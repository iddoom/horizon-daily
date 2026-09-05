---
layout: default
title: "Horizon Summary: 2026-09-05 (ZH)"
date: 2026-09-05
lang: zh
---

> 从 24 条内容中筛选出 5 条重要资讯。

---

1. [单张 RTX 5090 上 NInfer NVFP4 与 llama.cpp Q5_K_M、vLLM 的对比测试](#item-1) ⭐️ 9.0/10
2. [Qwen3.8 Flash Next 提示模板对比测试：Stock xhigh 在 SWE-bench Verified 达 99%](#item-2) ⭐️ 8.0/10
3. [gfx906-llama-cpp 分支为 AMD GCN 显卡带来 11-23% 性能提升](#item-3) ⭐️ 7.0/10
4. [用 AMD BC-250 矿机主板打造廉价游戏 PC：真实成本与 BIOS 解锁](#item-4) ⭐️ 6.0/10
5. [Simon Willison：在 macOS 上用编码智能体驱动 Blender](#item-5) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [单张 RTX 5090 上 NInfer NVFP4 与 llama.cpp Q5_K_M、vLLM 的对比测试](https://www.reddit.com/r/LocalLLaMA/comments/1w821fg/ninfer_vs_llamacpp_vs_vllm_quality_speed/) ⭐️ 9.0/10

一位生产环境用户发布了严格的对比测试，在单张 RTX 5090 32GB 上比较 llama.cpp（Q5_K_M GGUF）、vLLM（NVFP4）和 NInfer（NVFP4）部署 Qwen 27B 模型的表现，使用基于真实生产数据构建的 6 层自定义评测并结合配对自助法统计检验。结果显示各引擎质量在统计上无显著差异，而 NInfer 解码速度最高提升 2.8 倍（32K 上下文下达 213 tok/s），预填充提升 4.7 倍。 该测试表明，从基于 GGUF 的 llama.cpp 迁移到 NVFP4 量化的 NInfer 可以在质量无可测量损失的情况下获得大幅速度与并发提升，直接解决在单张消费级 GPU 上部署大模型的常见约束。其方法论（配对提示、固定种子、非劣性边际、金标签审计）为任何人在自己的工作负载上评估推理引擎提供了可复用的模板，而非依赖通用基准。 NInfer 采用 MTP3 投机解码（接受率 76%）、240K 上下文和 2 条并发通道，而 llama.cpp 受限于 parallel=1 和 196K 上下文（无法容纳 192K 的大海捞针测试项）；此外 NInfer 不支持 json_mode，因此结构化抽取测试在其上被跳过。注意事项包括 eGPU OCuLink 连接方式（仅影响模型加载）以及 vLLM 因采用墙钟计时方法不可比而被排除在速度表之外。 如果你在单张 RTX 5090 级别 GPU 上部署大模型并需要并发或长上下文吞吐，可以尝试 NInfer 或 vLLM 的 NVFP4 构建，并按照帖子中的方法在自己的工作负载上用配对提示、固定种子和自助法非劣性检验进行验证。

reddit · r/LocalLLaMA · /u/bengizmoed · 9月5日 14:20

**背景**: 量化通过压缩模型权重来适配有限的显存：Q5_K_M 是 llama.cpp 经典的 5 位 GGUF 格式，而 NVFP4 是 NVIDIA 的 4 位浮点格式，可在 Blackwell 架构 GPU 上被 vLLM 和 NInfer 等新引擎支持。MTP（多 token 预测）是一种投机解码技术，模型原生地每步预测多个 token，无需单独的草稿模型即可提升解码速度。连续批处理（vLLM、NInfer）支持并发请求服务，而该 llama.cpp 配置只能单流并行。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://docs.vllm.ai/en/latest/features/speculative_decoding/mtp/">MTP ( Multi - Token Prediction ) - vLLM</a></li>
<li><a href="https://www.aulafy.net/en/courses/ia-local/cuantizacion-gguf">GGUF Quantization : Q4, Q 5 , and Q8</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#inference-optimization`, `#quantization`, `#benchmarking`, `#vllm`

---

<a id="item-2"></a>
## [Qwen3.8 Flash Next 提示模板对比测试：Stock xhigh 在 SWE-bench Verified 达 99%](https://www.reddit.com/r/LocalLLaMA/comments/1w84mod/qwen38_flash_next_templates_comparison/) ⭐️ 8.0/10

一位 Reddit 用户在 SWE-bench Verified 前 100 个任务上，使用 mini-SWE-agent 2.4.6 对比了 Qwen3.8 Flash Next（NVFP4 量化，通过 SGLang 在 RTX PRO 6000 上部署）的 Stock、Fixed 和 Sharp 三种提示模板，分别在 medium 和 xhigh 推理强度下运行。Stock 在 xhigh 下解决了 100 个任务中的 99 个，Fixed 为 98，Sharp 仅为 94。 这是一个完全可复现的实证，表明提示模板的选择与推理强度设置在编码智能体中有强烈的交互作用——Sharp 在 medium 下领先，但在 xhigh 下落后，而 Stock 在获得更多推理预算时扩展性最好。任何在本地运行 LLM 编码智能体的人都可以直接借鉴这些结论，根据自己的准确率与速度权衡来选择模板和推理强度的组合。 Sharp 在 medium 下已经饱和（推理 token 增加 46.5%、耗时增加 53.4% 但解决率仍是 94→94），而 Stock 从 medium 到 xhigh 提升了 8 个任务，Fixed 提升了 11 个；Sharp 在 xhigh 下每解决一个任务的 token 效率仍然最高（14,541 输出 token/任务，对比约 17,000）。作者还分享了完整配置：262K 上下文、BF16 KV 缓存（51.2 GB）、FP8 n-gram 嵌入表和固定在内存中的 32 GB HiCache，运行于 CUDA 13.3——不过该分析较为非正式，且仅基于 100 个任务。 如果你在本地用 Qwen3.8 Flash Next 运行编码智能体，追求最高准确率时用 Stock 模板加 xhigh 推理强度，追求速度时用 Sharp 加 medium；作者提供的容器（jpezzulli/sglang-rtxpro6000）和 mini-SWE-agent 配置让你可以很容易地在自己的任务切片上复现该测试。

reddit · r/LocalLLaMA · /u/HeDo88TH · 9月5日 16:02

**背景**: SWE-bench Verified 是基于开源 Python 仓库真实 GitHub issue 的基准测试，被广泛视为评估编码智能体的黄金标准。这里的“提示模板”指不同的系统/交互提示词（Stock 为模型默认，Fixed 和 Sharp 为社区修改版本），它们会改变智能体的推理方式和输出格式。“推理强度”控制模型在作答前消耗的思考 token 数量；更高强度通常提升准确率，但在本次测试中总耗时大约翻倍。模型以 NVFP4 量化运行——这是一种 4 位浮点格式，可大幅缩小显存占用，使其能装进单张工作站 GPU。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://llm-stats.com/benchmarks/swe-bench-verified">SWE-Bench Verified Leaderboard</a></li>
<li><a href="https://huggingface.co/Qwen/Qwen3.8-Flash-Next">Qwen/Qwen3.8-Flash-Next · Hugging Face</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#benchmarking`, `#swe-bench`, `#prompt-templates`, `#ai-agents`

---

<a id="item-3"></a>
## [gfx906-llama-cpp 分支为 AMD GCN 显卡带来 11-23% 性能提升](https://www.reddit.com/r/LocalLLaMA/comments/1w82kpd/gfx906llamacpp_new_pptg_gains_for_mi50mi60radeon/) ⭐️ 7.0/10

gfx906-llama-cpp 分支的维护者宣布，通过采纳上游 llama.cpp 的相关 PR，在 AMD gfx906 显卡（MI50/MI60/Radeon VII）上取得新性能提升：预填充吞吐量提升 23%（332.5 到约 410 t/s），深度填充提升 14%，token 生成提升 11%（13.6 到约 15.1 t/s）。该分支还能在 40GB 显存中容纳 25 万上下文，且输出与上游逐位一致（通过 SHA 和逐 token 比对验证）。 MI50（32GB）和 Radeon VII 在二手市场上价格低廉，这些优化让预算有限、买不起新显卡的用户也能负担得起长上下文的本地大模型推理。从上游 PR 中挖掘并适配相关改进的方法论，对维护特定硬件分支的开发者也具有借鉴意义。 这些提升主要来自采纳 llama.cpp 现有 PR 而非新写的内核，25 万上下文的容纳依赖一种“紧凑显存机制”。作者说明 11% 的 token 生成提升是相对于 pre-mirror 基线的持平结果，且输出与上游逐位一致，证明没有引入数值回归。 如果你拥有 MI50/MI60/Radeon VII，请在 GitHub 上克隆 milpster/gfx906-llama-cpp 并阅读更新后的 README（其中记录了改了什么、为什么、来自谁），然后用该分支对比你现有的 llama.cpp 构建跑基准测试来验证性能提升。

reddit · r/LocalLLaMA · /u/milpster · 9月5日 14:42

**背景**: gfx906 指的是 AMD 的 GCN 5.1（Vega 20）架构，用于消费级显卡 Radeon VII 以及数据中心加速器 MI50/MI60；MI50 提供 32GB HBM2 显存且二手价格很低。llama.cpp 是本地运行量化大模型的主流开源推理引擎，PP（提示预填充）和 TG（token 生成）是其两个关键吞吐指标。AMD 官方 ROCm 对这些老显卡的支持一直滞后，因此像这个分支以及 ik_llama.cpp 这样的社区项目通过针对性优化填补了空白。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/ikawrakow/ik_llama.cpp">GitHub - ikawrakow/ik_ llama . cpp : llama . cpp fork with additional...</a></li>
<li><a href="https://arkprojects.space/wiki/AMD_GFX906">AMD GFX 906 | KBD</a></li>
<li><a href="https://www.techpowerup.com/gpu-specs/radeon-vii.c3358">AMD Radeon VII Specs | TechPowerUp GPU Database</a></li>

</ul>
</details>

**标签**: `#llama.cpp`, `#AMD GPUs`, `#local-llm`, `#performance-optimization`, `#open-source`

---

<a id="item-4"></a>
## [用 AMD BC-250 矿机主板打造廉价游戏 PC：真实成本与 BIOS 解锁](https://devquasar.com/hardware/the-60-gaming-pc-amd-bc-250/) ⭐️ 6.0/10

Hacker News 上一则讨论帖和实机文章重新点燃了用 AMD BC-250（基于阉割版 PlayStation 5 APU 的前加密货币矿机主板）打造 60 美元游戏 PC 的热情。实际动手的网友报告称，现在光主板就要 150-186 美元以上，整机成本约 300 美元，且通过刷 BIOS 可将 GPU 计算单元从 24 个解锁到 40 个、CPU 核心从 6 个解锁到 8 个。 这提供了一个将矿场剩余硬件改造为消费级游戏机的罕见案例，其 BIOS 刷写和“硅抽奖”测试方法对购买廉价可解锁硬件的人有可复用价值。但它也说明，随着需求推高价格，病毒式传播的“廉价装机”说法很快会过时。 解锁结果存在“硅抽奖”：并非每块主板都能稳定解锁全部 40 个 CU 和 8 个核心，部分主板存在故障核心。此外整机还需要电源、NVMe 硬盘、高风压风扇、DP 转 HDMI 转接头、可能还有 Wi-Fi/蓝牙模块以及 3D 打印或自制机箱，实际总成本远超标题所说的 60 美元。 购买前先查看 eBay 实时价格和 BC-250 社区文档（如 GitHub 上的 bc250-documentation 仓库），了解 BIOS 刷写、解锁成功率及全部配件成本，并与二手 Dell Optiplex 等更省事的方案做比较。

hackernews · networked · 9月5日 13:36 · [社区讨论](https://news.ycombinator.com/item?id=49576386)

**背景**: AMD BC-250 是一块基于 PlayStation 5 APU 阉割版的矿机主板：6 个 Zen 2 CPU 核心、24 个 GPU 计算单元和 16GB GDDR6 显存。它原本以 4U 机架式机箱形式用于加密货币挖矿，社区在 GitHub 和博客上的文档说明了如何刷入修改版 BIOS 来启用被屏蔽的核心，并运行桌面版 Linux（如 Arch 或直接启动 Steam 的 Bazzite）。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/mothenjoyer69/bc250-documentation">GitHub - mothenjoyer69/bc250-documentation: Information on running the AMD BC-250 powered ASRock mining boards as a desktop. · GitHub</a></li>
<li><a href="https://www.tomshardware.com/video-games/playstation/amds-rare-playstation-5-apu-based-bc-250-mining-board-resurfaces-for-usd120-and-can-actually-run-cyberpunk-2077">AMD’s rare PlayStation 5 APU-based BC-250 mining board resurfaces for $120 and can actually run Cyberpunk 2077 | Tom's Hardware</a></li>
<li><a href="https://worldofmatthew.com/blog/bc250/">My BC - 250 Journey (with 40 CUs Unlocked ) | World of Matthew</a></li>

</ul>
</details>

**社区讨论**: 亲自动手的网友一致认为 60 美元的价位已成历史——主板现价 150-186 美元以上，有评论者警告整机成本超过 300 美元，且热度催生了只卖 3D 打印外壳却抬高价格的骗局。也有人指出更便宜的合法替代方案，比如碰运气买“未测试”的 Dell Optiplex；同时承认成功解锁的 BC-250 虽然很折腾，但性能可与 Steam Machine 掰手腕而价格低得多。

**标签**: `#hardware`, `#diy`, `#budget-pc`, `#amd`, `#hacker-news`

---

<a id="item-5"></a>
## [Simon Willison：在 macOS 上用编码智能体驱动 Blender](https://simonwillison.net/2026/Sep/5/blender-coding-agents-macos/) ⭐️ 6.0/10

Simon Willison 发布了一篇 TIL 文章，展示在 macOS 上 ChatGPT Codex 可以通过简单的自然语言提示控制已安装的 Blender 应用，并借助 Blender 的 Python API 构建并渲染出一个“鹈鹕骑自行车”的 3D 场景。最终生成的脚本 pelican_final.py 已发布在 GitHub 上。 它展示了一个可复现、门槛很低的工作流：用户无需了解 Blender 的 API，由智能体编写并迭代 Python（bpy）代码即可生成 3D 场景。这种“编码智能体 + 可脚本化桌面应用”的搭配模式可以推广到许多其他自动化任务。 该方案需要从 blender.org 安装完整的 Blender 应用到 /Applications 目录，之后智能体便可通过 bpy API 运行 Python 脚本。迭代是对话式的——像“加个背景，再加点花样”这样的后续提示会持续细化同一场景，最终生成的脚本可供查看。 从 blender.org 安装 Blender，然后在 ChatGPT Codex 中尝试提示“使用已安装在 /Applications/Blender 的 Blender 渲染一个鹈鹕骑自行车的场景”，并用后续提示不断迭代；可以将结果与 Willison 公开的 pelican_final.py 脚本进行对比。

rss · Simon Willison · 9月5日 15:51

**背景**: Blender 是一款免费开源的 3D 创作套件，它通过名为 bpy 的 Python API 暴露几乎全部功能，包括网格建模、材质、灯光和渲染。像 OpenAI 的 Codex 这样的编码智能体可以在本地执行 shell 命令和编辑文件，因此能够自己编写 bpy 脚本并调用 Blender 进行渲染。Willison 的文章展示了智能体仅凭英文描述就完成了整个场景——几何体、材质、灯光与渲染——的搭建。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://docs.blender.org/api/current/index.html">Blender Python API</a></li>
<li><a href="https://github.com/openai/codex">GitHub - openai/ codex : Lightweight coding agent that runs in your...</a></li>

</ul>
</details>

**标签**: `#coding-agents`, `#blender`, `#python-api`, `#automation`, `#TIL`

---