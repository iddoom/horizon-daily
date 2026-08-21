---
layout: default
title: "Horizon Summary: 2026-08-21 (ZH)"
date: 2026-08-21
lang: zh
---

> 从 13 条内容中筛选出 3 条重要资讯。

---

1. [Codex 在 AWS Bedrock 上因提示缓存失效导致费用暴涨 10 倍](#item-1) ⭐️ 7.0/10
2. [Anna's Archive 警告：AI 公司扫描后销毁珍稀书籍](#item-2) ⭐️ 5.0/10
3. [内华达州批准特斯拉、Uber 和 Waymo 部署数千辆无人出租车](#item-3) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [Codex 在 AWS Bedrock 上因提示缓存失效导致费用暴涨 10 倍](https://github.com/openai/codex/issues/37674) ⭐️ 7.0/10

openai/codex 仓库中的一个 GitHub issue 报告称，在 AWS Bedrock 上运行的 Codex 提示缓存（prompt caching）失效，用户观察到缓存读/写比例低于 5%，费用约为预期的 10 倍。据报告，在 Codex 配置中设置 web_search = "disabled" 可以恢复正常的缓存行为和费用水平。 提示缓存最多可将 LLM 推理成本降低 90%，因此一旦它静默失效，像 Codex 这样每轮都重发大量上下文前缀的智能体工具就会在毫无报错的情况下产生巨额账单。在 Bedrock 上运行 Codex（或类似智能体）的团队都应检查缓存命中率指标并应用该临时方案，以避免多付费用。 诊断信号是缓存读/写比例低于 5%：系统在执行昂贵的缓存写入，但从未复用，说明缓存实际上没有生效。Codex 配置 Bedrock 缓存（缓存模式还是断点设置）的确切根因仍不清楚，一位维护者指出该 issue 讨论本身条理混乱，因此应将该临时方案视为经验性有效而非已有完整解释。 如果你在 AWS Bedrock 上运行 Codex，请检查 CloudWatch 中 Bedrock 的缓存读/写指标；如果读取比例异常偏低，可在 Codex 配置中设置 web_search = "disabled"，测试费用是否回落到正常水平。

hackernews · TheP1000 · 8月21日 03:17 · [社区讨论](https://news.ycombinator.com/item?id=49383326)

**背景**: 提示缓存允许 LLM 服务商在多次 API 调用之间复用重复提示前缀的计算，在 Amazon Bedrock 上最多可降低 90% 的成本和 85% 的延迟。像 Codex 这样的智能体编程工具受益尤其明显，因为它们在每次工具调用和每一轮对话中都会重发相同的庞大系统提示和对话历史。Codex 可以配置为通过 Amazon Bedrock 而非 OpenAI 的 API 路由模型请求，由 AWS 计费。一旦缓存失效，缓存写入（比普通输入 token 更贵）会被反复计费，却没有缓存读取的节省来抵消，从而使总支出成倍增加。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-caching.html">Prompt caching for faster model inference - Amazon Bedrock</a></li>
<li><a href="https://aws.amazon.com/blogs/machine-learning/effectively-use-prompt-caching-on-amazon-bedrock/">Effectively use prompt caching on Amazon Bedrock</a></li>
<li><a href="https://developers.openai.com/codex/amazon-bedrock">Use ChatGPT Work and Codex with Amazon Bedrock | ChatGPT Learn</a></li>

</ul>
</details>

**社区讨论**: 一位用户用具体数据证实了诊断（缓存读/写比例低于 5%，费用约 10 倍），并验证 web_search = "disabled" 的临时方案有效。维护者 amluto 批评该 issue 讨论条理近乎混乱，并指向官方提示缓存文档，指出 Codex 配置错误的根因仍未查明。其他评论者借这个 bug 指出即便是顶级 AI 公司也会犯低级错误，还有人报告 Codex 应用本身也在异常消耗用量。

**标签**: `#openai-codex`, `#aws-bedrock`, `#prompt-caching`, `#cost-optimization`, `#bug-report`

---

<a id="item-2"></a>
## [Anna's Archive 警告：AI 公司扫描后销毁珍稀书籍](https://annas-archive.gl/blog/physical-destruction.html) ⭐️ 5.0/10

Anna's Archive 发布博文称，多家 AI 公司通过中间商大量收购二手书，进行破坏性扫描后销毁原书，以获取 2022 年前'未经机器接触'的训练数据。该文呼吁在实体书被销毁前尽快对珍稀书籍进行保存性扫描。 工业规模的破坏性扫描可能导致从未被数字化的珍稀实体书永久消失，造成不可逆的文化遗产损失。这也揭示了版权执法正在如何重塑 AI 训练数据的获取方式和保存优先级。 Anthropic 于 2024 年初启动的'Project Panama'是一个有据可查的大规模破坏性扫描项目，此前该公司因使用盗版书籍达成 15 亿美元的版权和解。破坏性扫描本身是标准的数字化手段（拆书后逐页扫描），但据报道美国法院首次明确认可在大规模数字化中销毁原件。 如果你拥有珍稀或绝版书籍，可以考虑进行非破坏性扫描（或自行扫描），并在实体副本丢失之前将数字化版本贡献给开放保存档案库。

hackernews · Cider9986 · 8月21日 02:37 · [社区讨论](https://news.ycombinator.com/item?id=49383026)

**背景**: Anna's Archive 是一个影子图书馆的开源搜索引擎，于 2022 年执法部门查封 Z-Library 后上线，聚合了 Z-Library、Sci-Hub 和 LibGen 等资源，目标是追踪所有书籍数字化的进度。破坏性扫描比非破坏性方式质量更高，但会毁掉实体书。据报道 AI 公司偏好 2022 年之前的文本，因为其早于 AI 生成内容的泛滥，属于'未经机器接触'的数据。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Anna's_Archive">Anna's Archive</a></li>
<li><a href="https://en.wikipedia.org/wiki/Project_Panama">Project Panama - Wikipedia</a></li>
<li><a href="https://www.bookbaby.com/book-printing/destructive-book-scanning">Destructive Book Scanning To Create New Copies | BookBaby Anthropic destroyed millions of print books to build its AI ... Save Your Books: AI Companies Destroying Books For Training Destructive Book Scanning | Velqa Publishers AI Companies Accused of Destroying Rare Books After Scanning ...</a></li>

</ul>
</details>

**社区讨论**: 评论者争论责任归属：有人认为拒绝再版或放开版权的版权方才是'封锁书籍'的一方，实际上迫使 AI 公司销毁购得的副本。还有人指出 AI 公司在'卡夫卡式'版权法下被迫销毁书籍的讽刺之处，质疑珍稀书籍原本是否真的被广泛获取过，并感叹缺乏追踪全球数字化进度的集中式工具。

**标签**: `#copyright`, `#AI`, `#digitization`, `#book preservation`, `#information access`

---

<a id="item-3"></a>
## [内华达州批准特斯拉、Uber 和 Waymo 部署数千辆无人出租车](https://techcrunch.com/2026/08/20/tesla-uber-and-waymo-all-get-the-ok-to-operate-thousands-of-robotaxis-in-nevada/) ⭐️ 5.0/10

内华达州监管机构批准了许可，允许特斯拉、Uber 和 Waymo 在未来 12 个月内在公共道路上合计部署多达 8000 辆无人出租车。这是单一州对商业自动驾驶网约车业务规模最大的授权之一。 大规模无人出租车部署的前提是获得监管批准，内华达州的决定表明各州越来越愿意批准商业自动驾驶车队。对于从事自动驾驶、物流和车队软件的工程师与运营者来说，这扩大了其系统和服务可以落地的真实市场。 内华达州要求企业在部署前获得 DMV 许可并完成自我认证流程，商业运营还需获得内华达州交通管理局的批准。8000 辆是三家公司在 12 个月内的合计上限，并非实际车队规模的保证。 如果你从事自动驾驶或车队运营工作，可以查阅内华达州 DMV 的自动驾驶车辆许可要求和该州的部署框架，了解自己的车辆或服务需要遵循的合规路径。

rss · TechCrunch · 8月21日 00:23

**背景**: Waymo 是 Alphabet 旗下子公司，由谷歌自动驾驶汽车项目发展而来，已在美国多个城市运营商业无人出租车服务。内华达州长期以来对自动驾驶汽车测试持友好态度，要求获得 DMV 许可并为测试车辆发放特殊的红色车牌。特斯拉一直采用基于摄像头的端到端神经网络方案，并于 2025 年底完成了内华达州无人出租车的自我认证流程。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://techcrunch.com/2025/09/11/teslas-robotaxi-plans-for-nevada-move-forward-with-testing-permit/">Tesla's robotaxi plans for Nevada move forward with testing permit | TechCrunch</a></li>
<li><a href="https://www.businessinsider.com/tesla-robotaxi-dmv-approval-nevada-autonomous-cars-self-certification-2025-11">Tesla's Robotaxi Gets DMV All-Clear in Nevada - Business Insider</a></li>
<li><a href="https://en.wikipedia.org/wiki/Waymo">Waymo - Wikipedia</a></li>

</ul>
</details>

**标签**: `#autonomous-vehicles`, `#robotaxis`, `#regulation`, `#transportation`, `#industry-news`

---