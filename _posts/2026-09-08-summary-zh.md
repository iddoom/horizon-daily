---
layout: default
title: "Horizon Summary: 2026-09-08 (ZH)"
date: 2026-09-08
lang: zh
---

> 从 17 条内容中筛选出 4 条重要资讯。

---

1. [kernel.org 维护者：滥用型爬虫消耗的 CPU 已超过所有合法流量](#item-1) ⭐️ 8.0/10
2. [任务感知量化 TAK 以 15%体积达到 BF16 推理性能的 99%](#item-2) ⭐️ 7.0/10
3. [Broadcom 悄然下架 VMware VDDK 下载，逃离 VMware 变得更难](#item-3) ⭐️ 5.0/10
4. [Warrior Quest：本地 LLM 驱动的确定性状态 RPG](#item-4) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [kernel.org 维护者：滥用型爬虫消耗的 CPU 已超过所有合法流量](https://simonwillison.net/2026/Sep/7/creepy-crawlies/) ⭐️ 8.0/10

kernel.org 维护者 Konstantin Ryabitsev 报告称，为滥用型爬虫将 git 提交渲染为 HTML 所消耗的 CPU 周期，已经超过了包括 git 克隆在内的所有合法访问的总和。在 5 个地理分布节点上，随时都有 14 个 CPU 核心专门用于服务爬虫。 这是一份有具体数据支撑的一线报告，表明在 AI 时代，爬虫滥用已经连资源充足的开源项目都成了真实的基础设施成本，而不只是小型个人网站的问题。任何运营可被抓取网站（文档站、代码托管、数据发布）的人，都可以用它作为规划或论证反爬虫措施的依据。 14 核这一数字是 5 个节点在任何时刻的持续占用，且仅计算渲染 HTML 提交的成本——原始 git 克隆流量被单独归为合法流量。这篇文章与 Read the Docs 等此前关于 AI 爬虫给社区支持型网站带来沉重成本的报告相呼应。 阅读 people.kernel.org 上的原文和链接的 Hacker News 讨论串以了解缓解策略；如果你运营可被抓取的服务，请审计机器人流量构成，并考虑限流、缓存或 Anubis 之类的挑战式防护工具。

rss · Simon Willison · 9月7日 23:08

**背景**: git.kernel.org 是托管 Linux 内核源码的官方 Git 仓库，其基于 cgit 的网页界面按需将每个提交的 diff 渲染为 HTML，这比直接提供 git 对象要消耗更多 CPU。随着大模型训练数据采集的兴起，激进的 AI 爬虫屡屡无视 robots.txt 和速率限制，催生了 Anubis 这类基于工作量证明挑战的反代工具，但据报道一些机器人已经学会破解此类挑战。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Anubis_(software)">Anubis (software) - Wikipedia</a></li>
<li><a href="https://about.readthedocs.com/blog/2024/07/ai-crawlers-abuse/">AI crawlers need to be more respectful - Read the Docs</a></li>
<li><a href="https://github.com/TecharoHQ/anubis">GitHub - TecharoHQ/anubis: Weighs the soul of incoming HTTP requests to stop AI crawlers · GitHub</a></li>

</ul>
</details>

**社区讨论**: 该消息经由一条内容丰富的 Hacker News 讨论串（编号 49491791）传播，社区普遍对爬虫滥用表示不满；Simon Willison 也补充了他对 Datasette 的担忧，因为该项目提供大量可抓取页面，面临同样的成本压力。

**标签**: `#web-crawling`, `#infrastructure`, `#linux-kernel`, `#ai-scrapers`, `#web-operations`

---

<a id="item-2"></a>
## [任务感知量化 TAK 以 15%体积达到 BF16 推理性能的 99%](https://www.reddit.com/r/LocalLLaMA/comments/1wa5dp9/my_qwen3827b_taskaware_quant_reaches_99_of_bf16/) ⭐️ 7.0/10

一位业余研究者发布了 TAK（Task Aware Knapsack）任务感知量化流水线，其 Qwen3.8-27B 推理专用量化在推理基准上得到 82.81%，而字节数匹配的 Unsloth UD IQ2_S 为 77.34%，BF16 为 83.59%。该方法在 Qwen3.5-4B、Gemma 4 E4B 和 Gemma 3 4B QAT 上也胜过同等大小的 Unsloth Dynamic 量化，提升幅度从 5.47 到 19.53 个百分点不等。 这表明针对单一任务定制量化精度分配（而非通用压缩还原），可以在极高压缩率下大幅保留质量，让用户在普通本地硬件上运行接近全精度的推理模型。该结果与 TASA 等学术研究一致：任务感知的 3.5-bit 模型可以匹敌任务感知较弱的 4-bit 基线。 TAK 先构建任务专用的 imatrix，找到模型崩溃前的最小体积临界点，然后在字节预算内对各张量做精度提升或降级——不涉及剪枝、微调或模型合并。有用户反馈用这个推理专用量化写代码时出现重复循环，因为代码不在其目标领域内；结果在保留数据集上验证，模型已发布在 HuggingFace 的 ByteOtter 账号下。 从 HuggingFace 下载 ByteOtter 的 TAK 量化模型，在你自己的推理任务上与现有的 Unsloth 量化做对比测试，但注意代码任务目前不在其适用范围内。

reddit · r/LocalLLaMA · /u/devildip · 9月7日 21:42

**背景**: 大模型通常以 BF16（每个权重 16 位）发布，体积过大难以在消费级硬件上运行，因此需要量化将权重压缩到更低位宽，但会损失精度。Unsloth 的 Dynamic GGUF 量化是流行的行业标准，通过在不同层间使用不同位宽来保留质量。TASA（arXiv 2607.00908）等任务感知方法更进一步，利用任务专用校准数据和精度分配，证明合理分配的低比特模型可以匹敌更高位宽的通用基线。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://arxiv.org/abs/2607.00908">[2607.00908] Beyond Activation Alignment:The Alignment-Diversity Tradeoff in Task-Aware LLM Quantization</a></li>
<li><a href="https://unsloth.ai/docs/basics/dynamic-3.0-ggufs">Unsloth Dynamic 3.0 GGUFs | Unsloth Documentation</a></li>
<li><a href="https://developers.redhat.com/articles/2026/09/02/llm-quantization-guide-how-to-do-it--and-how-it-helps">LLM quantization guide: How to do it, and how it... | Red Hat Developer</a></li>

</ul>
</details>

**社区讨论**: 有社区成员用这个推理专用量化模型写代码时遇到重复循环问题，作者承认代码不在目标领域内，并表示会复现并研究这一失败模式。

**标签**: `#quantization`, `#local-llm`, `#llm`, `#open-source`, `#benchmarking`

---

<a id="item-3"></a>
## [Broadcom 悄然下架 VMware VDDK 下载，逃离 VMware 变得更难](https://www.virtualizationhowto.com/2026/09/leaving-vmware-just-got-harder-after-broadcom-pulled-vddk-downloads/) ⭐️ 5.0/10

2026 年 8 月下旬，Broadcom 在没有任何公告、弃用通知或迁移方案的情况下，悄然从下载门户移除了 VMware 虚拟磁盘开发工具包（VDDK），相关页面现在返回 404 错误。大多数无代理的 VMware 到 KVM/其他管理程序的迁移工具都依赖这些下载，但 VMware 到 Proxmox 的迁移不受影响。 VDDK 是众多第三方备份和迁移产品的核心依赖，它的下架直接提高了脱离 vSphere 的成本和难度，这是基础设施团队在做平台选型时需要考虑的厂商锁定的具体案例。正在进行或计划迁离 VMware 的企业现在面临工具受阻或降级的问题。 此次下架完全是静默进行的——没有弃用通知，也没有替代方案，直接导致多年来嵌入在无代理迁移工具中的下载链接失效。VMware 到 Proxmox 的迁移不经过 VDDK（Proxmox 可以把 ESXi 挂载为存储并直接复制虚拟机），因此该路径仍然可用。 如果你依赖基于 VDDK 的备份或迁移工具，请确认供应商是否镜像或重新分发了该工具包，或通过有效的授权许可联系 Broadcom 支持获取访问权限；同时可以评估 Proxmox 直接从 ESXi 存储导入的方式，作为不依赖 VDDK 的迁移替代方案。

hackernews · josephcsible · 9月7日 20:32 · [社区讨论](https://news.ycombinator.com/item?id=49602699)

**背景**: VDDK 是一组库和实用工具，允许软件开发者访问和操作 vSphere、Workstation 和 Fusion 所使用的虚拟磁盘（VMDK 文件）。自 Broadcom 收购 VMware 以来，其授权和订阅模式的调整被普遍视为在向存量客户榨取价值，促使许多用户评估 Proxmox VE、Hyper-V、KVM 和 Apache CloudStack 等替代方案。无代理的迁移和备份工具依赖 VDDK 直接从 vSphere 存储读取 VMware 磁盘，而无需在客户机内安装代理。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://byteiota.com/broadcom-pulls-vmware-vddk-exit-door-bolted/">Broadcom Pulls VMware VDDK: The Exit Door Is Bolted | byteiota</a></li>
<li><a href="https://www.shapeblue.com/broadcom-vddk-download-vmware-to-kvm/">Broadcom Removes VDDK Pages Without Explanation: What You ...</a></li>
<li><a href="https://micronauts.us/blog/broadcom-pulls-vddk-download-access/">Broadcom Pulls Public Access to the VDDK: What It Is, Why It ...</a></li>

</ul>
</details>

**社区讨论**: 评论者对 VMware 在 Broadcom 手下的衰落表示惋惜和怀旧，一位前 VMware 工程师认为该公司正被在价值耗尽前榨取现金。在实践层面，多位评论者指出迁移到 Proxmox 出奇地轻松（将 ESXi 挂载为存储后直接复制虚拟机），而一位迁移到 Hyper-V 的评论者则认为微软的工具链割裂且难用。还有人将 VDDK 下架视为 Broadcom 在“给客户建笼子”的证据，认为信任已严重受损，即使降价也难以留住客户。

**标签**: `#vmware`, `#broadcom`, `#virtualization`, `#vendor-lock-in`, `#proxmox`

---

<a id="item-4"></a>
## [Warrior Quest：本地 LLM 驱动的确定性状态 RPG](https://www.reddit.com/r/LocalLLaMA/comments/1wa84sa/i_made_warrior_quest_a_local_llmpowered/) ⭐️ 5.0/10

一位软件工程师在 Steam 上发布了 Warrior Quest 的试玩版，这是一款黑暗奇幻 RPG：本地运行的 LLM（仅需 8GB 显存，无需 API 密钥）只负责 NPC 对话，而所有游戏状态、任务、世界逻辑和剧本故事都由确定性系统处理。试玩版包含约 60–90 分钟的内容，美术、音乐、音效以及基于开发者本人录音的 TTS 配音均为其自制。 这展示了一种可用于 LLM 游戏的架构模式：将 LLM 限制在狭窄且非权威的角色（对话生成）上，同时保持游戏正史和状态的确定性，从而避免任务幻觉或逻辑崩坏。对于想在普通硬件上构建类似混合系统的独立开发者来说，这是一个具体的设计参考。 所有内容完全在本地运行，最低需要 8GB 显存，不需要云端 LLM 或 API 密钥；NPC 的 TTS 语音源自开发者本人的配音。不过该帖属于自我宣传，并未说明使用了哪个 LLM、推理框架或提示词/隔离技术，实现细节需要通过试玩或向开发者询问才能得知。 在 Steam 上用 8GB 以上显存的 GPU 免费下载 Warrior Quest 试玩版，体验 LLM 驱动的 NPC 对话与确定性任务结构相结合的效果。如果你自己在开发 LLM 游戏，可以借鉴同样的边界设计：只让 LLM 生成对话和氛围文本，所有玩家可见的操作都由确定性规则引擎校验。

reddit · r/LocalLLaMA · /u/Rikkendo · 9月7日 23:37

**背景**: LLM 驱动的 NPC 通常用运行时文本生成取代传统的有限状态对话树，让玩家可以像在桌面跑团中一样自由交谈。但如果让 LLM 掌控游戏状态，就有产生幻觉的风险——虚构任务、物品或剧情矛盾。借助 Ollama 和 llama.cpp 等工具，7B 级小模型经量化后可在约 6–8GB 显存的消费级 GPU 上运行，这使得完全本地化的游戏内推理对独立游戏来说切实可行。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://markaicode.com/usecases/llm-for-gaming/">Ollama for Game Development: 5 Use Cases for NPCs , Dialogue , and...</a></li>
<li><a href="https://localai.computer/learn/llm-hardware-guide">LLM Hardware Guide | GPU, RAM & Storage Requirements</a></li>
<li><a href="https://gamereviewblog.org/llm-npc-generative-dialogue-architecture/">Real-Time Generative Dialogue Architecture and Gameplay Limits in...</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#game-development`, `#npc-emulation`, `#architecture`, `#indie-game`

---