---
layout: default
title: "Horizon Summary: 2026-08-04 (ZH)"
date: 2026-08-04
lang: zh
---

> 从 26 条内容中筛选出 6 条重要资讯。

---

1. [FFmpeg 9.0 发布：引入 Vulkan 硬件加速与动态 WebP 支持](#item-1) ⭐️ 9.0/10
2. [在单块 AMD MI300X GPU 上运行 DeepSeek V4 Flash](#item-2) ⭐️ 7.0/10
3. [Bending Spoons 将以 12.8 亿美元收购 Airtable](#item-3) ⭐️ 7.0/10
4. [Runware 推出模块化 Sonic Inference Pod，打造便携式 AI 算力](#item-4) ⭐️ 6.0/10
5. [EON 计划部署太空激光网络以替代海底光缆](#item-5) ⭐️ 6.0/10
6. [微软下一代 Xbox「Project Helix」目标实现全面向下兼容](#item-6) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [FFmpeg 9.0 发布：引入 Vulkan 硬件加速与动态 WebP 支持](https://github.com/FFmpeg/FFmpeg/blob/n9.0/RELEASE_NOTES) ⭐️ 9.0/10

FFmpeg 9.0 已正式发布，引入了多项重要功能，包括用于视频处理的 Vulkan 硬件加速、动态 WebP 解码器和解复用器、MP4 复用器中的 LCEVC 轨道复用支持，以及 v360_vulkan 和 transpose_cuda 等众多新滤镜。该版本还包含了 Swscale 重写等正在进行的内部重构、用于 DAB+ 的 HE-AAC 960 解码，以及移除独立的 CELT 解码支持。 FFmpeg 是全球几乎每个视频处理流水线、流媒体服务和媒体应用都在使用的基础多媒体框架。Vulkan 硬件加速的加入提供了一个现代、跨平台、厂商中立的 API，用于高效的视频解码、编码和滤镜处理，可以显著降低 CPU 开销并提升在支持的 GPU 上的性能。 值得注意的技术新增包括 SMPTE 2094-50 元数据支持与直通、ProRes RAW VideoToolbox 硬件加速、APV Vulkan 硬件加速、Playdate 视频编码器和复用器，以及 AMF 帧率转换滤镜。一位贡献者的详细博客文章指出，该版本还包含重要的汇编优化以及正在进行的 Swscale 重写工作，以改善缩放性能。

hackernews · gyan · 8月4日 09:30 · [社区讨论](https://news.ycombinator.com/item?id=49166202)

**背景**: FFmpeg 是一个开源多媒体框架，能够解码、编码、转码、复用、解复用、流式传输、滤镜处理和播放几乎所有视频或音频格式。Vulkan 是一个现代跨平台 GPU API，包含用于硬件加速视频处理的 Vulkan Video 扩展，为开发者提供对调度、同步和内存分配的细粒度控制。WebP 是由 Google 开发的图像格式，支持有损和无损压缩以及动画，是网络上 JPEG、PNG 和 GIF 的现代替代品。硬件加速将计算密集型的视频处理任务从 CPU 卸载到 GPU，大幅提高吞吐量并降低功耗。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://vulkan.org/">Home | Vulkan | Cross platform 3D Graphics</a></li>
<li><a href="https://deepwiki.com/FFmpeg/FFmpeg/7-hardware-acceleration">Hardware Acceleration | FFmpeg/FFmpeg | DeepWiki</a></li>
<li><a href="https://en.wikipedia.org/wiki/WebP">WebP - Wikipedia</a></li>

</ul>
</details>

**社区讨论**: 社区对 FFmpeg 表达了深深的感激之情，多位评论者强调它对其职业生涯和更广泛的软件生态系统的关键重要性。一位贡献者分享了一篇详细的博客文章，涵盖了 Swscale 重写、Vulkan 变更、汇编细节和发布统计数据。一位用户提出了一个具体的功能请求，希望在制造商已在 ACPI 表中禁用 Intel QSV 编码的 Windows 笔记本电脑上也能使用该功能。

**标签**: `#ffmpeg`, `#multimedia`, `#open-source`, `#release-notes`, `#video-processing`

---

<a id="item-2"></a>
## [在单块 AMD MI300X GPU 上运行 DeepSeek V4 Flash](https://github.com/ryanzhou/deepseek-v4-flash-mi300x) ⭐️ 7.0/10

一个新的 GitHub 仓库提供了一份实用指南，介绍如何在单块 AMD MI300X GPU 上运行拥有 2840 亿参数的混合专家模型 DeepSeek V4 Flash。该方案利用了模型原生的 MXFP4 量化技术，使其能够装入该 GPU 192GB 的 HBM3 显存中。 这证明了大规模最先进语言模型可以在易于获取的企业级硬件上部署，而无需依赖庞大的多 GPU 集群。它凸显了 AMD 在 AI 推理市场中对 NVIDIA 日益增强的竞争力，并为更具成本效益地部署前沿模型打开了大门。 DeepSeek V4 Flash 总参数量为 2840 亿，但每个 token 仅激活 130 亿参数，其 256 个专家模块采用原生 MXFP4 格式量化，大幅降低了内存需求。MI300X 的 192GB HBM3 显存对于这种单 GPU 部署至关重要，不过基于 PCIe 的 MI350P 变体（144GB 显存）也可能满足要求。

hackernews · zhoutong · 8月4日 10:00 · [社区讨论](https://news.ycombinator.com/item?id=49166386)

**背景**: DeepSeek V4 Flash 是一款以效率为核心的混合专家模型，采用稀疏激活策略，即推理时每个 token 仅使用总参数的一小部分。量化是一种降低模型精度（例如从 FP16 降至 MXFP4 等 4 位格式）的技术，可在质量损失极小的情况下减少内存占用并加速推理。AMD MI300X 是一款配备 192GB HBM3 显存的数据中心 GPU，被视为 NVIDIA H100/H800 在大模型推理领域的有力替代品。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/deepseek-ai/DeepSeek-V4-Flash">deepseek-ai/DeepSeek-V4-Flash · Hugging Face</a></li>
<li><a href="https://www.amd.com/en/products/accelerators/instinct/mi300/mi300x.html">AMD Instinct™ MI300X Accelerators</a></li>
<li><a href="https://bentoml.com/llm/model-preparation/llm-quantization">LLM quantization | LLM Inference Handbook</a></li>

</ul>
</details>

**社区讨论**: 社区成员指出了重要的硬件细节：MI300X 是 OAM 模块，通常以 8-GPU 整机方式销售，价格约 25 万欧元，而基于 PCIe 的 MI350P（144GB 显存）可能更适合单卡部署。一位评论者提到了显著的性能差距：DeepSeek 在其原生 H800 集群上实现了每 GPU 15k tokens/s 的吞吐量，这表明 MI300X 方案仍有大量优化空间。

**标签**: `#DeepSeek`, `#AMD MI300X`, `#LLM Inference`, `#Hardware`, `#Quantization`

---

<a id="item-3"></a>
## [Bending Spoons 将以 12.8 亿美元收购 Airtable](https://techcrunch.com/2026/08/04/bending-spoons-to-buy-airtable-for-1-28b/) ⭐️ 7.0/10

科技公司 Bending Spoons 将以 12.8 亿美元收购广受欢迎的无代码平台 Airtable。此前有报告称，Airtable 的股票在二级市场上的估值约为 40 亿美元，较其巅峰时期大幅下跌。 此次收购凸显了科技行业的巨额估值修正，Airtable 的市值从 2021 年科技热潮期间 110 亿美元的峰值暴跌至如今的一小部分。这笔交易表明，投资者情绪正在转变，企业级 SaaS 和无代码软件公司面临着更广泛的市场调整。 12.8 亿美元的收购价远低于 Airtable 在 2021 年创下的 110 亿美元估值。今年早些时候，该公司的私人股票在二级市场上的易手估值约为 40 亿美元，这表明在被收购之前，其估值经历了快速且大幅的缩水。

rss · TechCrunch · 8月4日 11:30

**背景**: Airtable 是一个知名的无代码开发平台（NCDP），允许用户通过图形界面而非传统编程来构建软件应用程序和自动化工作流。二级市场促进了私人公司在首次公开募股（IPO）之前的股票交易，为早期投资者和员工提供了变现股票的途径。这些二级市场上的估值通常能反映出私人公司的财务状况和市场需求的真实指标。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.nasdaqprivatemarket.com/secondary-markets-what-you-need-to-know/">Secondary Markets: What You Need to Know About the Market for Private Company Stock - Nasdaq Private Market</a></li>
<li><a href="https://en.wikipedia.org/wiki/No-code_development_platform">No-code development platform - Wikipedia</a></li>

</ul>
</details>

**标签**: `#acquisition`, `#saas`, `#airtable`, `#tech-industry`, `#valuation`

---

<a id="item-4"></a>
## [Runware 推出模块化 Sonic Inference Pod，打造便携式 AI 算力](https://techcrunch.com/2026/08/04/is-the-future-of-data-centers-portable-runware-builds-a-pod-to-find-out/) ⭐️ 6.0/10

AI 基础设施公司 Runware 宣布推出 Sonic Inference Pod，这是一种模块化、便携式的数据中心概念，被设计为一个可整体运输的独立单元。Sonic Pod 目前已投入量产并正在向多个城市部署，提供了一种可与传统超大规模数据中心并行的灵活算力替代方案。 这一发展引入了一种更加灵活且可快速部署的 AI 基础设施方案，有望缩短传统数据中心的建设周期并降低相关成本。便携式计算舱可以将 AI 推理能力带到更靠近数据源的边缘计算场景中，从而有效降低实时工作负载的延迟。 Sonic Inference Pod 基于 Runware 的 Sonic Inference Engine 构建，这是一个将定制硬件和软件从 PCB 层面开始进行一体化设计的垂直推理平台。该系统配备了专有的主板、服务器、机架、网络和散热架构，专为最大化推理吞吐量而设计，据称成本可降低至十分之一。

rss · TechCrunch · 8月4日 13:00

**背景**: 模块化数据中心是一种预制设施，内部容纳服务器、存储和网络设备等 IT 硬件，通常安装在标准集装箱内以便于运输。与需要数年时间建造的传统实体数据中心不同，这些便携式单元可以快速部署以满足即时的计算需求。边缘计算利用类似的去中心化基础设施，在更靠近数据源的地方处理数据，而非依赖集中式云，这对于降低 AI 和机器学习等数据密集型任务的延迟至关重要。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://runware.ai/sonic-inference-engine">Sonic Inference Engine® – Fastest AI Inference | Runware</a></li>
<li><a href="https://techcrunch.com/2026/08/04/is-the-future-of-data-centers-portable-runware-builds-a-pod-to-find-out/">Is the future of data centers portable? Runware builds a pod to find out</a></li>
<li><a href="https://www.ibm.com/think/topics/data-centers">What Is a Data Center ? | IBM</a></li>

</ul>
</details>

**标签**: `#ai-infrastructure`, `#data-center`, `#hardware`, `#edge-computing`, `#runware`

---

<a id="item-5"></a>
## [EON 计划部署太空激光网络以替代海底光缆](https://techcrunch.com/2026/08/04/eon-wants-to-move-the-data-superhighway-from-ocean-fiber-to-space-lasers/) ⭐️ 6.0/10

Endeavour Optical Networks（EON）宣布计划发射迄今为止最快的太空激光通信系统，旨在将其打造为海底光缆的可行替代方案。该提案试图将洲际数据传输从海洋底部转移到轨道自由空间光学网络中。 这项举措可能会从根本上颠覆全球电信基础设施，目前洲际互联网流量几乎完全依赖海底电缆。如果成功，基于太空的光学网络将提供一种部署更快的替代方案，从而避开在海底铺设和维护电缆所带来的地缘政治及物理脆弱性。 该系统依赖于自由空间光通信，利用调制的激光束（通常在近红外光谱内）在卫星之间或地球与太空之间传输数据。与传统的射频系统相比，激光通信能够提供更高的带宽且硬件尺寸更小，但 EON 在轨道部署、大气干扰以及远距离精确瞄准方面仍面临巨大的工程挑战。

rss · TechCrunch · 8月4日 12:00

**背景**: 目前，超过 95%的洲际数据流量是由铺设在海底的 submarine communications cable（海底通信电缆）承载的。太空中的激光通信，也被称为自由空间光通信，是一种通过激光束而非无线电波或物理玻璃纤维传输数据的新兴技术。像 NASA 这样的航天机构一直在积极开发这项技术，以使航天任务能够以前所未有的速度和效率向地球传回更多数据（例如高分辨率图像）。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Laser_communication_in_space">Laser communication in space - Wikipedia</a></li>
<li><a href="https://www.nasa.gov/communicating-with-missions/lasercomms/">Laser Communications - NASA</a></li>
<li><a href="https://en.wikipedia.org/wiki/Submarine_communications_cable">Submarine communications cable - Wikipedia</a></li>

</ul>
</details>

**标签**: `#space-lasers`, `#telecommunications`, `#infrastructure`, `#optical-networks`

---

<a id="item-6"></a>
## [微软下一代 Xbox「Project Helix」目标实现全面向下兼容](https://www.theverge.com/games/974773/xbox-helix-disc-digital-backwards-compatibility-leaked-memo-opt-in) ⭐️ 6.0/10

The Verge 获取的一份泄露备忘录显示，微软的下一代 Xbox 主机（代号「Project Helix」）旨在实现对以往所有 Xbox 世代的全面向下兼容。这意味着这款新主机在理论上不仅可以运行 PC 游戏，还能游玩从 2001 年初代 Xbox 到 Xbox 360，再到 Xbox One 以及 Xbox Series X/S 的所有游戏。 如果得以实现，Project Helix 将拥有家用游戏机历史上最庞大的游戏库，为玩家提供前所未有的价值。这也标志着微软将继续贯彻其优先发展软件生态系统和注重游戏保存的战略，而非传统的硬件锁定策略。 微软正与 AMD 合作，力求在 Project Helix 的渲染和模拟技术上突破极限。实现全面向下兼容在技术上极具挑战性，因为以往各代 Xbox 主机使用了不同的硬件架构，过去需要结合基于硬件的解决方案和软件模拟才能运行旧款游戏。

rss · The Verge · 8月4日 11:00

**背景**: 自 Xbox One 时代起，向下兼容就一直是 Xbox 的重要卖点，允许玩家在较新的硬件上体验精选的旧款游戏。然而，由于初代 Xbox 采用 x86 架构，而 Xbox 360 采用 PowerPC 架构，微软在向基于 x86 的 Xbox One 过渡时，不得不开发复杂的软件模拟来弥合硬件差异。预计将于 2027 年左右发布的 Project Helix 主机似乎正在此模拟技术的基础上进一步发展，旨在打造一个涵盖该公司全部游戏历史的统一平台。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://news.xbox.com/en-us/2026/03/11/project-helix-building-next-generation-of-xbox/">From GDC: Building the Next Generation of Xbox - XBOX Wire</a></li>
<li><a href="https://en.wikipedia.org/wiki/List_of_backward-compatible_games_for_Xbox_One_and_Series_X/S">List of backward-compatible games for Xbox One and Series X/S - Wikipedia</a></li>
<li><a href="https://www.windowscentral.com/gaming/pc-gaming/xbox-pc-back-compat-360-emulator">Xbox's new backwards-compatible games on PC are "already Xbox 360 games" — and that changes everything about what's next | Windows Central</a></li>

</ul>
</details>

**标签**: `#gaming`, `#xbox`, `#hardware`, `#backwards-compatibility`, `#microsoft`

---