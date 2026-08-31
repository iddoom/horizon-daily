---
layout: default
title: "Horizon Summary: 2026-08-31 (ZH)"
date: 2026-08-31
lang: zh
---

> 从 12 条内容中筛选出 2 条重要资讯。

---

1. [Simon Willison 厘清 OpenAI 令人困惑的 ChatGPT Work 产品](#item-1) ⭐️ 8.0/10
2. [Reddit 用户构建跨基准的参数归一化“智能体编码指数”](#item-2) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [Simon Willison 厘清 OpenAI 令人困惑的 ChatGPT Work 产品](https://simonwillison.net/2026/Aug/30/understanding-chatgpt-work/) ⭐️ 8.0/10

Simon Willison 发布了一篇详细解读文章，澄清 OpenAI 于 7 月 9 日发布的 ChatGPT Work 实际上是两个不同的产品：一个是通过 chatgpt.com 和移动应用访问的云端版本（Work Cloud），另一个是源自原 Codex 应用的本地桌面版本（Work Local）。他梳理出 Work Cloud 的差异化功能：可选择 GPT-5.6 Sol、Luna、Terra 模型、带互联网访问的代码执行环境、无头 Chrome 浏览器、跨会话持久共享文件系统、发布 ChatGPT Sites、子代理以及定时提示自动化。 ChatGPT Work 功能强大但产品包装令人困惑，OpenAI 官方关于何时使用 Chat 还是 Work 的说明也不够清晰，因此这篇基于实际使用的拆解为付费订阅者提供了具体的功能层面的选择依据。任何正在评估用于文档、分析或自动化工作流的 AI 代理工具的人，都能从准确理解 Work 相比普通 Chat 增加了什么而受益。 两种版本的 Work 都需要每月 20 美元或更高的订阅；免费用户和每月 8 美元的 Go 用户无法使用。Work 提供从 Light 到 Ultra 的推理等级（据称 Ultra 会更积极地把任务委派给子代理），而 Chat 的 5.6 Pro 等级似乎是 Chat 独有的，且仅限每月 100 美元以上的订阅者使用，Work 会话似乎按 Codex 类型的用量额度计费。 如果你有每月 20 美元或更高的 ChatGPT 订阅，建议阅读 Willison 的完整文章，并亲自试用 Work Cloud 的无头 Chrome 浏览器和持久文件系统，看看它们能否解决普通 Chat 无法完成的任务，再决定是否需要单独的代理工具。

rss · Simon Willison · 8月30日 23:59

**背景**: ChatGPT Work 于 2026 年 7 月推出，由 GPT-5.6 驱动，是 OpenAI 面向白领工作者的代理产品，旨在通过连接应用和文件来产出演示文稿、电子表格和文档等成品。桌面应用的前身是 Codex，即 OpenAI 面向开发者的编程代理，2026 年 4 月增加了计算机操作、浏览和插件功能；Work Local 本质上是面向非开发者的 Codex 换皮版本。聊天机器人（回答问题）与代理（借助浏览器、代码执行和文件系统等工具执行多步任务）之间的区别，正是这款产品所代表的核心概念转变。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://openai.com/chatgpt-work/">ChatGPT Work for every team | OpenAI</a></li>
<li><a href="https://en.wikipedia.org/wiki/ChatGPT">ChatGPT - Wikipedia</a></li>
<li><a href="https://techcrunch.com/2026/08/24/openai-is-building-an-ai-agent-for-everything-will-everyone-use-them/">OpenAI is building AI agents for everything. Will everyone use them? | TechCrunch</a></li>

</ul>
</details>

**标签**: `#OpenAI`, `#ChatGPT Work`, `#AI agents`, `#LLM tools`, `#product analysis`

---

<a id="item-2"></a>
## [Reddit 用户构建跨基准的参数归一化“智能体编码指数”](https://www.reddit.com/r/LocalLLaMA/comments/1w2v97w/i_collected_every_single_llm_coding_benchmark_and/) ⭐️ 6.0/10

一位 Reddit 用户将主要智能体编码基准（SWE-bench Pro、DeepSWE v1.1、Terminal-Bench v4/v3/v2.1、Code Arena Elo、LiveCodeBench v6）聚合为一个“智能体编码指数”，再除以参数量得到“智能密度”指标。公式使用了超线性指数和 8B 参数下界，以防止极小模型人为占据榜首。 这篇帖子把当前主流智能体编码基准集中整理在了一起，参数效率的视角也有助于读者按单位参数能力比较小型本地模型与前沿模型。但权重设置和公式常数是主观且未经验证的，因此排名应视为个人观点而非严谨度量。 指数权重为：DeepSWE v1.1（20%）、Code Arena Elo（20%）、Terminal-Bench v4.0（15%）、SWE-bench Pro（15%）、Terminal-Bench v3.0（13%）、Terminal-Bench v2.1（12%）、LiveCodeBench v6（5%）。归一化设定中性基线为 50，Scale = 2.5354，PLowerBound = 8B 作为防止 1B 以下模型分数虚高的正则项。 可以把帖子中的基准列表当作评估编码模型的清单，并直接查看 SWE-bench Pro、Terminal-Bench、DeepSWE 的官方排行榜，而不是依赖这个综合指数。如果你关注本地部署，可以用符合自己工作负载的权重自行计算“能力/参数”比较。

reddit · r/LocalLLaMA · /u/Informal-Trouble2183 · 8月30日 22:20

**背景**: 智能体编码基准测试的是模型能否自主完成多步骤软件工程任务，而非回答孤立的编程问题。SWE-bench Pro 使用来自 41 个真实代码仓库的 1865 个问题来模拟企业级工作；Terminal-Bench 在真实终端环境中运行智能体；DeepSWE 专注于长时程、无污染的任务；LiveCodeBench 则用新题测试竞赛编程能力。参数效率指标将能力除以模型规模，这对在消费级硬件上运行本地模型的 LocalLLaMA 用户尤其重要。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://scaleapi.github.io/SWE-bench_Pro-os/">SWE-Bench Pro</a></li>
<li><a href="https://www.tbench.ai/">TERMINAL-BENCH</a></li>
<li><a href="https://deepswe.datacurve.ai/">DeepSWE measures frontier coding agents on original, long-horizon...</a></li>

</ul>
</details>

**标签**: `#LLM benchmarks`, `#agentic coding`, `#model evaluation`, `#LocalLLaMA`, `#parameter efficiency`

---