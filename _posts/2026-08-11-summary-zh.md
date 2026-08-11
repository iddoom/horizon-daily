---
layout: default
title: "Horizon Summary: 2026-08-11 (ZH)"
date: 2026-08-11
lang: zh
---

> 从 4 条内容中筛选出 1 条重要资讯。

---

1. [Redis 之父 antirez 发布 H3-metal：为 Apple Silicon 打造的原生 MiniMax-H3 推理引擎](#item-1) ⭐️ 7.0/10

---

<a id="item-1"></a>
## [Redis 之父 antirez 发布 H3-metal：为 Apple Silicon 打造的原生 MiniMax-H3 推理引擎](https://github.com/antirez/h3.c) ⭐️ 7.0/10

Redis 的创造者 Salvatore Sanfilippo（antirez）发布了 H3-metal（h3.c）项目，这是一个使用 C 语言和 Metal 编写的全新项目，专门针对 Apple Silicon 优化，实现了原生的 MiniMax-H3 视频推理。该项目正以迭代方式开发，涵盖模型元数据、Metal 模块对齐、提示词编码以及从提示词到视频和音频的生成。 该项目将最先进的开源全能态视频生成模型原生引入 Apple Silicon，减少了对 NVIDIA CUDA 的依赖，并证明了在 Mac 硬件上进行高端本地 AI 执行是可行的。这对于开发者社区尤为重要，因为它出自备受尊敬的工程师 antirez 之手，表明了业界对拓展苹果统一内存架构在 AI 工作负载方面能力边界的浓厚兴趣。 运行 MiniMax-H3 推理目前需要大量内存，用户报告称全精度工作流需要 128GB 内存，不过 64GB 内存的机器可以通过 ComfyUI 运行 GGUF 量化版本（如 Q5_K_M 或 Q8_0）。速度仍然是主要瓶颈，即使在使用 M4 Max 或 M5 Pro 等高端硬件的情况下，生成一段 9 到 15 秒的 480p 视频片段大约需要一个小时甚至更长时间。

hackernews · swyx · 8月11日 01:22 · [社区讨论](https://news.ycombinator.com/item?id=49252179)

**背景**: MiniMax H3 是最近发布的开源全能态生成模型，能够联合理解和生成文本、图像、视频和音频，可生成最长 15 秒带有原生立体声音频的 2K 视频。虽然扩散模型和 AI 推理通常在专用 GPU 上使用 NVIDIA 的 CUDA 平台进行加速，但 Apple Silicon 依赖其自身的 Metal 框架和统一内存架构。Antirez 的 H3-metal 项目正是利用 Metal 框架，在 Mac 电脑上无需翻译层即可原生运行该模型。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.minimax.io/blog/minimax-h3">MiniMax H3: An Open Model Breaking the Boundaries Between Tasks and Modalities - MiniMax Research | MiniMax</a></li>
<li><a href="https://upstract.com/x/3438bb50f95f2e72">Antirez / h 3 .c: MiniMax H 3 inference engine for Mac computers</a></li>
<li><a href="https://huggingface.co/MiniMaxAI/MiniMax-H3">MiniMaxAI/MiniMax-H3 · Hugging Face</a></li>

</ul>
</details>

**社区讨论**: 社区情绪非常积极，但受限于当前的性能瓶颈，多位用户分享了具体的硬件配置和量化技术（如 GGUF Q5_K_M），以便将模型装入 64GB 或 128GB 的统一内存中。用户和 antirez 本人都指出速度是主要瓶颈，并希望 MiniMax 计划支持的稀疏注意力机制能带来显著的加速。讨论中还比较了 Apple Silicon 和 NVIDIA 的 DGX Spark，指出虽然 CUDA 在扩散模型工作负载中仍占主导地位，但 Mac 的统一内存在本地运行大型模型方面具有独特优势。

**标签**: `#apple-silicon`, `#ai-inference`, `#video-generation`, `#local-ai`, `#minimax`

---