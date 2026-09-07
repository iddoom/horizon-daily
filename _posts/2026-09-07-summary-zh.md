---
layout: default
title: "Horizon Summary: 2026-09-07 (ZH)"
date: 2026-09-07
lang: zh
---

> 从 20 条内容中筛选出 5 条重要资讯。

---

1. [爱好者基准测试：七个视觉大模型估算餐食卡路里](#item-1) ⭐️ 7.0/10
2. [腾讯开源 EVIE 视觉文档检索模型](#item-2) ⭐️ 7.0/10
3. [LG 智能电视被发现在息屏时录音并扫描本地网络设备](#item-3) ⭐️ 6.0/10
4. [MobileWorld：用用户交互与 MCP 任务评测手机自主 GUI 智能体](#item-4) ⭐️ 6.0/10
5. [瑞士联邦政府在 3000 台电脑上试点替换微软办公套件](#item-5) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [爱好者基准测试：七个视觉大模型估算餐食卡路里](https://www.reddit.com/r/LocalLLaMA/comments/1w9jmo8/benchmarking_calories_evaluation_with_llms/) ⭐️ 7.0/10

一位 Reddit 用户使用谷歌 Nutrition5k 数据集中随机挑选的 25 份餐食，测试了七个具备视觉能力的大模型的卡路里估算表现，评判标准是估算误差在 20% 以内的比例。Muse Spark 1.3 表现最佳（48% 达标，中位误差 45 千卡），而 Qwen 3.8 27b 最差（16%，中位误差 148 千卡）。 结果显示没有任何模型能可靠地从照片估算卡路里，且排名与模型大小无关——Muse Glimmer 30b 远超更大的 Qwen 3.8 27b。这有力地提醒我们：消费级硬件上的"最佳模型"取决于具体任务，任何想开发拍照计数卡路里应用的人都必须针对自己的任务验证模型。 方法是将 Nutrition5k 照片与一个可查询 USDA FoodData Central 和 MEXT 营养数据库的工具结合，超出本地硬件能力的模型通过 OpenCode Go/OpenRouter 运行。注意事项：仅测试了 25 份餐食，各模型平均偏差差异很大（从 -24 到 +64 千卡），即便最好的模型也有超过一半的餐食误差超过 20%。 如果你要开发基于照片的卡路里计数应用，先在自己的餐食照片上复现这个小规模测试再做模型选型，并考虑让模型只负责识别食物、再通过 USDA FoodData Central 查询卡路里，而不是直接信任模型给出的卡路里数字。

reddit · r/LocalLLaMA · /u/mr_tolkien · 9月7日 05:56

**背景**: Nutrition5k 是谷歌研究的真实食堂菜品数据集，包含 RGB-D 图像和逐食材的详细营养标注，由于仅在加州少数食堂采集，存在菜系偏差。USDA FoodData Central 是美国农业部整合的食物成分数据库，可为营养估算提供权威数据依据。视觉大模型接受图像加文本输入，但仅凭单张照片估算分量本身就很困难，这解释了观察到的较大误差。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/google-research-datasets/Nutrition5k">GitHub - google-research-datasets/Nutrition5k: Detailed ...</a></li>
<li><a href="https://fdc.nal.usda.gov/">USDA FoodData Central</a></li>

</ul>
</details>

**标签**: `#LLM benchmark`, `#vision models`, `#practical evaluation`, `#local LLM`, `#experiment`

---

<a id="item-2"></a>
## [腾讯开源 EVIE 视觉文档检索模型](https://www.reddit.com/r/LocalLLaMA/comments/1w9nphc/tencentevie8b_and_evie45b_highcapacity_visual/) ⭐️ 7.0/10

腾讯开源了 EVIE-8B 和 EVIE-4.5B 视觉文档检索模型，8B 版本在 ViDoRe V3 上取得 66.75 nDCG@10 的 SOTA 成绩，4.5B 版本为 66.02。模型采用 4096 维逐 token 多向量嵌入，并使用类似套娃（Matryoshka）的 Prefix-MRL 投影，可在运行时从 2048 维自由截断到 64 维。 任何在 PDF、扫描件或富视觉文档上构建检索或 RAG 管线的开发者，都可以本地运行顶级检索模型而无需支付 API 费用。4.5B 模型的弹性维度截断和免训练的 HAC 压缩（每页压缩到 32 个向量，每百万页索引约 3.81 GiB）使其在普通硬件上也可实际部署。 EVIE-4.5B 通过 EVIE-ARD（锚点保持、容量感知的关系蒸馏）方法从 8B 教师模型蒸馏而来，性能接近教师模型。两个模型在覆盖 ViDoRe V1/V2/V3 和 JinaVDR 的 138 个任务上、以四类指标（nDCG、Recall、MAP、MRR）进行了评估。 从 Hugging Face 下载 tencent/EVIE-8B 和 tencent/EVIE-4.5B，并使用 vidore-benchmark 评估代码在你自己的文档样本上测试，再决定是否将其接入 RAG 管线。

reddit · r/LocalLLaMA · /u/jacek2023 · 9月7日 09:47

**背景**: 视觉文档检索（以 ColPali 生态的 ViDoRe 基准为代表）直接将文本查询与文档页面图像匹配，用视觉编码器生成多向量嵌入（每个 patch/token 一个向量）并通过后期交互比较，从而绕过有损的 OCR。套娃表示学习（Matryoshka Representation Learning, MRL）训练出的嵌入在截断到更小维度（如 2048 到 64 维）后仍有良好表现，使单一模型可在运行时权衡精度与存储、延迟。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/illuin-tech/vidore-benchmark">GitHub - illuin-tech/vidore-benchmark: Vision Document Retrieval (ViDoRe): Benchmark. Evaluation code for the ColPali paper. · GitHub</a></li>
<li><a href="https://huggingface.co/blog/matryoshka">Introduction to Matryoshka Embedding Models - Hugging Face</a></li>
<li><a href="https://arxiv.org/abs/2205.13147">[2205.13147] Matryoshka Representation Learning - arXiv.org Introduction to Matryoshka Embedding Models - Hugging Face Matryoshka Representation Learning - arXiv.org Matryoshka Representation Learning, Explained — Supermemory Matryoshka Embeddings — Sentence Transformers documentation Matryoshka Representation Learning - NeurIPS Matryoshka Representation Learning (MRL) Explained | AI/TLDR</a></li>

</ul>
</details>

**标签**: `#embedding-models`, `#visual-document-retrieval`, `#open-source`, `#RAG`, `#local-LLM`

---

<a id="item-3"></a>
## [LG 智能电视被发现在息屏时录音并扫描本地网络设备](https://www.notebookcheck.net/LG-smart-TVs-caught-logging-audio-with-screen-off-and-snooping-on-local-devices.1391214.0.html) ⭐️ 6.0/10

据报道，LG 智能电视在屏幕关闭时仍记录音频，并扫描本地网络中的其他设备。这一在 Hacker News 上广泛传播的报道表明，即使电视看似已关机，其监听行为仍在继续。 对于在家、办公室或会议室使用智能电视的人来说，这是一份具体且可操作的隐私报告——能录音并扫描网络的设备一旦捕获敏感对话或设备清单，会带来真实的商业法律责任。缓解措施简单且可复用：关闭联网功能，或将 IoT 设备隔离到独立的网络分区。 这种行为与自动内容识别（ACR）技术一致——这是大多数现代智能电视内置的广告追踪技术，通过监测观看内容（有时还包括音频）来建立用户画像。ACR 通常只能通过深藏在菜单中的退出设置关闭，而且电视仍可能通过 UPnP 和 mDNS 等协议进行本地网络发现。 检查智能电视设置中的 ACR/观看数据退出选项并禁用，或者干脆关闭电视的联网功能，把它当作纯 HDMI 显示器使用；在企业环境中，应将智能电视放在与敏感设备隔离的 VLAN 中。

hackernews · chris_overseas · 9月7日 07:03 · [社区讨论](https://news.ycombinator.com/item?id=49594878)

**背景**: 自动内容识别（ACR）会对电视显示或听到的内容生成特征签名，将观看历史汇入数据库以构建广告画像；三星、LG 和 Vizio 都使用过自研或第三方的 ACR 技术。纽约大学的研究表明，本地网络中的 IoT 设备可能通过 UPnP 和 mDNS 等标准协议无意间暴露敏感数据，而用户通常认为本地网络是可信环境。禁用 ACR 能显著改善隐私，网络隔离则是应对不可信智能设备的常见防御手段。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Automatic_content_recognition">Automatic content recognition - Wikipedia</a></li>
<li><a href="https://www.zdnet.com/home-and-office/home-entertainment/how-to-disable-acr-tv/">How to disable ACR on your TV (and why it makes such a big difference when you do) - ZDNET</a></li>
<li><a href="https://engineering.nyu.edu/news/new-research-reveals-alarming-privacy-and-security-threats-smart-homes">New research reveals alarming privacy and security threats in Smart...</a></li>

</ul>
</details>

**社区讨论**: 评论者基本认同该报道并分享了缓解措施：一位用户描述自己在 LG 电视上禁用所有联网功能长达五年，尽管遭到朋友嘲笑；还有人指出许多现代电视自带允许屏幕捕获的开发者模式。多位评论者提出了商业责任方面的担忧，认为将语音转为文本的电视一旦捕获信用卡等敏感信息就会成为巨大风险；也有人指出，即使出于善意收集的数据，最终也会招致不良用途。

**标签**: `#privacy`, `#IoT security`, `#smart devices`, `#surveillance`, `#network security`

---

<a id="item-4"></a>
## [MobileWorld：用用户交互与 MCP 任务评测手机自主 GUI 智能体](https://www.reddit.com/r/LocalLLaMA/comments/1w9kfs3/lit_review_on_benchmarking_llms_running_in_your/) ⭐️ 6.0/10

一篇 Reddit 文献综述介绍了 MobileWorld 基准：包含约 20 个安卓应用（通讯、消息、生产力等）中的 201 个任务，并引入两个全新评测维度——需要向 GPT-4 模拟用户追问缺失信息的用户交互任务，以及允许智能体直接调用 GitHub、arXiv 等 MCP 工具的任务。最佳组合（Gemini-3-Pro 规划器 + UI-Inst-7B 定位模型）平均成功率仅约 52%，端到端纯 GUI 模型表现更差。 现有手机智能体基准大多只测试静态 GUI 操作；MobileWorld 新增的交互追问与工具增强任务维度更贴近真实部署场景，为端侧 LLM 智能体的开发者和评测者提供了更严格的标尺。约 52%的成功率上限表明这些新能力仍是未解决的难题。 架构采用规划器-执行器设计：VLM 规划器只接收截图（不使用无障碍树），输出“点击发送按钮”这类自然语言动作，再由单独的定位模型转换为精确的(x,y)坐标。应用多为日常应用的开源替代品（系统应用不足约 5%），生态代表性受限；模型失败主要集中在两个新任务维度上。 如果你在开发或评测手机智能体，建议阅读 MobileWorld 论文（以及 Reddit 综述中附带的统计图），并考虑在自己 的评测集中加入用户交互和 MCP 工具类任务，以压力测试追问澄清与工具使用能力。

reddit · r/LocalLLaMA · /u/East-Muffin-6472 · 9月7日 06:39

**背景**: 手机 GUI 智能体利用 LLM/VLM 通过点击、输入、滑动等操作手机；此前多数基准（如 AndroidWorld）只评测自主多步应用操作。MCP（模型上下文协议）是 Anthropic 于 2024 年 11 月推出的开放标准，用于规范 AI 应用与外部工具和数据源的连接方式，让智能体一次调用即可获取信息或执行操作，而无需缓慢的 GUI 操作。定位模型负责将自然语言动作描述映射到屏幕精确坐标，与仅凭截图推理的 VLM 规划器形成互补。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Model_Context_Protocol">Model Context Protocol - Wikipedia</a></li>
<li><a href="https://www.anthropic.com/news/model-context-protocol">Introducing the Model Context Protocol \ Anthropic</a></li>

</ul>
</details>

**标签**: `#LLM agents`, `#mobile GUI agents`, `#benchmarks`, `#MCP`, `#LocalLLaMA`

---

<a id="item-5"></a>
## [瑞士联邦政府在 3000 台电脑上试点替换微软办公套件](https://itsfoss.com/news/switzerland-replace-microssoft-pilot/) ⭐️ 5.0/10

瑞士联邦政府启动试点项目，在约 3000 台工作站（约占联邦机器的 5-7%）上用开源替代方案替换 Microsoft 365，目标在 2027 年底前完成迁移。 这是政府 IT 减少厂商锁定、实现数字主权的真实案例，在变更管理、许可证费用节省和迁移可行性方面提供了借鉴。计划类似迁移的组织可以学习政府如何以分阶段的部分迁移而非整体更换操作系统来推进。 该试点重点替换的是 Microsoft 365（办公套件和邮件），而非 Windows 操作系统本身，这限制了范围和风险。评论者指出的一个关键技术难题是用 Linux 兼容方案替代微软的设备管理体系（Entra/Intune），这仍然复杂且不成熟。 如果考虑类似迁移，可先在少量用户中开展小规模试点，梳理哪些桌面应用是真正必需的、哪些可由网页版替代，并在下定决心前评估 Linux 兼容的设备管理工具（即 Entra/Intune 的替代品）。

hackernews · ivell · 9月7日 05:33 · [社区讨论](https://news.ycombinator.com/item?id=49594251)

**背景**: 厂商锁定使客户依赖单一供应商的产品，切换需在重新培训、数据迁移和工具建设上付出高昂成本。欧洲各国政府对依赖美国云服务商日益担忧，部分原因在于美国 CLOUD 法案允许美国执法机构访问美国公司持有的数据，无论数据存储在哪里。LibreOffice 和 Linux 发行版等开源替代方案可节省许可费用并提升主权可控性，但在设备管理和企业集成方面历来较弱。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://itsfoss.com/news/switzerland-replace-microssoft-pilot/">Switzerland 's Federal Government is Replacing Microsoft on 3,000...</a></li>
<li><a href="https://en.wikipedia.org/wiki/Vendor_lock-in">Vendor lock-in - Wikipedia</a></li>

</ul>
</details>

**社区讨论**: 评论者普遍支持这一试点，认为这是摆脱美国供应商依赖的迟来一步，但也警告变更管理会非常艰难，Linux 设备管理的重建是主要障碍。有人指出网页应用（Figma、Google Docs、Outlook 网页版）降低了对桌面操作系统的依赖，使迁移更容易；也有人希望试点更进一步，用 Linux Mint 替换 Windows 本身，并将节省的费用投入开源开发。

**标签**: `#linux-migration`, `#open-source`, `#government-it`, `#microsoft-365`, `#vendor-independence`

---