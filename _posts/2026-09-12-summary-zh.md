---
layout: default
title: "Horizon Summary: 2026-09-12 (ZH)"
date: 2026-09-12
lang: zh
---

> 从 30 条内容中筛选出 7 条重要资讯。

---

1. [smolbenchmark：按速度、能耗和发热为边缘设备上的小型 LLM 排名](#item-1) ⭐️ 7.0/10
2. [Q2 草稿模型在 16 GB 显卡上运行 Qwen3.8-27B 优于内置 MTP](#item-2) ⭐️ 7.0/10
3. [《经济学人》：英伟达的投资规模使其成为“AI 央行”](#item-3) ⭐️ 6.0/10
4. [Perplexity 将端到端系统运维交给 GPT-6 Astra](#item-4) ⭐️ 6.0/10
5. [从业者寻求可在 H100 上部署的西方开源权重模型以替代中国模型](#item-5) ⭐️ 6.0/10
6. [使用 JOSM 插件完成 OpenStreetMap 首次编辑的教程](#item-6) ⭐️ 5.0/10
7. [LG 回应智能电视“ spying”指控并予以反驳](#item-7) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [smolbenchmark：按速度、能耗和发热为边缘设备上的小型 LLM 排名](https://www.reddit.com/r/LocalLLaMA/comments/1weekio/releasing_smolbenchmark_helps_you_choose_the_best/) ⭐️ 7.0/10

一个名为 smolbenchmark 的全新开源基准测试发布，针对能装进 8GB 内存的 LLM，按解码速度（tok/s）、能效（tok/J）和发热情况在消费级边缘硬件上进行排名。目前覆盖 13 个模型家族，在 Jetson Orin Nano Super 8GB 上测量了约 1000 种配置，树莓派、手机和 Mac mini 的结果仍在补充中。 大多数排行榜默认使用服务器级 GPU，导致边缘设备用户无从判断哪个小模型能在自己的硬件上跑得好。该基准提供原始数据（tok/s、tok/J、ITL 延迟、功耗、温度、电池），让开发者和爱好者能为手机、Jetson、树莓派和 Mac 选择最合适的模型——在这些设备上，能耗和发热往往与速度同样重要。 覆盖尚不完整：目前只有 Jetson Orin Nano Super 8GB 的数据齐全（约 1000 种配置），树莓派、手机和 Mac mini 的数据仍在补充，网站也仍处于重度开发阶段。其指标不止于吞吐量，还包括 token 间延迟、功耗、温度和电池影响，这在公开基准中相当少见。 访问 https://yuvrajsingh-mist.github.io/smolbenchmark/，查看目标模型家族在 Jetson 上的解码速度和 tok/J 数据；作者正在征集意见，可以就缺失的设备或指标提交反馈。

reddit · r/LocalLLaMA · /u/East-Muffin-6472 · 9月12日 14:49

**背景**: LLM 推理分为两个阶段：预填充（并行读取提示词，受算力限制）和解码（逐个生成 token，受内存带宽限制）——解码速度就是用户看到的文字流式输出的速度。在手机和 Jetson 这类靠电池供电的边缘设备上，每个 token 的能耗（tok/J）和发热量才决定模型是否可用，而不只是快慢。现有排行榜大多在数据中心 GPU 上测试，而 TokenPowerBench 等关注能耗的项目面向更大的模型和服务器硬件，8GB 以下模型类别因此存在空白。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://arxiv.org/html/2512.03024v1">TokenPowerBench: Benchmarking the Power Consumption of LLM Inference</a></li>
<li><a href="https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-orin/nano-super-developer-kit/">Jetson Orin Nano Super Developer Kit | NVIDIA</a></li>
<li><a href="https://ai-tldr.dev/learn/local-open-models/running-models-locally/llm-tokens-per-second/">Tokens per Second: Measuring Local LLM Speed | AI/TLDR</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#benchmarking`, `#edge-computing`, `#open-source`, `#performance`

---

<a id="item-2"></a>
## [Q2 草稿模型在 16 GB 显卡上运行 Qwen3.8-27B 优于内置 MTP](https://www.reddit.com/r/LocalLLaMA/comments/1weersc/this_draft_model_is_op_on_16_gb_cards_for_qwen_38/) ⭐️ 7.0/10

一位 Reddit 用户报告，将 HermiHg 的 Qwen3.8-27B-DFlash2-Q2_K_S 草稿模型与 IQ3_XXS 量化的 Qwen3.8-27B GGUF 搭配，在 16 GB 的 RX 9070 XT 上以 128k 上下文实现了约 60 tok/s 的投机解码速度。该方案优于会成倍增加显存占用的 Qwen 内置 MTP。 它为 16 GB 显卡用户提供了一套具体可复现的方案（模型、量化级别、KV 缓存设置），可在本地快速运行 27B 模型。同时也表明在显存受限时，轻量外挂草稿模型可以胜过内置 MTP。 KV 缓存量化为 k 8_0 / v 4_0 以容纳 128k 上下文。注意事项：投机解码会让性能对显存溢出更敏感——一旦用量超过显存，在作者的 DDR5 PCIe 5 系统上关闭投机解码反而更快。 下载 DFlash2-Q2_K_S 草稿 GGUF 和 ISTA-DASLab 的 IQ3_XXS 主模型，在 llama.cpp 或 LM Studio 中开启投机解码，并将 KV 缓存量化设为 k 8_0 / v 4_0；当显存接近上限时，对比开关投机解码的 tok/s 差异。

reddit · r/LocalLLaMA · /u/pneuny · 9月12日 14:57

**背景**: 投机解码使用一个小而快的草稿模型提前预测多个 token，再由大模型在一次并行前向中验证，输出完全一致但速度更快。MTP（多 token 预测）是训练进模型内部的变体，通常可带来 1.4–2.2 倍加速，但会增加显存需求。IQ3_XXS 是基于重要性矩阵的低比特 GGUF 量化，能在极小体积下保持质量；Q2_K_S 是更小的量化级别，这里只用于草稿模型，因为草稿猜测只需大致正确即可。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/ggml-org/llama.cpp/blob/master/docs/speculative.md">llama . cpp /docs/ speculative .md at master · ggml-org/ llama . cpp</a></li>
<li><a href="https://lmstudio.ai/blog/lmstudio-v0.3.10">LM Studio 0.3.10: Speculative Decoding | LM Studio Blog</a></li>
<li><a href="https://unsloth.ai/docs/models/mtp">How to Run MTP Models: Multi-Token Prediction Guide | Unsloth Documentation</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#speculative-decoding`, `#qwen`, `#gguf-quantization`, `#gpu-inference`

---

<a id="item-3"></a>
## [《经济学人》：英伟达的投资规模使其成为“AI 央行”](https://www.economist.com/interactive/briefing/2026/09/03/nvidia-is-the-central-bank-of-ai) ⭐️ 6.0/10

《经济学人》发布一篇简报，指出英伟达超过 5000 亿美元的 AI 投资与承诺规模堪比央行的货币干预，使其成为系统级重要的“AI 央行”。文章将英伟达的金融工程与美联储等机构的货币创造角色进行了类比。 该分析揭示了英伟达对客户和合作伙伴的融资承诺实际上在向 AI 经济注入资本，这意味着英伟达的健康状况已成为所有 AI 基础设施从业者的宏观级风险。理解这一动态有助于工程师、投资者和规划者评估 AI 供应链中的集中度风险。 亚马逊、谷歌、Meta 和微软等超大规模云厂商约占英伟达收入的一半，而英伟达的金融工程部分是对这些客户通过自研芯片变成竞争对手的回应。评论者指出，没有证据表明英伟达以股票为抵押借款或将股权价值与这些承诺挂钩，这限制了直接的传染风险。 通过存档链接（https://archive.ph/kt50V）阅读完整简报，并梳理你自身对英伟达的依赖——硬件、CUDA 软件栈或由英伟达融资的客户——为你的项目或投资组合做一个简单的集中度风险评估。

hackernews · tolugenius · 9月12日 15:08 · [社区讨论](https://news.ycombinator.com/item?id=49673098)

**背景**: 美联储等央行通过资产购买和借贷计划扩张或收缩资产负债表（美联储目前约 6.7 万亿美元）来影响经济。英伟达采取了类似的策略——向 OpenAI 和 Anthropic 等 AI 客户进行股权投资并提供融资，使其能够购买英伟达 GPU，从而将收入回收为需求。这种循环融资类似于过去的厂商融资案例，随着超大规模云厂商同时是英伟达最大客户和新兴竞争对手，其系统性重要性不断上升。

**社区讨论**: JumpCrisscross 指出英伟达超过 5000 亿美元的承诺超过同期美联储的宽松规模，但认为英伟达似乎没有以股票抵押借款，令人安心。评论者讨论英伟达越来越像公共机构的现象；thrownawaysz 猜测英伟达最终将退出游戏市场（已从财报中移除独立的游戏收入报告）；MangoCoffee 则认为超大规模云厂商正试图通过自研芯片摆脱“黄仁勋税”，尤其是在推理环节。

**标签**: `#nvidia`, `#ai-economics`, `#market-analysis`, `#hardware`, `#macroeconomics`

---

<a id="item-4"></a>
## [Perplexity 将端到端系统运维交给 GPT-6 Astra](https://openai.com/index/perplexity-improving-accuracy-with-astra) ⭐️ 6.0/10

在 OpenAI 发布的厂商案例中，Perplexity 报告使用 GPT-6 Astra 自主撰写沟通内容、修改软件并监控生产系统。值得注意的是，该公司表示与早期模型相比，现在对智能体的检查频率大幅降低。 将沟通、代码修改和生产监控整体交给智能体处理，标志着智能体自主性超越了常见的编程助手场景。探索智能体工作流的团队可以将其视为模型可靠性发展趋势的信号，但宣传性质限制了可直接借鉴的内容。 该公告只是一份简短案例，没有公布基准测试、实现细节、错误率或安全防护机制等信息。减少人工检查的说法来自客户自述，实际自主程度和失败模式仍未得到独立验证。 阅读 OpenAI 原始案例了解细节；如果你在生产环境中运行智能体，应在提升自主性的同时配套可观测性工具（追踪、告警、行为监控），而不是单纯延长人工检查间隔。

rss · OpenAI Blog · 9月14日 00:00

**背景**: Perplexity 是一家 AI 答案引擎公司（成立于 2022 年，截至 2025 年 9 月估值约 200 亿美元），结合大语言模型与网络搜索。GPT-6 Astra 是 OpenAI 最近发布的旗舰模型，被普遍认为是能力的重大跃升。让自主智能体操作生产系统会带来可观测性与控制方面的挑战，因此追踪、行为监控和漂移检测（如通过 Langfuse 或 OpenTelemetry）已成为该领域的标准实践。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Perplexity_(company)">Perplexity (company)</a></li>
<li><a href="https://magazine.sebastianraschka.com/p/gpt-6-astra-looped-transformers-and">GPT - 6 Astra , Looped Transformers, and Hidden Reasoning</a></li>

</ul>
</details>

**标签**: `#AI agents`, `#autonomous systems`, `#OpenAI`, `#Perplexity`, `#case study`

---

<a id="item-5"></a>
## [从业者寻求可在 H100 上部署的西方开源权重模型以替代中国模型](https://www.reddit.com/r/LocalLLaMA/comments/1wegs2w/for_those_of_you_forced_to_only_use_open_models/) ⭐️ 6.0/10

一位 Reddit 从业者透露，其组织禁止在 4 张 H100 集群上部署中国开源权重模型（GLM、Qwen、DeepSeek），被迫在 120B 以上、具备视觉能力的类别中寻找西方替代品。帖子提到 Thinking Machines Inkling Small 和 Cohere Command A+是主要候选，而 Poolside Laguna S 2.1 和 NVIDIA Nemotron 3 Super 则缺少视觉能力。 这反映了许多企业因合规或地缘政治政策限制模型来源的真实约束，发帖人指出在 120B 以上规模，西方与中国开源模型之间存在巨大性能差距。这一讨论能帮助面临类似限制的团队找到目前最强的西方可选方案。 据报道，Inkling Small 在 AA 基准上仍落后 GLM 5.3 Flash 约 16 分，而 Command A+虽满足大部分要求但上下文窗口仅 128k。在 4 张 H100（每张 80GB）上运行 120B 级模型通常需要张量并行和精细的显存调优，例如通过 vLLM 调整 gpu_memory_utilization 和 max_model_len 参数。 在 4 张 H100 上使用 vLLM 进行张量并行，在你自己的评测集上对候选模型（Inkling Small、Command A+、Nemotron 3 Super、Laguna S 2.1）进行基准测试，然后再投入生产。

reddit · r/LocalLLaMA · /u/Porespellar · 9月12日 16:17

**背景**: 开放权重模型公开发布训练好的参数，任何人都可以下载并在自己的硬件上运行，这与仅提供 API 的模型不同。中国实验室（智谱/Z.ai、阿里的 Qwen、DeepSeek）目前主导许多开源榜单，例如 GLM 5.3 Flash 是原生多模态模型，覆盖文本和视觉工作流。一些西方组织出于数据安全和供应链考虑禁止使用中国模型，即使是本地推理也不例外，这大幅缩小了可选模型范围。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/zai-org/GLM-5.3-Flash">zai-org/ GLM - 5 . 3 - Flash · Hugging Face</a></li>
<li><a href="https://simplismart.ai/blog/deploy-gpt-oss-120b-h100-vllm">How to Deploy OpenAI's Open-Source GPT-OSS 120B Model on H100 GPUs: Complete vLLM Deployment Guide</a></li>
<li><a href="https://mahaai.co.in/glossary/open-weight-model/">Open - Weight Model — Meaning & Definition | Maha AI Glossary</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#open-source-models`, `#production-deployment`, `#H100`, `#model-selection`

---

<a id="item-6"></a>
## [使用 JOSM 插件完成 OpenStreetMap 首次编辑的教程](https://high5apps.github.io/josm-plugin-website-wizard/) ⭐️ 5.0/10

一篇新教程指导新手使用 JOSM 网站插件向导完成首次 OpenStreetMap 编辑。然而，有经验的贡献者认为 JOSM 并不适合第一次编辑的用户。 它降低了为 OpenStreetMap（众多应用和服务依赖的众包地图）做贡献的门槛。选择合适的入门工具可以让一次性的编辑变成长期的绘图习惯。 JOSM 是一款功能强大的 Java 桌面编辑器，学习曲线陡峭，更适合高级批量编辑；在 OSM 网站内置的 iD 编辑器上做一个简单修改只需一分钟，而通过此流程需要 15 分钟。StreetComplete（基于问答任务）和 Every Door（兴趣点、入口、微测绘）等移动应用提供了更简单的手机端选择。 第一次编辑时，直接打开 openstreetmap.org 使用内置的 iD 编辑器，而不是 JOSM；如果你喜欢上了绘图，可以在安卓上尝试 StreetComplete，回答附近的测绘问题。

hackernews · juliantigler · 9月12日 16:25 · [社区讨论](https://news.ycombinator.com/item?id=49674050)

**背景**: OpenStreetMap（OSM）是一个由志愿者编辑的免费众包世界地图，其贡献会传播到许多依赖 OSM 数据的应用。编辑工具包括 iD（OSM 网站内置的浏览器编辑器）、JOSM（功能最强的桌面编辑器），以及用于实地测绘的 StreetComplete 和 Every Door 等手机应用。用于描图的卫星影像可能滞后数年，因此绘图者有时会步行记录 GPX 轨迹来采集新路径。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://josm.openstreetmap.de/">JOSM</a></li>
<li><a href="https://streetcomplete.app/">streetcomplete . app</a></li>
<li><a href="https://every-door.app/">Every Door</a></li>

</ul>
</details>

**社区讨论**: 评论者几乎一致认为 JOSM 不适合初学者，推荐网站上的 iD 编辑器以及移动端的 StreetComplete 和 Every Door。一位新手分享说，Google 和 Apple 都忽略了他的步道修改建议，而 OSM 接受了，这展示了 OSM 的贡献如何真正传播到下游应用。

**标签**: `#openstreetmap`, `#crowdsourced-data`, `#josm`, `#mapping`, `#tutorial`

---

<a id="item-7"></a>
## [LG 回应智能电视“ spying”指控并予以反驳](https://www.theverge.com/tech/994333/lg-responds-to-tv-spying-allegations) ⭐️ 5.0/10

LG 发布声明，反驳 Gamers Nexus、Level1Techs 及独立安全研究人员关于其智能电视记录并上传用户数据的指控。该公司表示，近期媒体报道“可能造成了关于 LG 智能电视工作方式的误解”。 这场争议涉及全球约 2.16 亿台 LG 智能电视的用户，也凸显了智能电视中基于 ACR 的广告数据收集与用户隐私期望之间的冲突。了解双方说法有助于消费者判断应修改哪些设置以及应信任哪些说法。 研究人员声称这些电视会扫描本地网络以映射手机和附近设备、在待机模式下存储麦克风音频，并将数据提供给 LG 广告解决方案（LG Ad Solutions）用于定向广告。LG 的声明属于公关回应，未提供技术性反证，因此原始调查仍是更详细的信源。 立即检查你的 LG 电视隐私设置：关闭 ACR/观看数据收集、限制麦克风使用，并在路由器上屏蔽或监控电视的对外网络流量。

rss · The Verge · 9月12日 15:19

**背景**: 智能电视普遍采用自动内容识别（ACR）技术，通过对观看内容进行指纹识别并发送给广告商来实现定向投放。Gamers Nexus 等调查称 LG 更进一步，会扫描本地网络以盘点设备，甚至在待机时采集音频。LG 通过其广告业务将这些数据变现，因此遥测数据是其核心商业驱动力而非偶然缺陷。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.notebookcheck.net/LG-smart-TVs-caught-logging-audio-with-screen-off-and-snooping-on-local-devices.1391214.0.html">LG smart TVs caught logging audio with... - Notebookcheck News</a></li>
<li><a href="https://tech.yahoo.com/cybersecurity/articles/smart-tv-spies-even-off-162140799.html">‘ Smart TV That Spies on You Even When It’s Off’ Is My #1 Christmas...</a></li>

</ul>
</details>

**标签**: `#privacy`, `#smart-tv`, `#security`, `#telemetry`, `#corporate-response`

---