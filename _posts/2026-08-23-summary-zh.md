---
layout: default
title: "Horizon Summary: 2026-08-23 (ZH)"
date: 2026-08-23
lang: zh
---

> 从 15 条内容中筛选出 5 条重要资讯。

---

1. [独立测试：DFlash 2 在 Qwen 3.8 27B 上提速 2.26 倍，叠加 n-gram 达 4.68 倍](#item-1) ⭐️ 9.0/10
2. [单张 RTX 5090 在 vLLM 中运行 Qwen3.8-27B NVFP4 并支持完整 262K 上下文](#item-2) ⭐️ 9.0/10
3. [Linus Torvalds 称 AI 在艰难的 Linux 内核调试中立了大功](#item-3) ⭐️ 6.0/10
4. [借助 AI 辅助打造的 AMD GFX906 优化版 llama.cpp 分支](#item-4) ⭐️ 6.0/10
5. [energygraph v1.3：零依赖的 CPU/GPU 终端功耗监控工具](#item-5) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [独立测试：DFlash 2 在 Qwen 3.8 27B 上提速 2.26 倍，叠加 n-gram 达 4.68 倍](https://www.reddit.com/r/LocalLLaMA/comments/1vvncyh/i_benchmark_dflash_2_pr_build_in_llamacpp_on_qwen/) ⭐️ 9.0/10

一位 Reddit 用户花三天时间在 llama.cpp 中测试了 DFlash 2 的 PR 构建（PR #27342），在 Qwen 3.8 27B 上对 100 个真实 LiveCodeBench 题目测得 2.26 倍加速（67.97 → 153.91 tok/s），叠加单个 n-gram 查找表后在多轮编码构建阶段最高达 4.68 倍。测试还发现，七月时在 DFlash 1 上叠加两个 n-gram 表是赢家，如今反而拖慢速度，且官方推荐的 --spec-draft-n-max 7 已超过峰值（n=5 在 8K 提示上多出约 11%）。 这为 llama.cpp 用户提供了独立验证的具体数据——显存开销（+2.7 GB）和延迟（14.27 → 6.02 ms）——以便判断 DFlash 2 是否适合自己的硬件和工作负载。它还提醒大家不要轻信合成基准数字（8.47 倍的结果被证实是模型陷入重复循环的假象），并说明 n-gram 叠加的收益取决于工作负载，并非普遍有效。 在相同草稿宽度 n=7 下，DFlash 2 优于 DFlash 1（2.26 倍对 2.00 倍），探针接受率 60% 对 48%，显存开销约为原来的一半，但部分差距来自量化选择（Q4_K_M 对 Q8_0 草稿模型）。值得注意的细节：--spec-draft-p-min 在 DFlash 2 代码路径中从未被读取，n-max 被静默钳制在 7（block_size 8），同一个 n-gram 参数在合成基准上 +52%（测试框架退化假象）、LiveCodeBench 上 +1%、纯文本上 -30%。 如果你在 llama.cpp 中本地运行 Qwen 3.8 27B，可以构建 PR #27342 并尝试 DFlash 2，将 --spec-draft-n-max 设为 5 而非默认的 7；仅在代码密集或多轮构建类工作负载中叠加 ngram-map-k4v 查找，纯文本生成时不要开启。

reddit · r/LocalLLaMA · /u/FantasticNature7590 · 8月22日 20:41

**背景**: 投机解码通过一个轻量快速的草稿模型提前猜测多个 token，再由大目标模型在一次前向传播中验证，接受正确的猜测、丢弃错误的，从而加速 LLM 推理。DFlash（来自 Z Lab）是一种轻量的块扩散草稿模型，可以并行起草 token，DFlash 2 随 Qwen 3.8 27B 的草稿模型和 llama.cpp PR 一起发布。n-gram 查找起草是最简单的自投机方法：在对话历史中找到最近匹配的 n-gram，并用其后跟随的 token 作为草稿，在模型复现或编辑已有代码时效果尤其好。MTP（多 token 预测）是另一种方案，模型本身被训练为在每个位置预测多个未来 token。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/z-lab/dflash">GitHub - z-lab/dflash: DFlash: Block Diffusion for Flash Speculative Decoding · GitHub</a></li>
<li><a href="https://github.com/ggml-org/llama.cpp/blob/master/docs/speculative.md">llama.cpp/docs/speculative.md at master · ggml-org/llama.cpp</a></li>
<li><a href="https://www.mindstudio.ai/blog/dflash-2-speculative-decoding-qwen">DFlash 2: Run Qwen3.8-27B at 2x Speed with Speculative Decoding | MindStudio</a></li>

</ul>
</details>

**标签**: `#llama.cpp`, `#speculative-decoding`, `#benchmarking`, `#local-llm`, `#inference-optimization`

---

<a id="item-2"></a>
## [单张 RTX 5090 在 vLLM 中运行 Qwen3.8-27B NVFP4 并支持完整 262K 上下文](https://www.reddit.com/r/LocalLLaMA/comments/1vvl7pc/single_rtx_5090_qwen3827b_nvfp4_at_a_real_262k/) ⭐️ 9.0/10

一位 Reddit 用户发布了一套完全可复现的日常使用配置：在单张 RTX 5090 上通过 vLLM 0.27.1 运行 NVFP4 量化的 Qwen3.8-27B（joshebbs/qwen3.8-27b-uncensored-nvfp4-modelopt，固定 revision），同时保留完整的 262,144 token 上下文窗口、视觉塔、FP8 KV 缓存、前缀缓存和工具调用。1K 提示词后解码速度为 77.2 tok/s，128K 上下文驻留时为 64.7 tok/s，完整 262K token 的预填充在 166 秒内完成。 这具体证明了在一张消费级 GPU 上可以同时容纳一个 27B 混合注意力模型和超长上下文，且速度足以日常使用，对本地大模型实践者具有直接可操作性。帖子给出了确切的模型 revision、显存预算、内核选择和基准测试方法，其他 RTX 5090 用户可以直接复现而无需猜测各种内存参数。 该模型是 64 层混合结构，包含 48 层 Gated DeltaNet 和 16 层全注意力层，因此预填充吞吐量随上下文增长显著下降（8K 时 7,005 tok/s 降至 262K 时 1,578 tok/s）；128K 和 262K 两行数据是单次运行的运行点，并非统计分布。前缀缓存带来实测 22.3 倍的冷启动到缓存 TTFT 加速（6.437 秒降至 0.288 秒），但 vLLM 在启用前缀缓存时会把混合 Mamba/DeltaNet 缓存置于实验性 align 模式——如果输出损坏，首先应测试禁用前缀缓存。 如果你拥有 RTX 5090，可以拉取固定 revision（e5ff4986938dcd0dd05ab4cce89da1b052be6ce3）的模型检查点，配置 vLLM 0.27.1 并启用 modelopt_fp4 量化、FlashInfer NVFP4 GEMM、FP8 KV 缓存和前缀缓存，然后按照帖子的方法（并发 1、temperature 0、--ignore-eos）自行测试 TTFT/TPOT。

reddit · r/LocalLLaMA · /u/Fz1zz · 8月22日 19:16

**背景**: NVFP4 是通过 NVIDIA ModelOpt 导出的 4 位浮点格式，相比 FP8 可将权重显存大致减半且保持质量，使这个 27B 模型的 safetensors 仅占 19.18 GiB。Gated DeltaNet 是一种具有固定大小循环状态的线性注意力机制，因此这 48 层不需要增长的 KV 缓存；只有 16 层全注意力层承担二次方注意力开销，这正是配合 FP8 KV 缓存后 262K 上下文能在 32 GB 显存上实现的原因。vLLM 中的前缀缓存会复用已处理提示词前缀的 KV 缓存块，对多轮智能体对话至关重要，可避免每轮都重新预填充整个对话记录。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/docs/diffusers/quantization/modelopt">NVIDIA ModelOpt · Hugging Face</a></li>
<li><a href="https://sebastianraschka.com/llm-architecture-gallery/hybrid-attention/">Hybrid Attention | Sebastian Raschka, PhD</a></li>
<li><a href="https://docs.vllm.ai/en/stable/design/prefix_caching/">Automatic Prefix Caching - vLLM</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#vllm`, `#nvfp4-quantization`, `#rtx-5090`, `#long-context`

---

<a id="item-3"></a>
## [Linus Torvalds 称 AI 在艰难的 Linux 内核调试中立了大功](https://simonwillison.net/2026/Aug/22/linus-torvalds/) ⭐️ 6.0/10

在 drm/xe Intel GPU 驱动修复（"不要把 flat CCS 存储当作可用 VRAM 分配"）的提交信息中，Linus Torvalds 透露一个 AI 在这场"地狱般的调试"中承担了大量繁琐工作。他指出 AI 多次断言这个 bug 不可能解决，但每当他坚持推进时，AI 仍会忠实地继续添加调试代码并分析结果。 这是顶级维护者真实使用 LLM 的一个高知名度案例：不是把 AI 当神谕，而是当作干粗活的苦力，其过早的"放弃"结论需要靠人类的固执来推翻。开发者可以借鉴这种模式——越过 AI 的消极结论继续推进，同时把重复性的插桩和分析工作交给它。 该 bug 涉及 get_flat_ccs_offset() 从硬件读取 flat CCS 存储基址、按启用的 L3 节点数进行缩放并向上取整到 128K，而低于该偏移的内存被错误地交给了 VRAM 分配器。Torvalds 还让 AI 自己写下了最终的提交信息，并打趣说这个 AI 的训练者可能"没他那么固执"。 阅读 GitHub 上 torvalds/linux 提交 818bebeb 的完整提交信息，查看 AI 撰写的提交文本和技术修复细节。用 LLM 调试时，应把它的"这问题无解"回应视为需要更努力推进、添加更多调试插桩的信号，而不是停止的理由。

rss · Simon Willison · 8月22日 21:04

**背景**: drm/xe 是 Linux 内核中较新的 Intel 显卡驱动，支持 Xe 系列 GPU 的渲染、显示、计算与媒体功能。Intel GPU 上的 CCS（计算命令流）状态存储在 VRAM 中一块"flat"区域，该区域必须保留，不能作为可用 VRAM 暴露给内存分配器。Torvalds 的评论触及了 LLM 的一个已知行为：模型在缺乏信心时常常推脱或宣称问题无解，即使坚定的人类可以通过持续迭代取得进展。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://linuxcommunity.io/t/linus-torvalds-uses-ai-to-debug-an-intel-gpu-driver-bug/11323">Linus Torvalds uses AI to debug an Intel GPU driver bug</a></li>
<li><a href="https://docs.kernel.org/gpu/xe/index.html">drm / xe Intel GFX Driver — The Linux Kernel documentation</a></li>

</ul>
</details>

**标签**: `#ai-assisted-coding`, `#linus-torvalds`, `#linux-kernel`, `#debugging`, `#llm-limitations`

---

<a id="item-4"></a>
## [借助 AI 辅助打造的 AMD GFX906 优化版 llama.cpp 分支](https://www.reddit.com/r/LocalLLaMA/comments/1vvljbz/glm_and_i_created_a_llamacpp_fork_optimized_for/) ⭐️ 6.0/10

Reddit 用户 u/milpster 发布了一个针对 AMD GFX906 架构优化的 llama.cpp 分支，通过 HIP/ROCm 支持 Mi50、Mi60 和 Radeon VII 显卡。该分支据称是与 GLM AI 模型协作开发的，作者正在征求社区反馈。 Mi50 等 GFX906 显卡在二手市场价格低廉，一个调优过的推理后端能让预算有限的 AMD 用户以更低成本本地运行大模型。这也展示了 AI 编程助手如何帮助开发和维护针对小众 GPU 的优化代码。 该 Reddit 帖子本身没有提供基准测试、技术实现细节或性能对比，因此该分支的质量和可复现性尚无法评估。GFX906 在部分路径上缺少 MFMA 指令，优化通常依赖文档化的 v_dot*混合精度点积路径。 如果你拥有 Mi50、Mi60 或 Radeon VII，可以访问该 Reddit 帖子找到仓库链接，启用 HIP 编译，并用 llama-bench 与官方 llama.cpp 的 HIP 后端对比性能后再决定是否采用。

reddit · r/LocalLLaMA · /u/milpster · 8月22日 19:29

**背景**: llama.cpp 是 Ollama 和 LM Studio 等大多数本地大模型工具背后的事实标准 C/C++推理引擎，它通过 HIP 支持 AMD GPU，HIP 是 AMD ROCm 平台内类似 CUDA 的编程模型。GFX906 是 AMD 基于 Vega 20 的架构，用于 Instinct Mi50/Mi60 数据中心显卡和消费级 Radeon VII；这些显卡因以极低的二手价格提供 16-32GB HBM2 显存而受爱好者欢迎，但官方 ROCm 支持一直滞后。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/ggml-org/llama.cpp">GitHub - ggml-org/llama.cpp: LLM inference in C/C++ · GitHub</a></li>
<li><a href="https://en.wikipedia.org/wiki/ROCm">ROCm - Wikipedia</a></li>
<li><a href="https://skyne98.github.io/wiki-gfx906/studies/2026-02-21/mi50-mi60-architecture-baseline.html">MI50/MI60 Architecture Baseline - Wiki GFX906</a></li>

</ul>
</details>

**标签**: `#llama.cpp`, `#AMD GPUs`, `#HIP`, `#local-LLM`, `#open-source`

---

<a id="item-5"></a>
## [energygraph v1.3：零依赖的 CPU/GPU 终端功耗监控工具](https://www.reddit.com/r/LocalLLaMA/comments/1vvkgs6/watching_that_wattage_in_your_terminal/) ⭐️ 5.0/10

energygraph v1.3 发布，新增对 NVIDIA、Intel 和 AMD 独立显卡的支持，并保留原有的 CPU 侧监控功能。根据厂商支持情况，它还可以在终端实时图表中显示 CPU 各核心、iGPU、平台和 DRAM 的功耗。 对于本地大模型用户来说，在推理时实时查看功耗有助于量化不同模型和硬件配置的实际能耗。零依赖的设计使其在无图形界面的 Linux 服务器上安装非常简单，而重型监控工具在这种场景下并不实用。 该工具每秒采样一次，因此数值既可以读作功率（瓦特），也可以读作绝对能量（焦耳），CPU/DRAM 数据来自 /sys 文件系统中的 Intel RAPL。GPU 支持程度因厂商而异，且已有研究表明基于 RAPL 的 DRAM 读数存在精度限制。 从 github.com/stolk/energygraph 克隆仓库并编译运行，在加载本地大模型时观察 GPU 和 CPU 的峰值功耗。你也可以参与 Reddit 上的挑战，晒出你系统测得的最大功率峰值。

reddit · r/LocalLLaMA · /u/mazarax · 8月22日 18:47

**背景**: Intel 的 RAPL（运行平均功率限制）接口将处理器划分为多个功率域，如 CPU 核心、集成显卡和 DRAM，并通过 Linux 的 /sys 文件系统暴露能量计数器。energygraph 由 GitHub 用户 stolk 开发，可在纯文本终端中绘制这些计数器，且无任何构建依赖。1.3 版将覆盖范围扩展到三大厂商的独立显卡，这很有用，因为独立显卡的功耗通常远超 PCIe 插槽单独提供的 75W。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/stolk/energygraph">GitHub - stolk/ energygraph : Graphs the energy use of a host inside...</a></li>
<li><a href="https://projectexigence.eu/green-ict-digest/running-average-power-limit-rapl/">Running Average Power Limit (RAPL) – Exigence</a></li>
<li><a href="https://dl.acm.org/doi/abs/10.1145/2989081.2989088">A Validation of DRAM RAPL Power Measurements</a></li>

</ul>
</details>

**社区讨论**: 发帖人向 r/LocalLLaMA 社区发起挑战，让大家晒出自己的最大功率峰值，将这次发布包装成一个有趣的测试活动。帖子本身没有包含实质性的技术讨论。

**标签**: `#power-monitoring`, `#local-llm`, `#hardware`, `#open-source-tools`, `#terminal`

---