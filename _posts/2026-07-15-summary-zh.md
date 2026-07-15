---
layout: default
title: "Horizon Summary: 2026-07-15 (ZH)"
date: 2026-07-15
lang: zh
---

> 从 44 条内容中筛选出 7 条重要资讯。

---

1. [据报道，Stripe 与 Advent 提出以约 534 亿美元收购 PayPal](#item-1) ⭐️ 9.0/10
2. [我是如何诱骗 Claude 泄露你最深层、最黑暗的秘密](#item-2) ⭐️ 8.0/10
3. [OpenAI 构建 GPT-Red：用于提升模型安全的 LLM 超级黑客](#item-3) ⭐️ 8.0/10
4. [Thinking Machines 发布首个开源模型 Inkling](#item-4) ⭐️ 8.0/10
5. [Apple Intelligence 携手阿里巴巴 Qwen 获批在中国上线](#item-5) ⭐️ 8.0/10
6. [在 13 年前的 Xeon CPU 上以每秒 5 个 token 的速度运行 Gemma 4 26B](#item-6) ⭐️ 7.0/10
7. [三秒钟的盗窃：为什么 AI 语音诈骗能轻易突破所有防线](#item-7) ⭐️ 7.0/10

---

<a id="item-1"></a>
## [据报道，Stripe 与 Advent 提出以约 534 亿美元收购 PayPal](https://techcrunch.com/2026/07/15/stripe-and-advent-reportedly-offered-to-buy-paypal-for-around-53-4b/) ⭐️ 9.0/10

据报道，领先的在线支付基础设施公司 Stripe 已与私募股权公司 Advent International 合作，向 PayPal 提出了约 534 亿美元的收购报价。这项拟议的收购将合并全球数字支付生态系统中最知名的两个平台。 若收购成功，将把 Stripe 以开发者为中心的支付处理业务与 PayPal 庞大的面向消费者的钱包及商户网络相结合，从而极大地重塑全球金融科技格局。这种整合可能会创造一个无与伦比的端到端支付巨头，足以主导在线结账体验和点对点转账市场。 据报道，该交易估值约为 534 亿美元，但目前尚不清楚 PayPal 董事会是否会接受该提议，以及该交易能否通过监管机构的审查。鉴于两家公司在国际商务中的巨大规模，任何合并交易都可能会在多个全球司法管辖区面临严格的反垄断审查。

rss · TechCrunch · 7月15日 15:30

**背景**: Stripe 是一家为互联网构建经济基础设施的科技公司，主要提供企业用于接受在线支付的 API。PayPal 是最早且最成熟的数字支付平台之一，提供了支票和汇票等传统纸质方法的电子替代方案。虽然 Stripe 在现代互联网企业和开发者的后端支付处理需求中占据主导地位，但 PayPal 在消费者数字钱包和在线结账服务方面依然维持着庞大的用户群体。

**标签**: `#fintech`, `#digital-payments`, `#m&a`, `#stripe`, `#paypal`

---

<a id="item-2"></a>
## [我是如何诱骗 Claude 泄露你最深层、最黑暗的秘密](https://simonwillison.net/2026/Jul/15/claude-web-fetch-exfiltration/#atom-everything) ⭐️ 8.0/10

Simon Willison 详细介绍了 Anthropic 的 Claude 中新发现的一个漏洞，该漏洞允许攻击者绕过 web_fetch 工具的安全限制，并窃取用户的私人记忆数据。

rss · Simon Willison · 7月15日 14:21

**标签**: `#AI Security`, `#Prompt Injection`, `#Data Exfiltration`, `#Claude`, `#LLM Vulnerability`

---

<a id="item-3"></a>
## [OpenAI 构建 GPT-Red：用于提升模型安全的 LLM 超级黑客](https://www.technologyreview.com/2026/07/15/1140514/meet-gpt-red-an-llm-super-hacker-openai-built-to-make-its-models-safer/) ⭐️ 8.0/10

OpenAI 开发了一款名为 GPT-Red 的自动化 LLM，作为对抗性陪练伙伴，用于发现并利用其模型中的网络安全漏洞。该公司表示，通过让最新的旗舰模型 GPT-5.6 与 GPT-Red 进行对抗训练，使其成为了迄今为止最稳健的版本。 这一发展标志着向完全自动化 AI 红队测试的重大转变，实现了仅凭人类团队无法达到的持续且可扩展的安全测试。随着 LLM 日益融入关键系统，使用自动化对手来强化防御能力可能会成为 AI 安全和网络安全领域的行业标准实践。 GPT-Red 充当一个自动化红队测试系统，持续探测诸如提示词注入、数据泄露以及其他对抗性攻击等弱点。通过使这一对抗过程自动化，OpenAI 能够在部署前系统地、大规模地对 GPT-5.6 等新模型进行压力测试。

rss · MIT Technology Review · 7月15日 17:09

**背景**: AI 红队测试是一种结构化的测试方法，由人类专家模拟对抗性攻击，以便在恶意行为者利用之前暴露 AI 系统中的漏洞。它与对抗性机器学习密切相关，后者是一个研究蓄意操纵（如规避攻击或数据投毒）如何损害模型完整性的子领域。传统上，红队测试是一个由人类安全研究人员主导的劳动密集型过程，但使用 LLM 使其自动化能够实现更广泛、更频繁的压力测试。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.paloaltonetworks.com/cyberpedia/what-is-ai-red-teaming">What Is AI Red Teaming? Why You Need It and How to Implement - Palo Alto Networks</a></li>
<li><a href="https://en.wikipedia.org/wiki/Adversarial_machine_learning">Adversarial machine learning</a></li>

</ul>
</details>

**标签**: `#AI Safety`, `#Cybersecurity`, `#Adversarial Machine Learning`, `#OpenAI`, `#LLM`

---

<a id="item-4"></a>
## [Thinking Machines 发布首个开源模型 Inkling](https://techcrunch.com/2026/07/15/thinking-machines-amps-up-its-bet-against-one-size-fits-all-ai-with-its-first-open-model-inkling/) ⭐️ 8.0/10

Thinking Machines Lab 发布了 Inkling，这是一个拥有 9750 亿参数的开放权重 AI 模型，能够处理文本、图像、视频和音频。这标志着该公司在经历了大约一年半的隐秘开发后，首次公开发布模型。 此次发布标志着由前 OpenAI 首席技术官 Mira Murati 领导的一支重要新力量正式进入 AI 领域，直接挑战了主流前沿模型的"一刀切"方法。通过提供强大的多模态开放权重模型，Thinking Machines 赋能开发者针对多样化的专业用例进行定制和微调，而非仅仅依赖专有 API。 Inkling 是一个拥有 9750 亿参数的模型，经过训练能够对文本、图像和音频进行推理，设计上注重高效性并支持微调。它以开放权重模型的形式发布，这意味着开发者可以下载并自定义模型权重，但底层的训练数据和源代码并未公开。

rss · TechCrunch · 7月15日 18:04

**背景**: Thinking Machines Lab 是一家由 OpenAI 前首席技术官 Mira Murati 创立的 AI 研究与产品公司。这家初创企业备受业界期待，其初始阶段主要用于在公众视野之外构建 AI 基础设施。该公司的核心理念是打造可扩展、适应性强的 AI 工具，超越"一刀切"的解决方案，迈向更具协作性和可定制性的人机交互模式。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.wired.com/story/thinking-machines-lab-releases-its-first-model-inkling/">Thinking Machines Lab Drops Its First Model | WIRED</a></li>
<li><a href="https://www.bloomberg.com/news/articles/2026-07-15/murati-s-thinking-machines-releases-first-ai-model-for-broad-use">Murati’s Thinking Machines Releases First AI Model for... - Bloomberg</a></li>
<li><a href="https://thinkingmachines.ai/inkling/">An efficient open -weights model that reasons over text, image, and...</a></li>

</ul>
</details>

**标签**: `#AI`, `#Machine Learning`, `#Open Source`, `#Thinking Machines`, `#Product Launch`

---

<a id="item-5"></a>
## [Apple Intelligence 携手阿里巴巴 Qwen 获批在中国上线](https://techcrunch.com/2026/07/15/apple-intelligence-approved-for-launch-in-china-with-alibabas-qwen-ai/) ⭐️ 8.0/10

Apple 已正式获得监管批准，将在中国上线 Apple Intelligence，并与阿里巴巴的 Qwen AI 合作来提供该服务。此前数月，外界一直在猜测 Apple 会选择哪家中国 AI 提供商以符合当地监管要求。 中国是 Apple 最重要的市场之一，无法提供 AI 功能将严重削弱 iPhone 对抗本土竞争对手的竞争力。选择阿里巴巴的 Qwen 而非其他中国 AI 模型，也重塑了竞争格局，使 Qwen 通过 Apple 庞大的用户群体获得了巨大的部署渠道。 Apple Intelligence 结合了设备端处理和云端 AI 处理，需要本地合作伙伴来承担服务器端计算，以符合中国关于数据和 AI 的监管要求。该服务支持 iPhone 15 Pro 及后续机型，以及搭载 M1 或更新芯片的 iPad 和 Mac。

rss · TechCrunch · 7月15日 15:29

**背景**: Apple Intelligence 是 Apple 在 2024 年 WWDC 上发布的 AI 平台，提供写作工具、图像生成、通知摘要和 Siri 增强等功能，支持 iOS 18、iPadOS 18 和 macOS Sequoia 系统。Qwen（通义千问）是阿里云开发的大语言模型系列，于 2023 年 4 月首次推出，基于 Meta AI 的 Llama 架构。中国要求所有 AI 服务必须通过监管审查并与持牌本地提供商合作，这就是 Apple 无法直接使用其现有美国 AI 基础设施的原因。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Apple_Intelligence">Apple Intelligence</a></li>
<li><a href="https://en.wikipedia.org/wiki/Qwen">Qwen - Wikipedia</a></li>

</ul>
</details>

**标签**: `#apple-intelligence`, `#alibaba`, `#qwen`, `#ai-regulation`, `#china-market`

---

<a id="item-6"></a>
## [在 13 年前的 Xeon CPU 上以每秒 5 个 token 的速度运行 Gemma 4 26B](https://www.neomindlabs.com/2026/06/08/running-gemma-4-26b-at-5-tokens-sec-on-a-13-year-old-xeon-with-no-gpu/) ⭐️ 7.0/10

一位开发者成功展示了在没有任何 GPU 的 13 年前 Intel Xeon CPU 上运行 Gemma 4 26B 模型，并实现了每秒 5 个 token 的可用推理速度。这之所以能够实现，是因为 Gemma 4 26B 采用了混合专家架构，每个 token 仅需激活 40 亿个参数，从而大幅降低了与传统稠密模型相比的计算需求。 这一成果证明了最新一代的高效开放权重模型可以在现成的老旧硬件上运行，极大地降低了本地 AI 实验的门槛。它凸显了一个日益增长的行业趋势：模型架构（如 MoE）的进步与软件优化相结合，正在使高质量的本地推理在没有昂贵 GPU 投资的情况下也能实现。 Gemma 4 26B 模型采用了混合专家架构，由于其活跃参数数量较低，它在提供与 270 亿参数稠密模型相当的质量的同时，保持了与更小的 40 亿参数模型相当的延迟。虽然每秒 5 个 token 的速度足以应对交互式任务，但其性能会因上下文大小而异，且其他用户报告称，根据具体的硬件配置，在类似的老旧双 CPU 系统上可以达到每秒 8 到 12 个 token 的速度。

hackernews · neomindryan · 7月15日 15:34 · [社区讨论](https://news.ycombinator.com/item?id=48922434)

**背景**: 混合专家是一种架构设计，对于任何给定的 token，仅激活模型总参数（即"专家"）的一个子集，这与使用所有参数的稠密模型相比，大幅减少了推理所需的计算量。每秒 token 数（TPS）是衡量大语言模型生成速度的标准指标，通常认为 5 到 8 TPS 左右的速度足以满足实时交互式阅读的需求。尽管 GPU 凭借其大规模的并行处理能力在 AI 推理领域占据主导地位，但最近的软件优化和高效的模型设计正越来越多地使 CPU 能够在本地处理更大的模型。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://ollama.com/library/gemma4">gemma 4</a></li>
<li><a href="https://gemma4.com/">Gemma 4 — Google DeepMind</a></li>
<li><a href="https://bentoml.com/llm/llm-inference-basics/cpu-vs-gpu-vs-tpu">Where is LLM inference run? | LLM Inference Handbook</a></li>

</ul>
</details>

**社区讨论**: 社区在讨论中既表达了兴奋之情，也进行了务实的经济分析，一位用户预测到 2027 年，超过 2000 亿参数的模型将能够在基础消费级硬件上运行。关于本地推理与使用 API 提供商的成本效益，出现了一场值得注意的辩论，有人指出在本地运行耗电量大的老旧服务器，其电力成本实际上可能超过云提供商按 token 收取的 API 费用。其他几位用户也分享了自己的基准测试结果，报告称在类似的旧款 Xeon 硬件上达到了每秒 8 到 12 个 token 的速度。

**标签**: `#local-llm`, `#cpu-inference`, `#hardware`, `#optimization`, `#open-source`

---

<a id="item-7"></a>
## [三秒钟的盗窃：为什么 AI 语音诈骗能轻易突破所有防线](https://smarterarticles.co.uk/the-three-second-theft-why-ai-voice-fraud-outruns-every-defence) ⭐️ 7.0/10

本文探讨了 AI 语音诈骗的迅速蔓延，并指出传统的安全防御手段已无法跟上该技术克隆声音和操纵信任的步伐。

hackernews · dxs · 7月15日 13:18 · [社区讨论](https://news.ycombinator.com/item?id=48920432)

**标签**: `#AI Security`, `#Voice Cloning`, `#Social Engineering`, `#Fraud`, `#Confused Deputy`

---