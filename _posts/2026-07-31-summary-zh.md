---
layout: default
title: "Horizon Summary: 2026-07-31 (ZH)"
date: 2026-07-31
lang: zh
---

> 从 17 条内容中筛选出 2 条重要资讯。

---

1. [DeepSeek 发布 V4 Flash 模型：高性能与低 API 成本](#item-1) ⭐️ 8.0/10
2. [Google 借助 AI 在 6 月修复了创纪录数量的 Chrome 漏洞](#item-2) ⭐️ 7.0/10

---

<a id="item-1"></a>
## [DeepSeek 发布 V4 Flash 模型：高性能与低 API 成本](https://artificialanalysis.ai/models/deepseek-v4-flash-ga) ⭐️ 8.0/10

DeepSeek 发布了 V4 Flash 模型，这是一个混合专家模型，总参数量为 284B，激活参数量为 13B，支持 100 万 token 的上下文窗口。模型权重已在 Hugging Face 上公开发布，API 价格极具竞争力，远低于 GPT-5.6 Sol 等替代方案。 此次发布延续了 DeepSeek 以极低价格提供接近前沿模型性能的市场颠覆策略。它使开发者和企业能够更容易地获取先进的 AI 能力，同时也加大了整个大语言模型行业的价格竞争压力。 DeepSeek V4 Flash 是一个效率优化的混合专家模型，专为在 100 万 token 的超长上下文窗口中进行高效推理而构建。根据社区基准测试，它在性价比方面已经以大约两倍的优势超越了部分竞争对手。

hackernews · theanonymousone · 7月31日 07:59 · [社区讨论](https://news.ycombinator.com/item?id=49120299)

**背景**: 混合专家模型是一种在推理过程中仅稀疏激活模型部分参数的架构，允许模型拥有庞大的总参数量，同时保持较低的计算成本。DeepSeek 此前已利用该技术以极具攻击性的价格提供高性能模型，在开源社区中建立了良好的声誉。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://openrouter.ai/deepseek/deepseek-v4-flash">DeepSeek V 4 Flash - API Pricing & Benchmarks | OpenRouter</a></li>
<li><a href="https://huggingface.co/deepseek-ai/DeepSeek-V4-Flash">deepseek -ai/ DeepSeek - V 4 - Flash · Hugging Face</a></li>
<li><a href="https://benchlm.ai/deepseek/api-pricing">DeepSeek API Pricing (July 2026): V4 Pro & Flash Rates | BenchLM.ai</a></li>

</ul>
</details>

**社区讨论**: 社区对此次发布表现出极高的热情，称赞 DeepSeek 提供了市场上最优的低价 API 模型。开发者们积极分享新发布的模型权重链接，将其性价比与竞争对手进行比较，并猜测即将推出的 V4 Pro 模型的潜在性能表现。

**标签**: `#DeepSeek`, `#Large Language Models`, `#AI Performance`, `#API Pricing`

---

<a id="item-2"></a>
## [Google 借助 AI 在 6 月修复了创纪录数量的 Chrome 漏洞](https://blog.google/security/chrome-stronger-with-every-update/) ⭐️ 7.0/10

Google 宣布，通过利用 AI 工具，他们在 2024 年 6 月修复的 Chrome 浏览器漏洞数量超过了过去两年的总和。这标志着人工智能辅助大幅加速了漏洞修复进程。 这展示了 AI 对大规模软件工程和网络安全工作流程日益增长的实际影响，可能会改变主流浏览器和企业软件处理漏洞管理的方式。它标志着 AI 正在成为安全团队的核心生产力倍增器，而不仅仅是编程助手。 Google 没有具体说明使用了哪些 AI 模型或工具，也没有公布修复的漏洞总数，这导致人们对这一声明的细节产生了一些质疑。修复的漏洞涵盖了 Chrome 浏览器代码库中各种严重程度和组件的问题。

hackernews · Garbage · 7月31日 07:29 · [社区讨论](https://news.ycombinator.com/item?id=49120097)

**背景**: Chrome 是全球使用最广泛的浏览器，其安全状况对数十亿用户至关重要。在像 Chromium（Chrome 的开源基础）这样的大型代码库中修复漏洞传统上非常耗费人力，需要开发者手动识别、复现和修补漏洞。AI 辅助的代码分析和自动化漏洞检测技术近年来发展迅速，Google、Microsoft 等公司已将机器学习整合到其安全流程中。

**社区讨论**: 社区讨论（208 条评论）显示出明显的分歧：一些用户分享了将 AI 作为日常编程任务生产力加速器的积极体验，而另一些人则对 Google 的声明表示怀疑，认为存在内部压力以制造可用于营销的 AI 采用指标。一个值得关注的担忧是，如果 AI 降低了内部修复漏洞的成本，Google 最终可能会减少对开源 Chromium 项目的投入，从而对 Brave 和 Edge 等下游浏览器分支产生负面影响。

**标签**: `#AI`, `#Software Engineering`, `#Cybersecurity`, `#Google Chrome`, `#Debugging`

---