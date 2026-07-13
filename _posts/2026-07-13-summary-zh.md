---
layout: default
title: "Horizon Summary: 2026-07-13 (ZH)"
date: 2026-07-13
lang: zh
---

> 从 17 条内容中筛选出 4 条重要资讯。

---

1. [Chromium 148 的 Math.tanh 变更使操作系统指纹追踪成为可能](#item-1) ⭐️ 7.0/10
2. [Simon Willison：AI 代理永远不应成为直接责任人](#item-2) ⭐️ 7.0/10
3. [印度科学家绘制高精度脑干图谱](#item-3) ⭐️ 7.0/10
4. [面对 GPT-5.6 竞争压力，Anthropic 再次延长 Claude Fable 5 可用期](#item-4) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [Chromium 148 的 Math.tanh 变更使操作系统指纹追踪成为可能](https://scrapfly.dev/posts/browser-math-os-fingerprint/) ⭐️ 7.0/10

从 Chromium 148 开始，V8 JavaScript 引擎更改了 Math.tanh 的实现方式，转而使用宿主操作系统的标准数学库（libm），而不是内置的跨平台例程。这意味着在某些输入下，Math.tanh 的精确位输出现在会因用户使用的是 Windows、macOS 还是 Linux 而异，从而为检测底层操作系统创造了新途径。 这一变更引入了一种难以伪造的新型指纹追踪信号，反机器人和追踪系统可以利用它来验证用户声称的操作系统是否与 User-Agent 标头一致。它突显了浏览器引擎实现中的细微变化如何在不经意间创建泄露隐私的侧信道，即使是像 Tor Browser 这样注重隐私的浏览器也难以应对。 Math.tanh 目前是 Chromium 中唯一会泄露操作系统信息的 Math.* 函数，而这种不对称性本身就可以被脚本检测到。该问题的根源在于不同操作系统在实现超越函数时具有略微不同的舍入行为，并且正确舍入的超越函数目前在技术上是可行的，但尚未被普遍采用。

hackernews · joahnn_s · 7月12日 21:12 · [社区讨论](https://news.ycombinator.com/item?id=48884853)

**背景**: 浏览器指纹追踪是一种识别用户的技术，它通过收集来自浏览器、操作系统和硬件的独特特征来进行追踪，而不是依赖 Cookie。像 tanh 这样的超越函数涉及无限级数，必须在浮点运算中进行近似，而不同操作系统上的数学库（libm）在最后一位的舍入选择上有所不同。当浏览器引擎从自身一致的实现切换到宿主操作系统的原生库时，它就继承了这些特定于平台的差异，而这些差异对于任何运行 JavaScript 的网站来说都是可观察的。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://scrapfly.dev/posts/browser-math-os-fingerprint/">Your Browser Does Math Differently on Every OS, and Anti-Bot Systems Read the Bits · scrapfly.dev</a></li>
<li><a href="https://news.ycombinator.com/item?id=48884853">Since Chromium 148, Math.tanh is now fingerprintable to link underlying OS | Hacker News</a></li>
<li><a href="https://www.darkwavetech.com/projects/device-fingerprinting/math-routine-fingerprinting">Darkwave Technologies, LLC - Math Routine Fingerprinting</a></li>

</ul>
</details>

**社区讨论**: Hacker News 社区对文章质量持高度怀疑态度，多位评论者指责这是一篇由 AI 生成的、为某爬虫公司服务的营销文章。然而，技术讨论本身却很有价值：评论者指出大多数用户不会通过 User-Agent 伪造操作系统，因此这一向量更适合用于检测浏览器版本范围，并指出正确舍入的超越函数可以消除此类侧信道。一位评论者观察到，由于指纹追踪向量数量庞大，即使是 Tor Browser 也已放弃尝试隐藏操作系统信息。

**标签**: `#browser-fingerprinting`, `#privacy`, `#chromium`, `#security`, `#web-browsers`

---

<a id="item-2"></a>
## [Simon Willison：AI 代理永远不应成为直接责任人](https://simonwillison.net/2026/Jul/12/directly-responsible-individuals/#atom-everything) ⭐️ 7.0/10

Simon Willison 发表评论指出，基于 LLM 的 AI 代理永远不应在组织中被指定为直接责任人（DRI），因为问责能力是人类独有的特质，机器无法具备。他直接引用了 IBM 1979 年著名的培训幻灯片——该幻灯片声明计算机永远无法被追责，因此永远不应做出管理决策。 随着 AI 代理越来越多地被整合到工程和业务流程中，组织面临着将责任转嫁给自主系统的危险诱惑，这可能导致严重的问责真空。Willison 的论点确立了一条重要的伦理边界：虽然代理可以执行任务，但人类必须始终对结果保留最终的所有权，确保在出现问题时始终有人需要承担责任。 DRI 概念起源于苹果公司，被定义为对特定项目的成功或失败承担最终责任的人，旨在确保明确的所有权并消除决策权的模糊性。Willison 引用了 GitLab 手册中的公开定义，并指出即使代理承担了大量工作，DRI 的身份也必须保留在能够为后果承担责任的人类身上。

rss · Simon Willison · 7月12日 23:57

**背景**: 直接责任人（DRI）模式是由苹果公司推广的管理框架，旨在通过为每个项目或计划指定唯一的最终负责人来确保明确的所有权。基于 LLM 的代理是利用大语言模型来理解指令、推理任务并自主与外部工具交互的软件实体。随着这些代理执行复杂操作的能力不断增强，组织正在努力解决如何将它们纳入传统的人类问责体系之中。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.bitesizelearning.co.uk/resources/directly-responsible-individual-dri-apple">Using the Directly Responsible Individual (DRI) concept at ...</a></li>
<li><a href="https://surajsonu.substack.com/p/apples-framework-for-responsibility">Apple's Framework for Responsibility - by Suraj Sonu</a></li>
<li><a href="https://www.hostinger.com/au/tutorials/what-is-an-llm-agent/">What is an LLM agent ? - Hostinger Tutorials</a></li>

</ul>
</details>

**标签**: `#AI Agents`, `#LLMs`, `#Accountability`, `#Engineering Management`, `#AI Ethics`

---

<a id="item-3"></a>
## [印度科学家绘制高精度脑干图谱](https://www.bbc.co.uk/news/articles/cg53l737v1qo?at_medium=RSS&at_campaign=rss) ⭐️ 7.0/10

印度科学家创建了一份全新且高度详细的人类脑干图谱，为大脑中最神秘、最不为人所知的区域之一提供了前所未有的结构图。这一新资源为研究人员提供了以往脑干研究中所缺乏的解剖学细节。 脑干控制着呼吸、心率和意识等关键的自主功能，但一直以来对其进行详细研究极为困难。这份新图谱为科学家提供了精确的参考地图，可能会极大地推动神经科学研究和临床治疗的发展。 脑干位于大脑底部，连接大脑和脊髓，是人体的自动控制中心。它由中脑、脑桥和延髓三个主要部分组成，共同调节无需意识参与的维持生命的功能。

rss · BBC World · 7月13日 00:08

**背景**: 脑图谱是一种综合性的参考图，用于识别和标注大脑的不同区域和结构，类似于地理图集对世界的描绘。此前，Allen Brain Atlas 等重大项目已经创建了详细的大脑图谱，但由于脑干解剖结构密集复杂且在维持生命中起着关键作用，它一直是一个极具挑战性的区域。脑干管理着包括呼吸、心跳、血压和吞咽在内的基本自主功能，这使其成为人类大脑中临床意义最重要但被测绘最少的区域之一。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://my.clevelandclinic.org/health/body/21598-brainstem">Brainstem: What It Is, Function, Anatomy & Location</a></li>
<li><a href="https://www.simplypsychology.org/brainstem-parts-and-functions.html">Brainstem: Parts, Functions, & Significance - Simply Psychology</a></li>
<li><a href="https://atlas.brain-map.org/">Allen Brain Atlas - Allen Reference Atlases :: Atlas Viewer</a></li>

</ul>
</details>

**标签**: `#neuroscience`, `#brain-mapping`, `#research`, `#biology`

---

<a id="item-4"></a>
## [面对 GPT-5.6 竞争压力，Anthropic 再次延长 Claude Fable 5 可用期](https://simonwillison.net/2026/Jul/12/bump/#atom-everything) ⭐️ 6.0/10

Anthropic 再次将所有付费计划中 Claude Fable 5 的可用期限延长至 7 月 19 日，同时将 Claude Code 的每周速率限制保持在提高 50% 的水平，这是对 OpenAI 新发布的 GPT-5.6 Sol 模型所带来的竞争压力的直接回应。与此同时，OpenAI 暂时取消了所有 Plus、Business 和 Pro 计划的 5 小时使用限制，并推出了 GPT-5.6 Sol 的效率改进，展现出对其算力容量的信心。 此次延期凸显了顶级 AI 实验室之间激烈的战略和定价战，模型访问权限和算力限制已成为关键的竞争差异化因素。Simon Willison 认为 Anthropic 应该让 Fable 永久可用，因为围绕其访问权限的不确定性正导致 Anthropic 在拥有可比的 Mythos 级模型的情况下，仍然将用户流失给 OpenAI。 付费计划用户最多可将每周使用限额的一半用于 Fable 5，之后必须使用使用额度或切换到其他模型。OpenAI 报告称 Codex 和 ChatGPT Work 的活跃用户已达到 600 万，并正在推出减少 GPT-5.6 Sol 消耗使用量的更改，有效地延长了用户在现有计划上能使用的距离。

rss · Simon Willison · 7月12日 21:20

**背景**: Claude Fable 5 是 Anthropic 强大的 Mythos 级模型家族中首个公开发布的模型，于 2026 年 6 月 9 日发布，以在网络安全等领域的超人类能力而闻名。Anthropic 最初因算力限制在订阅计划中限制了 Fable 的可用性，希望在承诺更低价格之前更好地了解需求。Claude Max 计划定价为每月 100 至 200 美元，专为需要更高速率限制和新模型优先访问权的高频专业用户设计。OpenAI 的 GPT-5.6 Sol 被认为是同一能力等级的直接竞争对手，从而引发了当前的竞争格局。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.anthropic.com/news/claude-fable-5-mythos-5">Claude Fable 5 and Claude Mythos 5 \ Anthropic</a></li>
<li><a href="https://support.claude.com/en/articles/11049741-what-is-the-max-plan">What is the Max plan? | Claude Help Center</a></li>
<li><a href="https://www.nbcnews.com/tech/security/fable-5-anthropic-release-public-mythos-claude-model-rcna349104">Anthropic releases Fable 5, the first public Mythos-class model</a></li>

</ul>
</details>

**标签**: `#AI`, `#Anthropic`, `#OpenAI`, `#LLMs`, `#AI Industry`

---