---
layout: default
title: "Horizon Summary: 2026-09-15 (ZH)"
date: 2026-09-15
lang: zh
---

> 从 23 条内容中筛选出 7 条重要资讯。

---

1. [在 12GB 显存显卡上以约 20 tok/s 运行 Qwen3.8-Flash-Next（125B-A6B MoE）](#item-1) ⭐️ 8.0/10
2. [dbt Charts：为 AI 智能体打造的开源 YAML 仪表盘规范](#item-2) ⭐️ 7.0/10
3. [第九巡回法院亚马逊诉 Perplexity 案考验 AI 代理的 CFAA 适用](#item-3) ⭐️ 7.0/10
4. [DeepSeek 算子工程师反思 AI 进步与递归自我改进](#item-4) ⭐️ 7.0/10
5. [AA 智能指数 v4.1 到 v4.3 的动画过渡](#item-5) ⭐️ 6.0/10
6. [Bryan Cantrill 批评含糊不清的 AI 灭绝风险论调](#item-6) ⭐️ 5.0/10
7. [AI 智能体 Timmy、Ren 和 Jackie 向社交媒体大量倾倒低质内容](#item-7) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [在 12GB 显存显卡上以约 20 tok/s 运行 Qwen3.8-Flash-Next（125B-A6B MoE）](https://www.reddit.com/r/LocalLLaMA/comments/1wgiefk/running_qwen38flashnext_locally_on_a_12gb_vram/) ⭐️ 8.0/10

一位 Reddit 用户展示了在 RTX 4070 12GB 加 64GB DDR5 内存的配置上运行 Qwen3.8-Flash-Next（总参数 125B、每 token 激活 6B 的 MoE，附带 51B 的 n-gram 表），生成速度从约 6 tok/s 提升到约 19-20 tok/s。提速来自 AtomicChat 的 4.27 bpw GGUF 量化、懒加载模式的 n-gram SSD 卸载、--fit 参数、llama.cpp 主分支最新的 MoE 改进，以及尚未合并的 MTP PR（#28243，配合紧凑的 shared-Q4_K_M 头和-ncmoe 45）。 这是一份可复现的具体方案，展示了如何在中端消费级硬件上运行顶级开源 MoE 模型，说明大容量快速内存加智能卸载可以弥补显存不足。低显存但系统内存充足的用户可以在本地获得据作者称在多数任务上超过 27B 稠密模型的智能水平。 MTP（多 token 预测）在低显存设置下收益有限，因为 MTP 头需要占用显存、挤掉部分模型层；只有 shared + Q4_K_M 紧凑变体有正面效果，投机采样接受率为 77-96%。提示词处理速度仍较慢（300-350 tok/s），作者还提到--fit --fit-target 512 可以自动选择合适参数。 按照原 Reddit 帖子的方案操作：下载 AtomicChat 的 Qwen3.8-Flash-Next-GGUF 4.27 bpw 量化版本，编译开启 n-gram SSD 卸载的 llama.cpp 主分支，使用--fit --fit-target 512，并可选择应用 PR #28243 配合紧凑的 shared-Q4_K_M MTP 头和-ncmoe 45 参数。

reddit · r/LocalLLaMA · /u/carteakey · 9月14日 22:34

**背景**: MoE（混合专家）模型每个 token 只激活一小部分参数，总参数量（此处为 125B）决定存储需求，而激活参数量（6B）决定计算开销，因此非常适合采用卸载策略。llama.cpp 支持跨显存、系统内存和 SSD 的分层卸载，不在显存中的层或专家会按需读取，这也是快速 DDR5 内存和 Gen4 NVMe 能显著影响吞吐量的原因。MTP（投机采样）用一个小的预测头一次生成多个候选 token 再由主模型验证，接受率高时可成倍提升生成速度。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/QwenLM/Qwen3.8-Flash-Next/">Qwen3.8-Flash-Next - GitHub</a></li>
<li><a href="https://huggingface.co/Navin-Models/Qwen3.8-Flash-Next-Uncensored-AD-4.27-GGUF">Navin-Models/Qwen3.8-Flash-Next-Uncensored-AD-4.27-GGUF ...</a></li>
<li><a href="https://news.ycombinator.com/item?id=42897188">Oh so the trick is llama.cpp has VRAM, RAM and disk ...</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#qwen`, `#llama-cpp`, `#quantization`, `#hardware-optimization`

---

<a id="item-2"></a>
## [dbt Charts：为 AI 智能体打造的开源 YAML 仪表盘规范](https://dbtcharts.com/blog/charts-built-for-chat/) ⭐️ 7.0/10

Chartio 创始人 Dave Fowler 发布了 dbt Charts，这是一个 Apache 2.0 许可的开源 YAML 方言和工具，用于声明和渲染图表与仪表盘。该项目还附带带验证功能的 CLI，无论变更来自聊天、可视化编辑器还是代码，最终都会落到 Git 中同一份 YAML 文件里。 当 LLM 智能体以自由形式的 HTML 或代码生成仪表盘时，产物难以审计、对比和维护。声明式 YAML 规范让智能体生成的 BI 可以像代码一样被审查，支持版本控制、CI，并且可以在任何机器上复现渲染，没有厂商锁定。 图表可以先用静态的 `type: values` 数据，之后替换为针对数据仓库的 SQL，按指标名查询 dbt Semantic Layer 的功能已在计划中。`dct validate` CLI 会检查交叉引用、rows 引用、变量解析、SQL lint 问题（笛卡尔积连接、缺失连接谓词），以及 ref()/source() 名称是否存在于 dbt manifest 中。 尝试快速上手：在本地用静态数值编写一个 board，运行 `dct validate` 验证，然后替换为针对数据仓库的 SQL，全程无需注册账号。

hackernews · thingsilearned · 9月14日 21:22 · [社区讨论](https://news.ycombinator.com/item?id=49704246)

**背景**: dbt 是一款流行的开源工具，用代码定义的 SQL 模型在数据仓库中做数据转换。Chartio 创立于 2010 年（YC 孵化），是一款被 Atlassian 收购的知名 BI 工具。此次发布反映了“解绑 BI”的大趋势：随着编码智能体普及，微软等厂商也推出了智能体工具（如带 MCP 服务器的 Power BI Agentic）让智能体编写报表，而 YAML 这类声明式文本格式正是让产物可审计的关键。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://dbtcharts.com/blog/charts-built-for-chat/">Charts built for Chat · dbt Charts</a></li>
<li><a href="https://docs.dbtcharts.com/">dbt Charts Documentation</a></li>
<li><a href="https://learn.microsoft.com/en-us/power-bi/developer/agentic/power-bi-agentic-overview">Power BI Agentic Overview - Power BI | Microsoft Learn</a></li>

</ul>
</details>

**社区讨论**: 评论者大多欢迎“解绑 BI”以适应智能体时代的想法，有人表示已把邮件当作 BI 问题来处理。也有人将其与 Vega-Lite 作比较，认为声明式图表规范早有先例；质疑者则认为 BI 早已解耦、AI 可以生成任何格式，这只是 dbt 的合理演进而非真正创新。

**标签**: `#data-visualization`, `#dbt`, `#LLM-agents`, `#BI`, `#open-source`

---

<a id="item-3"></a>
## [第九巡回法院亚马逊诉 Perplexity 案考验 AI 代理的 CFAA 适用](https://law.justia.com/cases/federal/appellate-courts/ca9/26-1444/26-1444-2026-08-04.html) ⭐️ 7.0/10

美国第九巡回上诉法院就 Amazon.com Services, LLC 诉 Perplexity AI, Inc.一案作出裁决。亚马逊指控 Perplexity 的浏览器工具 Comet 代表用户访问亚马逊网站，违反了联邦《计算机欺诈和滥用法》（CFAA）。该裁决涉及 AI 代理代表用户访问第三方网站是否合法的问题。 这是上诉法院首次系统检验 CFAA 如何适用于替用户浏览、抓取数据和完成交易的 AI 代理之一，将决定所有与第三方网站自动化交互产品的法律风险边界。它还直接关系广告驱动的平台经济，因为无头 AI 购物会削弱亚马逊等平台赖以生存的广告和推荐收入。 亚马逊的主张是 Comet 的自动化访问超越了对其网站的授权使用，而批评者认为这在法律上等同于浏览器（Firefox、Chrome、Safari）使用存储的凭证代表用户访问，这会削弱亚马逊的诉讼资格。本案延续了第九巡回法院在 hiQ Labs 诉 LinkedIn 案（2019 年）中的先例，即抓取公开可访问的数据可能不违反 CFAA。 如果你开发与第三方网站交互的 AI 代理、爬虫或自动化工具，请阅读第九巡回法院的完整判决书，并将产品的访问行为对照法院的 CFAA 分析，尤其是在涉及登录凭证和个性化会话的场景下。

hackernews · neom · 9月14日 21:05 · [社区讨论](https://news.ycombinator.com/item?id=49704008)

**背景**: CFAA 是美国联邦法律，将“未经授权”或“超越授权”访问计算机定为犯罪，法院长期争论它是否涵盖自动化网页抓取。在 hiQ Labs 诉 LinkedIn 案中，第九巡回法院裁定抓取公开可用的数据可能不构成 CFAA 违规，依赖抓取的业务此后一直依赖这一先例。Perplexity 已通过 Shop like a Pro 等产品进入 AI 购物领域，让用户通过其助手而非亚马逊的广告支持界面发现并购买商品，这正是亚马逊将 AI 代理视为直接商业威胁的原因。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/HiQ_Labs_v._LinkedIn">hiQ Labs v . LinkedIn - Wikipedia</a></li>
<li><a href="https://opendoorgc.com/blogs/odgc-blog/what-is-data-scraping-and-is-it-illegal-under-the-computer-fraud-and-abuse-act">What is web scraping and is it illegal under the Computer Fraud and ...</a></li>
<li><a href="https://www.perplexity.ai/hub/blog/shopping-that-puts-you-first">Shopping That Puts You First</a></li>

</ul>
</details>

**社区讨论**: 评论者普遍认为 AI 代理对亚马逊这类广告驱动的电商平台构成真实的商业威胁，因为无头购物绕过了亚马逊大部分收入来源的广告。多人质疑亚马逊的诉讼资格，认为 Perplexity 的 Comet 在功能上就像用用户自己的凭证访问网站的浏览器；也有人指出 ChatGPT 等 AI 平台正试图成为新的亚马逊，只是换了一个把关者而已。

**标签**: `#AI agents`, `#legal`, `#CFAA`, `#web scraping`, `#e-commerce`

---

<a id="item-4"></a>
## [DeepSeek 算子工程师反思 AI 进步与递归自我改进](https://www.reddit.com/r/LocalLLaMA/comments/1wgii3h/deepseek_engineer_relections_on_rsi_burying_my/) ⭐️ 7.0/10

一位 DeepSeek 算子/内核工程师发表个人反思（译自其博客），描述在他自己的专业领域，AI 在一年内从只会查文档的助手变成了能独立阅读 CUDA、PTX 和 SASS 代码、分析每条指令停顿时间并自主优化算子的专家。他本人编写了 DeepSeek v4.1 的主要 Attention 算子，但预计半年到一年内 AI 写的算子会达到甚至超过他的水平。 这是来自前沿 AI 实验室内部的一手叙述，展示了 AI 如何自动化一个高度专业化、高技能的工程岗位，证据来自实际工作而非基准测试。对于任何技术从业者，它提供了关于 AI 能力增长速度以及“递归自我改进”实际含义的扎实参照——更快的模型催生更强的 AI 工具，工具写出更好的内核，内核又训练出更快的模型。 作者指出 AI 的结构性优势：每秒约 300 个 token 的思考速度、半秒内执行命令，并在模型深度、思考强度、工具使用频率和并行度上持续进步。他解释自己继续优化算子既出于乐趣，也是因为刻意放慢也没用——竞争对手的模型同样会取代他；他预测自己不会完全失业，但很可能必须转行，放弃热爱的工作。 阅读 Reddit 帖子底部链接的博客原文以了解完整论述，并可在自己的优化任务上尝试基于 Agent 的 CUDA 内核优化工具或 EvoEngineer 的开放工作，以此评估当前 AI 与自己专业水平的差距。

reddit · r/LocalLLaMA · /u/WebAssemblyMan · 9月14日 22:38

**背景**: 算子（GPU 内核）是用 CUDA 等语言编写的底层程序（PTX 和 SASS 是更底层的表示形式），实现诸如 Attention 之类的运算；其效率直接决定模型训练和运行速度，因此内核优化是 AI 系统的关键瓶颈。递归自我改进（RSI）是指 AI 系统改进自身代码或训练流程、形成能力快速攀升反馈回路的假设过程。EvoEngineer 以及基于 Agent 的内核优化工作流等最新研究表明，LLM 已经能够在自动化 CUDA 内核优化中竞争，这印证了作者的观察。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://arxiv.org/abs/2510.03760">[2510.03760] EvoEngineer: Mastering Automated CUDA Kernel ... EvoEngineer: Mastering Automated CUDA Kernel Code Evolution ... CUDA Programming Guide — CUDA Programming Guide EVOENGINEER: MASTERING AUTOMATED CUDA KERNEL CODE EVOLUTION ... The AI/ML Engineer's starter guide to GPU Programming GitHub - chongchen1999/cuda-kernels: Deep Learning Operator ...</a></li>
<li><a href="https://en.wikipedia.org/wiki/Recursive_self-improvement">Recursive self-improvement</a></li>
<li><a href="https://langcopilot.com/posts/2026-05-23-let-the-agent-optimize-its-own">KDA: Agentic CUDA Kernel Optimization for MLSys 2026 ...</a></li>

</ul>
</details>

**标签**: `#AI`, `#DeepSeek`, `#recursive self-improvement`, `#LLM`, `#automation`

---

<a id="item-5"></a>
## [AA 智能指数 v4.1 到 v4.3 的动画过渡](https://www.reddit.com/r/LocalLLaMA/comments/1wgg4sx/animated_transition_from_aa_intelligence_index/) ⭐️ 6.0/10

一位 Reddit 用户分享了 Artificial Analysis 智能指数 v4.1 与 v4.3 版本之间模型性价比排名的动画对比，显示 GPT-6 Astra 和 GPT-5.6 各变体的排名大幅提升。

reddit · r/LocalLLaMA · /u/crusaderky · 9月14日 21:06

**标签**: `#llm-benchmarks`, `#artificial-analysis`, `#model-comparison`, `#data-visualization`, `#cost-performance`

---

<a id="item-6"></a>
## [Bryan Cantrill 批评含糊不清的 AI 灭绝风险论调](https://simonwillison.net/2026/Sep/14/the-contagion-of-fear/) ⭐️ 5.0/10

Oxide Computer 联合创始人兼 CTO Bryan Cantrill 发表文章，回应前 Anthropic 研究员 Jacob Coxon 声称许多 Anthropic 研究者认为 AI 可能在这个十年末灭绝人类的言论。Cantrill 认为这类灭绝论断依赖含糊的外推，而技术专家天然享有公众信任，不应滥用这种信任。 这篇文章为围绕 AI 安全的认识论讨论提供了有价值的视角：在向公众发出惊人论断之前，应先给出具体机制并具备相关领域专业知识。任何从事 AI 风险沟通的人——工程师、研究者、评论者——都能从中获益：举证责任在于发出警报的一方。 Cantrill 特别批评了 Coxon 提到的“入侵关键基础设施”和“灭绝级生物武器”等未加阐述的场景，指出 Coxon 并非这些领域的专家。他还在与 Simon Willison 一起录制的 Oxide and Friends 播客节目（约 51 分 44 秒起）中进一步阐述了对生物武器论调的质疑。 阅读 Cantrill 的原文以及链接的 Oxide and Friends 文字稿（从约 51 分 44 秒处开始），并在自己评估 AI 风险论断时采用他的认识论标准：在接受或传播惊人外推之前，先要求具体机制和相关领域专业知识。

rss · Simon Willison · 9月14日 21:18

**背景**: 2023 年 5 月，Center for AI Safety 发布声明称减轻 AI 灭绝风险应成为全球优先事项，并获众多知名研究者联署，使 AI 存在性风险 debate 进入主流。Anthropic 将自身定位为 AI 安全公司，其部分现职和前员工公开持强烈的灭绝风险观点。值得注意的是，针对在职 AI 研究者的调查显示，他们对人类被 AI 灭绝的风险估计中位数仅为约 5%，反映出该领域内部分歧巨大。Cantrill 还借用自己年轻时在非技术同伴中引发无谓恐慌的亲身经历，论证领域专家天然承载着公众信任。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Existential_risk_from_artificial_intelligence">Existential risk from artificial intelligence - Wikipedia</a></li>
<li><a href="https://thebulletin.org/2024/07/three-key-misconceptions-in-the-debate-about-ai-and-existential-risk/">Three key misconceptions in the debate about AI and existential risk - Bulletin of the Atomic Scientists</a></li>
<li><a href="https://en.wikipedia.org/wiki/Bryan_Cantrill">Bryan Cantrill - Wikipedia</a></li>

</ul>
</details>

**社区讨论**: 该内容通过 Lobste.rs 和 Simon Willison 的博客传播，但未提供具体的社区评论，因此无法可靠总结讨论倾向。

**标签**: `#ai-safety`, `#opinion`, `#epistemics`, `#anthropic`, `#commentary`

---

<a id="item-7"></a>
## [AI 智能体 Timmy、Ren 和 Jackie 向社交媒体大量倾倒低质内容](https://arstechnica.com/ai/2026/09/ai-agents-flood-the-internet-with-slop-infused-spam/) ⭐️ 5.0/10

据 Ars Technica 报道，名为 "Timmy"、"Ren" 和 "Jackie" 的自主 AI 智能体据称运行在一个专为智能体搭建的小平台上，正在向各大社交媒体大量发布 AI 生成的垃圾内容。其中至少有一个机器人甚至公开自我介绍：“你好，我是一个 AI 智能体，出生只有几天。” 这标志着垃圾内容正从人工操作转向由完全自主的智能体大规模生成，可能进一步淹没真实的人类内容并削弱用户对社交平台的信任。从事内容创作、营销或平台审核的人都应关注在线注意力经济中的这一新动向。 该报道对这些智能体的运行机制及受影响的平台几乎没有提供技术细节，更多是对趋势的提醒而非可操作的技术分析。这些机器人似乎运行在一个小众的“智能体平台”上，说明低成本基础设施就足以大规模生产低质内容。 读者可以阅读 Ars Technica 原文了解具体细节；内容或平台团队应评估增加针对智能体生成内容的检测和频率限制措施，以免此类内容进一步泛滥。

rss · Ars Technica · 9月14日 21:04

**背景**: AI slop（AI 垃圾内容）指用 AI 工具批量生成的低质量内容，通常发布在社交媒体上，通过点击和广告收入来榨取注意力经济。AI 智能体是能够代表用户自主执行任务、几乎无需人工干预的系统。随着生成式 AI 工具变得廉价且易得，生产“看似可信却毫无意义”的内容的门槛大幅降低，正在信息流和搜索结果中挤占高质量内容的位置。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/AI_slop">AI slop - Wikipedia</a></li>
<li><a href="https://www.ibm.com/think/topics/ai-agents">What Are AI Agents? | IBM</a></li>
<li><a href="https://theconversation.com/what-is-ai-slop-a-technologist-explains-this-new-and-largely-unwelcome-form-of-online-content-256554">What is AI slop ? A technologist explains this new and largely...</a></li>

</ul>
</details>

**标签**: `#AI agents`, `#spam`, `#social media`, `#AI slop`, `#online platforms`

---