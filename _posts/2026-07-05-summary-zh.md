---
layout: default
title: "Horizon Summary: 2026-07-05 (ZH)"
date: 2026-07-05
lang: zh
---

> 从 14 条内容中筛选出 4 条重要资讯。

---

1. [SOTA Claude 模型在第三方工具模式遵循上出现倒退](#item-1) ⭐️ 8.0/10
2. [利用 AI 模型将《命令与征服：将军》移植到 macOS、iPhone 和 iPad](#item-2) ⭐️ 7.0/10
3. [GPT-5.5 Codex 推理 token 聚集问题导致性能下降](#item-3) ⭐️ 7.0/10
4. [Simon Willison 使用 Claude Fable 在 sqlite-utils 4.0rc2 正式发布前进行代码审查](#item-4) ⭐️ 7.0/10

---

<a id="item-1"></a>
## [SOTA Claude 模型在第三方工具模式遵循上出现倒退](https://simonwillison.net/2026/Jul/4/better-models-worse-tools/#atom-everything) ⭐️ 8.0/10

Armin Ronacher 报告称，像 Claude Opus 4.8 和 Sonnet 5 这样的较新 Anthropic 模型在使用其 Pi 编程工具时，越来越多地在工具调用模式中捏造无效字段，这是旧模型中未曾出现的倒退现象。他推测这是因为这些模型通过强化学习被专门微调以适配 Claude Code 的内置编辑工具，从而对自定义的第三方工具造成了干扰。 这揭示了一个反直觉的趋势：最强大的 SOTA 模型在工具调用模式遵循等特定关键任务上，实际表现可能不如其前代模型。它凸显了第一方与第三方 AI 工具生态系统之间日益紧张的关系，表明为自家专有工具进行优化的模型提供商可能会在不经意间降低独立开发者构建自定义智能体框架时的性能。 这些模型生成的编辑内容本身是正确的，但在嵌套参数数组中包含了捏造的键，导致像 Pi 这样严格的模式验证器拒绝工具调用并触发重试循环。Claude 的原生编辑工具使用搜索替换机制，而 OpenAI 的 Codex 则使用 apply_patch 机制，这引发了第三方框架是否必须实现多种编辑工具以匹配不同模型训练接口的疑问。

rss · Simon Willison · 7月4日 22:53

**背景**: 工具调用（或函数调用）是一项允许 LLM 根据提供的模式生成结构化 JSON 参数，从而与外部工具、API 和函数进行交互的能力。像 Pi、Claude Code 和 OpenAI Codex 这样的 AI 编程框架严重依赖这一机制来让模型自主读取、写入和编辑文件。当模型产生所提供的 JSON 模式中不存在的幻觉字段时，执行就会失败，这使得严格的模式验证成为 AI 智能体的关键可靠性保障层。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://eskilab.com/llm-tool-calling-schema-design/">LLM Tool Calling Schema Design | EskiLab</a></li>
<li><a href="https://www.promptingguide.ai/agents/function-calling">Function Calling in AI Agents | Prompt Engineering Guide</a></li>
<li><a href="https://tianpan.co/blog/2026-06-02-the-hallucinated-tool-argument-that-passed-schema-validation">The Hallucinated Tool Argument That Passed Schema Validation</a></li>

</ul>
</details>

**标签**: `#LLM`, `#AI Agents`, `#Tool Calling`, `#Claude`, `#Software Engineering`

---

<a id="item-2"></a>
## [利用 AI 模型将《命令与征服：将军》移植到 macOS、iPhone 和 iPad](https://github.com/ammaarreshi/Generals-Mac-iOS-iPad/tree/main) ⭐️ 7.0/10

一位开发者利用名为 Fable 的 AI 模型，成功将《命令与征服：将军：绝命时刻》原生移植到 macOS、iPhone 和 iPad 上。该项目基于 EA 发布的 GPL v3 源代码以及此前 GeneralsX 的 macOS/Linux 移植工作，新增了 iOS/iPadOS 支持、DXVK/MoltenVK 渲染器和自定义的即时战略触控操作。 该项目展示了 AI 辅助大规模代码转换的一个引人注目的实际用例，表明 AI 模型如何通过让经典游戏在现代平台上运行来帮助保存它们。这凸显了 AI 在处理跨平台移植等复杂软件工程任务方面日益增长的潜力，而这些任务传统上需要大量人工投入。 该移植版本使用了 EA GPL v3 源代码发布的原始游戏引擎，并采用 DXVK/MoltenVK 进行向 Apple Metal API 的渲染转换。它包含自定义的即时战略触控操作，包括点击选择、拖拽框选、长按取消选择、双指滚动和捏合缩放，但开源版本不包含游戏资源文件。

hackernews · asronline · 7月4日 19:41 · [社区讨论](https://news.ycombinator.com/item?id=48788283)

**背景**: 《命令与征服：将军》是一款经典的即时战略游戏，最初由 Westwood Studios 开发、电子艺界（EA）发行。该游戏的源代码以 GPL v3 许可证发布，使得像 GeneralsX 这样的社区驱动移植工作成为可能，后者此前已将游戏移植到 macOS 和 Linux。Fable 是由 Anthropic 开发的高性能 AI 模型，在软件工程任务方面表现出色。DXVK 和 MoltenVK 是转换层，分别将 DirectX 图形调用转换为 Vulkan 和 Apple 的 Metal API，使为 Windows 构建的游戏能够在非 Windows 平台上运行。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/ammaarreshi/Generals-Mac-iOS-iPad">ammaarreshi/ Generals -Mac-iOS-iPad: Command & Conquer ...</a></li>
<li><a href="https://aitoolsworth.com/command-conquer-generals-apple-silicon-ios-port/">Command & Conquer Generals Ported to macOS, iOS, iPad</a></li>
<li><a href="https://www.anthropic.com/claude/fable">Claude Fable \ Anthropic</a></li>

</ul>
</details>

**社区讨论**: 评论者称赞这是 AI 辅助大规模代码转换的真正好用途，风险低且可以反复迭代。有人注意到 AI 编程代理的一种语言习惯——倾向于创造复合名词来概括复杂概念——并讨论这是为了节省 token 还是便于后续引用。还有人表示希望将类似技术应用于《沙丘魔堡帝國》等其他经典游戏，强调了 AI 在游戏保存方面的潜力。

**标签**: `#AI`, `#Game Porting`, `#macOS`, `#iOS`, `#Reverse Engineering`

---

<a id="item-3"></a>
## [GPT-5.5 Codex 推理 token 聚集问题导致性能下降](https://github.com/openai/codex/issues/30364) ⭐️ 7.0/10

开发者在 GPT-5.5 Codex 中发现了一个可复现的 Bug：该模型会间歇性地中断推理过程，人为地将思考 token 恰好限制在 516 个，从而导致错误的结果。这种性能倒退似乎与模型的自适应思考机制失效有关，该机制本应动态分配数千个推理 token 来解决复杂问题。 这种静默的服务器端性能倒退严重破坏了开发者对 GPT-5.5 Codex 处理复杂编程任务的信任，因为他们已无法依赖其稳定的逻辑输出。这凸显了行业内的一个普遍问题：专有 LLM 中不透明的自适应推理机制可能会在没有预警的情况下发生退化，迫使开发者为了稳定性而转向本地模型或竞争平台。 当自适应思考正常运行时，模型会使用 6000 到 8000 个推理 token 来准确解开难题；然而，该聚集 Bug 会迫使模型在 516 个 token 处停止，导致生成极其糟糕的代码实现。通过 Codex CLI 向模型输入需要深度推理的谜题提示，可以轻松复现这一问题。

hackernews · maille · 7月4日 21:51 · [社区讨论](https://news.ycombinator.com/item?id=48789428)

**背景**: 推理 token 是大型语言模型（LLM）在生成最终可见输出之前，为了促进思维链处理而生成的隐藏中间步骤。像 GPT-5.5 Codex 这样的模型使用自适应思考机制，根据任务复杂度动态调整推理 token 的数量。当该机制失效或被人为限制时，模型在逻辑上处理复杂编程问题的能力就会受到严重损害。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://medium.com/@fhorvat90/i-tested-reasoning-tokens-on-5-llms-via-openrouter-most-models-silently-drop-them-b8071b5d857d">I Tested Reasoning Tokens on 5 LLMs via OpenRouter. | Medium</a></li>
<li><a href="https://openai.com/index/introducing-gpt-5-5/">Introducing GPT - 5 . 5 | OpenAI</a></li>

</ul>
</details>

**社区讨论**: 社区对这种间歇性的质量下降感到沮丧，许多用户指出之前的版本（如 5.3）提供了更好的稳定性和代码质量。几位开发者已经放弃了 Codex，转而使用 Claude Code 或本地模型等替代方案，并指出 OpenAI 在几个月内显然未能解决这一性能倒退问题。还有一种愤世嫉俗的共识认为，这是一个罕见的、已被证实的公司确实降低了模型智能的案例，而不仅仅是用户的主观错觉。

**标签**: `#AI`, `#LLM`, `#OpenAI`, `#Coding Tools`, `#Debugging`

---

<a id="item-4"></a>
## [Simon Willison 使用 Claude Fable 在 sqlite-utils 4.0rc2 正式发布前进行代码审查](https://simonwillison.net/2026/Jul/5/sqlite-utils-fable/#atom-everything) ⭐️ 7.0/10

Simon Willison 利用 Claude Fable 对 sqlite-utils 4.0 进行了发布前的最终审查，发现了 5 个严重的阻碍性错误，包括 `delete_where()` 方法中一个会导致数据丢失的关键缺陷。在 37 次提示和 34 次提交的过程中，这个 AI 代理帮助修复了这些问题，最终产出了 4.0rc2 发布候选版本，API 费用约为 149.25 美元。 这展示了一个高度实用且贴近真实的开发工作流，说明了如何将 Claude 这样的高级 LLM 应用于软件发布管理和深度代码审查等工程任务中。它突显了 AI 辅助开发的成本效益，在一个被广泛使用的开源工具进行重大稳定版发布前，成功捕获了本可能导致用户数据丢失的关键错误。 发现的最严重的错误位于 `Table.delete_where()` 方法中，该方法在没有 `atomic()` 包装器的情况下执行了 DELETE 语句，导致连接处于事务状态，从而破坏了后续操作并造成数据丢失。Willison 通过 iPhone 上的 Claude Code for web 远程管理了整个审查过程，甚至在外出参加当地游行活动时也在继续提示下一步操作。

rss · Simon Willison · 7月5日 01:00

**背景**: sqlite-utils 是由 Simon Willison 创建的一个流行的 Python CLI 实用工具和库，用于操作 SQLite 数据库。Claude Fable 是由 Anthropic 开发的一个强大的大型语言模型，专为处理长时间运行和复杂的软件工程任务而设计。语义化版本控制（SemVer）是一种为软件分配版本号的标准系统，其中主版本号的增加（如 4.0）标志着引入了不兼容的 API 更改。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/simonw/sqlite-utils">GitHub - simonw/sqlite-utils: Python CLI utility and library for manipulating SQLite databases · GitHub</a></li>
<li><a href="https://www.anthropic.com/claude/fable">Claude Fable \ Anthropic</a></li>
<li><a href="https://code.claude.com/docs/en/claude-code-on-the-web">Claude Code on the web - Claude Code Docs</a></li>

</ul>
</details>

**标签**: `#AI-assisted-coding`, `#sqlite-utils`, `#LLM`, `#software-engineering`, `#release-management`

---