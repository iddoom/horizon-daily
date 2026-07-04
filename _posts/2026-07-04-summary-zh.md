---
layout: default
title: "Horizon Summary: 2026-07-04 (ZH)"
date: 2026-07-04
lang: zh
---

> 从 9 条内容中筛选出 3 条重要资讯。

---

1. [调查间谍软件的欧洲议会议员遭 Pegasus 黑客攻击](#item-1) ⭐️ 8.0/10
2. [SearXNG：驱动本地 AI 的隐私优先元搜索引擎](#item-2) ⭐️ 7.0/10
3. [Current AI 发布开源 AI 差距地图 v0.1](#item-3) ⭐️ 7.0/10

---

<a id="item-1"></a>
## [调查间谍软件的欧洲议会议员遭 Pegasus 黑客攻击](https://citizenlab.ca/research/member-of-committee-investigating-spyware-hacked-with-pegasus/) ⭐️ 8.0/10

Citizen Lab 的一项调查揭示，欧洲议会议员 Kostas Kouloglou 在参与调查间谍软件滥用问题期间，于 2022 年 10 月 21 日前后以及 2023 年 3 月 6 日至 7 日多次感染 NSO Group 的 Pegasus 间谍软件。对其 iPhone 的取证分析以高置信度确认该设备已被成功入侵，可能导致机密政府文件和个人医疗数据泄露。 这一事件标志着商业间谍软件滥用行为的严重升级：一名调查监控滥用的民主选举官员本人竟成为他所审查的技术的攻击目标。这凸显了不受监管的间谍软件对欧盟内部民主制度、政府监督和法治所构成的系统性威胁。 调查指出，第一次感染与此前针对在欧洲流亡的俄语和白俄罗斯语记者及活动人士的 Pegasus 攻击活动存在重叠，暗示存在一个获准在多个欧洲国家进行监控的 Pegasus 客户。此外，被入侵的设备据报同时存有敏感的政府文件和个人医疗信息，引发了对操作安全规范的严重担忧。

hackernews · ledoge · 7月3日 20:38 · [社区讨论](https://news.ycombinator.com/item?id=48779683)

**背景**: Pegasus 是由以色列网络武器公司 NSO Group 开发的一种高度复杂的商业间谍软件，能够通过零点击漏洞利用隐蔽地远程入侵 iOS 和 Android 设备。一旦安装，它可以读取短信、窃取密码、追踪位置、激活麦克风和摄像头，并从应用程序中提取数据。尽管 NSO Group 声称 Pegasus 仅用于打击犯罪和恐怖主义，但 Citizen Lab、国际特赦组织等机构的调查已记录了全球各国政府系统性地使用该软件监控记者、律师、政治对手和活动人士。欧洲议会此前已成立了一个专门委员会（PEGA），旨在调查 Pegasus 及同类监控间谍软件在欧盟成员国中日益严重的滥用丑闻。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Pegasus_(spyware)">Pegasus (spyware)</a></li>

</ul>
</details>

**社区讨论**: 评论者强调了一个讽刺现象：一名欧盟议会议员竟遭受了通常针对记者和活动人士的间谍软件攻击，而涉嫌实施监控的正是欧盟成员国本身。多位用户提到了持续发酵的希腊监控丑闻，并指出一些欧洲国家如此严重地滥用 Pegasus，以至于以色列公司已切断了与它们的合作。此外，人们对设备分离政策的缺失表示了极大关注，质疑为何机密政府文件和个人医疗数据会存储在同一部手机上。

**标签**: `#cybersecurity`, `#pegasus-spyware`, `#surveillance`, `#european-parliament`, `#mobile-security`

---

<a id="item-2"></a>
## [SearXNG：驱动本地 AI 的隐私优先元搜索引擎](https://github.com/searxng/searxng) ⭐️ 7.0/10

SearXNG 是一款免费且开源的元搜索引擎，它聚合了多达 280 个搜索服务的结果且不追踪用户。如今，它正越来越多地被开发者用作本地 AI 模型和检索增强生成（RAG）应用的后端搜索工具。 这一趋势凸显了隐私与人工智能的关键交汇点，使得开发者能够在不依赖追踪用户行为的商业搜索 API 的情况下，构建自主 AI 智能体和 RAG 系统。作为自托管的搜索后端，SearXNG 赋能本地大语言模型安全、独立地获取实时网络信息。 SearXNG 支持 JSON 输出，这使其非常兼容程序化的 AI 集成和内部文档搜索设置。但是，用户应注意实际局限性，包括搜索速度较慢、结果质量有时不如主流引擎，以及可能会被 DuckDuckGo 或 Brave 等底层搜索提供商封锁 IP 或要求验证码。

hackernews · theanonymousone · 7月3日 20:15 · [社区讨论](https://news.ycombinator.com/item?id=48779454)

**背景**: 元搜索引擎的工作原理是将用户的查询转发给多个其他搜索引擎，并将结果聚合到一个列表中，从而在不追踪用户画像的情况下提供更广泛的覆盖。RAG（检索增强生成）是一种 AI 框架，通过在生成回复之前从外部知识库获取相关的最新信息，来改善大语言模型（LLM）的输出。SearXNG 最初是从已停止维护的 searX 项目中分叉出来的，并凭借其强大的隐私功能在自托管社区中获得了广泛关注。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/SearXNG">SearXNG - Wikipedia</a></li>
<li><a href="https://docs.searxng.org/">SearXNG Documentation (2026.7.3+9d7ca4feb)</a></li>
<li><a href="https://aws.amazon.com/what-is/retrieval-augmented-generation/">What is RAG? - Retrieval-Augmented Generation AI Explained - AWS</a></li>

</ul>
</details>

**社区讨论**: Searx 的原作者 asciimoo 指出，由于元搜索概念固有的局限性，他已不再参与该项目，并推出了一款名为 Hister 的新项目，这是一个用于本地和已访问网页的全文索引器。其他用户强调了实际的集成方案，例如使用 TinySearch 为 AI 智能体优化上下文，并分享了在 RAG 应用中结合 YaCY 后端使用 SearXNG 的长期经验。讨论中也出现了一个值得注意的反面观点：一位用户指出了隐私方面的讽刺之处，即将搜索分发到 280 个服务实际上可能比单一的主流提供商让更多公司接触到用户数据。

**标签**: `#search-engine`, `#privacy`, `#self-hosting`, `#llm-tools`, `#open-source`

---

<a id="item-3"></a>
## [Current AI 发布开源 AI 差距地图 v0.1](https://simonwillison.net/2026/Jul/3/open-source-ai-gap-map/#atom-everything) ⭐️ 7.0/10

拥有 4 亿美元承诺资金支持的非营利组织 Current AI 发布了开源 AI 差距地图 v0.1，该地图深入索引了横跨 14 个类别的 421 个开源 AI 产品。底层的数据（包含 1,184 个 YAML 文件，追踪了超过 16,000 个 GitHub 仓库）已通过 MIT 许可证在 GitHub 上开源发布。 这一举措为碎片化的开源 AI 生态系统提供了一份急需的结构化地图，为追踪 AI '公共选择'的研究人员、工程师和政策制定者提供了重要参考。通过将底层数据集开源，该项目不仅鼓励社区参与贡献，还使得识别最需要新开源工具的领域空白变得更加容易。 这 421 个被深入记录的产品包括来自 228 个组织的 266 个软件工具、85 个模型、50 个数据集和 20 个硬件项目，它们被组织在模型组件、产品/用户体验（UX）和基础设施这三个技术栈层级中。另外还有 24,400 个未分类的产物处于长尾状态，在经过充分研究和引用之前，它们暂时不会获得评分。

rss · Simon Willison · 7月3日 22:04

**背景**: Current AI 是一个旨在为 AI 构建'公共选择'的全球合作组织，于 2025 年 2 月在巴黎的 AI 行动峰会上作为非营利机构成立。AI 行动峰会是由法国总统埃马纽埃尔·马克龙联合主持的国际活动，重点在于加强国际合作，推动服务于公共利益的 AI 发展。'AI 技术栈'指的是构建和部署 AI 应用所需的分层技术架构，涵盖了从基础模型组件到面向用户的产品以及底层基础设施的各个层面。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/AI_Action_Summit">AI Action Summit 2025 - Wikipedia</a></li>
<li><a href="https://hai.stanford.edu/news/ai-action-summit-in-paris-highlights-a-shifting-policy-landscape">AI Action Summit in Paris Highlights A Shifting Policy ...</a></li>

</ul>
</details>

**标签**: `#open-source-ai`, `#ai-index`, `#machine-learning`, `#current-ai`, `#tools`

---