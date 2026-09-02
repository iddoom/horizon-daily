---
layout: default
title: "Horizon Summary: 2026-09-02 (ZH)"
date: 2026-09-02
lang: zh
---

> 从 46 条内容中筛选出 7 条重要资讯。

---

1. [调查：21.5 万个批量制造的“最佳软件”页面被 Perplexity 引用](#item-1) ⭐️ 7.0/10
2. [类星体 438B：欧洲领先的 AI 模型](#item-2) ⭐️ 7.0/10
3. [Ars Technica 深度解析一起向生产网络投毒的 BGP 劫持事件](#item-3) ⭐️ 7.0/10
4. [Mistral 现在默认使用用户输入进行训练，企业版除外](#item-4) ⭐️ 6.0/10
5. [Claude 新系统提示词强烈拒绝复制歌词](#item-5) ⭐️ 5.0/10
6. [Incus 7.4 发布：新增 Secure Boot 密钥管理、准实时迁移与突发 I/O 限制](#item-6) ⭐️ 5.0/10
7. [H3-World：用 LoRA 实现语言控制的 gameplay 视频生成](#item-7) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [调查：21.5 万个批量制造的“最佳软件”页面被 Perplexity 引用](https://trellner.com/reports/manufactured-sources-behind-ai-recommendations/) ⭐️ 7.0/10

Trellner 的一项调查发现，仅有三个网站就批量生成了 215,128 个“最佳软件”推荐页面，而 AI 问答引擎 Perplexity 在其回答中引用了这些捏造的来源。这表明大规模 SEO 式内容操纵可以成功污染 AI 生成的答案。 这表明 AI 问答引擎继承了传统搜索引擎的垃圾信息操纵问题，用户不能盲目信任 AI 推荐的软件或来源。对于做研究、采购或内容策略的人来说，AI 工具给出的引用需要独立核实。 该操纵使用了程序化 SEO——通过模板自动生成针对海量长尾关键词变体（如“最适合某场景的某软件”）的页面。还有评论者指出该报告本身似乎也是 Claude 生成的产物，这一讽刺恰恰凸显了 AI 生成内容的泛滥程度。 在采纳 AI 推荐的软件或产品之前，点击查看其引用来源——检查它们是否是没有原创测评或署名的、模板化的低质量页面。对内容发布者而言，这个案例也提示要关注竞争对手是否在批量制造页面以抢占 AI 问答引擎的引用位。

hackernews · jakobgreenfeld · 9月2日 13:59 · [社区讨论](https://news.ycombinator.com/item?id=49536375)

**背景**: Perplexity 是一个 AI 问答引擎，结合实时网络搜索与大语言模型来生成带引用的综合答案。程序化 SEO 是一种自动生成成千上万个模板化页面、针对细分关键词查询的技术，长期被用于收割搜索流量。由于 AI 问答引擎在筛选和引用网页内容时的审查不如 Google 的反垃圾系统严格，批量生成的内容便能混入其引用池——这种做法有时被称为“LLM 优化”或 AI 搜索垃圾信息。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Perplexity_AI">Perplexity AI - Wikipedia</a></li>
<li><a href="https://grokipedia.com/page/Programmatic_SEO">Programmatic SEO</a></li>
<li><a href="https://www.perplexity.ai/hub/getting-started">Perplexity AI</a></li>

</ul>
</details>

**社区讨论**: 评论者普遍认同这一问题真实存在：有人引用研究表明 LLM 更偏好 LLM 生成的段落而非人类写作的内容，并称 Claude 经常检索到生成式网站；另有人分享了 LLM 自信地幻觉出一个并不存在的“Foobar 广场”还附上生动细节的经历。还有人指出 Perplexity 为追求响应速度而导致质量下降，调侃“Google 首先是反垃圾公司，其次才是搜索引擎”，并讽刺这份报告本身可能就是 Claude 写的。

**标签**: `#SEO`, `#AI search`, `#Perplexity`, `#content manipulation`, `#LLM bias`

---

<a id="item-2"></a>
## [类星体 438B：欧洲领先的 AI 模型](https://multiversecomputing.com/resources/introducing-quasar-438b-europe-s-leading-ai-model) ⭐️ 7.0/10

Multiverse Computing 宣称 Quasar-438B 是'欧洲领先的 AI 模型'，但 HN 评论者发现证据表明它很可能是 GLM 5.2 的张量网络压缩衍生版本，并非独立训练的模型。

hackernews · amunozo · 9月2日 10:02 · [社区讨论](https://news.ycombinator.com/item?id=49534132)

**标签**: `#AI models`, `#model compression`, `#critical analysis`, `#LLM benchmarks`, `#open-source`

---

<a id="item-3"></a>
## [Ars Technica 深度解析一起向生产网络投毒的 BGP 劫持事件](https://arstechnica.com/security/2026/09/well-executed-bgp-attack-uses-hijacked-ips-to-infect-real-networks/) ⭐️ 7.0/10

Ars Technica 发布了一起 BGP 劫持事件的详细事后分析：攻击者虚假宣告 IP 前缀，并利用被劫持的地址向真实生产网络推送恶意载荷。文章将事件描述为多重失误叠加的“连环错误”，而非单点高深漏洞利用。 BGP 劫持可在数分钟内于全球范围悄悄重定向互联网流量，把常规的软件更新或下载变成恶意软件的分发渠道。任何运营互联网基础设施或依赖网络分发软件更新的团队都能从事故中吸取切实的防御经验。 BGP 协议本身没有来源认证机制，虚假路由宣告会在任何人察觉之前全球传播——这正是本次攻击利用的核心弱点。基于 RPKI 的 ROA 可以让网络用密码学方式证明哪个自治系统有权宣告其前缀，从而使无效宣告被拒收，但目前部署仍不完整。 阅读 Ars Technica 的完整分析，然后审计本组织的防护状况：为所有前缀发布并强制执行 RPKI ROA（ROV），并对通过网络下载的软件做签名校验或固定来源，使路由劫持无法悄悄替换载荷。

rss · Ars Technica · 9月2日 11:00

**背景**: BGP（边界网关协议）是维系互联网整体运行的核心协议，让各个自治系统交换 IP 前缀的路由信息。当攻击者虚假宣告并不拥有的 IP 前缀时，就构成 BGP 劫持，流量会被引向攻击者控制的基础设施。由于 BGP 诞生于互信网络时代、没有来源验证机制，后来才出现 RPKI（资源公钥基础设施）等防御手段：前缀所有者发布签名的 ROA，路由器据此拒绝未经授权的宣告。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.cloudflare.com/learning/security/glossary/bgp-hijacking/">What Is BGP Hijacking?</a></li>
<li><a href="https://ipbnb.com/blog/rpki-bgp-hijacking-prevention">RPKI for Beginners: How to Secure Your IP Blocks from BGP Hijacking</a></li>
<li><a href="https://en.wikipedia.org/wiki/BGP_hijacking">BGP hijacking - Wikipedia</a></li>

</ul>
</details>

**标签**: `#security`, `#BGP`, `#networking`, `#incident-analysis`, `#supply-chain`

---

<a id="item-4"></a>
## [Mistral 现在默认使用用户输入进行训练，企业版除外](https://help.mistral.ai/en/articles/455207-can-i-opt-out-of-my-input-or-output-data-being-used-for-training) ⭐️ 6.0/10

Mistral 在非企业版（包括付费的 Team 版）中默认启用对用户提示词的训练，用户可选择退出，但管理员级别的控制仅限企业版，这一说明来自一次纠正最初表述的讨论。

hackernews · teekert · 9月2日 12:30 · [社区讨论](https://news.ycombinator.com/item?id=49535284)

**标签**: `#llm`, `#data-privacy`, `#mistral`, `#vendor-selection`, `#ai-policy`

---

<a id="item-5"></a>
## [Claude 新系统提示词强烈拒绝复制歌词](https://simonwillison.net/2026/Sep/2/claudes-new-system-prompt/) ⭐️ 5.0/10

Simon Willison 发现，Claude 新模型 Fable 5.1 的系统提示词新增了冗长的一节，明确拒绝完整或部分复制歌词、诗歌或书籍文章段落，并针对逐行粘贴等规避手段做了防范。Anthropic 还将公开的系统提示词文档从单页重组为索引页加每模型独立页面的形式，同时展示当前与历史版本。 新策略明确封堵了常见规避手段（改写措辞、逐行粘贴、声称是自己的作品），且仅允许 1929 年之前出版的作品，说明厂商正在系统提示词层面强化版权合规。Anthropic 重组后的公开提示词档案支持在任意文档 URL 后加 .md 获取 Markdown 内容，方便任何人对比不同模型版本之间的提示词变化。 新规则规定，一旦 Claude 拒绝某个歌词请求，它会在该对话后续中持续拒绝更窄或改写后的版本，并且依据自己对作品出版日期的判断而非用户的说法，不确定时直接拒绝。遗憾的是文档并未覆盖 Claude Code 和 Claude Cowork，Willison 通过他 GitHub 上的 Claude 系统提示词仓库来跟踪差异。 访问 platform.claude.com/docs/en/release-notes/system-prompts/overview 查看系统提示词索引（在 URL 后加 .md 可获取 Markdown 版本），或查看 Willison 的 claude-system-prompts GitHub 仓库，自行对比提示词变化。

rss · Simon Willison · 9月2日 14:16

**背景**: 系统提示词是发送在用户消息之前的隐藏指令块，用于引导大模型的行为、语气和拒绝策略。Anthropic 少见地公开了其消费级应用的这些提示词，让研究者可以审计其行为随时间的演变——Willison 一直在公开的 GitHub 仓库中跟踪它们。拒绝歌词是因为复制受版权保护的文本可能使厂商承担法律责任，而 1929 年前的作品属于公有领域。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://medium.com/@himanshubhoir/how-llms-treat-system-and-user-prompts-34bb93796802">How LLMs Treat System and User Prompts | by Himanshu... | Medium</a></li>
<li><a href="https://www.soundverse.ai/blog/article/why-ai-cant-provide-full-song-lyrics-due-to-copyright-restrictions-0916">Why AI Can't Provide Full Song Lyrics Due to Copyright ...</a></li>

</ul>
</details>

**标签**: `#Claude`, `#Anthropic`, `#system-prompt`, `#LLM`, `#AI`

---

<a id="item-6"></a>
## [Incus 7.4 发布：新增 Secure Boot 密钥管理、准实时迁移与突发 I/O 限制](https://lwn.net/Articles/1092229/) ⭐️ 5.0/10

系统容器与虚拟机管理器 Incus 发布了 7.4 版本，主要新特性包括：UEFI Secure Boot 密钥管理、Incus 实例之间的容器“准实时”迁移，以及磁盘和网络设备的突发 I/O 限制。 这些特性解决了运维中的常见痛点：Secure Boot 密钥管理提升虚拟机的安全合规性，准实时迁移提供了比基于 CRIU 的实时迁移更可靠的替代方案，突发 I/O 限制则有助于在多租户主机上更公平地分配资源。 新的准实时迁移基于本地 ZFS 或 Btrfs 存储实现，绕开了成功率高度依赖容器内工作负载的 CRIU，但会有短暂停机而非完全实时切换。突发 I/O 限制允许在短时间内超出配置的磁盘/网络 I/O 上限，从而吸收突发负载而不进行永久性限流。 请阅读 Linux Containers 论坛上的官方发布公告；如果你在 ZFS 或 Btrfs 上运行 Incus，可在实验环境中测试两个 Incus 实例之间的容器迁移，评估你的工作负载的停机时间。

rss · LWN.net · 9月2日 15:03

**背景**: Incus 是 LXD 的社区分支，通过 REST API 提供类似公有云的体验，用于在系统容器和虚拟机中运行完整的 Linux 系统。容器的实时迁移传统上依赖 CRIU（用户态检查点/恢复），它会保存进程树状态并在另一台主机上恢复，但对复杂工作负载较为脆弱。UEFI Secure Boot 是一种固件机制，只执行由受信任密钥（PK/KEK/db）签名的引导加载程序和内核，管理自定义密钥可让运维人员在虚拟机中运行自行签名的内核。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://linuxcontainers.org/incus/">Linux Containers - Incus - Introduction</a></li>
<li><a href="https://www.criu.org/Live_migration">Live migration - CRIU Incus 7.4 Adds Near-Live Container Migration for ZFS and Btrfs Practicable live container migrations in high performance ... Understanding Migration Mechanisms of Containers using CRIU Live Migrations for Containers with CRIU · ma.ttias.be</a></li>
<li><a href="https://github.com/lxc/incus">GitHub - lxc/incus: Powerful system container and virtual ...</a></li>

</ul>
</details>

**标签**: `#containers`, `#virtualization`, `#linux`, `#devops`, `#release-notes`

---

<a id="item-7"></a>
## [H3-World：用 LoRA 实现语言控制的 gameplay 视频生成](https://www.reddit.com/r/LocalLLaMA/comments/1w5akpy/h3world_turning_language_understanding_into_world/) ⭐️ 5.0/10

H3-World 是一种研究方法，它将角色与镜头动作的文本指令注入预训练的 MiniMax-H3 视频模型的语言通道，实现可控的游戏视频生成。该方法仅需 8000 个游戏样本、10000 步 LoRA 微调和 0.199% 的可训练参数，并能泛化到未见的动作组合与视觉场景。 它表明可以用极低的成本，把预训练视频模型变成可控的交互式世界模型，并以语言而非架构改动作为控制接口。这使可控视频仿真在游戏原型、具身智能研究和合成数据生成方面变得更易实现。 控制是按时间对齐的：每个视频潜变量区间接收各自的动作指令，从而在动作随时间变化时实现精确控制。该方法依赖 MiniMax-H3 原生支持语言条件的架构，文本指令因此可以直接引导视频生成。 先阅读 arXiv 上的论文（2609.01560），并浏览 GitHub 仓库和 Hugging Face 模型卡，确认硬件需求以及代码能否复现论文结果，再决定是否实验。

reddit · r/LocalLLaMA · /u/sachasayan · 9月2日 13:35

**背景**: 世界模型根据观测和动作生成未来的视频帧，近期系统在交互仿真中已展现出较强的动作可控性。LoRA（低秩适应）冻结预训练模型的权重，仅注入少量可训练的低秩矩阵，使微调在参数上非常高效。MiniMax-H3 是一个开源的全模态生成模型，能联合理解文本、图像、视频和音频，可生成最高 2K、15 秒的视频——H3-World 正是利用其文本通道来实现控制。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://arxiv.org/abs/2106.09685">[2106.09685] LoRA : Low - Rank Adaptation of Large Language Models</a></li>
<li><a href="https://github.com/MiniMax-AI/MiniMax-H3">GitHub - MiniMax-AI/MiniMax-H3 · GitHub</a></li>
<li><a href="https://arxiv.org/html/2608.13552">PlayWorld: Benchmarking World Modelswith Agent Players over...</a></li>

</ul>
</details>

**标签**: `#world-models`, `#video-generation`, `#LoRA`, `#research-paper`, `#controllable-generation`

---