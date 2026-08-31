---
layout: default
title: "Horizon Summary: 2026-08-31 (ZH)"
date: 2026-08-31
lang: zh
---

> 从 49 条内容中筛选出 6 条重要资讯。

---

1. [Simon Willison 整理 ChatGPT Work 内部工具与技能参考文档](#item-1) ⭐️ 7.0/10
2. [SlopTV：基于 MiniMax H3 在双 5090 上完全本地运行的无限 AI 直播](#item-2) ⭐️ 7.0/10
3. [用 BirdNET-Go 把家用监控摄像头改造成自动鸟类识别系统](#item-3) ⭐️ 6.0/10
4. [Netdev 0x1A 大会视频与幻灯片现已上线](#item-4) ⭐️ 5.0/10
5. [Linux 7.3 合并窗口关闭，共纳入 15,267 个非合并提交](#item-5) ⭐️ 5.0/10
6. [Archify：生成动画式自包含 HTML 图表的 Agent 技能](#item-6) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [Simon Willison 整理 ChatGPT Work 内部工具与技能参考文档](https://codex-tool-reference.simonw.chatgpt.site/) ⭐️ 7.0/10

Simon Willison 发布了一个参考网站，记录了 ChatGPT Work 的内部工具与技能。最值得关注的发现是 control-browser 技能：它指导 ChatGPT Work 通过 Node.js REPL 启动 Playwright 实例，然后执行 `nodeRepl.write(await browser.documentation())` 来以编程方式获取自身的使用说明。 这揭示了一种自文档化的工具设计模式——智能体在运行时通过查询工具本身来学习如何使用它，而不是依赖臃肿的系统提示词。任何构建或评估智能体工具的人都可以借鉴这种按需加载的方式，以保持提示词精简且指令始终最新。 技能源码规定：浏览器仅用于需要实时网站状态的已登录或公开网页任务；登录必须使用声明的 `browserAuth` 能力；公开查询应优先使用网络搜索，且搜索失败时绝不能回退到浏览器工具。Playwright 是微软的跨浏览器自动化库，支持 Chromium、Firefox 和 WebKit，如今明确面向 AI 智能体工作流。 访问 codex-tool-reference.simonw.chatgpt.site 查看完整的技能列表和 control-browser 的文档内容。如果你在开发智能体工具，可以考虑采用同样的模式：为工具暴露一个 `documentation()` 方法，让智能体按需获取使用说明。

hackernews · ijidak · 8月31日 14:07 · [社区讨论](https://news.ycombinator.com/item?id=49510000)

**背景**: ChatGPT Work 是 OpenAI 的智能体产品，可以代替用户浏览网页并执行操作，在完成付款等有后果的操作前会请求许可。技能（skills）是教会智能体如何使用特定工具的打包指令，而 Playwright 是微软开发的程序化驱动真实浏览器的库。Node.js REPL 是一个交互式 JavaScript 执行环境，智能体可以在其中运行任意 Node.js 代码来控制浏览器。`browser.documentation()` 模式意味着完整的使用手册只在需要时才获取，从而使技能定义本身保持精简。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://codex-tool-reference.simonw.chatgpt.site/skills/control-browser">control-browser · Skill source</a></li>
<li><a href="https://playwright.dev/">Fast and reliable end-to-end testing for modern web apps | Playwright</a></li>
<li><a href="https://openai.com/index/introducing-chatgpt-agent/">Introducing ChatGPT agent: bridging research and action | OpenAI</a></li>

</ul>
</details>

**社区讨论**: Simon Willison 本人重点指出了 control-browser 技能的自文档化机制是最有趣的细节，并链接了其创建提示词的背景说明。有评论者质疑这与 Codex 有何区别，因为两者能力重叠；另有一位评论者发表了题外话，认为 AI 生成的网站外观千篇一律，让人想起 Bootstrap 时代。

**标签**: `#AI agents`, `#ChatGPT`, `#Playwright`, `#browser automation`, `#LLM tools`

---

<a id="item-2"></a>
## [SlopTV：基于 MiniMax H3 在双 5090 上完全本地运行的无限 AI 直播](https://www.reddit.com/r/LocalLLaMA/comments/1w3i7ze/sloptv_an_infinite_livestream_of_ai_slop/) ⭐️ 7.0/10

一位开发者构建了 SlopTV，这是一个无限时长的 YouTube 直播：聊天评论由 LLM 扩写成 400 词的提示词，再由完全本地运行在两块 RTX 5090 上的 MiniMax H3 渲染成 15 秒的视频片段。int8 剪枝扩散模型（19.5GB）和 nvfp4 文本编码器（14.6GB）无法同时装进一张 32GB 显卡，因此依靠 ComfyUI 的 VRAM 卸载处理溢出，大约每 45 秒产出一条新片段。 除了趣味性之外，该项目记录了可迁移的本地视频生成经验：量化方案选择、VRAM 卸载策略，以及 H3 在 352p 分辨率下提示词遵循效果最好（再放大到 1080p）这一意外发现。任何运行本地扩散模型流水线的人都可以复用这些调优经验。 值得注意的坑包括：通过桩替换三个组件并伪装成服务器，可以把 ComfyUI 嵌入自己的进程；YouTube 的 gRPC 直播聊天 API 需要自己编译 proto，而官方发布的 proto 根本编译不过，REST 替代方案则会在 30 分钟内耗尽每日配额；小模型会照抄系统提示中的示例，因此只用规则和占位符比少样本示例效果更好。 克隆 SlopTV 仓库（github.com/shuttie/SlopTV）研究其 ComfyUI 嵌入和 VRAM 卸载方案；如果你在本地运行 MiniMax H3，可以尝试以 352p 分辨率渲染以获得更好的提示词遵循，然后再放大。

reddit · r/LocalLLaMA · /u/InvadersMustLive · 8月31日 16:07

**背景**: MiniMax H3 是一个开放权重的多模态生成模型，可生成带原生音频的视频，最长 15 秒、最高 2K 分辨率。在本地运行它需要把庞大的模型组件装入显存，因此量化（扩散模型用 int8、文本编码器用 nvfp4）以及 ComfyUI 的 VRAM 卸载（将模型部分移到内存）对消费级硬件至关重要。该项目灵感来自 @levelsio 的 infiniteslop，但完全运行在作者自己的 GPU 上而非云端 API。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.minimax.io/blog/minimax-h3">MiniMax H 3 : An Open Model Breaking the Boundaries Between Tasks...</a></li>
<li><a href="https://www.instasd.com/post/comfyui-vram-offloading-guide">ComfyUI VRAM Guide: Run MiniMax H3 on 8-16 GB Cards</a></li>

</ul>
</details>

**标签**: `#video-generation`, `#local-llm`, `#minimax-h3`, `#comfyui`, `#gpu-inference`

---

<a id="item-3"></a>
## [用 BirdNET-Go 把家用监控摄像头改造成自动鸟类识别系统](https://jasontucker.blog/how-i-turned-my-security-cameras-into-an-automatic-bird-identification-system-with-birdnet-go/) ⭐️ 6.0/10

一位爱好者发布了教程，展示如何将现有监控摄像头的 RTSP 音频流接入 BirdNET-Go，实现全天候自动鸟类物种识别。除了摄像头和一台小型常驻运行的计算机外，无需额外硬件。 该项目高度可复现，展示了一个可迁移的模式：把现有的物联网/流媒体数据接入本地开源机器学习模型进行实时分类。任何有家用摄像头的人都能低成本搭建野生动物监测或类似的音频分类系统。 BirdNET-Go 可接收声卡输入或网络音频流（如 Unifi 摄像头的 RTSP 流），并在树莓派上运行多模型本地 AI 推理。有评论者指出 markdown 卡片中用 U+2581–U+2587 替代 U+2588 可避免方块字符超出基线，另有人在类似项目 birdhomie 中发现物种检测准确度尚不理想。 如果你的摄像头支持 RTSP（如 Unifi），可以在树莓派或闲置电脑上安装 BirdNET-Go，并将其指向摄像头的 RTSP 音频流，即可开始记录鸟类物种检测结果。

hackernews · speckx · 8月31日 16:47 · [社区讨论](https://news.ycombinator.com/item?id=49511856)

**背景**: BirdNET-Go 是一个开源自托管的实时声景分析器，通过音频识别鸟类、蝙蝠等野生动物，可全天候在本地运行。RTSP（实时流协议）是大多数 IP 监控摄像头输出直播音视频流的标准协议，因此工具可以方便地“监听”摄像头。由于推理在本地进行，无需云订阅或上传数据。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/tphakala/birdnet-go">GitHub - tphakala/birdnet-go: Self-hosted realtime soundscape analyser for birds, bats and other wildlife. Multi-model local AI inference, runs 24/7 on a Raspberry Pi. · GitHub</a></li>
<li><a href="https://www.kyleniewiada.org/blog/2025/05/backyard-bird-tracking-with-ai/">Backyard Bird Tracking With AI-Powered BirdNET-Go</a></li>
<li><a href="https://en.wikipedia.org/wiki/Real-Time_Streaming_Protocol">Real-Time Streaming Protocol - Wikipedia</a></li>

</ul>
</details>

**社区讨论**: 评论者反响热烈，分享了类似搭建，包括用 Unifi 门铃 RTSP 流并计划用电子墨水屏显示识别到的鸟类，以及一个名为 birdhomie 的开源替代方案。实用反馈包括 markdown 卡片的 Unicode 渲染修复，不过有用户提到自己项目中的物种检测准确度还不够好。

**标签**: `#DIY`, `#machine-learning`, `#BirdNET-Go`, `#home-automation`, `#computer-vision`

---

<a id="item-4"></a>
## [Netdev 0x1A 大会视频与幻灯片现已上线](https://lwn.net/Articles/1091600/) ⭐️ 5.0/10

于 7 月 13 日至 16 日在意大利罗马举行的 Netdev 0x1A 大会的全部会议视频和幻灯片已发布上线。议题涵盖 Linux QUIC、共享内存套接字传输以及基于 eBPF 的 DDoS 防护等。 Netdev 是 Linux 内核网络开发者最重要的会议，其会议资料是从业者了解前沿网络技术的主要途径。从事 QUIC 卸载、eBPF/XDP 包处理或高性能进程间通信的工程师都能从这些演讲中直接受益。 该新闻本身只是指向 netdevconf.info 会议页面的链接，没有嵌入具体内容或讨论。值得关注的议题包括内核态 QUIC 实现（lxin/quic 项目要求内核版本不低于 6.1，并支持硬件加密卸载）以及基于 eBPF/XDP 的 DDoS 缓解方案。 浏览 Netdev 0x1A 的会议页面，观看关于 Linux QUIC 和基于 eBPF 的 DDoS 防护的演讲；如果有兴趣实验，可以在运行 6.1 或更新内核的机器上克隆 lxin/quic 内核模块进行尝试。

rss · LWN.net · 8月31日 14:44

**背景**: Netdev 是专注于 Linux 内核网络的社区会议，议题涵盖从驱动开发到协议设计的各个方面。QUIC 是一种基于 UDP 的传输协议（HTTP/3 使用），传统上在用户态实现；将其移入内核可以降低开销并支持硬件卸载。eBPF 允许在内核中进行安全、可编程的包处理，基于 XDP 的 eBPF 程序能在数据包接收的最早阶段丢弃恶意流量，因此对 DDoS 缓解非常有效。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/lxin/quic">GitHub - lxin/quic: In-kernel QUIC implementation with Userspace handshake · GitHub</a></li>
<li><a href="https://dev.to/douglasmakey/harnessing-ebpf-and-xdp-for-ddos-mitigation-a-rust-adventure-with-rust-aya-4k1h">Harnessing eBPF and XDP for DDoS Mitigation - A Rust Adventure with rust-aya - DEV Community</a></li>

</ul>
</details>

**标签**: `#networking`, `#linux-kernel`, `#ebpf`, `#conference`, `#quic`

---

<a id="item-5"></a>
## [Linux 7.3 合并窗口关闭，共纳入 15,267 个非合并提交](https://lwn.net/Articles/1089791/) ⭐️ 5.0/10

Linus Torvalds 发布了 7.3-rc1 并关闭了合并窗口，共有 15,267 个非合并变更集进入主线，这是内核历史上第二高的 -rc1 提交数。其中约 13,000 个提交是在 LWN 上半程合并窗口总结发布之后进入主线的。 合并窗口总结是内核开发者和系统工程师跟踪每个版本变化的标准方式，无需阅读数千个提交。异常高的提交数表明 7.3 变动很大，对于计划在新内核上开展驱动、文件系统或虚拟化工作的人值得关注。 只有 6.7-rc1 的提交数更多，而那是因为一次性合并了近 3,000 个 bcachefs 历史提交。关于 7.3-rc1 的报道还提到代码总量约 4,100 万行、Apple Thunderbolt 支持相关工作以及 KVM 的大幅改造。 阅读 LWN 全文以了解各子系统的详细变更；如果你运行前沿内核，可以下载并测试 7.3-rc1，在稳定化阶段尽早报告回归问题。

rss · LWN.net · 8月31日 14:12

**背景**: Linux 内核采用基于时间的开发周期：每个版本发布后，会开启约两周的合并窗口，子系统维护者在此期间向 Linus Torvalds 发送包含新特性的拉取请求。窗口关闭后，他会标记第一个候选版本（-rc1），此后直到正式发布前只接受错误修复。bcachefs 是一个写时复制（copy-on-write）的 Linux 文件系统，在 6.7 周期中合入内核，同时带来了庞大的既有 git 历史。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://docs.kernel.org/process/2.Process.html">2. How the development process works — The Linux Kernel documentation</a></li>
<li><a href="https://en.wikipedia.org/wiki/Bcachefs">Bcachefs - Wikipedia</a></li>
<li><a href="https://www.linuxcompatible.org/story/linux-kernel-73rc1-released-41m-lines-apple-thunderbolt-and-kvm-overhaul">Linux Kernel 7.3-rc1 Released: 41M Lines, Apple Thunderbolt, and KVM Overhaul</a></li>

</ul>
</details>

**标签**: `#linux-kernel`, `#open-source`, `#kernel-development`, `#merge-window`

---

<a id="item-6"></a>
## [Archify：生成动画式自包含 HTML 图表的 Agent 技能](https://github.com/tt-a1i/archify) ⭐️ 5.0/10

新 GitHub 项目 tt-a1i/archify 在过去 24 小时内获得 29 颗星，正在走红。它提供一个 agent 技能，能生成自包含 HTML 格式的架构图、时序图、工作流、数据流和生命周期图，带动画效果且可清晰导出。 需要撰写系统设计文档的工程师可以用这个技能让 AI 代理生成精美、可验证的图表，无需依赖外部工具。由于输出是单个自包含 HTML 文件，图表便于分享、嵌入和纳入文档流程。 该项目仍处于极早期：仅 29 星、5 个 fork，没有社区讨论或成熟度证据，价值尚属推测。它遵循新兴的 Agent Skills 模式（面向 Claude 等 AI 编码助手的 SKILL.md 指令包），并与 cathrynlavery/diagram-design 等类似项目竞争。 从 GitHub 克隆该仓库并尝试将技能安装到你的 AI 编码助手中，然后让它为你的某个服务生成一张时序图，亲自评估输出质量。

ossinsight · tt-a1i · 8月31日 18:14

**背景**: Agent Skills 是可复用的指令包（包含 SKILL.md 文件及可选脚本/资源的文件夹），用于教会 AI 代理处理某类任务，可在 Claude、Cursor、Codex 等助手中使用。传统图表绘制常依赖 Mermaid 或 draw.io，而自包含 HTML/SVG 输出避免了外部依赖，还能包含动画和交互，同时易于验证和分享。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://docs.claude.com/en/docs/agents-and-tools/agent-skills/overview">Agent Skills - Claude Docs</a></li>
<li><a href="https://github.com/ComposioHQ/awesome-claude-skills">GitHub - ComposioHQ/awesome- claude - skills : A curated list of...</a></li>
<li><a href="https://github.com/cathrynlavery/diagram-design">GitHub - cathrynlavery/diagram-design: 38 editorial diagram types for Claude Code, Codex, and Pi. Self-contained HTML + SVG. No shadows. No Mermaid slop. · GitHub</a></li>

</ul>
</details>

**标签**: `#open-source`, `#diagramming`, `#ai-agents`, `#documentation`, `#developer-tools`

---