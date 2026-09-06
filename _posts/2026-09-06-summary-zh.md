---
layout: default
title: "Horizon Summary: 2026-09-06 (ZH)"
date: 2026-09-06
lang: zh
---

> 从 19 条内容中筛选出 6 条重要资讯。

---

1. [Asahi Linux 正式支持 Apple M3 Mac（附带限制条件）](#item-1) ⭐️ 6.0/10
2. [Interisle 报告：新注册 gTLD 域名中 10-20%为恶意域名](#item-2) ⭐️ 6.0/10
3. [用 GPT Astra 通过 MCP 教 Qwen Next 在 Blender 中进行 3D 雕刻](#item-3) ⭐️ 6.0/10
4. [双 RX 9700 主机用 vLLM 跑 Qwen 3.8，价格仅 RTX 5090 一半](#item-4) ⭐️ 6.0/10
5. [llama.cpp 新增 Spark-X2.5 模型支持，混合注意力实现百万级上下文](#item-5) ⭐️ 6.0/10
6. [在获得法律意见后，Nitter 项目将继续运营](#item-6) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [Asahi Linux 正式支持 Apple M3 Mac（附带限制条件）](https://www.phoronix.com/news/Asahi-Linux-Official-M3) ⭐️ 6.0/10

Asahi Linux 宣布正式支持搭载 Apple M3 芯片的 Mac，但附带重要限制，例如尚不支持 HDMI 和睡眠功能。这一支持来自团队对 Apple 芯片的持续逆向工程，相关细节已在开发者博客文章中公布。 尽管 Apple 完全不提供公开文档，该项目仍将原生 Linux 支持扩展到了更新一代的 Apple 硬件，展示了社区逆向工程的能力上限。希望在 M3 Mac 上原生运行 Linux（而非虚拟机）的用户将直接受益。 睡眠（挂起）和 HDMI 输出目前尚不可用，社区认为这是日常使用的主要障碍。Apple 不为 M 系列芯片发布任何硬件文档，因此每一代芯片的驱动都需要从头逆向工程。 如果你拥有 M3 Mac 并想运行原生 Linux，请先阅读 Asahi 团队的博客文章，并在 asahilinux.org 上查看功能支持矩阵，确认你的具体机型哪些硬件可用。

hackernews · mdp2021 · 9月6日 14:08 · [社区讨论](https://news.ycombinator.com/item?id=49586698)

**背景**: Asahi Linux 由 Hector Martin 发起，由于 Apple 不为其 SoC 提供官方文档，该项目完全依靠逆向工程将 Linux 内核及配套软件移植到 Apple Silicon Mac 上。项目从 M1 开始，逐步扩展到 M2，现在又扩展到 M3，包括改造现有驱动和从零编写 GPU 驱动。每一代芯片的细微硬件变化都迫使团队重新验证此前的假设，这也是支持需要逐步推进并附带限制的原因。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Asahi_linux_project">Asahi linux project</a></li>
<li><a href="https://asahilinux.org/">Asahi Linux</a></li>

</ul>
</details>

**社区讨论**: 评论者称赞这项逆向工程工作非常了不起，有人将其比作在火箭发射途中修飞船。有人对 Apple 连基本规格文档都不公开表示不满；用户指出缺失的睡眠和 HDMI 支持仍是实际使用障碍；还有人好奇 M 系列各代芯片之间的规格究竟变化了多少。

**标签**: `#linux`, `#apple-silicon`, `#asahi-linux`, `#reverse-engineering`, `#open-source`

---

<a id="item-2"></a>
## [Interisle 报告：新注册 gTLD 域名中 10-20%为恶意域名](https://simonwillison.net/2026/Sep/6/the-purpose-of-dns-is-to-spread-scams/) ⭐️ 6.0/10

Interisle 咨询集团对 2025 年 gTLD 域名注册的分析显示，8500 万新注册域名中有 850 万个在 2025 年 5 月前被列入封禁清单，意味着恶意注册率至少为 10%，很可能接近 20%。Terence Eden 和 Simon Willison 强调这些数据，指出 DNS 实际上已成为犯罪分子实施诈骗的重要渠道。 任何运营网络服务、过滤内容或在网络数据上训练模型的人，都应假设相当一部分新注册域名是恶意的，并默认对未知新域名保持警惕。这些数据为在安全流程中对新注册域名采取激进过滤和验证措施提供了具体依据。 该报告仅涵盖 gTLD（如.com、.living、.travel 等通用顶级域名），不包括国家代码顶级域名，且基于封禁清单的估算很可能低估了实际滥用程度。ICANN 自 2024 年 4 月起对注册局和注册商执行更严格的 DNS 滥用义务，但问题依然存在。 阅读 interisle.net/cybercriminaldomaindemand 上的 Interisle 完整报告，并在你的电子邮件、链接预览或内容过滤系统中加入新注册域名检查（例如域名年龄过滤或封禁清单数据源）。

rss · Simon Willison · 9月6日 14:40

**背景**: 域名系统（DNS）将人类可读的域名转换为 IP 地址，任何人都可以在通用顶级域名（gTLD）下以极低的验证门槛注册域名，这使其成为钓鱼和诈骗活动的廉价弹药。Interisle 咨询集团是一个安全研究组织，利用封禁清单数据定期发布关于网络犯罪分子域名需求的报告。ICANN 是协调 DNS 根区的机构，拥有对注册商和注册局执行 DNS 滥用缓解的合同机制，但执法力度一直落后于问题规模。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://interisle.net/insights/cybercriminaldomaindemand">Malicious Registrations in the Domain Name Market: An Analysis of 2025 gTLD Registrations and Cybercriminal Demand — Interisle Consulting Group</a></li>
<li><a href="https://www.icann.org/dnsabuse">DNS Abuse Mitigation Program - ICANN</a></li>
<li><a href="https://natlawreview.com/press-releases/interisle-study-finds-malicious-actors-accounted-10-20-new-domain-name">Interisle Study Finds Malicious Actors Accounted for 10-20% of New Domain Name Registrations in 2025</a></li>

</ul>
</details>

**标签**: `#DNS`, `#security`, `#web`, `#domain-abuse`

---

<a id="item-3"></a>
## [用 GPT Astra 通过 MCP 教 Qwen Next 在 Blender 中进行 3D 雕刻](https://www.reddit.com/r/LocalLLaMA/comments/1w90igd/using_gpt_astra_to_teach_qwen_next_how_to_sculpt/) ⭐️ 6.0/10

一位 Reddit 用户演示了一种工作流：由 OpenAI 的前沿模型 GPT-6 Astra（配合 Codex）生成分步指导，再由较小的开源模型 Qwen Next 通过 MCP Blender 服务器执行 3D 雕刻修改。这用上下文引导替代了蒸馏或微调等传统技能迁移方法。 这篇帖子提供了一个可复用的思路：与其对小型模型进行昂贵缓慢的微调，不如让前沿模型生成结构化指令、由廉价的开源模型执行，从而在推理阶段实现技能迁移。任何使用本地模型运行智能体工作流的人都可以将此模式推广到 3D 雕刻以外的领域。 作者指出 Astra 的质量非常出色，但会迅速耗尽 Pro 套餐额度，因此不适合作为唯一的执行者。帖子缺少实现细节、代码、提示词或基准测试，具体的指导形式（例如步骤列表还是工具调用示例）并不明确。 安装开源的 blender-mcp 插件，通过 OpenCode 或其他支持 MCP 的客户端连接本地 Qwen 模型，尝试让 GPT Astra（或任何强模型）为一个简单雕刻任务生成带编号的 Blender Python 步骤，再把这些步骤交给 Qwen Next 执行。

reddit · r/LocalLLaMA · /u/LegacyRemaster · 9月6日 16:19

**背景**: MCP（模型上下文协议）是一个开放标准，让 AI 助手连接外部工具；Blender 的 MCP 服务器暴露了 Blender 的 Python API，使 LLM 能够通过自然语言控制 3D 建模操作。Qwen Next 指近期开源权重的 Qwen 模型（如 Qwen3-Coder-Next），经过了大量智能体与编码任务训练，很适合执行结构化指令。GPT-6 Astra 是 OpenAI 最强大的前沿模型，擅长复杂推理和计算机操作，但大规模运行成本高。帖子的核心洞见是：前沿模型的进步会间接惠及开源模型，因为前沿模型的知识可以在不修改权重的情况下转化为可复用的指导。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.blender.org/lab/mcp-server/">MCP Server — Blender</a></li>
<li><a href="https://github.com/ahujasid/blender-mcp">GitHub - ahujasid/blender-mcp: Community plugin to control ...</a></li>
<li><a href="https://openai.com/index/gpt-6-astra/">GPT-6 Astra: A new generation of intelligence | OpenAI</a></li>
<li><a href="https://qwen.ai/blog?id=qwen3-coder-next">Qwen3-Coder-Next: Pushing Small Hybrid Models</a></li>

</ul>
</details>

**标签**: `#LLM`, `#agent-workflow`, `#MCP`, `#Blender`, `#open-source-models`

---

<a id="item-4"></a>
## [双 RX 9700 主机用 vLLM 跑 Qwen 3.8，价格仅 RTX 5090 一半](https://www.reddit.com/r/LocalLLaMA/comments/1w92x3j/2x_r9700_64_gb_ddr5_is_an_absolute_beast_machine/) ⭐️ 6.0/10

一位 Reddit 用户分享了一台约 4000 欧元的本地推理主机：配备两块 32GB AMD Radeon AI PRO R9700（共 64GB 显存）、Ryzen 7500F 和 64GB DDR5，通过 vLLM Radiance/R9V 运行 Qwen3.8-27B。基准测试显示 MXFP4 量化的 Qwen3.8-27B 配合 MTP 投机解码的中位解码速度为 111.4 tok/s，而采用分层专家卸载的 Qwen3.8-Flash-Next 为 35.4 tok/s。 它展示了一种比单张 RTX 5090 更划算的具体替代方案：以低超过 1000 欧元的价格获得 64GB 显存，足以运行 27B 模型并保留完整的 131k 上下文。考虑组建预算型本地大模型推理主机的用户可以从中获得 AMD 显卡配合 vLLM 的真实性能数据，而这条路线的公开资料相对较少。 两张显卡均以 PCIe 5.0 x8 运行；MXFP4 量化配合 1 个 MTP 草稿（最多 8 token）达到 111.4 tok/s 加权中位解码速度，原生 FP8 为 87.6 tok/s，Flash-Next（GGUF UD-IQ4_XS、分层专家卸载）为 35.4 tok/s。需要注意的细节包括：EXPO 意外未开启，SATA SSD 对 Flash-Next 影响出乎意料地小，其中一张 GPU 温度高 10-15°C 因此计划限功率至 210W 并轻微降压，且测试仅为单流、无并发场景。 如果你在评估本地推理主机的预算，可以针对目标模型和上下文长度，把双 R9700 方案（64GB 显存、约 4000 欧元）与单张 5090（32GB、约 5000 欧元以上）做对比，并且在跑分前务必开启 EXPO 并使用高速 NVMe，以免测试结果失真。

reddit · r/LocalLLaMA · /u/smallDeltaBigEffect · 9月6日 17:48

**背景**: vLLM 是一个流行的开源 LLM 推理引擎，通过张量并行（TP）可将模型拆分到多张 GPU 上；R9V/vLLM Radiance 是支持 AMD ROCm 生态的分支。MTP（multi-token prediction）投机解码让模型一次预测多个 token 以提升解码速度，而“分层专家卸载”指将 MoE 模型的部分专家权重放在 CPU 内存或磁盘上以突破显存限制。MXFP4 和 FP8 是降低权重量化精度以节省显存和带宽的格式。

**标签**: `#local-llm`, `#vllm`, `#hardware`, `#amd-gpu`, `#inference`

---

<a id="item-5"></a>
## [llama.cpp 新增 Spark-X2.5 模型支持，混合注意力实现百万级上下文](https://www.reddit.com/r/LocalLLaMA/comments/1w90zdc/model_support_for_spark2_5forcausallm/) ⭐️ 6.0/10

由 KnightYao 提交的 PR #27868 为 llama.cpp 增加了 Spark2_5ForCausalLM 实现，使 Spark-X2.5-1.7B 和 Spark-X2.5-4B 可以在本地运行。这些模型采用混合注意力架构（1 层全局注意力加 3 层滑动窗口注意力），原生支持高达 100 万 token 的上下文窗口。 这表明通过混合注意力类型，即使在很小的模型中也能实现超长上下文，大幅降低长上下文推理通常所需的计算和内存开销。本地大模型用户因此获得了一个可在消费级硬件上处理长文档、编程和智能体工作流的开源选择。 官方称这些模型在同等规模的开源模型中，于编程、推理和智能体任务上表现领先，支持超过 200 种语言，并在华为昇腾集群上通过大规模强化学习后训练（如 MOPD）完成训练。XHToken 已在 Hugging Face 上提供 GGUF 量化版本，但该 llama.cpp 实现的独立基准测试尚未公布。 从 XHToken 的 Hugging Face 仓库（Spark-X2.5-4B-GGUF / Spark-X2.5-1.7B-GGUF）下载 GGUF 文件，待 PR #27868 合并后在 llama.cpp 或 LM Studio 中测试，重点关注长上下文下的内存占用表现。

reddit · r/LocalLLaMA · /u/jacek2023 · 9月6日 16:36

**背景**: 标准 Transformer 的注意力是全局的：每个 token 都会关注整个前文，成本随上下文长度呈平方增长。滑动窗口注意力（SWA）将每个 token 的关注范围限制在局部窗口内，显著降低计算量和 KV 缓存大小；混合设计（如 Gemma 2 以 1:1 比例混合全局与局部层）则在效率与远距离信息检索能力之间取得平衡。llama.cpp 是广泛使用的 C/C++ 推理引擎，其 GGUF 格式将模型张量和元数据存储在单个文件中，使量化模型能通过 Ollama、LM Studio 等工具在消费级硬件上运行。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/XHToken/Spark-X2.5">GitHub - XHToken/Spark-X2.5: Spark-x2.5 open model series ...</a></li>
<li><a href="https://sebastianraschka.com/llm-architecture-gallery/swa/">Sliding Window Attention (SWA) | Sebastian Raschka, PhD</a></li>
<li><a href="https://en.wikipedia.org/wiki/GGUF">GGUF - Wikipedia</a></li>

</ul>
</details>

**标签**: `#llama.cpp`, `#local-llm`, `#long-context`, `#model-architecture`, `#gguf`

---

<a id="item-6"></a>
## [在获得法律意见后，Nitter 项目将继续运营](https://github.com/zedeus/nitter) ⭐️ 5.0/10

此前因 X（前 Twitter）的法律威胁而关停的 Nitter 项目，在获得法律意见后宣布将继续运营。这扭转了此前 Nitter 和 XCancel 因 X 对替代前端进行法律打压而关闭的局面。 Nitter 让用户无需账号、无需 JavaScript、也不会被追踪 IP 即可阅读 X 上的公开帖子，这一点很重要，因为许多关键信息只发布在 X 上。它的存续表明开源前端项目能够应对围墙花园平台施加的法律压力，为 Invidious 等类似项目提供了借鉴。 Nitter 依赖 X 的非官方 API，无需开发者账号；2024 年初 X 移除了 Nitter 依赖的访客账号机制，导致大多数公共实例下线。此次公告本身技术细节很少，项目的长期可行性仍取决于能否找到可行的访问方式。 访问 Nitter 的 GitHub 仓库以跟进项目状态，并在依赖它之前确认目前哪些公共实例可用。

hackernews · Cider9986 · 9月6日 17:51 · [社区讨论](https://news.ycombinator.com/item?id=49589003)

**背景**: Nitter 是一个免费开源的 X 替代前端，灵感来自 Invidious 项目（YouTube 的替代前端），它将所有请求通过自己的后端转发，使 X 无法追踪用户。热门平台的替代前端屡遭法律威胁——Instagram 客户端 Barinsta 就曾在 Facebook 的类似压力下关停。X 近期对 Nitter 和 XCancel 的法律打压，是平台封锁内容访问这一更大趋势的一部分。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/zedeus/nitter">GitHub - zedeus/nitter: Alternative Twitter front-end</a></li>
<li><a href="https://cybernews.com/tech/musks-x-cracks-down-on-nitter-xcancel/">Tweet browsing tools Nitter and XCancel shut down after X legal threats</a></li>
<li><a href="https://wbcomdesigns.com/nitter-alternatives-and-competitors/">Nitter Alternatives That Actually Still Work</a></li>

</ul>
</details>

**社区讨论**: 评论者对项目继续运营表示欣慰，指出由于关键信息只发布在 X 上，替代前端很重要，并提到 Invidious 是另一个需要支持的项目。几位评论者分享了收到停止侵权函的经历，警告大公司可以靠花钱拖垮个人开发者。还有人感叹 X 事实上的垄断地位，并希望 AI 编程工具能帮助此类项目绕过平台的反制措施。

**标签**: `#open-source`, `#nitter`, `#twitter`, `#legal`, `#alternative-frontends`

---