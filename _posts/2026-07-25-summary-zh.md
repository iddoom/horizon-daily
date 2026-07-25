---
layout: default
title: "Horizon Summary: 2026-07-25 (ZH)"
date: 2026-07-25
lang: zh
---

> 从 20 条内容中筛选出 5 条重要资讯。

---

1. [Anthropic 发布 Claude Opus 5，以半价登顶 AI 排行榜](#item-1) ⭐️ 9.0/10
2. [Claude Opus 5 展现出对提示词注入攻击的强大抵抗力](#item-2) ⭐️ 8.0/10
3. [SpaceX 发射 V3 星链卫星，但助推器再次遭遇点火失败](#item-3) ⭐️ 7.0/10
4. [Prentis AI 实验室寻求融资 1 亿美元，专注于自动化日常计算机任务](#item-4) ⭐️ 6.0/10
5. [特朗普誓言调查欧盟对美国科技巨头的反垄断罚款](#item-5) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [Anthropic 发布 Claude Opus 5，以半价登顶 AI 排行榜](https://simonwillison.net/2026/Jul/24/introducing-claude-opus-5/#atom-everything) ⭐️ 9.0/10

Anthropic 发布了新的旗舰 AI 模型 Claude Opus 5，该模型以相当于 Claude Fable 5 等先前顶级模型一半的价格，提供了接近前沿水平的智能。该模型目前位居 Artificial Analysis 排行榜榜首，定价与前代 Opus 4.8 相同。 此次发布代表了性价比方面的重大突破，使接近前沿水平的 AI 能力更容易被开发者和企业所获取。这也加剧了行业竞争，Anthropic 证明了其能够以极低的成本匹配甚至超越更昂贵模型的智能水平。 Opus 5 被描述为具有“极度主动性”，在一个基准测试任务中，当被拒绝直接访问图像时，它自主编写了计算机视觉流水线来从原始像素中提取几何信息。虽然它在发现网络安全漏洞方面有所提升，但 Anthropic 刻意避免训练其利用这些漏洞的能力，使其在该领域仍落后于受限访问的 Mythos 5。

rss · Simon Willison · 7月24日 23:48

**背景**: Claude 模型家族包含多个层级，其中 "Mythos" 系列最为强大但受到限制，而 "Fable" 是 Mythos 的通用安全版本。Claude Fable 5 于 2026 年 6 月与 Mythos 5 一同发布，后者因具备发现软件漏洞的能力而被限制访问。Artificial Analysis 排行榜是一个被广泛引用的基准测试，用于比较来自 OpenAI、Anthropic 等提供商的大语言模型在质量、速度和价格方面的表现。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Claude_Fable_5">Claude Fable 5</a></li>
<li><a href="https://artificialanalysis.ai/leaderboards/models">LLM Leaderboard - Comparison of AI models from OpenAI, Anthropic...</a></li>

</ul>
</details>

**标签**: `#AI`, `#LLM`, `#Anthropic`, `#Claude Opus 5`, `#Machine Learning`

---

<a id="item-2"></a>
## [Claude Opus 5 展现出对提示词注入攻击的强大抵抗力](https://simonwillison.net/2026/Jul/25/boris-cherny/#atom-everything) ⭐️ 8.0/10

Boris Cherny 在谈及 Anthropic 新发布的 Claude Opus 5 时强调，该模型是迄今为止最难被提示词注入攻击的版本。在提示词注入评估和红队测试中，Opus 5 展现出了对成功操纵尝试的强大抵御能力。 提示词注入在 OWASP 2025 年 LLM 应用十大安全风险中排名第一，是当前 AI 部署面临的最关键未解决安全挑战。如果 Opus 5 确实在抗注入方面取得了实质性进步，这可能标志着向让基于 LLM 的智能体和工具在高风险环境中安全投入生产迈出的重要一步。 关于抗提示词注入的具体发现记录在 Claude Opus 5 系统卡片的第 73 页，不过 Cherny 指出该信息在其他评估分数中略显隐蔽。这些结果来自发布前进行的自动化提示词注入评估和对抗性红队测试。

rss · Simon Willison · 7月25日 00:42

**背景**: 提示词注入是一种安全漏洞，攻击者通过精心构造的输入诱骗 AI 语言模型忽略原有指令，转而执行攻击者的命令。该漏洞利用了一个根本性的架构弱点：LLM 无法可靠地区分可信的系统指令和不可信的用户数据。红队测试是一种源自军事和网络安全领域的测试方法，测试团队会在部署前主动寻找 AI 系统中的漏洞、边界情况和异常行为。系统卡片是 AI 公司发布的详细技术文档，用于披露模型的能力、局限性和安全评估结果。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://genai.owasp.org/llmrisk/llm01-prompt-injection/">LLM01:2025 Prompt Injection - OWASP Gen AI Security Project</a></li>
<li><a href="https://blog.cyberdesserts.com/prompt-injection-attacks/">Prompt Injection Attacks: Examples and Defences</a></li>
<li><a href="https://www.linkedin.com/pulse/red-teaming-artificial-intelligence-proactive-security-testing-jdo0c">Red Teaming Artificial Intelligence – Proactive Security Testing for...</a></li>

</ul>
</details>

**标签**: `#prompt-injection`, `#anthropic`, `#claude`, `#llm-security`, `#generative-ai`

---

<a id="item-3"></a>
## [SpaceX 发射 V3 星链卫星，但助推器再次遭遇点火失败](https://techcrunch.com/2026/07/24/spacex-launches-new-v3-starlink-satellites-but-suffers-another-booster-failure/) ⭐️ 7.0/10

在第二次 Starship V3 飞行中，SpaceX 成功部署了新一代 V3 星链卫星，标志着下一代运载火箭取得进展。然而，在尝试重新点燃超重型助推器发动机时，公司再次遭遇失败，而这一步骤对助推器回收和重复使用至关重要。 Starship 项目是 SpaceX 实现快速、完全可重复使用太空飞行愿景的核心，而助推器反复出现的点火失败凸显了实现这一目标的工程挑战。成功部署 V3 星链卫星也推进了 SpaceX 的卫星互联网星座建设，这是公司更宏大太空目标的重要收入来源。 Starship V3 在超重型助推器、Starlink 上面级和新型 Raptor 3 发动机方面进行了数十项重新设计，包括全新设计的推进系统。助推器重新点火程序在技术上要求很高，因为早期的 V1 和 V2 助推器只能自行重新点燃内环发动机，而外环发动机则需要发射台供应所需气体才能点火。

rss · TechCrunch · 7月24日 23:25

**背景**: SpaceX 的 Starship 是一种完全可重复使用的超重型运载火箭，由超重型助推器和 Starship 上面级组成，旨在大幅降低太空运输成本。Starship V3 代表了一次重大升级迭代，拥有全新设计的推进系统、改进的反应控制系统以及更强大的 Raptor 3 发动机。本次飞行中发射的星链 V3 卫星是 SpaceX 下一代互联网星座的一部分，该星座需要频繁的大容量发射，而这最终只有 Starship 能够提供。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.teslarati.com/spacex-unveils-sweeping-starship-v3-upgrades-ahead-may-19-launch/">SpaceX unveils sweeping Starship V3 upgrades ahead of May 19 launch</a></li>
<li><a href="https://www.reddit.com/r/SpaceXLounge/comments/1tkzr0h/starship_flight_12_objectives_and_results/">Starship flight 12 objectives and results : r/SpaceXLounge - Reddit</a></li>
<li><a href="https://en.wikipedia.org/wiki/SpaceX_Starship">SpaceX Starship - Wikipedia</a></li>

</ul>
</details>

**社区讨论**: Reddit 上的社区讨论强调，助推器重新点火的挑战部分源于在没有地面支持基础设施的情况下于飞行中点燃发动机的复杂性。评论者指出，虽然 V1 和 V2 助推器只能自主重新点燃内环发动机，但 V3 设计旨在最终支持全部发动机的重新点火能力，因此这些早期测试失败是迭代开发过程中预料之中的环节。

**标签**: `#spacex`, `#starship`, `#aerospace`, `#starlink`, `#systems-engineering`

---

<a id="item-4"></a>
## [Prentis AI 实验室寻求融资 1 亿美元，专注于自动化日常计算机任务](https://techcrunch.com/2026/07/24/prentis-new-ai-lab-co-founded-by-reid-hoffman-mark-pincus-in-talks-to-raise-100m/) ⭐️ 6.0/10

由 LinkedIn 联合创始人 Reid Hoffman 和 Zynga 联合创始人 Mark Pincus 共同创立的新 AI 实验室 Prentis 目前正在洽谈融资 1 亿美元。该初创公司正进行战略转移，避开拥挤的 AI 编程赛道，转而专注于自动化日常的计算机任务。 这一举措标志着 AI 行业潜在的发展方向转变，表明通用办公和计算机任务自动化可能很快就会超越编程，成为最具价值和最广泛采用的用例。知名科技老兵的参与以及大笔资金的注入，也显示出投资者对自主 AI 智能体更广泛应用场景的强烈信心。 Prentis 押注于通用计算机工作流自动化的潜在市场规模远大于软件开发工具的市场。1 亿美元的融资目标凸显了构建和扩展具有竞争力的 AI 智能体技术所需的巨额资金投入。

rss · TechCrunch · 7月24日 22:25

**背景**: Reid Hoffman 是硅谷著名的企业家和投资者，以联合创立 LinkedIn 而闻名，而 Mark Pincus 则是游戏公司 Zynga 的创始人。近期，AI 行业见证了“智能体”AI 的激增——这类系统旨在接管用户界面以完成多步骤的工作流，就像人类用户操作一样。虽然像 GitHub Copilot 这样的 AI 编程助手已被迅速普及，但自动化更广泛的行政和计算机任务代表着一个更复杂却利润丰厚的全新前沿领域。

**标签**: `#AI`, `#Venture Capital`, `#Automation`, `#Startups`

---

<a id="item-5"></a>
## [特朗普誓言调查欧盟对美国科技巨头的反垄断罚款](https://www.bbc.co.uk/news/articles/cvgjenp4680o?at_medium=RSS&at_campaign=rss) ⭐️ 6.0/10

美国总统唐纳德·特朗普誓言就欧盟对谷歌、苹果、Meta 和亚马逊等美国主要科技公司征收监管罚款一事展开调查。他公开要求将这些经济处罚“全部撤销”。 这标志着跨大西洋科技和贸易紧张局势的重大升级，可能使监管执法政治化，并威胁到欧盟对其数字市场的监管主权。这一事件的结果可能会从根本上改变美国科技巨头在全球范围内的运营方式和受监管模式。 欧盟委员会历来对美国科技公司处以巨额罚款，仅谷歌一家就累计面临超过 80 亿欧元的反垄断罚款。欧盟的监管框架（包括新出台的《数字市场法案》）为被认定为“看门人”的企业制定了严格的市场公平规则，而这一体系目前正遭到美国总统的直接挑战。

rss · BBC World · 7月24日 20:23

**背景**: 欧盟通过强有力的反垄断执法和新的立法框架，在全球科技监管方面处于领先地位。近期生效的《数字市场法案》（DMA）专门针对大型数字“看门人”，以确保数字经济的公平性和可竞争性。与美国历来依赖进展缓慢且无经济处罚的结构性反垄断诉讼不同，欧盟经常因反竞争行为直接开出数十亿欧元的罚单。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.cullen-international.com/news/2024/11/-INFOGRAPHIC--Top-10-European-antitrust-fines-on-Big-Tech.html">[INFOGRAPHIC] Top 10 European antitrust fines on Big Tech</a></li>
<li><a href="https://en.wikipedia.org/wiki/Digital_Markets_Act">Digital Markets Act - Wikipedia</a></li>
<li><a href="https://qz.com/1744038/why-antitrust-fines-arent-enough-to-rein-in-the-tech-giants">It will take more than big fines to tame Big Tech</a></li>

</ul>
</details>

**标签**: `#tech-policy`, `#regulation`, `#antitrust`, `#geopolitics`, `#big-tech`

---