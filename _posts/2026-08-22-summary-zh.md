---
layout: default
title: "Horizon Summary: 2026-08-22 (ZH)"
date: 2026-08-22
lang: zh
---

> 从 12 条内容中筛选出 2 条重要资讯。

---

1. [FreeToken 在 16GB 显存上以约 100 tok/s 运行 35B MoE 模型](#item-1) ⭐️ 7.0/10
2. [llama.cpp 0.2.0 版本发布，附更新日志与预编译二进制文件](#item-2) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [FreeToken 在 16GB 显存上以约 100 tok/s 运行 35B MoE 模型](https://www.reddit.com/r/LocalLLaMA/comments/1vv6v00/freetokens_project_is_impressive/) ⭐️ 7.0/10

一位 Reddit 用户测试了新发布的 FreeToken 项目（由 FlashML 开发），在 16GB 显存的 RTX 5080 上运行 NVFP4 量化的 QWEN3.6-35B-A3B 模型（约 20GB），达到了约 100-110 tok/s 的速度，尽管模型大小超出了显存容量。该项目于报告前一天发布，论文在 arXiv 上，代码在 GitHub 上开源。 这表明通过将 GPU、CPU、主机内存和互连视为一个统一的弹性推理平台，前沿规模的开源 MoE 模型可以在消费级硬件上以交互式速度运行。拥有中端显卡（16GB 显存）的用户现在可以实际在本地运行 30B 以上级别的模型，而不会因卸载而损失吞吐量。 测试配置为 RTX 5080（16GB）、64GB DDR6 内存和 AMD Ryzen 9 9950X3D 处理器，在 1028 token 的提示词下达到约 110 tok/s。该模型是稀疏 MoE 架构（A3B 表示每个 token 仅激活约 30 亿参数），NVFP4 是带共享指数的 4 位浮点格式，比 INT4 更好地保留动态范围。 从 GitHub（FlashML-org/FreeToken）克隆 FreeToken 仓库，下载 NVFP4 量化的 Qwen MoE 模型，在自己的硬件上跑分，与现有的 llama.cpp/vLLM 配置进行对比。

reddit · r/LocalLLaMA · /u/ViRROOO · 8月22日 08:34

**背景**: 混合专家（MoE）模型每个 token 只激活一小部分参数，因此像 Qwen3.6-35B-A3B 这样的 350 亿参数模型实际只计算约 30 亿活跃参数，即使整个模型放不进显存也能实现快速推理。传统的卸载方案（如 llama.cpp 的 CPU offload）受限于 PCIe 和主机内存带宽，通常速度很慢。FreeToken 通过协同设计模型布局、专家驻留和 CPU-GPU 执行，并采用带宽自适应调度，使异构边缘资源像统一的服务平台一样工作。NVFP4 是为 NVIDIA Blackwell 架构显卡引入的格式，将 4 位的紧凑性与浮点语义结合，精度优于整数量化。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/FlashML-org/FreeToken">GitHub - FlashML-org/FreeToken</a></li>
<li><a href="https://arxiv.org/pdf/2608.16157">FreeToken: Efficient Edge-Native MoE Serving with Bandwidth-Adaptive ...</a></li>
<li><a href="https://developer.nvidia.com/blog/introducing-nvfp4-for-efficient-and-accurate-low-precision-inference/">Introducing NVFP4 for Efficient and Accurate Low-Precision Inference | NVIDIA Technical Blog</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#inference-optimization`, `#open-source`, `#benchmark`, `#llm`

---

<a id="item-2"></a>
## [llama.cpp 0.2.0 版本发布，附更新日志与预编译二进制文件](https://www.reddit.com/r/LocalLLaMA/comments/1vv4mei/llamacpp_version_020_is_out/) ⭐️ 5.0/10

llama.cpp 发布了 0.2.0 版本，更新日志和源代码已在 GitHub 的 ggml-org 组织下公开。同时提供了预编译的二进制文件，方便不想从源码编译的用户使用。 llama.cpp 是包括 Ollama 和 LM Studio 在内的大多数本地大模型工具的事实核心推理引擎，因此它的版本发布会直接影响本地模型用户。查看更新日志有助于用户在升级前了解新功能、性能改进或破坏性变更。 这只是一次例行版本发布公告，Reddit 帖子本身并未讨论具体功能或破坏性变更。该项目近期开始采用带版本号的发布方式（此前主要以 b10566 这类构建号标识），对应的预编译版本在 GitHub 上标记为 b10566。 前往 GitHub 的 v0.2.0 发布页面查看官方更新日志，了解具体变更内容；如果不想自行编译，可以直接下载预编译的二进制文件试用新版本。

reddit · r/LocalLLaMA · /u/PhilippeEiffel · 8月22日 06:23

**背景**: llama.cpp 是一个开源的 C/C++ 库，用于在本地以最少的配置运行大模型推理，由 Georgi Gerganov 于 2023 年 3 月创建，并与 GGML 张量库协同开发。它使用 GGUF 格式，该格式已成为在 Hugging Face 上分发量化本地大模型的主流方式。由于它是大多数本地推理工具的底层引擎，其更新会影响整个本地大模型生态。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/ggml-org/llama.cpp">GitHub - ggml-org/llama.cpp: LLM inference in C/C++ · GitHub</a></li>
<li><a href="https://en.wikipedia.org/wiki/Llama.cpp">Llama.cpp</a></li>
<li><a href="https://www.datacamp.com/tutorial/gguf-format-a-complete-guide">GGUF Format: A Complete Guide to Local LLM Inference | DataCamp</a></li>

</ul>
</details>

**标签**: `#llama.cpp`, `#local-llm`, `#release`, `#open-source`

---