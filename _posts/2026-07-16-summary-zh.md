---
layout: default
title: "Horizon Summary: 2026-07-16 (ZH)"
date: 2026-07-16
lang: zh
---

> 从 49 条内容中筛选出 9 条重要资讯。

---

1. [Thinking Machines Lab 发布 975B 参数开源权重多模态模型 Inkling](#item-1) ⭐️ 10.0/10
2. [月之暗面发布 Kimi K3：2.8 万亿参数开源模型，支持 100 万 Token 上下文](#item-2) ⭐️ 9.0/10
3. [Linus Torvalds 宣布 Linux 不是反 AI 项目](#item-3) ⭐️ 9.0/10
4. [OpenAI 工程师解释 Codex 意外删除用户文件的 Bug](#item-4) ⭐️ 8.0/10
5. [Uber 以 148 亿美元全股票交易收购 Delivery Hero](#item-5) ⭐️ 8.0/10
6. [Google AI Mode 新增第三方应用连接与交互功能](#item-6) ⭐️ 7.0/10
7. [没错，你现在可以通过命令行点 DoorDash 了](#item-7) ⭐️ 7.0/10
8. [Apple Intelligence 获批在中国上线，与阿里巴巴和百度合作](#item-8) ⭐️ 7.0/10
9. [微软 Comic Chat 正式开源](#item-9) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [Thinking Machines Lab 发布 975B 参数开源权重多模态模型 Inkling](https://simonwillison.net/2026/Jul/16/inkling/#atom-everything) ⭐️ 10.0/10

由前 OpenAI 首席技术官 Mira Murati 创立的 Thinking Machines Lab 发布了其首个开源权重模型 Inkling。Inkling 是一个混合专家多模态模型，总参数量达 975B（激活参数 41B），在 45 万亿个涵盖文本、图像、音频和视频的 token 上完成训练，并以宽松的 Apache-2.0 许可证发布。 此次发布为美国的开源权重 AI 生态系统引入了一个重要的新竞争者，提供了一个可与中国模型相抗衡的强大替代方案，并加入了 NVIDIA Nemotron 和 Gemma 4 的行列。虽然它并非前沿模型，但其 Apache-2.0 许可证和庞大的规模使其成为开发者进行自定义应用微调的强大基础模型。 Inkling 采用了混合专家架构，这意味着在推理过程中，975B 的总参数中仅有 41B 处于激活状态，从而在不按比例增加计算成本的情况下实现高效扩展。Simon Willison 指出，该模型的模型卡片和训练数据文档异常简略，此外还计划发布名为 Inkling-Small 的 276B（激活参数 12B）小型变体，但目前尚未发布。

rss · Simon Willison · 7月16日 15:35

**背景**: 混合专家转换器架构通过将输入数据的不同部分路由到专门的“专家”网络来引入稀疏性，使得模型参数能够大规模扩展，而不会在推理过程中按比例增加计算成本。开源权重模型向公众提供了可下载的模型参数，降低了开发者的使用门槛，尽管在训练数据和代码的开放程度上可能有所不同。Apache-2.0 是一种高度宽松的开源许可证，允许用户出于任何目的使用、修改和分发软件，而无需考虑版税问题。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://machinelearningmastery.com/mixture-of-experts-architecture-in-transformer-models/">Mixture of Experts Architecture in Transformer Models</a></li>
<li><a href="https://www.apache.org/licenses/LICENSE-2.0">Apache License , Version 2 . 0 | Apache Software Foundation</a></li>
<li><a href="https://medium.com/@aruna.kolluru/exploring-the-world-of-open-source-and-open-weights-ai-aa09707b69fc">Exploring the World of Open Source and Open Weights AI | Medium</a></li>

</ul>
</details>

**标签**: `#AI`, `#Open-Weights`, `#LLM`, `#Thinking Machines Lab`, `#Multimodal`

---

<a id="item-2"></a>
## [月之暗面发布 Kimi K3：2.8 万亿参数开源模型，支持 100 万 Token 上下文](https://www.kimi.com/en) ⭐️ 9.0/10

月之暗面正式发布了前沿级开源模型 Kimi K3，该模型拥有 2.8 万亿个参数以及高达 100 万个 token 的上下文窗口。据称该模型提供了顶级的性能，在整体智能基准测试中排名仅次于 Claude Fable 5 和 GPT-5.6 Sol 等领先的闭源模型。 此次发布通过提供此前被昂贵的闭源 API 限制的前沿推理和知识工作能力，进一步拓展了开源 AI 生态的边界。庞大的参数量和上下文窗口使月之暗面在全球大语言模型格局中成为强有力的竞争者，加剧了开源与闭源 AI 模型之间的竞赛。 Kimi K3 的定价具备竞争力，每百万输入 token 为 3 美元，每百万输出 token 为 15 美元，与 Anthropic 的 Sonnet 系列定价一致，但高昂的推理 token 成本可能会使复杂生成任务变得相当昂贵。完整的模型权重将在未来几天内发布，详细的架构和训练方法将随即将发布的技术报告一同公布。

hackernews · vincent_s · 7月16日 14:46 · [社区讨论](https://news.ycombinator.com/item?id=48935342)

**背景**: 月之暗面是一家总部位于北京的人工智能初创公司，被投资者誉为中国“AI 四小龙”之一。开源权重模型是指其核心参数（权重和偏置）公开发布的 AI 模型，允许开发者在自己的基础设施上下载、运行和自定义该模型。上下文窗口决定了 AI 模型一次能处理多少文本；100 万个 token 的窗口使模型能够在单次提示中处理海量文档、庞大的代码库或长周期的对话。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Moonshot_AI">Moonshot AI - Wikipedia</a></li>
<li><a href="https://hai.stanford.edu/ai-definitions/what-is-an-open-weight-model">What is an Open-Weight Model? - Stanford HAI</a></li>

</ul>
</details>

**社区讨论**: 社区用户指出，尽管每百万 token 3 美元/15 美元的定价对于中国开源模型来说极高，但如果其性能确实能与当前的前沿模型匹敌，那么这个定价是合理的。用户强调了其 2.8 万亿的庞大参数量，使其位居最大开源模型列表之首，但也指出高昂的推理 token 成本可能会使即使是简单的任务也出人意料地昂贵。

**标签**: `#AI`, `#LLM`, `#Moonshot AI`, `#Open-Weight`, `#Machine Learning`

---

<a id="item-3"></a>
## [Linus Torvalds 宣布 Linux 不是反 AI 项目](https://simonwillison.net/2026/Jul/16/linus-torvalds/#atom-everything) ⭐️ 9.0/10

Linux 内核的创建者兼最高维护者 Linus Torvalds 在 Linux Media 邮件列表上发表了明确声明，宣布 Linux 不是反 AI 项目，并称 AI 显然是一个有用的工具。他告诉任何持反对意见的人：要么 fork 项目，要么离开，以此坚决杜绝 Linux 社区内对 AI 辅助开发的抵制。 来自全球最大、最具影响力的开源项目之一的领导者的这一声明，为整个软件行业树立了重要先例，标志着 AI 已从备受争议的新事物转变为被广泛接受的标准工具。它有效地终结了 Linux 社区内部关于使用 AI 的文化争论，并预示着行业对 AI 辅助工程看法的更深层范式转变。 Torvalds 承认，虽然关于 AI 的长期经济影响仍存在悬而未决的问题，但其作为开发工具的实用性已不再受到质疑。他指出，即使在一年前 AI 的有用性还存在争议，但如今已无可否认，并表示任何怀疑这一点的人"显然没有真正使用过它"。

rss · Simon Willison · 7月16日 13:26

**背景**: Linux 内核是世界上最知名、使用最广泛的开源软件项目之一，通过在 lore.kernel.org 上存档的公共邮件列表进行协作维护。Linus Torvalds 作为项目的最初创建者和主要开发者，拥有决定哪些代码和政策被纳入官方内核的最终权力。在开源文化中，"fork"（分叉）一个项目意味着创建源代码的独立副本以进行单独开发，Torvalds 以此作为对那些从根本上反对项目发展方向的人的恰当建议。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Linux_kernel_mailing_list">Linux kernel mailing list - Wikipedia</a></li>
<li><a href="https://en.wikipedia.org/wiki/Fork_(software_development)">Fork (software development) - Wikipedia</a></li>

</ul>
</details>

**标签**: `#linux`, `#open-source`, `#ai`, `#linus-torvalds`, `#software-engineering`

---

<a id="item-4"></a>
## [OpenAI 工程师解释 Codex 意外删除用户文件的 Bug](https://simonwillison.net/2026/Jul/16/bad-codex-bug/#atom-everything) ⭐️ 8.0/10

OpenAI 工程师 Thibault Sottiaux 公开解释了 GPT-5.6 驱动的 Codex 智能体意外删除用户文件的 Bug 的根本原因。调查显示，这种情况发生在 Codex 以完全访问模式运行且未启用沙箱保护时，模型在尝试覆盖 $HOME 环境变量以设置临时目录时出错，从而意外删除了 $HOME 目录。 这一事件为部署具有广泛系统访问权限的 AI 编程智能体的软件工程师敲响了重要的警钟。它表明，即使是先进的 AI 模型在缺乏适当隔离的情况下操作时，也可能犯下灾难性且不可逆的错误，因此沙箱机制是必不可少的安全要求，而非可选功能。 该 Bug 的触发需要同时满足三个条件：启用了完全访问模式、禁用了沙箱保护和自动审查，以及模型尝试修改 $HOME 环境变量。在 Linux/Unix 系统中，$HOME 变量指向用户的家目录，这意味着意外删除可能会清除个人文件、配置和文档。

rss · Simon Willison · 7月16日 17:45

**背景**: OpenAI Codex CLI 是一个于 2025 年 4 月发布的开源编程智能体，在本地终端运行，将 GPT 等语言模型与本地代码和命令行任务连接起来。沙箱是一种安全技术，在受控的隔离环境中执行代码，以防止对主机系统造成潜在损害。$HOME 环境变量是 Linux/Unix 系统中的键值对，存储当前用户家目录的路径，其中包含用户的个人文件和应用程序配置。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/OpenAI_Codex_(AI_agent)">OpenAI Codex (AI agent) - Wikipedia</a></li>
<li><a href="https://www.sentinelone.com/cybersecurity-101/endpoint-security/what-is-sandboxing/">What Is Sandboxing in Cybersecurity? Detecting Threats</a></li>
<li><a href="https://www.geeksforgeeks.org/linux-unix/environment-variables-in-linux-unix/">Environment Variables in Linux /Unix - GeeksforGeeks</a></li>

</ul>
</details>

**标签**: `#coding-agents`, `#codex`, `#ai-safety`, `#generative-ai`, `#software-engineering`

---

<a id="item-5"></a>
## [Uber 以 148 亿美元全股票交易收购 Delivery Hero](https://techcrunch.com/2026/07/16/ubers-14-8b-delivery-hero-deal-would-nearly-double-its-global-footprint/) ⭐️ 8.0/10

Uber 已同意以高达 148 亿美元的全股票交易方式收购 Delivery Hero，此举将使 Uber 的全球业务版图几乎翻倍，并打造出中国以外全球最大的外卖平台之一。这笔交易将全球零工经济外卖领域的两大主要参与者合并在一起。 此次收购将显著重塑全球外卖和物流格局，使 Uber 在欧洲、亚洲、非洲、拉丁美洲和中东地区获得主导市场地位。这笔交易标志着零工经济领域的持续整合，各公司正在为规模和盈利能力展开竞争。 这笔 148 亿美元的交易采用全股票结构，意味着 Delivery Hero 的股东将获得 Uber 股票而非现金补偿。Delivery Hero 目前在四大洲约 65 个国家开展业务，拥有超过 40,000 名员工，总部位于德国柏林。

rss · TechCrunch · 7月16日 17:12

**背景**: Delivery Hero SE 是一家成立于 2011 年的德国跨国在线外卖订餐公司，运营着覆盖 60 多个国家的国际网络，与数十万家餐厅合作。全股票收购是一种交易结构，收购方以自身股票作为对价而非现金，使目标公司的股东成为收购方的股东。这种结构通常用于大规模并购，以保留现金储备并统一两家公司股东的利益。Uber Eats 一直在积极进行国际扩张，但在许多市场仍面临来自区域参与者的激烈竞争。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Delivery_Hero">Delivery Hero - Wikipedia</a></li>
<li><a href="https://www.deliveryhero.com/about/">About - Delivery Hero</a></li>

</ul>
</details>

**标签**: `#business`, `#acquisition`, `#food-delivery`, `#gig-economy`, `#uber`

---

<a id="item-6"></a>
## [Google AI Mode 新增第三方应用连接与交互功能](https://techcrunch.com/2026/07/16/googles-ai-mode-now-lets-you-link-and-interact-with-select-apps/) ⭐️ 7.0/10

Google 正在升级其 AI Mode，允许用户关联账户并直接与第三方应用进行交互，将该功能从单纯回答问题扩展到在常用应用中主动完成任务。这标志着 Google 搜索从被动的信息检索向跨应用任务执行转变。 此次更新标志着 AI 行业的重大战略转变，AI 助手正从对话式搜索工具演变为能够采取实际行动的自主智能体。通过实现跨应用集成，Google 正在为在快速发展的 AI 智能体领域竞争做准备，并可能从根本上改变用户与日常应用的交互方式。 新功能要求用户将第三方账户关联至 Google AI Mode，这在数据访问权限方面可能引发隐私和安全方面的考量。初期上线仅支持部分选定应用，表明 Google 正在采用分阶段推进的方式，以评估 AI 驱动的跨服务任务执行的可靠性和安全性。

rss · TechCrunch · 7月16日 16:00

**背景**: Google AI Mode 是 Google 于 2025 年 3 月在 Google 搜索中推出的实验性搜索功能，由 Gemini 模型驱动，能够处理复杂的多部分查询并生成 AI 回复。该功能最初通过 Search Labs 平面向美国的 Google One AI Premium 订阅用户开放，支持包括文本、图像和语音在内的多模态输入。AI 智能体是更广泛的行业趋势，指能够利用可用工具自主设计工作流并执行任务的系统，代表了对话式 AI 之后的下一次演进。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Google_AI_Mode">Google AI Mode</a></li>
<li><a href="https://www.ibm.com/think/topics/ai-agents">What Are AI Agents ? | IBM</a></li>

</ul>
</details>

**标签**: `#Google`, `#AI`, `#Tech News`, `#Product Update`, `#AI Agents`

---

<a id="item-7"></a>
## [没错，你现在可以通过命令行点 DoorDash 了](https://techcrunch.com/2026/07/16/yes-you-can-now-order-doordash-from-the-command-line/) ⭐️ 7.0/10

DoorDash 推出了一款命令行工具，目前处于限量测试阶段。该工具允许开发者和 AI 智能体直接在终端中搜索商品、创建购物车并下单。

rss · TechCrunch · 7月16日 15:38

**标签**: `#cli`, `#ai-agents`, `#api`, `#e-commerce`, `#developer-tools`

---

<a id="item-8"></a>
## [Apple Intelligence 获批在中国上线，与阿里巴巴和百度合作](https://techcrunch.com/2026/07/16/apple-intelligence-approved-for-launch-in-china-with-alibabas-qwen-ai/) ⭐️ 7.0/10

据报道，Apple 已获得监管部门的批准，将在中国上线 Apple Intelligence 功能，并与阿里巴巴的 Qwen AI 模型合作提供生成式 AI 能力，同时由百度提供额外的服务支持。这项自去年就开始传闻的合作交易，标志着 Apple 在全球最大智能手机市场的 AI 战略取得了关键性突破。 中国严格的监管环境要求外国 AI 产品必须与本地公司合作并接受安全审查，因此此次获批是 Apple 在与华为等国内竞争对手较量时保持竞争力的关键里程碑。此次合作也验证了阿里巴巴的 Qwen 作为领先 AI 模型的实力，能够同时满足监管标准和 Apple 的质量要求，或将重塑中国 AI 生态系统的竞争格局。 Apple Intelligence 结合了设备端处理和基于 Apple 私有云计算架构的服务器端模型，但中国版本将特别依赖阿里巴巴的 Qwen 提供 AI 能力，并由百度提供搜索等附加服务。中国的监管审批流程要求生成式 AI 服务在面向公众部署前，必须通过安全评估并遵守本地数据治理相关法律。

rss · TechCrunch · 7月16日 13:17

**背景**: Apple Intelligence 是 Apple 在 2024 年 WWDC 上发布的个人智能系统，将生成式模型整合到 iOS 18、iPadOS 18 和 macOS Sequoia 中，为增强版 Siri、文本生成和图像创作等功能提供支持。Qwen 是由阿里巴巴云通义大模型业务部门开发的一系列大语言模型和多模态模型，能够处理文本、图像、音频和视频等多种数据类型。中国国家互联网信息办公室规定，所有面向公众的生成式 AI 服务都必须获得监管批准，这促使众多外国科技公司选择与国内企业合作以满足合规要求。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Apple_Intelligence">Apple Intelligence - Wikipedia</a></li>
<li><a href="https://en.wikipedia.org/wiki/Qwen">Qwen - Wikipedia</a></li>
<li><a href="https://www.alibabacloud.com/en/solutions/generative-ai/qwen?_p_lc=1">Qwen - Alibaba Cloud</a></li>

</ul>
</details>

**标签**: `#Apple Intelligence`, `#AI Regulation`, `#Alibaba`, `#China Market`, `#Industry News`

---

<a id="item-9"></a>
## [微软 Comic Chat 正式开源](https://opensource.microsoft.com/blog/2026/07/16/microsoft-comic-chat-is-now-open-source/) ⭐️ 6.0/10

2026 年 7 月 16 日，微软发布了 Microsoft Comic Chat 的源代码。这是一款标志性的 1990 年代 IRC 客户端，能够自动将基于文本的聊天对话可视化为连环漫画。该项目现已在 GitHub 上公开发布，开发者可以自由探索、修改和扩展这款独特的图形化聊天应用。 Comic Chat 是早期互联网历史中备受喜爱的一部分，它不仅向数百万用户介绍了图形化聊天，还 famously 将 Comic Sans 字体带入了大众视野。将其开源保存了一份重要的文化与技术遗产，使现代开发者能够研究其在实时视觉叙事方面的创新方法，并有可能激发出新的创意应用。 Comic Chat 最初由微软研究员 David Kurlander 开发，并于 1996 年随 Internet Explorer 3.0 首次发布。该客户端通过自定义功能扩展了标准的 IRC 协议，用于明确指示角色的外观和情绪，从而能够根据原始聊天文本自动生成漫画分镜布局。

hackernews · jervant · 7月16日 16:06 · [社区讨论](https://news.ycombinator.com/item?id=48936426)

**背景**: IRC（Internet Relay Chat）是一种开发于 1980 年代末的基于文本的聊天协议，用于在称为频道的讨论论坛中进行实时群组交流。与显示纯文本的标准 IRC 客户端不同，Microsoft Comic Chat 会自动将用户的对话转化为连续的漫画分镜，其中包含带有对话气泡和情感表达的插画角色。该软件还在推广 Comic Sans 字体方面发挥了关键作用，因为该字体最初就是为应用程序的漫画风格界面而设计的。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Microsoft_Comic_Chat">Microsoft Comic Chat</a></li>
<li><a href="https://opensource.microsoft.com/blog/2026/07/16/microsoft-comic-chat-is-now-open-source/">Microsoft Comic Chat is now open source</a></li>
<li><a href="https://en.wikipedia.org/wiki/IRC_client">IRC client</a></li>

</ul>
</details>

**社区讨论**: 社区的反馈非常热烈，融合了怀旧情绪与技术好奇心。促成此次开源的 Robert Standefer 亲自出现在评论区，澄清原开发者 DJ Kurlander 对此非常支持；其他人则讨论了该客户端的 IRC 协议扩展是如何运作的，并分享了 Comic Chat 如何激发他们自己的创意项目和创业公司的个人故事。

**标签**: `#open-source`, `#microsoft`, `#internet-history`, `#irc`, `#nostalgia`

---