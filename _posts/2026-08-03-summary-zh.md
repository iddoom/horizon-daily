---
layout: default
title: "Horizon Summary: 2026-08-03 (ZH)"
date: 2026-08-03
lang: zh
---

> 从 32 条内容中筛选出 7 条重要资讯。

---

1. [红杉资本肖恩·马奎尔领投核初创公司 Valar Atomics 10 亿美元融资](#item-1) ⭐️ 9.0/10
2. [OpenAI 宣布在数学和理论计算机科学领域取得十项 AI 驱动的进展](#item-2) ⭐️ 8.0/10
3. [ComfyUI 为 MiniMax H3 开源权重视频模型提供首发支持](#item-3) ⭐️ 8.0/10
4. [苹果对英国政府新的 iCloud 后门要求提起法律挑战](#item-4) ⭐️ 8.0/10
5. [欧盟 AI 法案透明度规则正式生效](#item-5) ⭐️ 8.0/10
6. [特朗普的 AI 保护主义将矛头指向机器人产业](#item-6) ⭐️ 7.0/10
7. [引用 David Crawshaw 的提示词](#item-7) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [红杉资本肖恩·马奎尔领投核初创公司 Valar Atomics 10 亿美元融资](https://techcrunch.com/2026/08/03/sequoias-shaun-maguire-leads-1b-round-for-nuclear-startup-valar-atomics/) ⭐️ 9.0/10

核能初创公司 Valar Atomics 在与英伟达达成最新开发合作伙伴关系后，以 60 亿美元的估值筹集了 10 亿美元资金。

rss · TechCrunch · 8月3日 17:16

**标签**: `#nuclear-energy`, `#venture-capital`, `#ai-infrastructure`, `#nvidia`, `#valar-atomics`

---

<a id="item-2"></a>
## [OpenAI 宣布在数学和理论计算机科学领域取得十项 AI 驱动的进展](https://openai.com/index/ten-advances-in-mathematics/) ⭐️ 8.0/10

OpenAI 宣布了利用其 AI 模型在数学和理论计算机科学领域取得的十项最新进展，包括在高维球体填充和多色拉姆齐数方面的突破。这些结果表明，大语言模型能够解决纯数学中此前没有可靠计算方法的开放性问题。 这一公告表明，前沿 AI 模型正在从自然语言任务扩展到需要深层数学推理的领域，有可能加速密码学、纠错码和计算机科学理论基础等领域的发现。它也引发了 AI 将补充还是颠覆研究数学家传统工作流程的问题。 被重点提及的问题包括高维球体填充（在通信系统的纠错码中有实际应用）和多色拉姆齐数（这是出了名的困难组合问题，已知的精确值极少）。该博客文章并未完全澄清这些结果是引入了根本性的新数学思想，还是主要大规模利用了计算暴力搜索方法。

hackernews · milkshakes · 8月3日 16:27 · [社区讨论](https://news.ycombinator.com/item?id=49157930)

**背景**: 球体填充问题研究如何在给定空间中尽可能密集地排列互不重叠的球体；虽然该问题在二维或三维中很直观，但在更高维度中变得极其困难，然而这些高维情况与数字通信中使用的纠错码直接相关。多色拉姆齐数源自拉姆齐理论，该理论保证在使用多种颜色对足够大的完全图的边进行着色时，必然出现某些单色子结构；确定精确的阈值大小是组合学中最困难的问题之一。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Sphere_packing">Sphere packing - Wikipedia</a></li>
<li><a href="https://www.quantamagazine.org/sphere-packing-solved-in-higher-dimensions-20160330/">Sphere Packing Solved in Higher Dimensions | Quanta Magazine</a></li>
<li><a href="https://en.wikipedia.org/wiki/Ramsey's_theorem">Ramsey's theorem - Wikipedia</a></li>

</ul>
</details>

**社区讨论**: 社区反应褒贬不一：一些用户对 AI 正在达到许多人认为还很遥远的里程碑表示兴奋，而另一些人则担心该公告使用的营销语言可能夸大了数学意义，认为这些结果可能只是暴力计算而非概念上新颖的证明。一位评论者指出某些结果有着令人惊讶的直观解释，另一位则指出虽然 AI 目前还无法生成原创猜想，但它可以通过穷举计算快速否定猜想。

**标签**: `#Artificial Intelligence`, `#Mathematics`, `#Theoretical Computer Science`, `#OpenAI`, `#Research`

---

<a id="item-3"></a>
## [ComfyUI 为 MiniMax H3 开源权重视频模型提供首发支持](https://blog.comfy.org/p/minimax-h3-day-0-support-in-comfyui) ⭐️ 8.0/10

ComfyUI 宣布对新发布的开源权重全模态生成模型 MiniMax H3 提供首发支持，该模型能够生成带有原生立体声音频、分辨率高达 2K 的视频。此次集成包含了激进的内存优化方案，包括将调制权重剪枝为查找表，使总内存占用减少 66%，从而让下一代 2K 视频模型能够在 RTX 3060 等消费级 GPU 上本地运行。 这一进展通过让原本需要超过 120 GB 显存的模型在广泛普及的消费级硬件上运行，实现了顶尖视频生成技术的民主化。这种新颖的权重剪枝技术展示了一种极具实用性的本地 AI 执行方法，可能会影响大型生成模型在整个生态系统中进行部署优化的方式。 该优化技术的核心在于发现模型的调制权重约占总参数量的 40%，并且可以用功能等效的查找表进行替换而不损失任何输出质量。这将全精度下 123.6 GB 的内存需求缩减至 42.5 GB，结合 ComfyUI 的动态显存卸载功能，使高分辨率的本地视频生成成为可能。

hackernews · vblanco · 8月3日 13:34 · [社区讨论](https://news.ycombinator.com/item?id=49155629)

**背景**: MiniMax H3 是一个通用的全模态生成模型，能够联合理解涵盖文本、图像、视频和音频的多模态上下文来生成内容。ComfyUI 是一款广受欢迎的开源、基于节点的图形界面和推理引擎，专为在本地构建和运行模块化生成式 AI 模型工作流而设计。"Day-0 支持"（首发支持）是指软件平台或框架在新的模型或硬件产品公开发布的当天即提供全面的兼容性和集成支持。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.minimax.io/blog/minimax-h3">MiniMax H3: An Open Model Breaking the Boundaries Between ...</a></li>
<li><a href="https://comfyui-wiki.com/en/models/minimax">MiniMax H3: Open Omni-Modal Video Model With Native Audio</a></li>
<li><a href="https://en.wikipedia.org/wiki/ComfyUI">ComfyUI</a></li>

</ul>
</details>

**社区讨论**: 用户们积极分享了实际性能基准，一位用户报告称在 RTX 4070 Ti Super 上生成 10 秒 480p 视频大约需要 10 分钟，且效果非常出色。社区对调制权重剪枝技术表现出了显著的技术好奇心，有用户质疑这种方法是否同样适用于大语言模型（LLM）。尽管这一技术成就受到广泛赞誉，但部分用户认为该模型目前的审美输出看起来过于平庸和普通。

**标签**: `#generative-ai`, `#video-generation`, `#model-optimization`, `#ComfyUI`, `#open-weights`

---

<a id="item-4"></a>
## [苹果对英国政府新的 iCloud 后门要求提起法律挑战](https://techcrunch.com/2026/08/03/apple-challenges-uk-governments-latest-demand-for-icloud-backdoor-report/) ⭐️ 8.0/10

苹果已向英国调查权法庭（IPT）提起新的法律诉讼，对政府修订后的一项要求提出上诉，该要求旨在为访问英国用户的加密 iCloud 备份创建后门。这是苹果对英国《调查权法》下发布的技术能力通知（TCN）发起的第二次法律挑战。 这家万亿美元科技巨头与国家政府之间的法律对抗，将为全球隐私权和端到端加密的未来树立关键先例。如果英国成功迫使苹果构建后门，可能会鼓励其他政府提出类似要求，从根本上破坏全球加密系统的安全性。 英国政府的要求是通过技术能力通知（TCN）提出的，这是一种强制电信运营商构建协助监控能力的法律机制。苹果的高级数据保护使用端到端加密，这意味着只有用户受信任的设备才持有解密密钥，这使得苹果在不从根本上削弱系统安全架构的情况下，在技术上无法遵守该要求。

rss · TechCrunch · 8月3日 18:54

**背景**: 加密后门是一种故意内置的方法，允许执法机构等第三方绕过加密来访问数据，本质上相当于一把万能钥匙。苹果的 iCloud 高级数据保护通过将解密密钥仅存储在用户受信任的设备上，而非苹果的服务器上，从而提供了该公司最高级别的云数据安全性。英国《调查权法》赋予政府广泛的监控权力，包括发布 TCN 以迫使公司提供对用户数据的访问权限，这长期以来一直是科技公司与各国政府之间紧张关系的根源。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.macrumors.com/2026/08/03/apple-legal-challenge-against-uk-demand/">Apple Launches New Legal Challenge Against UK Backdoor Demand</a></li>
<li><a href="https://proton.me/learn/encryption/glossary/encryption-backdoor">What is an encryption backdoor and why is it risky? | Proton</a></li>
<li><a href="https://support.apple.com/en-us/108756">How to turn on Advanced Data Protection for iCloud - Apple ...</a></li>

</ul>
</details>

**标签**: `#encryption`, `#privacy`, `#apple`, `#cybersecurity`, `#government-regulation`

---

<a id="item-5"></a>
## [欧盟 AI 法案透明度规则正式生效](https://www.theverge.com/ai-artificial-intelligence/974571/eu-ai-act-transparency-labels-rules-deepfakes) ⭐️ 8.0/10

8 月 2 日，欧盟具有里程碑意义的 AI 法案中的透明度义务正式生效，要求公司在用户与聊天机器人等 AI 系统交互时进行明确披露，并对包括深度伪造在内的 AI 生成内容进行标注。这些规则在法案的第 50 条中定义，针对涉及人类直接与 AI 交互或合成媒体生成的四种特定情况。 这是一个重大的监管里程碑，因为这是欧盟首次对 AI 系统广泛执行透明度要求，迫使所有在欧洲运营的公司调整其软件平台以符合规定。这些规则对 AI 开发者和内容平台具有重大的运营、法律和技术影响，并为 AI 治理的全球标准树立了先例。 AI 法案第 50 条在四种关键情况下引入了透明度义务：AI 直接与人交互时、AI 生成合成内容时、AI 用于情感识别或生物识别分类时，以及 AI 创建涉及公共利益的深度伪造或文本时。未能遵守这些义务的公司将面临严厉处罚，潜在罚款高达 3500 万欧元或全球年营业额的 7%。

rss · The Verge · 8月3日 17:38

**背景**: 欧盟 AI 法案是一个全面的立法框架，旨在根据人工智能对社会的潜在风险对其进行监管，规则通过分阶段推出逐步实施，一直延续到 2028 年。该法案将 AI 系统划分为不同的风险等级——从最低风险到不可接受的风险——对高风险应用实施严格要求，同时完全禁止某些做法。刚刚生效的透明度义务是这一更广泛监管框架的早期阶段之一，该框架于 2024 年 8 月 1 日首次生效。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://artificialintelligenceact.eu/transparency-rules-article-50/">The EU AI Act's Transparency Rules: A Practical Guide to Article 50</a></li>
<li><a href="https://www.legiscope.com/blog/eu-ai-act-effective-dates-phases-2024-2027.html">EU AI Act Effective Dates: Compliance Phases 2024-2027</a></li>
<li><a href="https://ai-act-service-desk.ec.europa.eu/en/ai-act/timeline/timeline-implementation-eu-ai-act">Timeline for the Implementation of the EU AI Act</a></li>

</ul>
</details>

**标签**: `#AI Regulation`, `#EU AI Act`, `#Transparency`, `#Deepfakes`, `#Tech Policy`

---

<a id="item-6"></a>
## [特朗普的 AI 保护主义将矛头指向机器人产业](https://www.technologyreview.com/2026/08/03/1141056/trumps-ai-protectionism-has-come-for-robotics/) ⭐️ 7.0/10

特朗普政府治下的保护主义贸易政策正从 AI 软件领域扩展，直接影响到新兴人形机器人产业的开发和供应链。这标志着以 AI 为核心的贸易限制正显著扩大到实体硬件和制造领域。 人形机器人产业仍处于起步阶段，限制性贸易政策可能会严重扰乱企业制造这些复杂机器所依赖的全球供应链。这一转变可能导致该产业走向碎片化、延缓创新步伐，并在谁能引领下一个主要计算平台的问题上造成地缘政治分歧。 该分析指出，目前的人形机器人仍然显得笨拙且不协调，凸显了这项技术确实处于早期阶段，且极易受到供应链中断的影响。全球人形机器人市场预计到 2035 年将达到 380 亿美元，这意味着新实施的贸易壁垒可能会威胁到巨大的潜在经济增长。

rss · MIT Technology Review · 8月3日 18:43

**背景**: AI 保护主义是指政府通过关税和出口管制等政策手段，保护国内 AI 产业免受外国竞争影响，并限制关键技术流向竞争对手国家。虽然这些措施最初主要针对半导体和 AI 软件，但正日益影响到实体硬件领域。人形机器人产业严重依赖于高度整合的全球供应链，以获取执行器、传感器和先进材料等关键零部件。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.goldmansachs.com/insights/articles/the-global-market-for-robots-could-reach-38-billion-by-2035">The global market for humanoid robots could reach $38 billion ...</a></li>
<li><a href="https://cepr.net/publications/the-high-cost-of-protectionism-ai-edition/">The High Cost of Protectionism : AI Edition – CEPR</a></li>

</ul>
</details>

**标签**: `#AI Policy`, `#Robotics`, `#Protectionism`, `#Hardware`, `#Geopolitics`

---

<a id="item-7"></a>
## [引用 David Crawshaw 的提示词](https://simonwillison.net/2026/Aug/3/david-crawshaw/#atom-everything) ⭐️ 6.0/10

Simon Willison 分享了 David Crawshaw 的一段话，展示了如何通过提示 LLM 编程代理来实现上游 rebase 和软件更新的夜间自动化。

rss · Simon Willison · 8月3日 16:15

**标签**: `#prompt-engineering`, `#coding-agents`, `#open-source`, `#llms`, `#automation`

---