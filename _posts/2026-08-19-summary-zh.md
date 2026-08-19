---
layout: default
title: "Horizon Summary: 2026-08-19 (ZH)"
date: 2026-08-19
lang: zh
---

> 从 14 条内容中筛选出 2 条重要资讯。

---

1. [爱好者用双卡 RTX 3090、vLLM 和 DFlash2 让 Qwen3.8-27B 达到 218 tok/s](#item-1) ⭐️ 8.0/10
2. [Cerebras CS-4 宣称在超 10 万亿参数模型上实现每秒 1000+ token 推理](#item-2) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [爱好者用双卡 RTX 3090、vLLM 和 DFlash2 让 Qwen3.8-27B 达到 218 tok/s](https://www.reddit.com/r/LocalLLaMA/comments/1vsccit/qwen3827b_on_2x_3090_vllm_dflash2_218_toks_single/) ⭐️ 8.0/10

一位 Reddit 用户在两张 RTX 3090 上使用裸机 vLLM v0.26.1rc1、AutoRound INT4 量化和 DFlash2 投机解码对 Qwen3.8-27B 进行了基准测试，单请求解码速度达到 218.3 tok/s。他们还发布了让整套环境顺利启动所需的自定义 vLLM 补丁（GitHub PR）。 这表明在约 1500 美元的二手消费级显卡上，就能以交互式速度运行接近前沿水平的 27B 模型，且方法论完全可复现。其公开的基准测试流程和补丁对任何搭建本地 LLM 推理服务的人都有可借鉴的价值。 投机解码使用 7 个草稿 token，平均接受长度 3.35，接受率 47.8%；DFlash2 草稿模型占用约 13.5 GB 显存，使上下文上限为 131k，每卡峰值显存 22.3 GB。预填充吞吐在 10k 上下文时为 1342 tok/s，但在 90k 时降至 628 tok/s，作者也承认方案是临时拼凑的，性能还有提升空间。 如果你有双 3090 级别的显卡，可以尝试复现这套方案：vLLM v0.26.1rc1 + AutoRound INT4 量化的 Qwen3.8-27B + DFlash2 草稿模型，并应用作者在 github.com/oceanplexian/vllm/pull/1 发布的补丁来解决启动问题。

reddit · r/LocalLLaMA · /u/xjx546 · 8月19日 04:39

**背景**: 投机解码用一个轻量快速的“草稿”模型提出多个 token，再由大型目标模型一次性验证；接受率越高加速越明显，且输出与普通解码完全一致。DFlash2 是基于块扩散的草稿模型，可以并行而非串行地生成 token 块，其作者报告接近 3 倍于自回归解码的速度。AutoRound 是英特尔的量化算法，可将大模型压缩到 INT4（本文使用 group 128），在精度损失极小的情况下让大模型装入有限显存。vLLM 是广泛使用的开源推理服务器，支持在多 GPU 环境中组合使用这些技术。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://z-lab.ai/projects/dflash/">DFlash: Block Diffusion for Flash Speculative Decoding - Z Lab</a></li>
<li><a href="https://docs.vllm.ai/en/v0.10.1/features/quantization/auto_round.html">AutoRound - vLLM</a></li>
<li><a href="https://developer.nvidia.com/blog/an-introduction-to-speculative-decoding-for-reducing-latency-in-ai-inference/">An Introduction to Speculative Decoding for Reducing Latency in AI Inference | NVIDIA Technical Blog</a></li>

</ul>
</details>

**标签**: `#LLM inference`, `#vLLM`, `#speculative decoding`, `#consumer GPU`, `#benchmarking`

---

<a id="item-2"></a>
## [Cerebras CS-4 宣称在超 10 万亿参数模型上实现每秒 1000+ token 推理](https://www.cerebras.ai/cs4) ⭐️ 6.0/10

Cerebras 发布了 CS-4，这是一款基于三颗 WSE-3 Turbo 晶圆级芯片的机架级推理系统，宣称在超过 10 万亿参数的模型上可实现每秒 1000+ token 的推理速度，比 GPU 快达 30 倍。HN 评论者注意到这一规格可能无意中暴露了 OpenAI GPT-5.6 Sol 约有 500 亿活跃参数。 如果性能宣称属实，晶圆级推理将大幅降低前沿模型服务的延迟和成本，挑战 NVIDIA 在 AI 推理领域的主导地位。社区对参数量的推断也为了解 OpenAI 前沿模型的架构提供了罕见的公开线索。 CS-4 每套系统配备三颗 WSE-3 Turbo 处理器；WSE 架构在单一晶圆上集成约 90 万个可编程核心和 44GB 片上内存，从而避免多 GPU 集群的互连瓶颈。10 万亿以上参数可能指稀疏 MoE 模型的总参数量，而推断出的约 500 亿活跃参数解释了如此高速度如何实现。 可以试用 Cerebras 现有的推理 API（通过 Cerebras Cloud 或 OpenRouter），针对你的工作负载对比其每秒 token 数和成本与当前 GPU 供应商的差异。

hackernews · sunils34 · 8月19日 00:28 · [社区讨论](https://news.ycombinator.com/item?id=49354949)

**背景**: Cerebras 制造晶圆级引擎（WSE）——整片晶圆大小的芯片而非切割后的小芯片——将计算、内存和互连集成在同一基底上。这种设计提供巨大的片上内存带宽，并避免了 GPU 集群在服务超大模型时的网络开销。Cerebras 此前已为开源模型提供快速推理 API，IPO 后正将 CS-4 作为其超大规模推理平台推进。现代前沿模型通常采用稀疏的混合专家（MoE）架构，每个 token 只使用总权重中的一小部分（活跃参数）。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.cerebras.ai/cs4">Product - System - Cerebras</a></li>
<li><a href="https://en.wikipedia.org/wiki/Cerebras">Cerebras - Wikipedia</a></li>

</ul>
</details>

**社区讨论**: 评论者主要关注从 CS-4 规格反推 GPT-5.x 的参数量，估计 GPT-5.4 约 450 亿、GPT-5.6 Sol 约 500 亿活跃参数。还有人讨论 Cerebras（与 AMD 合作）能否真正挑战 NVIDIA 的垄断，质疑前代 CS-3 为何未在 OpenRouter 上成为 token 吞吐量最大的提供商，并期待推出面向个人用户的版本。

**标签**: `#AI hardware`, `#inference`, `#Cerebras`, `#LLM`, `#semiconductors`

---