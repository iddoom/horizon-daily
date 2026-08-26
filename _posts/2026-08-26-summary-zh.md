---
layout: default
title: "Horizon Summary: 2026-08-26 (ZH)"
date: 2026-08-26
lang: zh
---

> 从 33 条内容中筛选出 6 条重要资讯。

---

1. [vLLM v0.28.0 发布：Kimi-K3 性能优化与 DeepSeek V4 稀疏 MLA 支持](#item-1) ⭐️ 6.0/10
2. [HN 实践者：RAG 中全文检索常常胜过向量嵌入](#item-2) ⭐️ 6.0/10
3. [Z.ai 确认 Ox Alpha 为 GLM 系列新模型并将开放权重](#item-3) ⭐️ 6.0/10
4. [Reddit 超级帖追踪 Qwen3.8-Flash-Next 发布日](#item-4) ⭐️ 6.0/10
5. [EPA 拟取消小型污染源空气许可的公示要求](#item-5) ⭐️ 5.0/10
6. [Simon Willison 引用 Paul Dix 谈 AI 构建百万行经验证的软件](#item-6) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [vLLM v0.28.0 发布：Kimi-K3 性能优化与 DeepSeek V4 稀疏 MLA 支持](https://github.com/vllm-project/vllm/releases/tag/v0.28.0) ⭐️ 6.0/10

vLLM v0.28.0 包含来自 270 位贡献者的 584 个提交，重点是对 Kimi-K3 的全栈性能优化（融合 FlashKDA 内核、Decode Context Parallel、通过共享专家分片每卡节省约 17 GiB 显存、DSpark TTFT 提升约 60%），以及 DeepSeek V4 稀疏 MLA 在普通解码、MTP 和投机解码上的端到端支持。此外还包括 Model Runner V2 的成熟化、分层 KV 缓存磁盘卸载、Rust gRPC 前端，以及将 max_num_batched_tokens 默认值从 8192 提升到 16384 等新默认设置。 本次发布为优化大型 MoE 模型推理的团队提供了具体参考，展示了哪些技术（内核融合、并行策略重构、专家分片、自适应投机预算）能真正带来可量化的显存和延迟收益。在 vLLM 上运行 Kimi-K3 或 DeepSeek V4 的用户只需升级即可获得显著的吞吐和显存改进。 破坏性变更包括：bitsandbytes 迁移为树外插件、Transformers 升级到 5.15.0、移除 calculate_kv_scales 和 override_attention_dtype，升级前应检查现有部署配置。Kimi-K3 还通过 V2 model runner 获得了 ROCm 支持，DeepSeek V4 稀疏 MLA 也在 ROCm gfx11 和 gfx950 上启用。 通过 `pip install vllm`（CUDA 13.0）升级或拉取 `vllm/vllm-openai:v0.28.0` 镜像，然后对照破坏性变更清单检查配置，并针对新的 max_num_batched_tokens=16384 默认值重新基准测试，确认吞吐和显存收益。

github · khluu · 8月26日 09:46

**背景**: vLLM 是广泛使用的开源大模型推理引擎，以 PagedAttention 和高吞吐服务著称。Kimi-K3 采用 Kimi Delta Attention（KDA）这一混合线性注意力设计，由 MoonshotAI 的 FlashKDA 内核提供服务；DeepSeek 的 MLA（多头潜在注意力）将 KV 缓存压缩为潜在向量，以降低解码阶段的显存带宽需求。投机解码则用轻量的草稿模型提出候选 token 再由主模型验证，在不改变输出的前提下加速生成。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://vllm.ai/blog/2026-07-22-kimi-k3-preview">A Preview of Production-Scale Kimi K3 Support on vLLM | vLLM Blog</a></li>
<li><a href="https://vllm.ai/blog/2026-07-27-k3">Kimi K3 Is Here: Efficient Day-0 Support on vLLM | vLLM Blog</a></li>
<li><a href="https://arxiv.org/abs/2502.14837">Towards Economical Inference: Enabling DeepSeek's Multi-Head ... Hardware-Centric Analysis of DeepSeek’s Multi-Head Latent ... DeepSeek's Multi-Head Latent Attention - Lior Sinai DeepSeek Multi-Head Latent Attention - GitHub DeepSeek-V3 Explained 1: Multi-head Latent Attention</a></li>

</ul>
</details>

**标签**: `#vllm`, `#llm-inference`, `#performance-optimization`, `#open-source`, `#release`

---

<a id="item-2"></a>
## [HN 实践者：RAG 中全文检索常常胜过向量嵌入](https://www.lighthousenewsletter.com/p/rag-is-simpler-than-you-think) ⭐️ 6.0/10

一篇主张 RAG（检索增强生成）在概念上比人们普遍认为的更简单的博文，在 Hacker News 上引发了实质性讨论。有经验的实践者强调，经典全文检索（FTS）往往优于基于向量嵌入的检索，后者增加了成本和复杂度却不保证质量提升。 构建 LLM 应用的团队常常默认使用向量数据库和嵌入，但这场讨论表明，从更简单、可移植、可扩展的全文检索入手就能解决 80% 的问题。这可以节省大量工程精力、基础设施成本和调优时间。 实践者指出，嵌入带来的语义相似性往往比预期弱，而且系统不可避免地需要对不同文本块重新嵌入以适应新内容。RAG 的核心是用尽可能少的查询把正确的信息放进 LLM 上下文——向量检索是可选项而非必需品。 在引入向量数据库之前，先在自己的查询和文档上对 BM25/全文检索（如 Elasticsearch、Postgres FTS、Meilisearch）做基线评测，只有当嵌入可衡量地提升检索质量时才引入它。

hackernews · j0selit0 · 8月26日 08:39 · [社区讨论](https://news.ycombinator.com/item?id=49445727)

**背景**: RAG 将信息检索与 LLM 生成结合：先获取相关文档并放入模型上下文，再让模型作答。全文检索通过 BM25、倒排索引等技术进行关键词匹配，而向量检索将文本编码为高维嵌入并按语义相似度检索。向量检索更能处理模糊或改述的查询，但需要嵌入模型、向量索引（如 pgvector、Pinecone），并且随着内容变化需要持续重新嵌入。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://medium.com/@s_nikolaev/full-text-search-vs-vector-search-c6cff365be8e">Full - text Search vs Vector Search | by Sergey Nikolaev | Medium</a></li>
<li><a href="https://internet10k.com/en/blog/vector-search-vs-full-text-when/">Vector search vs full - text — when to use which | INTERNET 10000</a></li>

</ul>
</details>

**社区讨论**: 有大规模 RAG 经验的实践者一致认为全文检索被严重低估、嵌入被高估，符合 80/20 法则。另一些人将 RAG 视为由 LLM 发起查询的经典信息检索，警告不要把向量搜索当作魔法粉尘——它增加成本却不保证收益。也有评论者对文章本身持批评态度，有人怀疑它是 LLM 生成的且难以阅读。

**标签**: `#RAG`, `#information-retrieval`, `#embeddings`, `#full-text-search`, `#LLM`

---

<a id="item-3"></a>
## [Z.ai 确认 Ox Alpha 为 GLM 系列新模型并将开放权重](https://www.bloomberg.com/news/articles/2026-08-26/china-s-z-ai-made-ox-alpha-stealth-model-that-rivals-deepseek) ⭐️ 6.0/10

Z.ai（智谱）于 8 月 26 日确认，此前通过 OpenCode 免费提供、来源不明的神秘模型 Ox Alpha 是其 GLM 系列的新版本，并表示将发布该模型的权重。 据称可与 DeepSeek 抗衡的模型开放权重，为开发者提供了可免费自托管的编程大模型选择，也使 Z.ai 在开源模型生态中保持竞争力。构建编程智能体的开发者应关注此次发布并在自己的任务上实测。 早期用户反馈不一：有测试者认为其水平介于 Claude Sonnet 与 Opus 之间，但会陷入“死循环”（例如重复执行同一条 bash 命令约一千次）；LiveBench 显示其低于 GPT-5.4 Nano，而官方自报分数则称大幅超过 Fable。基准测试证据相互矛盾，尚不可复现。 权重发布后，下载模型并在自己的编程任务上实测，重点观察是否出现循环重复失败，并与当前使用的模型在类似 LiveBench 的基准上对比。

hackernews · garo-pro · 8月26日 10:04 · [社区讨论](https://news.ycombinator.com/item?id=49446422)

**背景**: Z.ai（智谱）是一家中国 AI 公司，其 GLM 系列大模型自 2025 年 7 月起以 MIT 许可证开源，近期版本包括 GLM 5.2 和 5.3。Ox Alpha 最初以免费“神秘模型”的形式出现在 OpenRouter 和 OpenCode Zen 上，未披露创建者，迅速登顶使用榜，随后身份才被确认。开放权重意味着任何人都可以下载并自托管该模型，而不必依赖 API。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.bloomberg.com/news/articles/2026-08-26/china-s-z-ai-made-ox-alpha-stealth-model-that-rivals-deepseek">China’s Z . AI Made Ox Alpha Stealth Model That Rivals... - Bloomberg</a></li>
<li><a href="https://en.wikipedia.org/wiki/Z.ai">Z . ai - Wikipedia</a></li>
<li><a href="https://siliconangle.com/2026/08/23/nobody-knows-who-built-ai-coding-model-ox-alpha-or-where-the-code-goes/">Nobody knows who built AI coding model Ox Alpha or... - SiliconANGLE</a></li>

</ul>
</details>

**社区讨论**: 社区态度谨慎乐观：用户欢迎开放权重、认为这能让 Z.ai 与 DeepSeek 保持竞争，但也指出实际表现不一——编程能力介于 Sonnet 与 Opus 之间但偶发“死循环”，LiveBench 分数低于 GPT-5.4 Nano 与官方自报高分相矛盾，还有人称模型在公开测试期间似乎有所改进。

**标签**: `#open-weights`, `#LLM`, `#GLM`, `#benchmark`, `#AI`

---

<a id="item-4"></a>
## [Reddit 超级帖追踪 Qwen3.8-Flash-Next 发布日](https://www.reddit.com/r/LocalLLaMA/comments/1vyq2v4/megathread_qwen38flashnext_release_day/) ⭐️ 6.0/10

Reddit r/LocalLLaMA 版块为 Qwen3.8-Flash-Next 的发布开设了超级讨论帖。该模型是总参数量 125B、每 token 激活 6B 的 MoE 模型，预览了下一代 Qwen4 架构，预计发布时间为 2026 年 8 月 26 日 15:00 UTC，官方页面已在 Hugging Face 和 ModelScope 上线。 r/LocalLLaMA 的发布日超级帖是获取新模型社区量化版本（GGUF/AWQ/GPTQ）、微调、abliteration、聊天模板和推理服务器兼容性信息的最快渠道。本地部署大模型的用户可以借助这个帖子判断模型是否适合自己的硬件，避免盲目下载大文件。 该模型页面描述了一个重新设计的多模态 MoE：主模型参数 125B，外加 51B 的 N-gram 嵌入参数，每个 token 仅激活 6B，并在注意力、残差、嵌入和优化等方面进行了架构升级。2026 年 8 月 25 日 ModelScope 页面曾短暂上线又消失，随后才是正式发布。 在发布日关注该超级帖和 Hugging Face 官方页面（https://huggingface.co/Qwen/Qwen3.8-Flash-Next），下载量化版本前先查看社区针对你硬件档位的显存占用和基准测试报告。

reddit · r/LocalLLaMA · /u/sammcj · 8月26日 07:26

**背景**: 混合专家（MoE）模型总参数量很大，但每个 token 只路由到少量专家，因此推理成本接近小得多的稠密模型。Qwen3.8-Flash-Next 被定位为阿里稠密 27B 模型的 MoE 兄弟版本，回应了社区反复提出的请求。Abliteration 是一种无需完整微调即可移除模型拒绝行为的技术；量化（GGUF、AWQ、GPTQ）可将显存需求降低约 4 倍并保留大部分质量——这些都是该超级帖将收集的核心内容。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/Qwen/Qwen3.8-Flash-Next">Qwen/Qwen3.8-Flash-Next · Upcoming release · Hugging Face</a></li>
<li><a href="https://www.explainx.ai/blog/qwen3-8-flash-next-125b-moe-release-august-2026">Qwen3.8-Flash-Next 125B-A6B: MoE Drop Aug 26 (2026 ...</a></li>
<li><a href="https://forums.developer.nvidia.com/t/qwen3-8-flash-next/381228">Qwen3.8-Flash-Next - DGX Spark / GB10 - NVIDIA Developer Forums</a></li>

</ul>
</details>

**标签**: `#LLM`, `#Qwen`, `#open-source-models`, `#local-inference`, `#release`

---

<a id="item-5"></a>
## [EPA 拟取消小型污染源空气许可的公示要求](https://www.tomshardware.com/tech-industry/data-centers/u-s-govt-moves-to-suppress-pushback-on-data-centers-by-removing-requirements-for-public-input-on-pollution-epa-change-would-allow-air-pollution-permits-without-publicizing-them) ⭐️ 5.0/10

EPA 提议修改《清洁空气法》新源审查（NSR）规则，各州将不再被要求对“小型污染源”的空气许可进行公示或征求公众意见，而许多数据中心正属于此类。该提案已在《联邦公报》上公布，若通过，此类许可可在不通知周边社区的情况下发放。 此事之所以重要，是因为美国数据中心建设正高速扩张，而公示往往是居民在污染性设施建成前了解并提出异议的唯一途径。它也反映出 AI 基础设施扩张正与地方环境和土地使用政治发生冲突。 小型 NSR 许可适用于未触发更严格大型源审查的较小污染源，但单个设施的影响仍可能很大——评论者引用的 Vantage 数据中心估计每年造成 5300 万至 9900 万美元的健康损害，是有史以来对单一设施的最高估计。值得注意的是，美国的规划许可权主要在地方，这一联邦层面的修改并不能剥夺地方政府阻止数据中心建设的能力。 美国读者可以在公开征求意见期内通过《联邦公报》的档案编号（2026-13667）提交意见，并查询所在州环保部门的许可数据库，了解本地区待批的数据中心许可。

hackernews · rbanffy · 8月26日 10:44 · [社区讨论](https://news.ycombinator.com/item?id=49446748)

**背景**: 根据《清洁空气法》，新源审查（NSR）计划要求在新建或改建污染源之前取得许可；“小型污染源”许可覆盖低于大型源门槛的设施，由各州的实施计划管理。以往此类许可需要公示和公众意见期，为社区提供了正式的异议渠道。数据中心因备用柴油发电机和冷却设备会排放受管制污染物，正成为增长最快的小型污染源之一。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.federalregister.gov/documents/2026/07/07/2026-13667/minor-new-source-review-program-air-permitting-public-participation-requirements-for-state">Federal Register :: Minor New Source Review Program Air ...</a></li>
<li><a href="https://www.epa.gov/nsr/minor-nsr-basic-information">Minor NSR Basic Information - US EPA</a></li>

</ul>
</details>

**社区讨论**: 评论者大多持批评态度，vintagedave 指出一个造成有史以来最高健康损害估计的设施竟被归类为“小型源”，充满讽刺。也有人指出该修改的实际局限——cmiles8 强调规划许可权在地方，如今许多社区对数据中心的抵触甚至超过对有毒废料处理设施；oefrha 则质疑为何对延迟不敏感的 LLM 负载不建在偏远地区，Zambyte 预测数据中心将出现过度建设并最终被改作他用。

**标签**: `#data-centers`, `#ai-infrastructure`, `#regulation`, `#environment`, `#policy`

---

<a id="item-6"></a>
## [Simon Willison 引用 Paul Dix 谈 AI 构建百万行经验证的软件](https://simonwillison.net/2026/Aug/26/paul-dix/) ⭐️ 5.0/10

Simon Willison 摘录了 Paul Dix 文章《The End of Programming》中的一段话：AI 编写了约 100 万行代码，并在随后数月不断打磨，最终产出运行在数百万开发者机器上的可靠软件。Willison 的这篇帖子本身只是引用并链接到 Dix 的原文。 这段引文点明了 AI 辅助编程争论的核心：瓶颈不在于 AI 生成代码的能力，而在于是否存在验证系统和清晰的方向。能够定义强有力的一致性基准（oracle）、测试和反馈闭环的团队，或许可以把非常庞大复杂的软件工程交给 AI 完成。 Dix 预判了主要反驳意见——即该项目因为有可对照的 oracle（已有实现，属于语言间的移植）而变得简单——但他认为这种说法低估了这一成就。Willison 的帖子仅是引用转发，没有附加分析、代码或数据。 前往 pauldix.com/the-end-of-programming 阅读 Paul Dix 的完整文章，并思考你自己的代码库中哪里可以提供 oracle（测试、黄金输出或参考实现），从而让编码智能体反复迭代直到正确。

rss · Simon Willison · 8月26日 08:07

**背景**: Paul Dix 是 InfluxData（InfluxDB）的联合创始人，长期撰写关于 AI 如何重塑软件工程的文章。所提到的项目似乎是一次由 AI 主导的大型运行时移植（Willison 帖子中的 Bun 标签暗示是 Bun JavaScript 运行时），原有实现充当了验证正确性的 oracle。在软件验证中，"oracle" 指可用于机械地比对新旧代码行为是否一致的参照物，能大幅降低 AI 生成代码出错的风险。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://simonwillison.net/2026/Aug/26/paul-dix/">A quote from Paul Dix | Simon Willison’s Weblog</a></li>
<li><a href="https://en.wikipedia.org/wiki/AI-assisted_software_development">AI-assisted software development - Wikipedia</a></li>

</ul>
</details>

**标签**: `#ai-assisted-programming`, `#coding-agents`, `#llms`, `#software-engineering`

---