---
layout: default
title: "Horizon Summary: 2026-09-09 (ZH)"
date: 2026-09-09
lang: zh
---

> 从 16 条内容中筛选出 2 条重要资讯。

---

1. [vLLM v0.29.0 将 Model Runner V2 设为默认执行核心](#item-1) ⭐️ 6.0/10
2. [Deepseek 已悄然退役 DeepSeek V4 Pro](#item-2) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [vLLM v0.29.0 将 Model Runner V2 设为默认执行核心](https://github.com/vllm-project/vllm/releases/tag/v0.29.0) ⭐️ 6.0/10

vLLM v0.29.0 包含来自 277 位贡献者的 594 个提交，将 Model Runner V2（MRV2）设为所有模型的默认执行核心，并新增了用于 KV 缓存自动容量调整的 CUDA graph 内存分析，以及可将每步 logits 内存降低 1/TP 的分片采样。该版本还支持了新模型，包括腾讯 Hy4-preview 770B MoE（带门控 DeepSeek 稀疏注意力和原生 MTP）、Qwen3.8-Flash-Next、GraniteSWA/GraniteMoeSWA 以及 Kimi K3 的 NVFP4 检查点。 在 GPU 上大规模部署 LLM 的用户可以获得更低的内存占用、更快的解码速度，以及对最新 MoE 模型的开箱即用支持，因为 MRV2 以模块化模型逻辑和 GPU 原生输入准备重构了 vLLM 的执行核心。新的 RL 权重同步功能和 Mamba 前缀缓存（TTFT 提升 9%-25%）可直接缩短 RLHF 训练循环和混合模型服务的迭代时间。 该版本包含显著的破坏性变更：移除了十个已废弃的模型架构，FlexOlmo/Olmo3/Hunyuan V1/VL 迁移到 Transformers 后端，移除了 PyAV 视频解码器，并且 `python -m vllm.entrypoints.openai.api_server` 已弃用，改用 `vllm serve`。新默认值包括 TP CUDA 组启用 FlashInfer all-reduce（可通过 `VLLM_ALLREDUCE_USE_FLASHINFER=0` 关闭）以及确定性的前缀缓存 NONE_HASH（分布式 KV 缓存用户不再需要固定 `PYTHONHASHSEED`）；MRV1 仍保留用于少数 ROCm 模型。 先在预发布环境中通过 `pip install vllm`（或对应的 ROCm/XPU wheel 源）进行升级，核对你使用的模型是否在已移除的架构列表中，并将启动脚本切换为 `vllm serve`；使用受影响模型的 ROCm 用户应在升级前确认是否适用于 MRV1 回退路径。

github · khluu · 9月9日 08:54

**背景**: vLLM 是广泛使用的开源 LLM 推理引擎，以基于 PagedAttention 的 KV 缓存管理和高吞吐服务著称。Model Runner V2 是对 vLLM V1 执行核心的重构，修复了累积的设计债务：它引入模块化模型逻辑、GPU 原生输入准备和稳定的持久批处理，取代了 V1 中严格的张量布局和重排序要求。MTP（多 token 预测）是一种投机解码技术，利用模型自身的原生预测头一次起草多个 token，再通过单次前向传播验证，与 EAGLE 等草稿模型方法互补。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://vllm.ai/blog/2026-03-24-mrv2">Model Runner V2: A Modular and Faster Core for vLLM</a></li>
<li><a href="https://docs.vllm.ai/en/latest/design/model_runner_v2/">Model Runner V2 Design Document - vLLM</a></li>
<li><a href="https://docs.vllm.ai/projects/speculators/en/latest/user_guide/algorithms/mtp/">MTP - Speculators Docs</a></li>

</ul>
</details>

**标签**: `#vllm`, `#llm-inference`, `#open-source`, `#release-notes`, `#gpu-optimization`

---

<a id="item-2"></a>
## [Deepseek 已悄然退役 DeepSeek V4 Pro](https://www.reddit.com/r/LocalLLaMA/comments/1wbfrut/deepseek_has_soft_retired_deepseek_v4_pro/) ⭐️ 5.0/10

一篇 Reddit 帖子称 DeepSeek 已悄然下线 DeepSeek V4 Pro，相关讨论正在 r/LocalLLaMA 上进行。

reddit · r/LocalLLaMA · /u/Few_Painter_5588 · 9月9日 08:34

**标签**: `#DeepSeek`, `#LLM`, `#AI models`, `#LocalLLaMA`

---