---
layout: default
title: "Horizon Summary: 2026-09-09 (ZH)"
date: 2026-09-09
lang: zh
---

> 从 37 条内容中筛选出 10 条重要资讯。

---

1. [OpenAI 宣称 AI 解决 Navier–Stokes 问题，但卷入优先权争议](#item-1) ⭐️ 7.0/10
2. [大语言模型在自适应探索中自发形成新型社会偏见](#item-2) ⭐️ 6.0/10
3. [陶哲轩：AI 正在不可再生地“开采”开放数学问题](#item-3) ⭐️ 6.0/10
4. [Kimi K3（2.8T）在 MacBook Pro 上以每秒 1 个 token 的速度运行，模型从四块 SSD 流式加载](#item-4) ⭐️ 6.0/10
5. [Inception Labs 发布扩散式大模型 Mercury 2.5，推理速度达每秒 1100 token](#item-5) ⭐️ 6.0/10
6. [陶哲轩警告：AI 或将终结开放共享研究问题的传统](#item-6) ⭐️ 6.0/10
7. [OpenAI 发布 ChatGPT Images 2.5，推出 Sunburst 与 Flare 两款 API 模型](#item-7) ⭐️ 6.0/10
8. [On the Value of Human Ideas: What data poisoning research reveals about "autonomous" AI breakthroughs](#item-8) ⭐️ 6.0/10
9. [黑客正在窃取订阅用户的 Claude 令牌](#item-9) ⭐️ 5.0/10
10. [OpenAI 宣称解决纳维-斯托克斯千禧年难题，争议四起](#item-10) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [OpenAI 宣称 AI 解决 Navier–Stokes 问题，但卷入优先权争议](https://simonwillison.net/2026/Sep/8/on-navier-stokes/) ⭐️ 7.0/10

2026 年 9 月 8 日，OpenAI 宣布其一个未发布的内部模型解决了 Navier–Stokes 存在性与光滑性这一千禧年大奖难题，并称经过约 88 小时智能体推理加 17 小时 Lean 形式化验证完成。该发布随即被 NYU 教授 Tristan Buckmaster 的指控掩盖——他与 Anthropic 员工 Levent Alpöge 早在 8 月 15 日就取得了密切相关成果，并指称 OpenAI 在时间安排和可能接触其未发表工作方面存在不当行为。 如果得到验证，这将是首个由 AI 完成的千禧年大奖难题解答，表明大规模智能体系统可以在前沿数学上超越纯人类努力——但该结果尚未经克雷数学研究所或独立数学家验证。这场争议还引发了关于 AI 公司在研究竞争中如何处理 Codex 等编程助手中用户机密草稿的现实问题。 OpenAI 称其智能体基于 Cordoba 与 Martinez Zoroa 在 2023 年提出的 blowup 技术，仅 Navier–Stokes 一项就消耗约 1300 亿输出 token（所有尝试问题合计约 3000 亿，按 GPT-6 Astra 公开价格估算约 1500 万美元），得到的是关于解破裂的反例而非光滑存在性证明。Buckmaster 表示 OpenAI 的首个提示是在其工作消息传到 OpenAI 之后才发出的，且 OpenAI 拒绝回答模型是否用其团队的 Codex 会话训练过；OpenAI 提出同步发布或让 Buckmaster 独立署名，但因与 Anthropic 的竞争关系拒绝让 Alpöge 合著。 在克雷数学研究所或独立专家（例如检查 Lean 形式化工件的社区）确认之前，应将此结果视为未经核实；建议同时阅读 Buckmaster 的声明 PDF 和 OpenAI 的官方文章，自行判断优先权争议。

rss · Simon Willison · 9月8日 23:55

**背景**: Navier–Stokes 存在性与光滑性问题问的是三维流体方程是否总存在光滑解，还是会出现奇性（blowup）；克雷数学研究所在 2000 年将其列为七大千禧年大奖难题之一，每题悬赏 100 万美元，目前仅庞加莱猜想被正式解决（Perelman 解决但拒领奖金）。据称 OpenAI 的结果是通过反例证明三维空间中解的破裂，并用 Lean 证明助手完成形式化验证——这是一种可机器检查证明的工具。Buckmaster 与 Alpöge 曾使用 Claude 和 Codex 对相关的 Euler 方程问题研究了近一年，双方据称以相似方法独立但几乎同时得到结果。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Navier–Stokes_existence_and_smoothness_problem">Navier–Stokes existence and smoothness problem</a></li>
<li><a href="https://www.wired.com/story/openai-navier-stokes-math-discovery-academics/">OpenAI Just Claimed a Huge Math Discovery. Some Academics Are Crying Foul | WIRED</a></li>
<li><a href="https://en.wikipedia.org/wiki/Millennium_Prize_Problems">Millennium Prize Problems</a></li>

</ul>
</details>

**社区讨论**: 该帖子未提供社区评论，但 WIRED、Fortune 和 Engadget 的报道显示数学界意见分歧：一部分人对技术成果感到震撼，另一部分人则对涉嫌的数据处理与署名不当行为表示严重担忧。

**标签**: `#AI`, `#OpenAI`, `#mathematics`, `#research`, `#controversy`

---

<a id="item-2"></a>
## [大语言模型在自适应探索中自发形成新型社会偏见](https://openreview.net/challenge?redirect=%2Fforum%3Fid%3Dpc7fqaOcAH) ⭐️ 6.0/10

一项研究（arXiv:2511.06148，OpenReview 挑战赛中）表明，大语言模型在模拟招聘任务中会针对虚构的人口群体（Tufa、Aima、Reku、Weki）自发形成全新的社会偏见，即使这些群体之间不存在任何内在差异。由此产生的任务分配高度分层，比人类参与者的分配更不公平，且在更新、更大的模型中该效应更加严重。 对于将大语言模型用于序列决策场景（招聘、招生、资源分配）的人来说，这项研究很重要，因为偏见可能源于模型自身的探索行为，而不仅仅是偏见训练数据。这表明标准的静态偏见基准可能无法捕捉交互过程中动态出现的歧视行为。 其机制与社会学研究结论一致：偏见源于探索-利用的权衡，模型探索不足，使早期观察强烈影响对整个群体的印象。实验使用四个虚构群体以排除预训练偏见，在带即时成败反馈的多轮招聘模拟中分离出涌现行为。 如果你在构建用于重复分配或选拔决策的 LLM 智能体，可以复现这个简单的虚构群体测试（提示词在论文附录中），作为涌现偏见的低成本审计手段，并考虑加入强制探索或随机化机制来抵消探索不足的问题。

hackernews · paimapi · 9月8日 21:47 · [社区讨论](https://news.ycombinator.com/item?id=49617581)

**背景**: 探索-利用权衡是强化学习中的经典概念：智能体需要在尝试新选项（探索）与坚持已知好选项（利用）之间取得平衡。如果探索不足，早期的随机结果就可能固化成对群体的扭曲信念——这是现实中统计性歧视的已知成因。相关研究（如 Science Advances 2025 关于 LLM 群体涌现集体偏见的工作）表明，即使个体智能体无偏见，偏见也能在多智能体 LLM 环境中涌现；本研究为该现象补充了单智能体、序列决策的变体。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://arxiv.org/abs/2511.06148">[2511.06148] Large Language Models Develop Novel Social Biases Through Adaptive Exploration</a></li>
<li><a href="https://www.science.org/doi/10.1126/sciadv.adu9368">Emergent social conventions and collective bias in LLM populations | Science Advances</a></li>

</ul>
</details>

**社区讨论**: 评论者主要分享了实验设置和附录中的提示词；有人指出该发现只是证实了“制造偏见的机制”本就嵌入在训练文本中，呼应了文化/媒体理论数十年的观点。也有人对方法论不以为然，或引用更早的实地实验（如 2015 年 eBay 上关于卖家种族的拍卖研究）指出人类存在类似的偏见。

**标签**: `#LLM`, `#AI bias`, `#alignment`, `#research`, `#evaluation`

---

<a id="item-3"></a>
## [陶哲轩：AI 正在不可再生地“开采”开放数学问题](https://mathstodon.xyz/@tao/117237320796901560) ⭐️ 6.0/10

加州大学洛杉矶分校的菲尔兹奖得主陶哲轩在 Mathstodon 上发帖称，AI 正在把开放数学问题当作不可再生资源“开采殆尽”，并指出发现有前景的问题本身如今才是稀缺而宝贵的资源。该帖在 Hacker News 上引发了关于“没有洞见的 AI 解答是否会贬损数学知识”的广泛讨论。 这重新框定了数学研究的价值体系：如果 AI 能在不产生概念性洞见的情况下解决著名难题，那么瓶颈就从“解题”转向“提问”以及构建能产生新问题的框架。各领域研究者都可以借用这一视角，审视自己工作中哪些环节真正无法被自动化。 陶哲轩自己的限定条件是这场辩论的核心：他指出，一个没有伴随洞见的机器验证解答，人类可能仍然无法真正利用这一结果，所以被“耗尽”的是奖金和声望价值，而不一定是知识本身。DeepMind 的 FunSearch 等系统已经解决了真正的开放问题（如部分 Erdős 问题），超越了基准测试层面的数学。 阅读陶哲轩的 Mathstodon 原帖和 Hacker News 讨论串，然后反思自己的研究或工作：区分哪些属于“解题”（可被自动化）、哪些属于“提出好问题、构建框架”（持久价值），并据此调整精力分配。

hackernews · _alternator_ · 9月8日 21:00 · [社区讨论](https://news.ycombinator.com/item?id=49616968)

**背景**: 陶哲轩被广泛认为是同代最杰出的数学家，2006 年获菲尔兹奖，代表性成果包括与 Green 合作的关于素数的 Green–Tao 定理，他也积极评论 AI 对数学的影响。费马大定理、黎曼猜想等开放问题历来是催生新理论的引擎——为攻克它们而发明的技术往往比答案本身更重要。近来从 DeepMind 的 FunSearch 到 Lean 等形式化证明工具，AI 已从“计算器”转变为能对真实研究问题做出贡献的“猜想者”。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Terence_Tao">Terence Tao</a></li>
<li><a href="https://www.theneuron.ai/explainer-articles/from-erdos-to-axiom-the-open-problems-ai-has-actually-solved/">From Erdős to Axiom: Open Problems AI Has Actually Solved</a></li>

</ul>
</details>

**社区讨论**: 评论者意见分歧：有人认为符号验证但无洞见的解答并不推进知识，因此也谈不上损失；也有人将其类比为 Deep Fritz 之后的国际象棋——人类对弈依然有意义。多位评论者提出，下一个前沿是能提出挑战性问题的 AI，而非仅仅解题，这与陶哲轩“发现问题才是稀缺资源”的观点相呼应；还有人宣称“纯数学已死，数学万岁”，预测 AI 将把应用数学的水平推得更高，并让更多人能成为“数学家”。

**标签**: `#AI`, `#mathematics`, `#research`, `#Terence Tao`, `#Hacker News`

---

<a id="item-4"></a>
## [Kimi K3（2.8T）在 MacBook Pro 上以每秒 1 个 token 的速度运行，模型从四块 SSD 流式加载](https://github.com/argonautlabsai/deltafin) ⭐️ 6.0/10

Argonaut Labs 的'deltafin'项目通过四块 SSD 流式加载 Kimi K3（2.8T 参数），使其在 MacBook Pro 上以约每秒 1 个 token 的速度运行。这表明超大模型技术上可以在本地运行，但距离实用还很遥远。

hackernews · Argonautlabs · 9月8日 20:07 · [社区讨论](https://news.ycombinator.com/item?id=49616257)

**标签**: `#llm`, `#local-inference`, `#hardware`, `#open-source`, `#apple-silicon`

---

<a id="item-5"></a>
## [Inception Labs 发布扩散式大模型 Mercury 2.5，推理速度达每秒 1100 token](https://www.inceptionlabs.ai/blog/introducing-mercury-2-5) ⭐️ 6.0/10

Inception Labs 发布了基于扩散架构的大模型 Mercury 2.5，在 NVIDIA H100 等常见 GPU 上可达到约每秒 1100 token 的推理速度。该模型以预览版形式提供，官方并未宣称达到前沿水平，而是定位为快速、低成本通用与编程模型。 在多模型流水线中，LLM 裁判评估其他模型输出时延迟是主要瓶颈，而每秒 1100 token 的裁判模型能以极低成本基本消除这一开销。这说明即使绝对质量未达前沿水平，扩散式大模型在延迟敏感场景中仍是实用的架构选择。 社区测试发现 Mercury 2.5 Preview 的问题解决能力与上一代开源权重模型相当，可作为通用聊天机器人使用，且价格有吸引力。该模型不开放权重，用户可在 API 平台的设置中关闭“Improve the model for everyone”选项，以避免数据被用于训练。 如果你在运行多模型流水线或 LLM 裁判评估，可以通过 Inception Labs 的 API 对 Mercury 2.5 作为低延迟仲裁模型进行基准测试；若不希望数据被用于训练，请关闭“Improve the model for everyone”设置。

hackernews · Topfi · 9月8日 20:14 · [社区讨论](https://news.ycombinator.com/item?id=49616354)

**背景**: 传统大模型以自回归方式逐个 token 生成文本，吞吐量因此受限。扩散式语言模型则通过多个去噪步骤并行地细化整个序列，使 Mercury 能在普通 GPU 上达到每秒 1000+ token 的速度——此前只有定制芯片才能实现。在 LLM-as-a-judge 流水线中，裁判模型依据评分标准为其他模型的输出打分，其额外延迟会直接影响整体系统响应速度。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.inceptionlabs.ai/blog/introducing-mercury">Introducing Mercury , the World’s First Commercial-Scale Diffusion ...</a></li>
<li><a href="https://langfuse.com/docs/evaluation/evaluation-methods/llm-as-a-judge">LLM - as - a - Judge - Langfuse</a></li>
<li><a href="https://www.inceptionlabs.ai/">Inception – When Every Millisecond Matters</a></li>

</ul>
</details>

**社区讨论**: 评论者对模型虽能在常见 GPU 上运行却不开放权重感到失望，但也有测试者称赞其可用性和价格，称其能力与上一代开源权重模型相当。还有人指出它非常适合作为多模型系统中的仲裁模型，因为每秒 1100 token 的速度可抵消 LLM 裁判带来的额外延迟，并提醒了可关闭数据训练的选项。

**标签**: `#diffusion-models`, `#llm`, `#low-latency-inference`, `#ai-announcement`, `#api-pricing`

---

<a id="item-6"></a>
## [陶哲轩警告：AI 或将终结开放共享研究问题的传统](https://simonwillison.net/2026/Sep/9/terence-tao/) ⭐️ 6.0/10

菲尔兹奖得主、加州大学洛杉矶分校数学家陶哲轩公开警告说，AI 系统正在以'不可再生'的方式挖掘有价值的开放数学问题资源。他指出，甚至只是有人在研究某个问题的传闻，就可能引发大规模的 AI 攻关，抢在原创研究者完成之前把问题'碾平'。 这凸显了 AI 正在重塑研究激励：如果分享有前景的研究方向会招致被抢发，研究者可能不再公开讨论未解问题，从而逆转数百年的开放科学传统。这一担忧不仅适用于数学，也适用于任何依靠公开问题清单和预印本来引导研究方向的领域。 陶哲轩此前曾在公开的 Git 仓库中追踪并估计，AI 对任意纯数学开放问题的系统性成功率约为 1-2%，因此威胁不在于 AI 今天就能解决一切，而在于它能针对任何被传闻的问题投入海量并行攻关。他的评论将开放问题定位为一种可耗竭的公共资源，而非取之不尽的宝藏。 阅读陶哲轩在 Mastodon 上的原帖及其 9 月的相关评论，然后思考：如果 AI 加速的抢发变得普遍，你自己所在领域在共享开放问题、预印本和研究路线图方面的规范可能需要如何调整。

rss · Simon Willison · 9月9日 00:20

**背景**: 陶哲轩被广泛认为是当代最伟大的数学家之一，曾获菲尔兹奖和数学突破奖。在数学界，公开分享猜想与未解问题长期以来是指引集体研究力量和分配学术荣誉的核心机制。近期 AI 系统在形式化及研究级数学上的能力不断攀升，促使学界讨论（例如陶哲轩 9 月 3 日以 Navier-Stokes 方程为例的评论）当重大开放问题被 AI 攻克后会发生什么。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://eu.36kr.com/en/p/3971371138855176">Did Claude Solve the Millennium Prize Problems ? Terence Tao ...</a></li>
<li><a href="https://type0.ai/articles/the-real-number-behind-ai-maths-pr-wins-1-2">The 1-2% problem : What Terence Tao learned from watching AI do...</a></li>

</ul>
</details>

**标签**: `#ai-ethics`, `#mathematics`, `#open-science`, `#research-culture`, `#ai-impact`

---

<a id="item-7"></a>
## [OpenAI 发布 ChatGPT Images 2.5，推出 Sunburst 与 Flare 两款 API 模型](https://simonwillison.net/2026/Sep/8/introducing-chatgpt-images-25/) ⭐️ 6.0/10

2026 年 9 月 8 日，OpenAI 发布了 ChatGPT Images 2.5，在 API 中新增两个模型 ID：面向精确编辑的 gpt-image-2.5-sunburst 和面向快速生成的 gpt-image-2.5-flare。本次升级改进了多轮对话中的指令遵循能力，并更好地保留参考照片中的主体，OpenAI 称其图像模型已累计生成超过 30 亿张图片。 构建图像编辑工作流的开发者现在可以按需选模型：需要高保真编辑（如向现有照片添加元素）用 Sunburst，日常快速生成用 Flare。Simon Willison 升级了他的 openai_image.py 命令行工具以支持传入多张参考图，用一条命令演示了实用的多图编辑能力。 根据 OpenAI 文档指引：编辑精度最重要的工作流选 Sunburst，快速、高质量的日常生成选 Flare——Willison 认为 Sunburst 是更强的选项。Sunburst 以更长的生成时间换取对复杂细节的更高保真度，参考图支持使编辑能在保留原图（如一张图表）的同时添加新内容（例如一只浣熊科学家）。 通过 uv 运行升级后的 openai_image.py 命令行工具，用 -i 参数传入一张或多张参考图，并指定 -m gpt-image-2.5-sunburst，在自己的照片上测试精确编辑效果。

rss · Simon Willison · 9月8日 22:46

**背景**: OpenAI 的 GPT-Image 模型同时支撑 ChatGPT 和 Images API 中的图像生成，可通过提示词完成文生图和图生图编辑。多轮编辑历来是难点：模型常常超出用户意图过度修改，并在连续指令间丢失上下文。参考照片保留指模型在执行修改的同时保持输入图像主体的完整性，这对真正的编辑工作流（而非完全重新生成）至关重要。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.orcarouter.ai/blog/gpt-image-2-5-flare-sunburst">GPT - Image - 2 . 5 Flare vs Sunburst : New OpenAI Image APIs</a></li>
<li><a href="https://fal.ai/models/openai/gpt-image-2.5/sunburst/text-to-image">Gpt Image 2 . 5 Sunburst (Text to Image) API on fal</a></li>

</ul>
</details>

**标签**: `#OpenAI`, `#image-generation`, `#API`, `#AI-tools`, `#product-update`

---

<a id="item-8"></a>
## [On the Value of Human Ideas: What data poisoning research reveals about "autonomous" AI breakthroughs](https://www.reddit.com/r/LocalLLaMA/comments/1wazzes/on_the_value_of_human_ideas_what_data_poisoning/) ⭐️ 6.0/10

A Reddit essay arguing that AI training on users' draft work may blur the line between human and machine contributions to 'AI breakthroughs,' drawing on data poisoning research and the OpenAI Navier-Stokes dispute.

reddit · r/LocalLLaMA · /u/MaxDev0 · 9月8日 20:23

**标签**: `#AI`, `#data-poisoning`, `#training-data`, `#OpenAI`, `#research-ethics`

---

<a id="item-9"></a>
## [黑客正在窃取订阅用户的 Claude 令牌](https://techcrunch.com/2026/09/08/hackers-are-stealing-claude-tokens-from-subscribers/) ⭐️ 5.0/10

一名 Claude 订阅用户发现自己的账户在未使用时也在消耗令牌，随后 Anthropic 向用户发出警告，提醒有黑客正在窃取订阅账户中的令牌。该事件由 TechCrunch 于 2026 年 9 月报道。 这对所有使用 Claude 或管理 AI API 凭证的用户都很重要，因为令牌被盗会直接造成付费计划的资金损失或额度耗尽。这也表明 AI 账户如今已成为凭证盗窃的真实攻击目标，就像云服务账户和银行账户一样。 目前的报道仅停留在标题层面：攻击机制、影响范围以及具体的缓解措施都尚未公开披露。被入侵的第一个迹象是无法解释的令牌消耗，这是用户最应关注的症状。 检查你的 Claude 用量面板是否存在异常的令牌消耗，如发现异常请在 Anthropic Console 中轮换 API 密钥，并为你的 Anthropic 账户启用双因素认证。

rss · TechCrunch · 9月8日 21:10

**背景**: Anthropic 按 token（作为输入和输出处理的文本单位）对 Claude 的使用量计费，因此无论是 API 用量还是付费订阅额度都与令牌消耗直接挂钩。API 密钥从 Anthropic Console 获取，可对账户进行程序化访问，这意味着任何窃取密钥或会话凭证的人都能以受害者的费用发起请求。研究型会话和多轮对话等正常功能也可能快速消耗令牌，因此要区分正常的高用量和被盗用，需要持续监控。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://support.claude.com/en/articles/12429409-manage-usage-credits-for-paid-claude-plans">Manage usage credits for paid Claude plans | Claude Help Center</a></li>
<li><a href="https://developer.puter.com/tutorials/how-to-get-anthropic-api-key/">How to Get an Anthropic ( Claude ) API Key: A Step-by-Step Guide</a></li>

</ul>
</details>

**标签**: `#security`, `#AI`, `#Anthropic`, `#Claude`, `#API-tokens`

---

<a id="item-10"></a>
## [OpenAI 宣称解决纳维-斯托克斯千禧年难题，争议四起](https://www.theverge.com/ai-artificial-intelligence/991710/openai-navier-stokes-solution) ⭐️ 5.0/10

OpenAI 在博客文章中宣布，其内部模型找到了存在约 90 年未解的纳维-斯托克斯存在性与光滑性问题的解，声称证明了三维欧几里得空间中解的破裂，并提供了 Lean 证明助手的形式化验证。该声明还引发了与 Anthropic 的 Levent Alpöge 及 Tristan Buckmaster 的优先权争议，后者此前已就欧拉方程得出了密切相关的结果。 如果得到验证，这将是千禧年大奖难题中第二个被解决的问题，也是 AI 模型能够产出前沿数学研究的里程碑式证明。但该声明尚未得到外部数学家或克雷数学研究所的验证，因此目前更像是一个关于 AI 辅助证明如何需要被独立检验的案例，而非定论。 据报道，该证明建立在 Diego Cordoba 和 Luis Martinez Zoroa 于 2023 年提出的用于证明相关流体方程爆破现象的方法之上，且 OpenAI 表示即使获奖也会拒绝 100 万美元的千禧年奖金。需要注意的关键点是：该结果尚未经克雷研究所验证，且与 Alpöge 和 Buckmaster 关于欧拉方程底层结果的优先权争议仍未解决。 关注外部验证进展：留意克雷数学研究所和流体力学专家的反应，如果你具备证明助手方面的专业知识，可以查看已发布的 Lean 形式化代码。在独立数学家完成评审之前，不应将该声明视为已确立的结论。

rss · The Verge · 9月8日 20:53

**背景**: 纳维-斯托克斯方程是描述流体运动的偏微分方程，尽管在工程领域应用极广，数学家们从未证明三维情况下光滑解是否总是存在，也未找到反例。克雷数学研究所于 2000 年将其列为七大千禧年大奖难题之一，悬赏 100 万美元求解。“爆破”结果——即证明解可能破裂——将以反例方式解决该问题，而理解湍流则被视为更深层的动机。截至 2026 年，唯一被官方确认解决的千禧年难题仍是由格里戈里·佩雷尔曼证明的庞加莱猜想。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Navier-Stokes_existence_and_smoothness_problem">Navier-Stokes existence and smoothness problem</a></li>
<li><a href="https://en.wikipedia.org/wiki/Millennium_Prize_Problems">Millennium Prize Problems</a></li>

</ul>
</details>

**标签**: `#AI`, `#OpenAI`, `#mathematics`, `#research`, `#news`

---