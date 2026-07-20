---
layout: default
title: "Horizon Summary: 2026-07-20 (ZH)"
date: 2026-07-20
lang: zh
---

> 从 7 条内容中筛选出 3 条重要资讯。

---

1. [Claude Fable 据报道找到了雅可比猜想的反例](#item-1) ⭐️ 9.0/10
2. [泄露的 2022 年 Altman 邮件揭示 OpenAI 开源战略的反竞争意图](#item-2) ⭐️ 8.0/10
3. [小米开源可执行家务的双臂机器人系统](#item-3) ⭐️ 7.0/10

---

<a id="item-1"></a>
## [Claude Fable 据报道找到了雅可比猜想的反例](https://xcancel.com/__alpoge__/status/2079028340955197566) ⭐️ 9.0/10

2026 年 7 月 19 日，Anthropic 员工兼数学家 Levent Alpöge 报告称，他使用 Anthropic 的 Claude 'Fable' 模型在三维空间中找到了雅可比猜想的一个具体反例。令人惊讶的是，该反例仅涉及 7 次多项式，远比之前暴力搜索所预期的要简单。 雅可比猜想是数学界著名的未解难题，在 Stephen Smale 1998 年提出的 21 世纪数学问题列表中位列第 16。如果得到验证，这一反例将解决一个困扰数学界数十年的问题，并展示一种全新的范式：AI 系统能够协助发现人类研究者难以找到的数学成果。 该反例是在三维空间中找到的，涉及 7 次多项式，考虑到研究人员此前估计反例的下界可能高达 200 次，这一结果出人意料地简洁。雅可比猜想因大量已发表和未发表的证明最终被发现含有微妙错误而臭名昭著，这意味着对该结果进行严格的人工验证至关重要。

hackernews · loubbrad · 7月20日 02:51 · [社区讨论](https://news.ycombinator.com/item?id=48973869)

**背景**: 雅可比猜想研究的是从 n 维空间到自身的多项式函数：它断言如果这样一个多项式映射的雅可比行列式是一个非零常数，那么该函数必定存在多项式逆函数。该猜想最早由 Ludwig Kraus 于 1884 年在二维情况下提出，1939 年由 Ott-Heinrich Keller 推广到一般情形，其表述仅需微积分知识即可理解，但在证明或证伪方面却极其困难。自动定理证明是计算机科学的一个子领域，专注于使用软件生成形式化的数学证明，而像 Claude 这样的现代大语言模型正越来越多地被用作数学探索的工具。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Jacobian_conjecture">Jacobian conjecture</a></li>
<li><a href="https://en.wikipedia.org/wiki/Automated_theorem_proving">Automated theorem proving</a></li>

</ul>
</details>

**社区讨论**: 社区成员对 Claude Fable 找到 7 次反例感到惊讶，因为此前涉及 16 个变量的暴力搜索估计下界可能高达 200 次。多位评论者讨论了与 AI 一起进行'数学氛围编程'的新兴实践，指出虽然 AI 使发现变得容易，但人工验证仍然是真正的瓶颈。一条富有洞察力的评论认为，未来许多突破将不是来自超级困难的问题，而是来自此前人类关注不足的领域。

**标签**: `#AI`, `#Mathematics`, `#LLMs`, `#Automated Theorem Proving`, `#Jacobian Conjecture`

---

<a id="item-2"></a>
## [泄露的 2022 年 Altman 邮件揭示 OpenAI 开源战略的反竞争意图](https://simonwillison.net/2026/Jul/20/sam-altman/#atom-everything) ⭐️ 8.0/10

一封日期为 2022 年 10 月 1 日、由 Sam Altman 发给 OpenAI 董事会的泄露邮件在 Musk v. Altman 诉讼程序中被曝光。该邮件揭示，OpenAI 发布开源模型的战略明确旨在打击竞争者，并使新的 AI 项目更难获得资金支持。Altman 特别提议在 Stability AI 或其他公司之前，发布一个能在消费级硬件上本地运行的、达到 GPT-3 能力水平的模型。 这份原始文件提供了直接证据，表明 OpenAI 将开源发布视为一种精心计算的商业武器，旨在切断竞争对手的资金和市场机会，而非出于善意或科学开放精神。它从根本上改变了公众对 OpenAI 发布开放权重模型背后动机的理解，并引发了关于 AI 行业垄断行为的严重质疑。 邮件中特别提到希望抢在 Stability AI 之前采取行动，后者因其 Stable Diffusion 等开源生成式 AI 模型而备受关注。Altman 提议发布一个能力接近 GPT-3（拥有 1750 亿参数的模型）且能在消费级硬件上本地运行的模型，这一概念在技术上具有挑战性，但通过量化等优化技术正逐渐变得可行。

rss · Simon Willison · 7月20日 03:47

**背景**: 2022 年，开源 AI 领域快速发展，Stability AI 等公司积极推动可在消费级硬件上运行的开放权重模型。OpenAI 于 2020 年发布的 GPT-3 是一个具有里程碑意义的、拥有 1750 亿参数的语言模型，最初需要大量计算资源才能运行。得益于量化（即降低模型参数精度）等优化技术，在消费级硬件上本地运行强大语言模型的能力成为 AI 民主化的重要推动力。Musk v. Altman 诉讼案是 Elon Musk 对 OpenAI 和 Sam Altman 提起的法律诉讼，指控他们放弃了该组织最初的非营利使命。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Stable_Diffusion">Stable Diffusion - Wikipedia</a></li>
<li><a href="https://en.wikipedia.org/wiki/GPT-3">GPT-3 - Wikipedia</a></li>
<li><a href="https://www.cognativ.com/blogs/post/running-local-llms-on-consumer-hardware/496">Running Local LLMs on Consumer Hardware - Cognativ</a></li>

</ul>
</details>

**标签**: `#ai-ethics`, `#openai`, `#open-source`, `#sam-altman`, `#generative-ai`

---

<a id="item-3"></a>
## [小米开源可执行家务的双臂机器人系统](https://robotics.xiaomi.com/xiaomi-robotics-1.html) ⭐️ 7.0/10

小米发布了 Xiaomi Robotics 1，这是一个开源的双臂机器人系统，旨在执行叠衣服等复杂的家务任务。该系统的硬件设计和软件已公开发布，允许研究人员和开发者自由地在此基础上进行开发。 将能够执行家务任务的双臂系统开源，标志着实用型消费机器人的普及化和可负担性迈出了重要一步。通过让全球开发者社区共同改进操作算法和硬件设计，这将加速家用机器人生态系统的创新。 双臂配置特别适合需要双手协调的任务，例如一只手臂稳定物体而另一只手臂进行操作。该系统展示了基于 AI 的运动规划和力感知能力，这些技术在近年来取得了显著进步，使其能够处理衣物等柔软、可变形的物体。

hackernews · ilreb · 7月20日 04:45 · [社区讨论](https://news.ycombinator.com/item?id=48974454)

**背景**: 双臂机器人在工业领域已使用多年，ABB 的 YuMi（2015 年发布）是装配任务领域的先驱平台。最近的真正增长来自于力感知技术和基于 AI 的运动规划的改进，使这些系统能够处理五年前不可能完成的任务。开源机器人是一种公开共享硬件蓝图、原理图和源代码的运动，使全球研究和创客社区能够进行协作开发。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://amdmachines.com/blog/dual-arm-robots-for-complex-assembly-tasks/">Dual-Arm Robots for Complex Assembly Tasks | AMD Machines</a></li>
<li><a href="https://en.wikipedia.org/wiki/Open-source_robotics">Open-source robotics</a></li>
<li><a href="https://dsiac.dtic.mil/articles/two-arms-are-better-than-one-the-benefits-of-a-dual-arm-robotic-system/">Two Arms are Better Than One: The Benefits of a Dual-Arm Robotic System - DSIAC</a></li>

</ul>
</details>

**社区讨论**: 社区情绪总体积极，用户们对机器人终于能够处理叠衣服等繁琐家务感到兴奋。关于设计理念存在积极讨论，一些人认为非人形设计更实用，并将催生新的人机混合使用工具和家电。用户还讨论了生活方式的影响，指出经济实惠的机器人家庭助手可以让更多人享受到目前在许多西方国家仍属奢侈品的家政服务。

**标签**: `#robotics`, `#open-source`, `#AI`, `#automation`, `#Xiaomi`

---