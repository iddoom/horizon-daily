---
layout: default
title: "Horizon Summary: 2026-09-01 (ZH)"
date: 2026-09-01
lang: zh
---

> 从 45 条内容中筛选出 7 条重要资讯。

---

1. [从零训练的小型 Transformer 以 67 美分在 ARC-AGI-1 上达到 44%](#item-1) ⭐️ 8.0/10
2. [Qwen3.8-27B 在单张 RTX 3090 上实现每秒 2000 token 预填充](#item-2) ⭐️ 8.0/10
3. [EFF 呼吁法院：不要因 AI 热潮改写版权法](#item-3) ⭐️ 7.0/10
4. [Python 指导委员会暂停 JIT 新开发，等待 PEP 通过](#item-4) ⭐️ 7.0/10
5. [Qwen 3.8 27B 本地一次性生成可玩的超级马里奥克隆](#item-5) ⭐️ 6.0/10
6. [Google Play 封禁 AnkiDroid 的 Open Collective 捐赠链接](#item-6) ⭐️ 5.0/10
7. [Python 3.15.0 第二个候选版本发布，正式版十月将至](#item-7) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [从零训练的小型 Transformer 以 67 美分在 ARC-AGI-1 上达到 44%](https://mvakde.github.io/blog/44-on-arc-1/) ⭐️ 8.0/10

一位独立研究者从零训练了一个小型 Transformer（既不是 LLM 也不是 LLM 微调），在 ARC-AGI-1 上取得 44%的成绩，总训练成本仅 67 美分。此前在该基准上的进展主要靠 LLM 或其微调版本，训练成本极高。 它证明了无需依赖大语言模型即可低成本攻克复杂的推理基准，降低了独立研究者的门槛。该方法可复现，并促使人们重新思考多少能力真正需要巨大规模。 一个关键争议是“在测试集上训练”的批评：模型在预训练中见过评测题目的输入（但未见过标签）。作者辩称这不构成作弊，因为 ARC 是一个元学习基准，本就应从评测题目中学习，而“训练在测试集上”特指训练测试标签。 阅读作者博客 mvakde.github.io/blog/44-on-ARC-1/，审查其方法论及关于数据泄漏的讨论；鉴于训练成本极低，可以尝试复现该训练。

hackernews · porridgeraisin · 9月1日 09:52 · [社区讨论](https://news.ycombinator.com/item?id=49519939)

**背景**: ARC-AGI-1 于 2019 年推出，通过新颖的视觉网格变换谜题测试系统性泛化和组合推理能力，超越表面统计模式。尽管 LLM 预训练规模扩大了约 5 万倍，它长期是最难的 AI 基准之一，并在 2024 年 12 月 OpenAI 展示 o3-preview 时被重点提及。历史上的高分大多来自 LLM 或昂贵的专用系统。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://arcprize.org/arc-agi/1">ARC-AGI-1</a></li>
<li><a href="https://epoch.ai/benchmarks/arc-agi">ARC-AGI-1 | Epoch AI</a></li>

</ul>
</details>

**社区讨论**: 作者积极参与讨论，澄清这是从零训练的小型 Transformer 而非 LLM，并说明在 ARC 的元学习设定下使用评测题目输入（而非标签）是合理的。评论者要求更通俗地解释“测试集训练”的批评，也有人指出此前博客社区笔记中提到的预训练输入泄漏问题。

**标签**: `#machine-learning`, `#ARC-AGI`, `#transformers`, `#benchmarks`, `#efficiency`

---

<a id="item-2"></a>
## [Qwen3.8-27B 在单张 RTX 3090 上实现每秒 2000 token 预填充](https://www.reddit.com/r/LocalLLaMA/comments/1w49id7/i_pushed_qwen3827b_to_2000_prefill_per_second_and/) ⭐️ 8.0/10

一位开发者将 Qwen3.8-27B 在单张 RTX 3090 上的推理优化到每秒约 2000 token 的预填充速度（此前约为 1300），解码速度达到每秒 132 token。预填充的提升主要来自一个自定义内核，它在 int8 精度下与 fp32 质量达到 0.99997 的相似度，代码已在 GitHub 上开源。 这表明只要投入自定义内核和投机解码等优化，消费级硬件就能以极低质量损失高速运行 27B 模型。开源代码和具体性能数字为本地大模型从业者提供了可复用的预填充/解码优化方案，而非泛泛之谈。 作者认为在出现更好草稿模型之前，解码速度已接近极限，因此将重心转向预填充；预填充测试是在 4k 上下文长度下进行的。与 fp32 达到 0.99997 相似度的 int8 自定义内核是关键技术贡献，意味着量化误差在这里几乎可以忽略。 克隆仓库 https://github.com/syv-ai/qwen38-27b-rtx3090，在你自己的 GPU 上跑基准测试，看看 int8 预填充内核和解码方案在你的工作负载下表现如何。

reddit · r/LocalLLaMA · /u/iamMess · 9月1日 11:43

**背景**: 大模型推理分为两个阶段：预填充阶段处理输入上下文（决定首 token 延迟），解码阶段逐个生成 token。投机解码通过一个更小的草稿模型提出候选 token，再由大模型并行验证，从而加速解码。Int8 量化将权重和激活压缩为 8 位整数以降低计算量和显存带宽消耗，而编写自定义 GPU 内核（如用 Triton 或 CUTLASS）可以融合算子，在不损失质量的情况下恢复大部分速度。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.parasail.io/blog/prefill-vs-decode-llm-inference">Prefill vs . decode in LLM inference</a></li>
<li><a href="https://neurips2024-enlsp.github.io/papers/paper_68.pdf">Speculative Diffusion Decoding</a></li>
<li><a href="https://blog.speechmatics.com/gpu-quantisation">Fast and Accurate GPU Quantization for Transformers | Speechmatics</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#inference-optimization`, `#custom-kernels`, `#quantization`, `#gpu`

---

<a id="item-3"></a>
## [EFF 呼吁法院：不要因 AI 热潮改写版权法](https://www.eff.org/deeplinks/2026/08/eff-courts-dont-rewrite-copyright-over-ai-hype) ⭐️ 7.0/10

电子前哨基金会（EFF）发文，敦促法院不要因 AI 训练争议而改写或扩张版权法。此时正值相关诉讼进行中，包括美国联邦法院在 Bartz 诉 Anthropic 案中裁定，在合法取得的版权书籍上训练模型构成合理使用。 这些案件的结局将决定普通 AI 用户、开发者和研究者能否合法地在版权数据上训练模型，以及新限制是否会波及日常的合理使用行为。它还影响开源许可体系，因为法院确立的规则可能重塑 copyleft 代码在 AI 系统中的流转方式。 EFF 的核心观点是：版权是有限定的法定契约，不是让创作者控制一切下游用途的工具，法院不应仅因 AI 是新事物就扩大其范围。美国版权局也认为 AI 训练并非一概属于合理使用，结论取决于具体情境，例如作品如何取得（Anthropic 案部分取决于其使用了盗版书籍）。 如果你在版权数据上训练或部署模型，请阅读 EFF 的完整文章，并关注主要的 AI 版权案件（如 Bartz 诉 Anthropic 案）和版权局的 AI 报告。如果你的工作依赖 copyleft 代码，请审视模型输出和许可条款如何处理源自 GPL 的材料。

hackernews · DeepLogin · 9月1日 12:53 · [社区讨论](https://news.ycombinator.com/item?id=49521315)

**背景**: 合理使用是美国法律原则，允许在未经许可的情况下有限使用版权作品，判断因素包括目的、性质、数量和市场影响。Copyleft（如 GPL 许可证）利用版权法要求衍生作品以相同许可保持开放。近期的 AI 判决——例如 Anthropic 案认定训练构成合理使用但获取盗版不合法——造成了 HN 评论者指出的不对称：个人受严格的合理使用限制，而 AI 公司却大规模利用合理使用。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.gnu.org/licenses/copyleft.en.html">What is Copyleft ? - GNU Project - Free Software Foundation</a></li>
<li><a href="https://distillation.technology/learn/is-ai-training-fair-use">Is AI Training Fair Use ? What Bartz v. Anthropic Actually</a></li>
<li><a href="https://copyrightalliance.org/copyright-offices-ai-report-takeaways/">5 Takeaways from the Copyright Office’s Report on Generative AI ...</a></li>

</ul>
</details>

**社区讨论**: 评论者普遍认为现行规则感觉不对称：teeray 指出几十年来合理使用对个人执行严厉，而 AI 公司却像挥舞大锤一样借其获利。fny 提出“copyleft 洗白”问题——专有 LLM 可以吸收 copyleft 代码而无需开放自身权重。其他人主张结构性改革：trashburger 建议版权期限改为 20 年（类似专利），anonyfox 主张彻底废除日常版权，gwbas1c 则希望在创作者获酬与公众非预期使用之间取得平衡。

**标签**: `#copyright`, `#AI policy`, `#fair use`, `#legal`, `#EFF`

---

<a id="item-4"></a>
## [Python 指导委员会暂停 JIT 新开发，等待 PEP 通过](https://lwn.net/Articles/1090385/) ⭐️ 7.0/10

今年六月，Python 指导委员会宣布，在一个证明 JIT 应成为受支持组件的 PEP 被接受之前，除错误和安全修复外，JIT 的新开发不得进入 CPython 主分支。由此产生了 PEP 836（《JIT Go Brrr：通往 CPython 受支持 JIT 编译器之路》），目前正在讨论中。 这一决定影响 Python 运行时性能演进的节奏，因为 JIT 是多年来 CPython 执行方式最重大的变化。它也展示了项目治理机制的正常运作：重大架构变更必须通过 PEP 流程，而不能非正式地合入。 暂停仅针对主分支，仍允许错误和安全修复；JIT 本身已按照 PEP 744 作为实验性、默认关闭的特性合入 Python 3.13。PEP 836 旨在论证将 JIT 变成 CPython 受支持（非实验性）组件的理由，但其被接受的时间尚不确定。 如果你关注或依赖 CPython 性能进展，可阅读 PEP 836 并跟踪 discuss.python.org 上的相关讨论；由于 JIT 仍是实验性且默认关闭的，无需进行任何代码改动。

rss · LWN.net · 9月1日 14:40

**背景**: 即时（JIT）编译器在运行时将字节码转换为机器码，能够基于实际运行时行为进行优化，而非提前编译全部代码。CPython 的 JIT 于 2024 年初合入主分支，并在 Python 3.13 中以实验性方式发布。Python 指导委员会是依据 PEP 13 选出的、负责语言方向的小组，它以 PEP（Python 增强提案）作为接受重大设计变更的正式机制。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://peps.python.org/pep-0744/">PEP 744 – JIT Compilation - Python Enhancement Proposals</a></li>
<li><a href="https://realpython.com/ref/glossary/python-steering-council/">Python Steering Council | Python Glossary – Real Python</a></li>
<li><a href="https://realpython.com/ref/glossary/jit-compiler/">JIT compiler | Python Glossary – Real Python</a></li>

</ul>
</details>

**标签**: `#python`, `#cpython`, `#jit-compiler`, `#performance`, `#governance`

---

<a id="item-5"></a>
## [Qwen 3.8 27B 本地一次性生成可玩的超级马里奥克隆](https://www.reddit.com/r/LocalLLaMA/comments/1w4821c/qwen_38_27b_q4km_oneshot_a_super_mario_clone/) ⭐️ 6.0/10

一位 Reddit 用户在配备 4070ti（12GB 显存）的 PC 上通过 llama.cpp 本地运行 Qwen 3.8 27B（Q4_K_M GGUF），一次性生成了一个完整可玩、自包含的超级马里奥克隆。该运行使用简单的提示词、64k 上下文、xhigh 思考模式，平均速度 7.6 tokens/秒，耗时 117 分钟。 这是一个具体的能力基准，表明中等规模的开源权重模型在普通消费级硬件上就能一次性生成一个不小的交互式应用，可供开发者评估本地模型的实际能力。作者分享的配置（llama.cpp 设置、RPC 连接、提示词）也让其他人容易复现。 该设置通过 llama.cpp 的 RPC 后端将推理分布在 Macbook M5 Air 和 Windows PC 两台机器上，使用 Q4_K_M 量化、8 位 KV 缓存、MTP=1，以及 minimal 模式的 DeepSeek harness。7.6 tokens/秒、耗时 117 分钟的速度较慢，反映了硬件有限和长一次性输出，而非典型的交互式编码工作流。 尝试复现这个演示：下载 Qwen 3.8 27B 的 Q4_K_M GGUF 文件，通过 llama.cpp 以 64k 上下文和 xhigh 思考模式运行，并让它生成一个完全自包含的 HTML 小游戏，看看在你的硬件上的表现。

reddit · r/LocalLLaMA · /u/zannix · 9月1日 10:31

**背景**: Q4_K_M 是常用推荐的 GGUF 量化格式，能以极小的质量损失大幅压缩模型显存占用，使 27B 模型可以部分装入 12GB 显存的 GPU。llama.cpp 的 RPC 功能可以让一台机器将张量计算卸载到远程 ggml-rpc-server 实例，从而跨设备汇集显存和内存。“一次性生成”意味着模型在单次补全中输出整个游戏代码而无需迭代修复，这是对长输出代码连贯性的高难度测试。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/ggml-org/llama.cpp/blob/master/tools/rpc/README.md">llama . cpp /tools/ rpc /README.md at master · ggml-org/ llama . cpp</a></li>
<li><a href="https://www.promptquorum.com/local-llms/llm-quantization-explained">Q 4 _ K _ M vs Q 4 _0 vs Q8_0: LLM Quantization Explained (2026)</a></li>
<li><a href="https://en.wikipedia.org/wiki/Qwen">Qwen - Wikipedia</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#qwen`, `#llama.cpp`, `#code-generation`, `#benchmark`

---

<a id="item-6"></a>
## [Google Play 封禁 AnkiDroid 的 Open Collective 捐赠链接](https://github.com/ankidroid/Anki-Android/issues/21656) ⭐️ 5.0/10

Google Play 以 Play 结算规则为由拒绝了 AnkiDroid 指向 Open Collective 的捐赠链接，禁止应用内使用替代性捐赠渠道。拒绝理由涉及税务状态的技术细节，在 Hacker News 上引发了对应用商店把关行为的讨论。 通过 Google Play 分发免费应用的开源维护者需要知道，捐赠链接受严格且有时不一致的政策约束执行，这可能切断项目唯一的收入来源。此案也说明了保留 F-Droid 等其他分发渠道作为后备的重要性。 Google 政策禁止对“免税捐赠”使用 Play 结算；Open Source Collective 属于 501(c)(6)（组织免税但捐赠不可抵税），评论者指出拒绝可能源于 Google 的措辞与该状态和 501(c)(3) 慈善机构之间的不匹配。Google 在 2019 年也曾有类似操作，将 WireGuard 从 Play 商店下架。 如果你在 Play 上维护开源应用，请核查 Google 的捐赠政策以及你所在财政托管方的税务状态；考虑只在官网而非应用内放置捐赠链接，并确保应用在 F-Droid 上可用，作为不受该政策影响的渠道。

hackernews · hexa555 · 9月1日 10:11 · [社区讨论](https://news.ycombinator.com/item?id=49520022)

**背景**: AnkiDroid 是一款流行的免费开源 Android 记忆卡片应用。Google Play 的结算政策限制应用接受付款和捐赠的方式，在很多情况下实际上要求使用 Play 自身的结算系统或禁止某些链接。Open Source Collective 以 501(c)(6) 会员组织的形式为许多开源项目托管财务，与捐赠可抵税的 501(c)(3) 慈善机构不同。项目也可以通过 F-Droid 等 Play 之外的渠道分发，不受此类支付限制。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://support.google.com/googleplay/?hl=en">Google Play Help</a></li>

</ul>
</details>

**社区讨论**: 评论者大多批评 Google 的把关行为，引用 2019 年 WireGuard 被下架的先例，主张软件分发不应被单一垄断者控制；有人认为应用应退出 Play 商店转投 F-Droid。也有人提出更细致的分析，认为拒绝的原因是 501(c)(6) 的捐赠在 Google 的定义下并不属于“免税捐赠”；还有评论者直接向 AnkiDroid 捐款以示支持。

**标签**: `#google-play`, `#open-source`, `#app-distribution`, `#policy`, `#monetization`

---

<a id="item-7"></a>
## [Python 3.15.0 第二个候选版本发布，正式版十月将至](https://simonwillison.net/2026/Sep/1/python-315-rc-2/) ⭐️ 5.0/10

Python 3.14 和 3.15 的发布经理 Hugo van Kemenade 宣布了 Python 3.15.0 的第二个（也是最后一个）候选版本，正式版计划于十月发布，在此之前只允许合入明确的错误修复。 官方强烈建议第三方 Python 项目维护者现在就在 PyPI 上构建并发布 Python 3.15 的 wheel 包，因为基于候选版本构建的 wheel 保证可以在最终的 3.15.0 上运行。在候选阶段测试自己的项目还能在正式发布前发现 bug——Simon Willison 曾因未在 RC 阶段测试而让 Python 3.10 的一个 bug 溜进了正式版。 该候选版本尚未在 GitHub Actions 上提供预装，因此 setup-python 需要 allow-prereleases 和 check-latest 两个标志才能自动获取 RC 版本（并在之后自动切换到正式版）。在 RC2 与正式版之间，只允许经过评审的 bug 修复类代码变更。 在 CI 测试矩阵中加入 "3.15"，使用 actions/setup-python@v7 并设置 allow-prereleases: true 和 check-latest: true，修复测试中发现的问题后向 PyPI 发布 3.15 的 wheel 包。

rss · Simon Willison · 9月1日 14:59

**背景**: 候选版本（Release Candidate，RC）是功能完整、代码冻结的预发布版本，如果没有发现严重 bug 就会成为正式版。wheel（.whl 文件）是 Python 的标准二进制分发格式，包含针对特定平台编译的代码，用户无需自己安装编译器。CPython 遵循每年一次的发布周期，新版本通常在十月定稿，因此 RC 阶段是在正式发布前发现回归问题的最后机会。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://tms-outsource.com/blog/posts/what-is-a-software-release-candidate/">What Is a Software Release Candidate ?</a></li>
<li><a href="https://cantera.org/dev/develop/distribution-packages/pypi-sdist-wheel.html">Distributing sdist and Wheel Packages via PyPI</a></li>

</ul>
</details>

**标签**: `#python`, `#release`, `#packaging`, `#pypi`

---