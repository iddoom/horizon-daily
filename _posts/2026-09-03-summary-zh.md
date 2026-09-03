---
layout: default
title: "Horizon Summary: 2026-09-03 (ZH)"
date: 2026-09-03
lang: zh
---

> 从 55 条内容中筛选出 11 条重要资讯。

---

1. [英伟达将以 129.3 亿美元收购 Hugging Face](#item-1) ⭐️ 8.0/10
2. [IFM 发布 K2-Horizon-MoVA-36B-A4B 并提供 GGUF 量化版本供本地部署](#item-2) ⭐️ 8.0/10
3. [开源代理框架 TrueForge 以更低成本比肩 Claude 托管代理](#item-3) ⭐️ 8.0/10
4. [英伟达以 129 亿美元收购 Hugging Face](#item-4) ⭐️ 7.0/10
5. [开发者实现 llama.cpp 中 Qwen3-Next Ngram PLE 表热插拔知识注入](#item-5) ⭐️ 7.0/10
6. [Google Antigravity 服务条款将 AI 误用与整个账号封禁挂钩](#item-6) ⭐️ 6.0/10
7. [企业难以将智能体 AI 从试点扩展到规模化](#item-7) ⭐️ 6.0/10
8. [LWN 深度回顾 Linux 内核内存分层近期进展与设计争议](#item-8) ⭐️ 6.0/10
9. [Qwen3.6 35B 以 IQ2_XXS 量化在 8GB 内存笔记本上纯 CPU 运行](#item-9) ⭐️ 6.0/10
10. [Google DeepMind 发布 WeatherNext 3 全球 AI 天气模型](#item-10) ⭐️ 5.0/10
11. [英伟达确认以 129 亿美元收购 Hugging Face](#item-11) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [英伟达将以 129.3 亿美元收购 Hugging Face](https://www.theverge.com/tech/985474/nvidia-buying-hugging-face-deal) ⭐️ 8.0/10

英伟达已同意以 129.3 亿美元收购 Hugging Face，这是领先的开源 AI 模型与数据集托管平台。这意味着最主要的开源 AI 模型中心将归全球最大 AI 芯片制造商所有。 Hugging Face 是开发者分享和下载开源模型的事实标准平台，英伟达的入主可能影响平台中立性、定价以及 AI 工作流的构建方式。任何构建或部署 AI 应用的人都应关注托管和推理服务在新东家之下可能发生的变化。 Hugging Face 成立于 2016 年，托管模型、数据集以及广泛使用的 transformers 库等工具。目前该交易仅为头条级新闻，关于平台独立性、开源承诺和监管审批的条款尚未公布细节。 审查你的 AI 流水线对 Hugging Face 托管和 transformers 生态的依赖程度，考虑将关键模型和数据集镜像备份，或评估 Together AI、Fireworks 或自托管等替代方案，以降低被锁定的风险。

rss · The Verge · 9月3日 12:12

**背景**: Hugging Face 是一家总部位于纽约的公司，其平台让机器学习开发者共享预训练模型、数据集和开发工具，使全球开发者都能使用先进的机器学习技术。英伟达在 AI 加速器市场占据主导地位，估计拥有 81%至 85%的 AI 数据中心芯片份额，其 GPU 支撑着大多数大规模模型的训练与推理。两家公司此前已有合作，包括 2023 年宣布的英伟达 DGX Cloud 与 Hugging Face 的集成。芯片厂商收购中立的模型中心，引发了与其他云和推理服务商之间利益冲突的疑问。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Hugging_Face">Hugging Face - Wikipedia</a></li>
<li><a href="https://www.ibm.com/think/topics/hugging-face">What is Hugging Face? - IBM</a></li>
<li><a href="https://www.fool.com/investing/2026/05/08/the-evidence-is-piling-up-nvidias-ai-chip-dominanc/">The Evidence Is Piling Up: Nvidia's AI Chip Dominance May Be About to Come to an End | The Motley Fool</a></li>

</ul>
</details>

**标签**: `#nvidia`, `#hugging-face`, `#ai-ecosystem`, `#acquisition`, `#open-source-ai`

---

<a id="item-2"></a>
## [IFM 发布 K2-Horizon-MoVA-36B-A4B 并提供 GGUF 量化版本供本地部署](https://www.reddit.com/r/LocalLLaMA/comments/1w67wso/ifmk2horizonmova36ba4bgguf_hugging_face/) ⭐️ 8.0/10

IFM 发布了 K2-Horizon-MoVA-36B-A4B，这是一个参数量为 360 亿、每 token 仅激活 40 亿参数的稀疏混合专家（MoE）模型，具备原生 512K 上下文和 Mixture-of-Values（MoVA）注意力机制。Hugging Face 上已提供从 0.9B 到 36B 的 GGUF 量化版本，IFM 还承诺将发布中间检查点、训练数据和训练代码。 该模型声称仅以 40 亿激活参数就能达到前沿级的智能体与推理性能，据称击败了规模大至 15 倍的开源权重模型，同时推理成本很低。由于 GGUF 量化版本已经可用，本地大模型用户可以立即通过基于 llama.cpp 的工具下载并进行测试。 512K（524,288 token）上下文是从中期训练阶段开始的原生能力，而非事后扩展。该家族还包括 0.9B、3.7B、7B 和 32B 的稠密模型变体；需要注意的是，此处的 MoVA 指模型采用的 Mixture-of-Values 注意力，与同名的多模态视觉 MoVA 论文不同。 从 https://huggingface.co/collections/IFM/k2-horizon 下载适合你显存的量化版本（例如 36B-A4B 的 Q4_K_M 或更小的稠密变体），并用 llama.cpp、LM Studio 或 Ollama 在你的智能体和长上下文任务上进行实测。

reddit · r/LocalLLaMA · /u/jacek2023 · 9月3日 13:47

**背景**: 稀疏混合专家（MoE）模型每个 token 只激活一部分专家模块，因此总存储参数可以很大，而每个 token 的计算量（FLOPs）保持较小——本模型为存储 360 亿参数、激活 40 亿。GGUF 是 llama.cpp 使用的标准量化文件格式，通过 Q4_K_M 等格式可大幅降低显存需求，使本地 CPU/GPU 推理高效可行。发布中间检查点和训练代码可以让研究者追踪能力随训练进程的演变，而不仅看到最终结果。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://kaitchup.substack.com/p/gguf-quantization-for-fast-and-memory">llama.cpp GGUF quantization: type-0/type-1 ... - The Kaitchup</a></li>
<li><a href="https://arxiv.org/html/2501.12370v1">Parameters vs FLOPs: Scaling Laws for Optimal Sparsity for ...</a></li>
<li><a href="https://aightbits.com/2025/04/11/sparse-mixture-of-experts-smoe-overview/">Sparse Mixture of Experts (SMoE) Overview – AightBits</a></li>

</ul>
</details>

**社区讨论**: 在该新闻被评分时，评论区尚无实质性的社区讨论。

**标签**: `#local-llm`, `#open-source-models`, `#mixture-of-experts`, `#gguf`, `#model-release`

---

<a id="item-3"></a>
## [开源代理框架 TrueForge 以更低成本比肩 Claude 托管代理](https://www.reddit.com/r/LocalLLaMA/comments/1w65ise/we_built_an_opensource_modelneutral_agent_harness/) ⭐️ 8.0/10

TrueFoundry 发布了采用 MIT 许可、与模型无关的代理框架 TrueForge，并在 14 个 DevRev Enterprise-Bench 任务上用盲评方式进行了基准测试。使用同一个模型（Opus 4.8）时，TrueForge 与 Claude 托管代理同样完成 11/14 个任务，但 token 用量减少约 63%（每次运行 370 万 vs 1000 万），成本降低约 30%（8.6 美元 vs 11.8 美元），平均每任务工具调用次数为 19 次 vs 32 次。 这表明框架设计（上下文管理、压缩和工具调用效率）与模型选择同样是可以显著影响成本的关键杠杆，为团队提供了两个独立的优化维度。它还说明用 GLM-5.2 这类更便宜的模型搭配高效框架，可以以约低 75% 的成本超越托管的高端方案。 局限也很明显：仅测试了 14 个任务（样本较小），作者是自荐产品，上下文压缩是有意为之的有损压缩，且该开源运行时还缺少一流的追踪/评估工具，也不自带代码执行沙箱。TrueForge 兼容 OpenAI 接口，支持工具/MCP、子代理、审批、持久会话和沙箱集成。 从 https://github.com/truefoundry/trueforge 克隆仓库，将其接入 OpenAI 兼容接口（托管或自托管模型），并运行仓库内置的基准测试工具，在自己的工作负载上复现或检验这一对比结果。

reddit · r/LocalLLaMA · /u/Background-Job-862 · 9月3日 12:07

**背景**: 代理框架（agent harness）是将 LLM 变成可用代理的执行层，负责代理循环、上下文、工具、重试和内存管理。上下文压缩通过压缩较长的对话历史来控制 token 消耗，这对长时运行的代理任务至关重要，因为累计 token 往往决定成本。DevRev Enterprise-Bench 是一个面向企业级 AI 代理的开放基准，每个任务都有唯一正确答案且答案被"掩埋"在更大规模的数据中，用于衡量生产规模下的可靠性。在长代理运行中，每次运行的 token 消耗（常达数百万）既取决于模型，也同样取决于框架如何在多轮之间传递上下文。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/devrev/enterprise-bench">GitHub - devrev / enterprise - bench : Open benchmark for enterprise...</a></li>
<li><a href="https://www.knolo.io/blog/what-is-ai-agent-harness-2026">What Is an AI Agent Harness — And Do You Actually Need One?</a></li>
<li><a href="https://kargarisaac.medium.com/the-fundamentals-of-context-management-and-compaction-in-llms-171ea31741a2">The Fundamentals of Context Management and Compaction in LLMs | by Isaac Kargar | Medium</a></li>

</ul>
</details>

**标签**: `#ai-agents`, `#benchmarking`, `#cost-optimization`, `#open-source`, `#llm-engineering`

---

<a id="item-4"></a>
## [英伟达以 129 亿美元收购 Hugging Face](https://www.wired.com/story/nvidias-hugging-face-acquisition-is-a-dollar129-billion-bet-on-open-source-ai/) ⭐️ 7.0/10

英伟达已同意以 129 亿美元收购 Hugging Face，终结了外界长期的猜测。这笔收购使这家芯片巨头获得了对最大开源 AI 模型与数据集仓库的访问权和影响力。 Hugging Face 是开源 AI 模型、数据集和工具共享的事实上的中心，英伟达的入主可能重塑开源生态的发展与商业化方式。所有基于开源模型构建应用的人都应关注该平台是否对非英伟达硬件保持中立。 据报道交易价格为 129 亿美元，这一高额溢价反映了 Hugging Face 在开源 AI 领域的战略地位。关于监管审查、平台治理以及 Hugging Face 的开放科学使命能否保留等细节尚未完全披露。 依赖 Hugging Face 的开发者应将关键模型和数据集在本地备份或建立镜像，并密切关注收购完成后平台服务条款和硬件集成路线图的变化。

rss · Wired AI · 9月3日 12:43

**背景**: 总部位于纽约的 Hugging Face 凭借用于自然语言处理的 Transformers 库起家，逐步成长为托管开源模型和数据集的核心平台。英伟达此前已投资 Hugging Face，并在将自家 GPU 与该平台对接的工具上有过合作。收购该平台符合英伟达巩固从芯片到软件和开发者生态的完整 AI 技术栈的战略。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Hugging_Face">Hugging Face - Wikipedia</a></li>
<li><a href="https://huggingface.co/">Hugging Face – The AI community building the future.</a></li>

</ul>
</details>

**标签**: `#Nvidia`, `#Hugging Face`, `#open-source AI`, `#acquisition`, `#AI industry`

---

<a id="item-5"></a>
## [开发者实现 llama.cpp 中 Qwen3-Next Ngram PLE 表热插拔知识注入](https://www.reddit.com/r/LocalLLaMA/comments/1w64y26/qwen38nextflash_ngram_hotswappable_knowledge/) ⭐️ 7.0/10

一位开发者修改了 llama.cpp，可以在内存中实时修改 Qwen3-Next 的 Ngram PLE 表，从而在每次提示时热插拔知识而无需重新加载模型。他发布了两个开源仓库：llama.cpp 的修改版（llama.cpp-NLTM）和一个用于生成表补丁的配套“编译器”工具（ngram-knowledge-injector）。 这展示了一种无需训练或微调就能为本地 LLM 提供即时长期记忆的低成本新途径，任何在本地运行 Qwen3-Next 的人都可以尝试。将查找表作为知识库进行编辑的思路，也可迁移到其他使用类似 n-gram 表的稀疏注意力架构。 主要限制：由于嵌入在网络较早的层就被注入，输出控制并不可靠；PLE 表必须通过内存映射加载（这是 llama.cpp 的默认方式）；且目前只在 q8 量化下测试过，需要较大的内存。作者认为经过改进，这或许可以成为一种低成本的“训练”方式或可热插拔的模型记忆。 克隆这两个仓库（llama.cpp-NLTM 和 ngram-knowledge-injector），启用内存映射加载 q8 量化的 Qwen3-Next 模型，然后尝试构建一个小的知识补丁，观察注入数据如何影响模型输出。

reddit · r/LocalLLaMA · /u/ortegaalfredo · 9月3日 11:40

**背景**: Qwen3-Next 采用稀疏注意力机制，其中包含一个巨大的 N-gram PLE（product key lookup）表，作为 token 模式的确定性查找表；由于它可以放在系统内存中异步读取，因此成为外部修改的天然目标。llama.cpp 是最主流的本地运行量化 LLM 的 C/C++推理引擎，并且已在投机解码中使用 n-gram 查找。向 LLM 注入知识是一个活跃的研究方向，其中潜层记忆方法将知识压缩为软 token，但这些表示通常与特定模型紧密耦合。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/HamboneLabs-AI/Qwen3.8-Flash-Next-uint3-g64">HamboneLabs-AI/ Qwen 3 .8-Flash- Next -uint3-g64 · Hugging Face</a></li>
<li><a href="https://github.com/ggml-org/llama.cpp/blob/master/docs/speculative.md">llama.cpp/docs/speculative.md at master · ggml-org/llama.cpp</a></li>

</ul>
</details>

**标签**: `#llama.cpp`, `#local-llm`, `#qwen3-next`, `#knowledge-injection`, `#open-source`

---

<a id="item-6"></a>
## [Google Antigravity 服务条款将 AI 误用与整个账号封禁挂钩](https://twitter.com/GergelyOrosz/status/2095453567955968398) ⭐️ 6.0/10

据报道，Google 的 Antigravity 智能体 IDE 的服务条款允许 Google 因 AI 产品误用（包括第三方使用方式）而封禁用户的整个 Google 账号。HN 和 Google 论坛上的用户报告了影响 Antigravity 和 Gemini CLI 的 403 服务条款封禁，且申诉数月无人回应。 任何将邮件、日历、照片、业务运营甚至政府电子身份（eID）依赖于单一 Google 账号的用户，都可能因 AI 分类器误判而面临不成比例的风险。这使得试用 Google AI 产品的风险权衡与使用独立 AI 供应商截然不同。 论坛报告显示，使用围绕 Gemini 的第三方 CLI 封装工具会触发账号封禁，用户被建议只使用官方 gemini-cli 登录或官方 API 密钥。封禁表现为 403 服务条款错误，而通过正常渠道申诉往往数月无回应。 为 Antigravity 和其他 Google AI 实验使用一个独立的专用 Google 账号，并使用官方 API 密钥或官方登录方式而非第三方封装工具。确保你的主邮箱和关键服务不与任何用于 AI 实验的账号绑定。

hackernews · tosh · 9月3日 11:01 · [社区讨论](https://news.ycombinator.com/item?id=49548452)

**背景**: Google Antigravity 是 Google 的智能体开发平台，是基于 Gemini 3 模型、面向智能体优先软件开发而构建的 AI IDE。Google 的统一账号体系意味着某一产品的服务条款违规可能连带影响到 Gmail、Drive、照片、Google Fiber 等绑定服务。当政府将数字身份系统（如欧洲的 eIDAS）与 Apple/Google 账号绑定时，这种风险被进一步放大。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://discuss.ai.google.dev/t/gemini-cli-account-suspended-403-tos-for-several-months-3-5-appeals-submitted-zero-response/180036">Gemini CLI account suspended (403 ToS) for several months...</a></li>
<li><a href="https://antigravity.google/">Google Antigravity</a></li>

</ul>
</details>

**社区讨论**: 评论者几乎一致认为封禁整个账号过于极端、对用户充满敌意，指出用户会失去多年的邮件和日历，而且几乎无法通过客服机器人申诉。多位评论者表示这正是他们完全不用 Google AI 产品的原因，尤其封禁还可能切断 GFiber 或政府 eID 访问。也有人主张结构性解决方案，例如将关键服务与平台解耦，并设立政府可接触的平台代表。

**标签**: `#google`, `#ai-tools`, `#account-suspension`, `#platform-risk`, `#terms-of-service`

---

<a id="item-7"></a>
## [企业难以将智能体 AI 从试点扩展到规模化](https://www.technologyreview.com/2026/09/03/1142868/scaling-agentic-ai-pilots-across-the-enterprise/) ⭐️ 6.0/10

MIT Technology Review Insights 发布文章指出，尽管约 80%的财富 500 强公司已采用智能体 AI，但大多数仍停留在试点阶段。文章将互操作性、数据访问以及跨业务流程的安全问题列为实现规模化扩展的主要障碍。 它为企业和技术领导者提供了一个现实的框架，说明智能体试点与生产部署之间的差距，帮助他们优先投资于智能体协同、数据集成和治理，而不是追逐演示效果。任何规划企业级 AI 落地的人都可以借此视角预判真正的扩展瓶颈。 这篇文章属于 Insights 类报告而非技术深度分析，因此只提供标题层面的讨论，缺乏具体方法和数据细节。值得注意的是，文中所提的障碍正好对应新兴标准，如 Anthropic 的 Model Context Protocol（MCP）用于工具/数据连接，以及用于多智能体互操作的 A2A 等协议。 阅读 MIT Technology Review Insights 的完整报告以获取详细发现，并在跨流程扩展智能体之前，先针对你的核心用例试点一个互操作标准（如 MCP）并建立治理框架。

rss · MIT Technology Review · 9月3日 09:30

**背景**: 智能体 AI 是指能够自主规划步骤、调用工具（API、文件、浏览器）、观察结果并循环迭代直到完成任务的 AI 系统，而不像聊天机器人那样只生成文本。在企业中扩展此类智能体，需要它们彼此互操作并安全地连接到企业系统和数据，这正是 MCP、A2A、ACP 等协议出现的原因。LangGraph、CrewAI 以及 AWS Bedrock 等云平台等编排框架则试图解决协同、可观测性和生产就绪问题。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.kore.ai/blog/what-is-ai-agent-interoperability">AI Agent interoperability : Why enterprise AI cannot scale without it</a></li>
<li><a href="https://agentic.ai/what-is-agentic-ai">What Is Agentic AI ? Definition, 6 Levels & Examples (2026) | Agentic . ai</a></li>

</ul>
</details>

**标签**: `#agentic AI`, `#enterprise AI`, `#AI deployment`, `#automation`, `#business strategy`

---

<a id="item-8"></a>
## [LWN 深度回顾 Linux 内核内存分层近期进展与设计争议](https://lwn.net/Articles/1092001/) ⭐️ 6.0/10

LWN 发布了一篇深度文章，梳理了 Linux 内核在分层内存系统（涵盖 DRAM、高带宽内存 HBM 以及 CXL 内存）方面的近期工作。文章指出，尽管相关工作仍在推进，但节奏有所放缓，而且核心努力正面临关于当前分层设计是否可行的质疑。 分层系统上的内存放置直接决定工作负载的性能，因此内核在此处的设计决策将影响未来服务器及 AI/HPC 硬件在 Linux 上的表现。系统工程师以及评估 CXL 内存扩展服务器的读者可以借此了解技术现状与尚未解决的开放问题。 文章聚焦于内核社区中关于现有分层架构是否合理的持续争论，这表明存在设计层面的不确定性，而不仅仅是增量调优。CXL 内存本身已相当成熟——Linux 自 5.12 内核起就提供支持，配置通过 CXL 子系统和 daxctl 等工具完成。 阅读 LWN 原文（https://lwn.net/Articles/1092001/）了解补丁级别的详细讨论；如果你在运营支持 CXL 的硬件，可以使用 CXL Memory Resource Kit 中的 cxlstat 工具检查内核的分层与 CXL 配置。

rss · LWN.net · 9月3日 14:11

**背景**: 分层内存系统将性能特征不同的多种内存组合在一起：标准 DRAM、更快的高带宽内存（HBM，垂直堆叠的 DRAM 芯片），以及通过基于 PCIe 的缓存一致性互连扩展的较慢 CXL 内存。由于各层的访问延迟和带宽不同，内核将内存分配放置在何处会显著影响工作负载性能。Linux 内核长期以来一直在通过内存分层抽象和基于 NUMA 的放置机制，自动将热页提升到更快层、将冷页下沉到较慢层。CXL 支持于 5.12 版本进入主线内核，并在每个版本中持续获得更新。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/cxl-reskit/cxl-reskit">GitHub - cxl-reskit/cxl-reskit: CXL Memory Resource Kit top ... Compute Express Link — The Linux Kernel documentation GitHub - microncxl/cxl-reskit: Documentation, tools, and ... Overview — The Linux Kernel documentation Compute Express Link Driver Theory of Operation — The Linux ... Linux CXL Memory: Convert from NUMA Node (System_RAM) to DAX ...</a></li>
<li><a href="https://www.kernel.org/doc/html/latest/driver-api/cxl/">Compute Express Link — The Linux Kernel documentation</a></li>
<li><a href="https://stevescargall.com/blog/2022/06/using-linux-kernel-memory-tiering/">Using Linux Kernel Memory Tiering</a></li>

</ul>
</details>

**标签**: `#linux-kernel`, `#memory-tiering`, `#CXL`, `#systems-engineering`

---

<a id="item-9"></a>
## [Qwen3.6 35B 以 IQ2_XXS 量化在 8GB 内存笔记本上纯 CPU 运行](https://www.reddit.com/r/LocalLLaMA/comments/1w655he/qwen36_35b_q2_xxs_being_gpu_poor_in_2026_is_not/) ⭐️ 6.0/10

一位 Reddit 用户在 i3 处理器、8GB 内存、无独显的笔记本上，通过 llama-server 纯 CPU 运行重度量化的 Qwen3.6-35B-A3B（IQ2_XXS GGUF），以每秒 3 个 token 的速度在 24 分钟内生成了一个完整的单文件 HTML RPG 游戏。用户分享了完整的 llama.cpp 命令、模型链接和提示词，使整个配置完全可复现。 这表明即使是没有 GPU、硬件配置很低的用户，也可以在本地运行 35B 级别的 MoE 模型来完成有用的长篇代码生成任务。具体的参数（q8_0 KV 缓存、自动 flash attention、关闭推理模式）为受 CPU 限制的用户提供了实用的配置模板。 该模型是总参数 35B 但仅激活约 3B 参数的稀疏 MoE 架构，这就是 CPU 上能跑到 3 t/s 的原因；IQ2_XXS 是最小的量化级别之一，质量下降是已知代价。用户选择了 Instruct 版本并关闭推理模式，以避免在隐藏推理输出上浪费 token。 从 Hugging Face 下载 bartowski 的 Qwen3.6-35B-A3B IQ2_XXS GGUF 模型，在自己的纯 CPU 机器上运行帖子中的 llama-server 命令，然后尝试生成一个小的单文件 HTML 应用来测试你的 token 生成速度。

reddit · r/LocalLLaMA · /u/ML-Future · 9月3日 11:50

**背景**: MoE（混合专家）模型每个 token 只激活一小部分参数，因此内存占用取决于总参数量而计算量取决于激活参数量，非常适合受内存带宽限制的 CPU 推理。GGUF 的 Q2/IQ2_XXS 等量化级别将权重压缩到每位约 2 比特，使 35B 模型能装入几 GB 内存，代价是精度损失。llama.cpp 的 llama-server 提供 OpenAI 兼容 API，并支持对线程数、KV 缓存精度和层卸载（-ngl 0 表示所有层留在 CPU）的精细控制。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://deepwiki.com/QwenLM/Qwen3.6/1.1-qwen3.6-models">Qwen3.6 Models | QwenLM/Qwen3.6 | DeepWiki</a></li>
<li><a href="https://github.com/ggml-org/llama.cpp">GitHub - ggml-org/ llama . cpp : LLM inference in C/C++ · GitHub</a></li>
<li><a href="https://tonisagrista.com/blog/2026/quantization/">GGUF quantization guide</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#quantization`, `#gguf`, `#llama.cpp`, `#cpu-inference`

---

<a id="item-10"></a>
## [Google DeepMind 发布 WeatherNext 3 全球 AI 天气模型](https://deepmind.google/blog/introducing-weathernext-3-our-most-advanced-and-accurate-global-weather-ai-model/) ⭐️ 5.0/10

Google DeepMind 宣布推出 WeatherNext 3，这是其最新的基于 AI 的全球天气预报模型，号称是 WeatherNext 系列迄今最先进、最准确的模型。该发布延续了 GraphCast（WeatherNext 1）、GenCast 和 WeatherNext 2 的发展路线。 它表明生成式 AI 和机器学习已能在中期预报中匹敌甚至超越传统数值天气预报，且在普通硬件上不到一分钟即可完成计算，而传统方法需要超级计算机运行数小时。农业、物流和能源领域的从业者可以从更快、更便宜的概率化预报中受益。 该公告属于新闻稿式博文，技术细节有限；独立研究表明，在洪水、热浪和风暴等极端天气预报上，物理模型仍优于 AI 模型。用户应将准确性声明主要限定在常规中期全球预报范围内看待。 可以在 GitHub 上查看 google-deepmind/weathernext 开源仓库，了解预训练的 GraphCast/GenCast 模型和数据格式，并关注 Google 天气产品中 WeatherNext 3 预报的实际上线情况。

rss · Google DeepMind Blog · 9月3日 15:02

**背景**: 传统天气预报依赖数值天气预报（NWP），通过模拟大气物理过程运行，通常需要在超级计算机上耗费数小时。Google 的公开 AI 天气研究始于 GraphCast——一个于 2023 年发表在《Science》上的确定性图神经网络，其在中期预报中匹敌或超越 NWP，随后推出了 GenCast（集合预报版本）和 WeatherNext 2。如今训练好的 AI 模型可以在不到一分钟内、用少得多的算力生成全球预报。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://zread.ai/google-deepmind/weathernext">Overview | google-deepmind/ weathernext | Zread</a></li>
<li><a href="https://github.com/google-deepmind/weathernext/blob/main/docs/weathernext1_graph/README.md">weathernext /docs/ weathernext 1_ graph /README.md at main...</a></li>
<li><a href="https://www.linkedin.com/pulse/physics-vs-ai-engines-under-hood-nexuswxc-hj2se">Physics vs . AI : The Engines Under the Hood</a></li>

</ul>
</details>

**标签**: `#AI`, `#weather-forecasting`, `#DeepMind`, `#machine-learning`, `#announcement`

---

<a id="item-11"></a>
## [英伟达确认以 129 亿美元收购 Hugging Face](https://techcrunch.com/2026/09/03/nvidia-confirms-it-will-buy-hugging-face-for-12-9-billion/) ⭐️ 5.0/10

英伟达确认将以 129 亿美元收购 Hugging Face，这一领先的开放模型托管平台。英伟达表示，Hugging Face 托管了超过 300 万个模型，服务超过 1800 万开发者。 这笔交易将英伟达的 GPU 硬件业务与开源 AI 生态中发现、托管和服务模型的主导平台进行了垂直整合。开发者和机器学习团队应关注平台在英伟达旗下如何演变，包括中立性、定价和工具链。 目前该消息仅有标题层面的信息，尚未披露模型托管、Spaces 或推理服务将如何变化的具体细节。鉴于英伟达在 AI 算力领域本已占据主导地位，此次收购可能会面临反垄断审查。 目前无需立即行动，但深度依赖 Hugging Face 的团队应关注服务条款变化，并考虑对自己依赖的关键模型和数据集保留镜像备份。

rss · TechCrunch · 9月3日 12:42

**背景**: Hugging Face 是事实上的开源机器学习中心，托管着全球开发者使用的数百万个模型、数据集和演示应用（Spaces）。英伟达此前已是其重要投资方和合作伙伴，曾将 DGX Cloud 和推理端点与 Hugging Face 集成。此次收购加深了 AI 芯片厂商整合 AI 软件层的趋势。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/welcome">Welcome - Hugging Face</a></li>

</ul>
</details>

**标签**: `#nvidia`, `#hugging-face`, `#ai-industry`, `#m&a`, `#machine-learning`

---