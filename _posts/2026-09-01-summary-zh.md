---
layout: default
title: "Horizon Summary: 2026-09-01 (ZH)"
date: 2026-09-01
lang: zh
---

> 从 71 条内容中筛选出 11 条重要资讯。

---

1. [Anthropic 发布 Claude Fable 5.1 和 Mythos 5.1](#item-1) ⭐️ 8.0/10
2. [Dan Luu 审计 Ed Zitron 的 AI 怀疑论预测](#item-2) ⭐️ 8.0/10
3. [slotstream：通过专家卸载在 16GB 内存的 Mac 上运行 125B 模型](#item-3) ⭐️ 8.0/10
4. [Jujutsu 创始人 Martin von Zweigbergk 加入 GitHub 竞争对手 ERSC](#item-4) ⭐️ 6.0/10
5. [OpenAI 发布案例：Basis、Clay 和 Exa Labs 如何构建 AI 原生工作流](#item-5) ⭐️ 6.0/10
6. [Google DeepMind 为 Gemini 推出智能体式视频理解能力](#item-6) ⭐️ 6.0/10
7. [Python 指导委员会暂停 CPython JIT 开发，等待 PEP 通过](#item-7) ⭐️ 6.0/10
8. [Spark-X2.5 1.7B/4B 开源模型宣称原生 1M 上下文并达到 Qwen-3.5-9B 级性能](#item-8) ⭐️ 6.0/10
9. [ChatGPT/Codex 桌面应用缓存 1.7GB 运行时捆绑包，内含 LibreOffice](#item-9) ⭐️ 5.0/10
10. [Python 3.15.0 候选版本 2 发布，正式版定于十月推出](#item-10) ⭐️ 5.0/10
11. [GitHub Copilot 代码审查现在可以批准拉取请求](#item-11) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [Anthropic 发布 Claude Fable 5.1 和 Mythos 5.1](https://www.anthropic.com/claude-fable-and-mythos-5-1) ⭐️ 8.0/10

Anthropic 发布了 Claude Fable 5.1 和 Claude Mythos 5.1，二者是同一底层模型的两种配置，安全防护级别不同：Fable 面向普遍可用，Mythos 则是受限变体。此次发布附带系统卡和变更日志，并声称在编程和科研能力上树立了新标准。 Fable 现在是 Anthropic 高于 Opus 的旗舰层级，凡基于 Claude API 或订阅进行开发的用户都应评估其写作风格改进、冗长度变化以及思维痕迹被移除对提示词和工作流的影响。尤其是可见思维痕迹的移除，削弱了开发者调试提示词的能力。 虽然文本中的套话和专业术语更少，但系统卡本身也承认句子更长、段落间隔更少，部分用户认为输出更密集、阅读起来更累。此前用于验证提示词是否生效的思维痕迹被移除，而 Mythos 以网络安全等高级能力为由限制发布，被一些用户视为营销策略。 先阅读官方的“Fable 5.1 新特性”变更日志和系统卡 PDF，再用现有提示词在 Fable 5.1 上测试，检查冗长度和推理可见性是否出现回退，然后再迁移生产环境。

hackernews · denysvitali · 9月1日 17:53 · [社区讨论](https://news.ycombinator.com/item?id=49525378)

**背景**: Anthropic 的模型阵营传统上由 Haiku、Sonnet 和 Opus 构成小、中、大三档，Fable 现在位于 Opus 之上，成为最强的一档。扩展思考（extended thinking）是让同一模型在回答前投入更多算力和时间进行推理的模式，可见的“思维痕迹”让开发者能够检查这些推理过程。Fable 与 Mythos 是“同一模型、不同防护”体现了 Anthropic 按风险评级并相应控制部署的做法。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.anthropic.com/claude-fable-and-mythos-5-1">Introducing Claude Fable 5 . 1 and Claude Mythos 5 . 1 \ Anthropic</a></li>
<li><a href="https://platform.claude.com/docs/en/models/fable-5-1/overview">Claude Fable 5.1 - Claude Platform Docs</a></li>
<li><a href="https://www-cdn.anthropic.com/0339e6a7c5c7b87f5c07798616dc32c215d14235/Claude+Fable+5.1+&+Claude+Mythos+5.1+System+Card.pdf">Claude Fable 5 . 1 & Claude Mythos 5 . 1 System Card</a></li>

</ul>
</details>

**社区讨论**: 这条 494 条评论的 HN 讨论分歧明显：Anthropic 员工 felixrieseberg 称赞写作风格更自然，而其他用户则抱怨冗长度增加（“人类也有 token 上限”）、思维痕迹被移除，exabrial 还批评围绕受限 Mythos 的宣传是营销炒作。simonw 通过在不同思考努力级别下渲染鹈鹕 SVG 进行测试，发现 effort max 的效果明显更好。

**标签**: `#anthropic`, `#llm`, `#model-release`, `#ai`, `#api`

---

<a id="item-2"></a>
## [Dan Luu 审计 Ed Zitron 的 AI 怀疑论预测](https://danluu.com/zitron/) ⭐️ 8.0/10

Dan Luu 发布了一篇详细的事实核查文章（danluu.com/zitron），系统性地审计了 AI 怀疑论者 Ed Zitron 的预测和统计数据，发现它们在仔细审查下大多站不住脚。文章表明 Zitron 抛出的数字往往无法构成连贯的论点，甚至不能支持他自己的结论。 任何要做 AI 投资或采用决策的人都需要可靠的预测，而这篇文章展示了一种可迁移的方法：核查被引用的数字是否真正支持所论述的观点。它还警示了“受众俘获”现象——无论是怀疑派还是鼓吹派——如何让预测质量退化。 Luu 记录了 Zitron 数据站不住脚的具体案例，例如声称 Facebook 月活下降会导致 Meta 财务困境，但这并不能从数据中推出。评论者指出 Zitron 已从否认 LLM 有用性转向指控前沿实验室存在安然级别欺诈，这种转变与他服务于付费订阅的固化受众相吻合。 阅读 danluu.com/zitron 上的原文并练习其方法：下次看到 AI 预测（无论看多还是看空）时，先核实被引用的数字是否真能推出结论，再据此行动。

hackernews · jatins · 9月1日 18:35 · [社区讨论](https://news.ycombinator.com/item?id=49526069)

**背景**: Ed Zitron 是一位科技评论人，撰写通讯“Where's Your Ed At”并主持播客“Better Offline”，已成为最响亮的 AI 怀疑论者之一，主张 AI 经济学不成立（例如每兆瓦 AI 数据中心成本约 4400 万美元）。Dan Luu 是一位受人尊敬的工程师和散文作者，以细致、数据驱动的分析著称。“受众俘获”指作者的激励转向说受众爱听的话，因为承认错误会损失订阅者和地位。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Ed_Zitron">Ed Zitron - Wikipedia</a></li>
<li><a href="https://www.newsweek.com/ai-skeptic-ed-zitron-says-math-on-data-centers-doesnt-add-up-11594219">AI Skeptic Ed Zitron Says Math on Data Centers Doesn’t Add Up - Newsweek</a></li>

</ul>
</details>

**社区讨论**: 评论者总体认同 Luu 的审计；pcstl 认为一旦怀疑主义变成带有固化受众的政治立场，Zitron 就成了他所嘲讽的 AI 鼓吹者的扭曲镜像，simonw 也证实 Zitron 的数字从未构成连贯论证。tolugenius 等人则反问是否存在对 AI 融资和政治的有效批评者，指出大多数评论者都倒向某一阵营。

**标签**: `#ai-skepticism`, `#forecasting`, `#critical-thinking`, `#dan-luu`, `#llm-economics`

---

<a id="item-3"></a>
## [slotstream：通过专家卸载在 16GB 内存的 Mac 上运行 125B 模型](https://github.com/carloslfu/slotstream) ⭐️ 8.0/10

开发者 carloslfu 发布了开源工具 slotstream，它基于 MLX 和 Swift，通过专家卸载（expert offloading）与 SSD 流式加载技术，让仅有 16GB 内存的 Mac 也能以约 12 tok/s 的速度运行 104GB 的 Qwen3.8-Flash-Next 4-bit（125B 参数）模型。工具还提供自动模式来平衡内存占用与速度，作者下一步计划实现基于 MTP 的投机解码。 它展示了一种具体且可复现的技术，让消费级硬件也能运行前沿规模的 MoE 模型，大幅降低了本地 LLM 推理的门槛。任何拥有一台普通 Mac 的用户都可以体验 125B 模型，而无需购买大内存机器或租用云端 GPU。 其核心技巧利用了混合专家（MoE）的稀疏性：每个 token 只激活一小部分专家权重，未激活的专家可以留在 SSD 上按需流入内存，用 I/O 延迟换取极小的内存占用。约 12 tok/s 的速度可用但远低于全内存推理，作者也提到实际瓶颈往往是 Hugging Face 的下载带宽而非技术本身。 从 GitHub 克隆 slotstream，在你的 Mac（最低 16GB 内存）上试用其自动模式，亲身体验内存与速度的权衡；如果你是开发者，可以研读其专家卸载与 SSD 流式加载的实现，这套模式可迁移到其他 MoE 模型。

hackernews · carloslfu · 9月1日 16:42 · [社区讨论](https://news.ycombinator.com/item?id=49524447)

**背景**: 像 Qwen3.8-Flash-Next 这样的混合专家（MoE）模型的总参数量远大于每个 token 实际激活的参数量，因此 4-bit 的 125B 模型完整加载需要约 100GB 内存，但任一时刻只用到了一小部分专家。专家卸载领域的研究（如 HOBBIT、ADEPT）表明，通过智能缓存和预取，把专家权重存放在 CPU/SSD 上可以让 MoE 推理在边缘设备上可行，代价是速度与内存之间的权衡。MLX 是苹果开源的、针对 Apple 芯片统一内存架构优化的数组框架，提供 Python、C++ 和 Swift API，非常适合 Mac 原生的 LLM 推理。MTP（多 token 预测）是一种投机解码方法，模型每步原生预测多个 token 以加速生成。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/ml-explore/mlx">GitHub - ml-explore/mlx: MLX: An array framework for Apple silicon</a></li>
<li><a href="https://arxiv.org/html/2411.01433v2">HOBBIT: A Mixed Precision Expert Offloading System for Fast MoE Inference</a></li>
<li><a href="https://docs.vllm.ai/en/latest/features/speculative_decoding/mtp/">MTP (Multi-Token Prediction) - vLLM</a></li>

</ul>
</details>

**社区讨论**: 评论者普遍支持在低成本硬件上普及大模型推理，jacquesm 警告说如果没有这类效率优化，前沿模型可能会把通用计算锁死在昂贵硬件之后。其他人则提出了实用反馈：mulemisterX 在 48GB 的 M5 上把上下文窗口推到了约 71,680 tokens，embedding-shape 批评 README 像未经整理的会话日志，atif089 则询问 Flash-Next 到底能解决哪些 27B 模型解决不了的实际任务。

**标签**: `#LLM inference`, `#Mac`, `#MLX`, `#model offloading`, `#local AI`

---

<a id="item-4"></a>
## [Jujutsu 创始人 Martin von Zweigbergk 加入 GitHub 竞争对手 ERSC](https://ersc.io/blog/martin-joins-ersc) ⭐️ 6.0/10

版本控制系统 Jujutsu (jj) 的创始人 Martin von Zweigbergk 已加入 ERSC，一家定位为 GitHub 竞争对手的公司。该消息在 Hacker News 上引发了关于 jj 相对 git 的优势以及对 ERSC 差异化价值的质疑的讨论。 这表明已在 Google 生产环境中使用的 jj 可能获得商业支持和更深入的基础设施投入，从而加快它作为更友好的 git 替代品的普及。这也引发了 ERSC 是否会为 jj 构建除 git 之外的替代后端的疑问。 Jujutsu 与 git 完全兼容——可以把它看作一个存储数据在现有 git 仓库中的新前端，因此所有 jj 操作都能映射到 git 能力上。评论者指出 jj 的突出特性是全局撤销、工作区自动快照，以及更安全的 rebase 体验。 如果你还没用过 jj，可以直接在现有的 git 仓库上安装试用（它直接兼容 git 仓库），体验撤销和 rebase 工作流，亲自判断其体验提升。关注 ERSC 博客和 Steve Klabnik 的发文，了解讨论中暗示的即将到来的公告。

hackernews · steveklabnik · 9月1日 17:46 · [社区讨论](https://news.ycombinator.com/item?id=49525297)

**背景**: Jujutsu (jj) 是一个分布式版本控制系统，融合了 git 和 Mercurial 的优点，既新颖又令人熟悉，并且已在 Google 内部使用，说明其长期生命力。与 git 不同，jj 会自动为工作区做快照，把提交视为可修改的一等对象，并允许撤销任何操作，从而避免许多常见的误操作。ERSC 是一个新入局者，目标是在代码托管与协作领域与 GitHub 竞争，但其具体差异化尚未被广泛了解。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://news.ycombinator.com/item?id=49525297">The creator of Jujutsu has joined ERSC | Hacker News</a></li>
<li><a href="https://neugierig.org/software/blog/2024/12/jujutsu.html">Tech Notes: The Jujutsu version control system - neugierig.org</a></li>
<li><a href="https://thenewstack.io/jujutsu-dealing-with-version-control-as-a-martial-art/">Jujutsu: Dealing With Version Control as a Martial Art - The New Stack</a></li>

</ul>
</details>

**社区讨论**: 讨论意见不一：jph 和 minraws 等支持者称赞 jj 是更聪明、更安全的 git，尤其是全局撤销功能；而 fallat 持怀疑态度，认为 jj 只是 git 之上的 UX 层，并质疑 ERSC 相对 GitHub 提供了什么额外价值。ksymph 猜测 ERSC 可能在为 jj 构建非 git 的替代后端，steveklabnik（Martin 的同事）则确认很快会有更多消息公布。

**标签**: `#jujutsu`, `#git`, `#version-control`, `#developer-tools`, `#hiring`

---

<a id="item-5"></a>
## [OpenAI 发布案例：Basis、Clay 和 Exa Labs 如何构建 AI 原生工作流](https://openai.com/index/ai-native-company-workflows) ⭐️ 6.0/10

OpenAI 发布了一篇博客文章，介绍了 Basis、Clay 和 Exa Labs 这三家 AI 原生公司，它们将 AI 智能体嵌入到客户入职、账户管理和开发者集成等核心工作流中。文章展示了这些公司如何将 AI 智能体从实验性工具转变为可复用的运营能力。 这些案例为想知道智能体究竟能在哪里创造实际价值（而不只是演示）的企业提供了可迁移的模式。从事会计自动化、销售/GTM 以及面向开发者的搜索的团队可以直接借鉴这些具体的工作流设计，而无需从零开始。 Basis 使用 OpenAI 的 o3、o3-Pro、GPT-4.1 和 GPT-5 驱动智能体，自动完成对账、日记账分录和财务摘要等工作，同时让会计师保持完全的可见性和控制权。Clay 专注于数据富化和 AI 驱动的 GTM 工作流，Exa Labs 则提供专为需要实时网络数据的 AI 智能体设计的搜索 API。需要注意的是，这是 OpenAI 的博客文章，带有宣传性质，实现细节可能有限。 阅读 openai.com/index/ai-native-company-workflows 上的完整文章，并从你自己的入职、账户管理或集成流程中挑一个环节用智能体做原型验证。可以进一步查看 Basis、Clay 和 Exa 的官方文档，了解其方案背后的具体实现机制。

rss · OpenAI Blog · 9月1日 17:00

**背景**: AI 原生公司从第一天起就围绕 AI 智能体来构建产品和内部流程，而不是在传统工作流上外挂 AI。智能体是能够端到端完成多步骤工作的自主系统——例如 Basis 的智能体做的是真正的会计工作，而不只是起草建议。Clay（营收增长自动化）和 Exa（面向智能体的搜索基础设施）等公司代表了这种方式催生的新兴工具栈和运营模式。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://openai.com/index/basis/">Basis scales accounting by turning OpenAI model progress into trusted agents | OpenAI</a></li>
<li><a href="https://www.clay.com/">Clay | Build systems to grow revenue</a></li>
<li><a href="https://exa.ai/">Exa | Search API for AI Agents — Real-Time Web Data</a></li>

</ul>
</details>

**标签**: `#AI agents`, `#enterprise workflows`, `#case study`, `#automation`, `#OpenAI`

---

<a id="item-6"></a>
## [Google DeepMind 为 Gemini 推出智能体式视频理解能力](https://deepmind.google/blog/introducing-agentic-video-in-gemini/) ⭐️ 6.0/10

Google DeepMind 宣布在 Gemini 中推出智能体式（agentic）视频理解能力，使模型能够以交互方式分析和推理视频内容，而不是被动地生成摘要。据官方介绍，Gemini 3.7 能够在回答关于视频内容的复杂问题时，相比静态分析消耗明显更少的 token。 智能体式视频理解将视频 AI 从一次性描述转变为交互式、可调用工具的分析方式，对构建视频搜索、内容审核和分析应用的开发者都有价值。官方声称的 token 效率提升也使得长视频处理在成本和延迟上更加可行。 这主要是一篇产品发布公告，未提供公开的实现细节、代码或基准测试，因此其具体的智能体机制（如帧选择或工具调用）尚无文档说明。该能力似乎与较新的 Gemini 模型（公告提到 Gemini 3.7）相关，可用性可能取决于模型版本和 API 访问权限。 可以通过 Gemini API 或应用上传一段长视频，并提出针对性的多轮问题，测试智能体式理解的实际效果，并与一次性摘要提示对比 token 消耗情况。

rss · Google DeepMind Blog · 9月1日 17:08

**背景**: 传统多模态模型分析视频时会均匀读取帧并生成一次性摘要，这对长视频而言 token 开销巨大，且难以回答针对性的后续问题。“智能体式”（agentic）AI 指的是能够规划、执行动作并迭代使用工具的模型，而非一次性作答。将其应用于视频，意味着模型在回答问题时可以有选择地查看视频中相关的片段，就像人类回放视频核对细节一样。Gemini 是 Google DeepMind 的多模态模型系列，通过 Gemini API 支持文本、图像、音频和视频输入。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-agentic-video-in-gemini/">Introducing Agentic Video in Gemini</a></li>
<li><a href="https://ai.google.dev/gemini-api/docs/models">Models - Gemini API | Google AI for Developers</a></li>
<li><a href="https://valossa.com/2026/06/ai-video-analysis/">AI Video Analysis Explained: Agentic Video AI (2026)</a></li>

</ul>
</details>

**标签**: `#AI`, `#Gemini`, `#multimodal`, `#video-understanding`, `#product-launch`

---

<a id="item-7"></a>
## [Python 指导委员会暂停 CPython JIT 开发，等待 PEP 通过](https://lwn.net/Articles/1090385/) ⭐️ 6.0/10

今年六月，Python 指导委员会宣布，在接受一份将 JIT 确立为受支持特性的 PEP 之前，CPython 主分支不得合入新的 JIT 开发内容（错误和安全修复除外）。这促成了 PEP 836（"JIT Go Brrr: The Path to a Supported JIT Compiler for CPython"）的提出，目前该提案正在讨论中。 这一决定影响了 Python 性能演进的未来方向，因为 Python 3.13 引入的实验性 JIT 是让 CPython 更快的关键一环。它也表明，CPython 的重大特性如今需要经过正式的治理流程论证，才能被视为受支持的功能。 JIT 的错误和安全修复仍允许合入主分支，暂停的仅是新特性开发。PEP 836 仍在讨论中，虽然 JIT 的开发工作很可能最终会继续，但时间表尚不确定。 如果你的项目依赖 CPython 的性能规划，请关注 Python 官方论坛和 peps.python.org 上关于 PEP 836 的讨论。在 PEP 被接受且发布计划明确之前，不要指望 JIT 成为受生产支持的功能。

rss · LWN.net · 9月1日 14:40

**背景**: Python 3.13（2024 年发布）内置了一个实验性的即时（JIT）编译器，基于 copy-and-patch 编译技术，用于加速 CPython 的代码执行。Python 的治理采用指导委员会模式（由 PEP 13 和 PEP 8016 定义），委员会拥有广泛的权力但极少直接行使，主要通过确立流程来治理。PEP（Python 增强提案）是对 Python 提出重大变更并加以论证的正式机制。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://peps.python.org/pep-0013/">PEP 13 – Python Language Governance | peps.python.org</a></li>
<li><a href="https://realpython.com/python313-free-threading-jit/">Python 3.13: Free Threading and a JIT Compiler</a></li>
<li><a href="https://tonybaloney.github.io/posts/python-gets-a-jit.html">Python 3.13 gets a JIT - GitHub Pages</a></li>

</ul>
</details>

**标签**: `#Python`, `#CPython`, `#JIT compiler`, `#governance`, `#PEP`

---

<a id="item-8"></a>
## [Spark-X2.5 1.7B/4B 开源模型宣称原生 1M 上下文并达到 Qwen-3.5-9B 级性能](https://www.reddit.com/r/LocalLLaMA/comments/1w4dsrw/new_model_sparkx254b_sparkx2517b/) ⭐️ 6.0/10

科大讯飞开源了 Spark-X2.5-4B 和 Spark-X2.5-1.7B 两款采用自研架构的小型端侧模型，原生支持最高 100 万 token 的上下文窗口，覆盖 200 多种语言。社区基准测试显示 4B 版本的性能与 Qwen 3.5 9B 大致相当。 如果 4B 级模型能在原生 1M 上下文下匹敌 9B 模型，对在消费级 GPU 或边缘设备上运行本地大模型的用户将是重大利好。这表明以效率为导向的小型架构也能在长上下文任务上与更大的模型竞争。 这些模型目前无法直接在原版 llama.cpp 上运行——支持正在等待 llama.cpp PR #27868 合并，XHToken 发布的 GGUF 量化版本暂时需要作者自制的 llama.cpp 分支。由于这是全新自研架构而非微调模型，实际质量（尤其是有效长上下文召回能力，通常低于标称上下文上限）尚待验证。 有探索精神的用户可以从 Hugging Face 下载官方 GGUF 文件（XHToken/Spark-X2.5-1.7B-GGUF 或 -4B-GGUF），并从 Spark-X2.5 的 GitHub 仓库编译作者定制的 llama.cpp 分支进行测试；其他用户可以关注 PR 27868 是否合并入主线。

reddit · r/LocalLLaMA · /u/insraq · 9月1日 14:35

**背景**: 大多数小型开源模型（如 Llama、Qwen 系列）都复用 llama.cpp 等推理引擎已原生支持的成熟架构。当模型采用自研架构时，引擎需要合并新代码才能运行 GGUF 文件，这就是本发布依赖 PR 27868 的原因。GGUF 是 llama.cpp 进行本地推理的标准量化文件格式。需要注意的是，宣称的上下文窗口只是标称上限——研究表明有效工作记忆可能在远未达到上限时就已退化。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/XHToken/Spark-X2.5">GitHub - XHToken/ Spark - X 2 . 5 : Spark - x 2 . 5 open model series.</a></li>
<li><a href="https://news.aibase.com/news/30716">iFLYTEK to Launch Spark X 2 . 5 General Large Model</a></li>
<li><a href="https://towardsdatascience.com/your-1m-context-window-llm-is-less-powerful-than-you-think/">Your 1M+ Context Window LLM Is Less Powerful Than You Think | Towards Data Science</a></li>

</ul>
</details>

**社区讨论**: 该 Reddit 帖子还只是早期发现帖，尚无实质性讨论；发帖人询问是否有人试过这些模型，随后补充了 GGUF 量化版本的链接。

**标签**: `#local-llm`, `#open-source-models`, `#llama.cpp`, `#small-language-models`, `#long-context`

---

<a id="item-9"></a>
## [ChatGPT/Codex 桌面应用缓存 1.7GB 运行时捆绑包，内含 LibreOffice](https://simonwillison.net/2026/Sep/1/codex-libreoffice/) ⭐️ 5.0/10

Simon Willison 发现 OpenAI Codex 桌面应用（已更名为 ChatGPT）在 ~/.cache/ 下有一个 1.7GB 的 codex-primary-runtime 文件夹，包含完整的 Python 和 Node.js 安装，以及 Poppler、git 和 LibreOffice 的原生二进制文件。该捆绑包位于 ~/.cache/codex-runtimes/ 下，还包含指导 Codex 如何使用这些二进制文件的插件“技能”。 这揭示了 AI 编程代理如何内置独立、沙箱化的工具链，从而在不依赖用户系统环境的情况下执行代码和处理文档。对开发者和高级用户来说，这既解释了磁盘空间被悄悄占用的原因，也提供了一种打包可复现运行时的思路。 具体构成为：771MB 原生二进制文件（其中 libreoffice-headless 429.7MB、poppler 187.9MB、git 148.1MB）、446.4MB 的 node 和 440.6MB 的 python。相关技能文件位于 ~/.cache/codex-runtimes/codex-primary-runtime/plugins/openai-primary-runtime/plugins/documents 目录。 在自己的机器上运行 OmniDiskSweeper 或执行 `du -sh ~/.cache/*`，检查 ~/.cache/codex-runtimes/ 目录，查看 ChatGPT/Codex 应用安装了什么，并浏览 plugins/skills 文件夹以了解它提供了哪些能力。

rss · Simon Willison · 9月1日 19:03

**背景**: OpenAI 的 Codex 是一个编程代理，后来演变为 ChatGPT 桌面应用，增加了计算机操作、浏览、插件和多代理工作流等功能。为了可靠地运行生成的代码并处理 PDF、Office 文档等文件，该应用内置了固定版本的解释器和工具，而不依赖宿主机上已安装的软件。Poppler 是一个开源的 PDF 渲染库，LibreOffice（2010 年从 OpenOffice.org 分叉而来）可进行无头模式的文档转换。Willison 是在使用 macOS 免费磁盘分析工具 OmniDiskSweeper 时发现这个捆绑包的。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://openai.com/index/codex-for-almost-everything/">Codex for (almost) everything - OpenAI</a></li>
<li><a href="https://en.wikipedia.org/wiki/OmniDiskSweeper">OmniDiskSweeper - Wikipedia</a></li>
<li><a href="https://poppler.freedesktop.org/">Poppler</a></li>

</ul>
</details>

**标签**: `#openai`, `#codex`, `#desktop-apps`, `#disk-usage`, `#ai-tooling`

---

<a id="item-10"></a>
## [Python 3.15.0 候选版本 2 发布，正式版定于十月推出](https://simonwillison.net/2026/Sep/1/python-315-rc-2/) ⭐️ 5.0/10

Python 3.14 和 3.15 的发布经理 Hugo van Kemenade 宣布了 Python 3.15.0 候选版本 2（RC2），正式版 3.15.0 计划于 2026 年 10 月 1 日发布。从该候选版本到正式版之间，只允许合并经过审核的明确缺陷修复。 发布经理强烈建议第三方包的维护者现在就构建并发布适用于 Python 3.15 的 wheel 到 PyPI，以便在十月正式版发布时生态系统已准备就绪。基于候选版本构建的二进制 wheel 保证可与未来的 3.15.x 版本兼容，因此现在是构建的最佳时机。 由于候选版本阶段 ABI 已经锁定，基于 3.15.0 RC 构建的 wheel 可用于未来所有 Python 3.15 版本。该 RC 尚未进入 GitHub Actions 的 python-versions，使用 actions/setup-python 并设置 allow-prereleases 和 check-latest 标志后，版本上线时会自动切换。 在 GitHub Actions 测试矩阵中加入 "3.15"，使用 actions/setup-python 并设置 allow-prereleases: true 和 check-latest: true，这样现在会自动测试 RC2，之后自动切换到稳定版。如果你维护着包含二进制 wheel 的包，请在此 RC 阶段构建并向 PyPI 发布 3.15 的 wheel。

rss · Simon Willison · 9月1日 14:59

**背景**: Python 采用年度发布周期，在十月正式版之前依次经历 alpha、beta 和候选版本（RC）阶段；RC 阶段只接受缺陷修复，且 ABI 被冻结。wheel 是 PyPI 上 Python 包的标准二进制分发格式，二进制 wheel 绑定特定的 CPython ABI 版本，因此每个新的 Python 版本都需要重新构建。Simon Willison 指出，在 RC 阶段而非发布后进行测试可以赶在缺陷随正式版流出之前发现它——他曾因未在 RC 期间测试而在 Python 3.10 正式发布后才发现一个 bug。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.python.org/downloads/release/python-3150rc2/">Python Release Python 3.15.0rc2 | Python .org</a></li>
<li><a href="https://briefly.co/anchor/Python/story/python-3150-beta-4-is-here--python-insider">Python 3.15.0 beta 4 is here! | Python Insider - Briefly</a></li>

</ul>
</details>

**标签**: `#python`, `#release`, `#packaging`, `#pypi`

---

<a id="item-11"></a>
## [GitHub Copilot 代码审查现在可以批准拉取请求](https://github.blog/changelog/2026-09-01-copilot-code-review-can-now-approve-pull-requests) ⭐️ 5.0/10

GitHub 宣布 Copilot 代码审查现在可以在判断拉取请求已就绪时正式批准它，前提是组织管理员启用该功能。该批准能力默认关闭，需要管理员显式开启。 这使得 AI 审查可以计入分支保护的批准要求，可能加快信任自动化审查的团队的合并流程。同时也带来治理问题：团队应该把多少批准权限委托给 AI。 该功能默认禁用，管理员必须显式授权 Copilot 签署批准。变更日志几乎没有技术细节，团队应查阅 GitHub 的 Copilot 代码审查文档以了解配置方法以及与分支保护规则的交互方式。 如果你是 GitHub 组织管理员，请查看 Copilot 代码审查的设置和文档，决定是否启用 AI 批准，并考虑将其与分支保护规则结合，对关键分支仍要求至少一次人工审查。

rss · GitHub Changelog · 9月1日 19:25

**背景**: GitHub Copilot 代码审查会审查拉取请求的改动、建议修复，并通过 GitHub Actions 运行代理能力。此前 Copilot 只能评论或建议修改，正式批准必须来自人类审查者才能满足分支保护要求。允许 AI 批准改变了 GitHub 对审查关卡的处理方式，因为拉取请求批准是大多数团队在合并前保证代码质量的机制。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://docs.github.com/en/copilot/concepts/agents/code-review">About GitHub Copilot code review</a></li>
<li><a href="https://docs.github.com/en/copilot/how-tos/use-copilot-agents/request-a-code-review/use-code-review">Using GitHub Copilot code review</a></li>

</ul>
</details>

**标签**: `#GitHub Copilot`, `#AI code review`, `#developer tools`, `#automation`

---