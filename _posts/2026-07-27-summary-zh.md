---
layout: default
title: "Horizon Summary: 2026-07-27 (ZH)"
date: 2026-07-27
lang: zh
---

> 从 11 条内容中筛选出 3 条重要资讯。

---

1. [揭秘倒卖打折 LLM API Token 的地下中转市场](#item-1) ⭐️ 7.0/10
2. [脑电波会是物理 AI 的下一个突破口吗？](#item-2) ⭐️ 7.0/10
3. [TechCrunch Equity 播客探讨对中国 AI 的恐慌情绪](#item-3) ⭐️ 7.0/10

---

<a id="item-1"></a>
## [揭秘倒卖打折 LLM API Token 的地下中转市场](https://simonwillison.net/2026/Jul/26/relay-market/#atom-everything) ⭐️ 7.0/10

Matt Lenhard 的一项调查揭露了一个主要存在于中国的大型地下经济，该经济通过代理服务转售打折的 LLM API 访问权限。这些转售商通过滥用免费试用、抓取未受保护的客服机器人以及使用被盗信用卡来获取凭证，他们通常使用 one-api 和 new-api 等开源代理软件。 这个地下市场对 LLM 供应商和独立开发者构成了直接的财务威胁，因为现在存在一个以盈利为目的的生态系统，激励黑客寻找并利用未受保护的 API 端点。它还突显了行业迫切需要更严格的 API 密钥控制（例如硬性支出上限），以防止产生巨额的未经授权的 Token 账单。 支撑该市场的主要软件是 one-api 及其分支 new-api 等合法的开源 API 网关工具，这些工具旨在对多个 API 凭证池进行请求的负载均衡。该市场的买家主要受廉价 Token、绕过地理限制的动机驱使，在某些情况下，他们还会收集数据用于模型蒸馏。

rss · Simon Willison · 7月26日 19:30

**背景**: LLM API 代理充当客户端应用程序与大型语言模型供应商之间的中介，通常被企业用于聚合多个 API 密钥、管理成本以及统一不同供应商的请求。中转市场通过将来自各种非法渠道的密钥汇集到单个代理中来滥用这种架构，从而允许第三方以低于市场的价格购买 LLM 访问权限。这利用了行业内提供免费试用额度或部署内部使用 LLM 但保护措施薄弱的自动化客服机器人的常见做法。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://simonwillison.net/2026/Jul/26/relay-market/">An Inside Look at the Relay Market Powering Token Resellers and Fraud</a></li>
<li><a href="https://blog.4sapi.com/blog/api-relay-proxies-llm-cost-optimization">Cut LLM API Costs with Relay Proxies - 4sAPI Blog</a></li>

</ul>
</details>

**社区讨论**: Hacker News 上的讨论强调了开发者对主要 LLM API 供应商缺乏硬性支出限制的共同不满，这使得他们一旦端点遭到破坏，就容易面临突发的财务责任。评论者强烈呼吁供应商必须实施严格的、可由用户配置的金额上限，以有效打击此类欺诈行为并保护开发者。

**标签**: `#LLM`, `#API Security`, `#AI Fraud`, `#Cybersecurity`, `#AI Economics`

---

<a id="item-2"></a>
## [脑电波会是物理 AI 的下一个突破口吗？](https://techcrunch.com/2026/07/26/are-brain-waves-the-next-unlock-for-physical-ai/) ⭐️ 7.0/10

TechCrunch 的一篇文章提出了一种物理 AI 模型训练方式的范式转变，认为未来的训练流程将不再局限于 YouTube 视频，而是需要多摄像头角度、密集标注，甚至人类脑电波数据。这代表了一个新的前沿领域：脑机接口（BCI）数据和 EEG 信号可能成为训练机器人和具身 AI 系统的关键输入。 如果脑电波数据成为物理 AI 的核心训练输入，它将通过让机器人获取人类的认知和感觉运动模式，从根本上改变机器人学习与物理世界交互的方式。神经科学与机器人学的这种融合可能会加速更强大的人形机器人的开发，同时创造一个全新的数据基础设施需求类别。 文章强调，密集标注——即衡量数据集中数据被标注的广泛程度和深度——对于前沿物理 AI 至关重要，远远超出了当前基于视频训练中使用的稀疏标注。脑电波数据的具体模态（如 EEG、fMRI）以及将其整合到训练流程中的确切方法并未详细说明，表明这仍然是一个新兴概念而非已部署的技术。

rss · TechCrunch · 7月27日 00:19

**背景**: 物理 AI 是指将智能直接引入机器人等物理实体的人工智能系统，它在动态的现实世界环境中结合了感知、推理和行动能力。当前训练物理 AI 的方法通常依赖于 YouTube 等来源的大规模视频数据，但这些视频缺乏物理机器人实际体验的密集、多视角传感器数据。机器学习中的密集标注是指对数据集进行全面标注，使模型能够学习更丰富的表征，与仅应用最少标签的稀疏标注形成对比。脑机接口（BCI）捕获 EEG 信号等神经活动，这些信号编码了关于人类意图、注意力和感觉运动控制的信息——这些数据理论上可以教会机器人人类如何自然地与物理世界交互。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.business-standard.com/technology/tech-news/physical-ai-explained-why-a-bigger-shakeup-may-be-round-the-corner-126041200973_1.html">Physical AI explained: Why a bigger shakeup... - Business Standard</a></li>
<li><a href="https://www.sapien.io/glossary/definition/annotation-density">Explanation of Annotation Density | Sapien's AI Glossary</a></li>
<li><a href="https://ai.plainenglish.io/the-rise-of-physical-ai-and-the-humanoid-robot-economy-in-2026-d691af74a918">The Rise of Physical AI and the Humanoid Robot Economy in 2026</a></li>

</ul>
</details>

**标签**: `#Physical AI`, `#Brain-Computer Interface`, `#Machine Learning`, `#Robotics`, `#Data Training`

---

<a id="item-3"></a>
## [TechCrunch Equity 播客探讨对中国 AI 的恐慌情绪](https://techcrunch.com/2026/07/26/making-sense-of-the-panic-over-chinese-ai/) ⭐️ 7.0/10

TechCrunch 的 Equity 播客在最新一期节目中讨论了为什么月之暗面（Moonshot AI）的 Kimi 模型在硅谷和华尔街引发了恐慌。该集探讨了这款中国 AI 模型对美国在该领域既有主导地位所构成的竞争威胁。 极具竞争力的中国 AI 模型的发布预示着全球科技格局可能发生转变，这将直接影响风险投资策略、市场估值以及国际 AI 的发展。这一动态引发了关键的地缘政治问题，即美国能否在技术上保持对中国的领先优势。 月之暗面最近发布了 Kimi K2，这是一个混合专家模型，总参数量达到 1 万亿，激活参数量为 320 亿，并且支持高达 25.6 万个 token 的上下文长度。Equity 播客专注于商业和初创企业生态系统，分析了市场与金融界对这些技术进步的反应。

rss · TechCrunch · 7月26日 19:40

**背景**: 月之暗面是一家知名的中国人工智能初创公司，开发了 Kimi 系列大型语言模型和聊天机器人。Kimi 聊天机器人于 2023 年首次因支持高达 12.8 万个 token 的上下文而备受瞩目，而较新的 Kimi K2 模型则作为一个开放权重系统运行，专为智能体智能设计。TechCrunch 的 Equity 是一档旗舰播客节目，主要为企业家和投资者深入剖析初创企业和科技市场的商业动态。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Kimi_(chatbot)">Kimi (chatbot) - Wikipedia</a></li>
<li><a href="https://moonshotai.github.io/Kimi-K2/">Kimi K2: Open Agentic Intelligence</a></li>
<li><a href="https://techcrunch.com/podcasts/equity/">Equity Archives | TechCrunch</a></li>

</ul>
</details>

**标签**: `#AI`, `#Chinese AI`, `#Moonshot AI`, `#Industry Analysis`, `#Geopolitics`

---