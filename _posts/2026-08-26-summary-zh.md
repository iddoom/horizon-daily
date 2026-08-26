---
layout: default
title: "Horizon Summary: 2026-08-26 (ZH)"
date: 2026-08-26
lang: zh
---

> 从 39 条内容中筛选出 8 条重要资讯。

---

1. [社区基准测试：Ornith 1.5 与 Tiel-Coder 成为 Qwen 35B-A3B 工具调用最佳微调](#item-1) ⭐️ 7.0/10
2. [EVE Online 开始从 Stackless Python 2.7 迁移到 Python 3](#item-2) ⭐️ 6.0/10
3. [MIT 研究：AI 聊天机器人短期提升新闻辨别力，长期存隐患](#item-3) ⭐️ 6.0/10
4. [mklinux v7.0-mk2 发布：无需管理程序在裸机上运行多个 Linux 内核](#item-4) ⭐️ 6.0/10
5. [Python 的预声明常量：__debug__ 与其他怪癖](#item-5) ⭐️ 5.0/10
6. [X 向开源项目 Nitter 发送停止侵权通知，指控其抓取数据](#item-6) ⭐️ 5.0/10
7. [加拿大宣布对美国商品征收最高 50%的报复性关税](#item-7) ⭐️ 5.0/10
8. [IBM 发布 Granite Speech 5.0 Turbo CTC，实现极速本地语音转录](#item-8) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [社区基准测试：Ornith 1.5 与 Tiel-Coder 成为 Qwen 35B-A3B 工具调用最佳微调](https://www.reddit.com/r/LocalLLaMA/comments/1vyaxip/35ba3b_tool_calling_benchmark_original_qwen_vs/) ⭐️ 7.0/10

一位 Reddit 用户使用 tool-eval-bench 2.6.0 的 hard 模式，对 13 个 GGUF 文件各运行 5 次（共 65 次运行、超过 300 GPU 小时），比较了 Qwen3.6-35B-A3B 各微调版本的工具调用能力。Ornith 1.5（144.2 分）与 Tiel-Coder（144.0 分）并列第一，超过了 Qwen3.6-27B（134.8 分），并接近 Qwen3.8-27B（152.6 分），满分为 176 分。 对于在显存受限硬件（如 32GB GPU）上运行智能体 LLM 的用户，这份带置信区间的测试为工具调用场景的微调模型选择提供了具体依据，而非凭感觉挑选。它还表明调校得当的 MoE 微调可以在相同显存占用下超越更大的稠密模型。 测试使用 llama.cpp、q8_0 KV 缓存、约 Q4 量化（15-22GB）、262144 上下文并施加 50% 上下文压力（约 128k 干扰性历史），88 个 hard 模式测试按 2/1/0 计分。KAT-Coder（133.8 分）仅略优于原版 35B-A3B（131.5 分），而 Ornith-1.5-Heretic（132.2 分）反而不如基础版 Ornith 1.5。 如果你在本地用 Qwen3.6-35B-A3B 做智能体工具调用，可以尝试 Ornith 1.5 或 Tiel-Coder 的 Q4 附近 GGUF 量化版本并配合 q8_0 KV 缓存，也可以用 tool-eval-bench --hardmode 在自己的硬件上复现该测试。

reddit · r/LocalLLaMA · /u/OsmanthusBloom · 8月25日 20:07

**背景**: Qwen3.6-35B-A3B 是一个混合专家（MoE）模型，总参数 35B 但每次仅激活约 3B，经 Q4 等 GGUF 量化后可在消费级 GPU 上运行。工具调用是 LLM 作为智能体调用外部函数的核心能力，tool-eval-bench 等基准会在包含长且具干扰性的上下文等真实条件下测试其准确性。KAT-Coder、Ornith、Tiel-Coder 等微调版本是社区基于同一底座训练、旨在提升编码和工具使用等技能的模型。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://unsloth.ai/docs/models/qwen3.6">Run the new Qwen 3 . 6 -27B and 35 B - A 3 B models locally!</a></li>
<li><a href="https://gorilla.cs.berkeley.edu/leaderboard.html">Berkeley Function Calling Leaderboard (BFCL) V4</a></li>
<li><a href="https://shaam.blog/articles/qwen-3-6-35b-a3b-moe-model-guide">Qwen 3 . 6 - 35 B - A 3 B : The Local-First MoE Model That Beats Google at...</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#tool-calling`, `#benchmark`, `#qwen`, `#fine-tuning`

---

<a id="item-2"></a>
## [EVE Online 开始从 Stackless Python 2.7 迁移到 Python 3](https://simonwillison.net/2026/Aug/25/eve-online-move-to-python-3/) ⭐️ 6.0/10

CCP Games 宣布 EVE Online 开始从 2010 年启用的 Stackless Python 2.7 迁移到 Python 3，将对 240 万行代码运行 futurize 脚本。随后团队需要人工审查约 2 万处 Python 2 与 Python 3 行为不一致的地方，例如整数除法（1 / 2 在 Python 2 中结果是 0，而在 Python 3 中是 0.5）。 这是世界上规模最大、运行时间最长的 Python 代码库之一终于告别 Python 2，对任何面对大规模遗留系统迁移的人都具有参考价值。240 万行代码和约 2 万处行为差异点的规模，真实展示了这类迁移的实际成本。 公告只涉及 Python 2 到 3 的语言迁移，并未说明如何替代 Stackless 本身——该项目已于 2025 年 2 月正式停止维护，GitHub 仓库被归档。不过 CCP 在去年的大会上做了题为 'Scheduling in Carbon: Leaving Stackless Python Behind' 的演讲，介绍了他们在 EVE Frontier 的 Carbon 引擎中如何用现已开源的 carbonengine/scheduler 库替代 Stackless。 可以在 YouTube 上观看 CCP 的演讲 'Scheduling in Carbon: Leaving Stackless Python Behind'，并研究开源的 carbonengine/scheduler 仓库，了解他们在 EVE Frontier 中如何解决 Stackless 的替代问题。如果你也在维护 Python 2 遗留代码，可以阅读 futurize 文档，作为规划自己迁移工作的起点。

rss · Simon Willison · 8月25日 22:59

**背景**: Stackless Python 是一个增强版 Python 解释器，其标志性特性是通过微线程（tasklet）实现轻量级并发，还提供协程、通道和任务序列化；EVE Online 自 2003 年上线以来一直基于它运行。python-future 项目中的 futurize 脚本会通过自动修复器将 Python 2 代码转换为合法的 Python 3 代码，并添加兼容性导入。整数除法这类行为差异在移植时尤其危险，因为它们不会抛出语法错误，而是悄悄改变结果。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Stackless_Python">Stackless Python</a></li>
<li><a href="https://python-future.org/futurize.html">futurize: Py2 to Py2/3 — Python-Future documentation</a></li>
<li><a href="https://sebastianraschka.com/Articles/2014_python_2_3_key_diff.html">Python 2 vs 3 Key Differences | Sebastian Raschka, PhD</a></li>

</ul>
</details>

**标签**: `#python`, `#legacy-migration`, `#python-2-to-3`, `#case-study`, `#game-development`

---

<a id="item-3"></a>
## [MIT 研究：AI 聊天机器人短期提升新闻辨别力，长期存隐患](https://www.technologyreview.com/2026/08/25/1140958/your-brain-on-ai/) ⭐️ 6.0/10

MIT 媒体实验室 Pattie Maes 及其同事的研究发现，在为期四周的实验中，使用 AI 聊天机器人评估成对新闻标题和图片的参与者，最初辨别内容的准确率高出 21%。但研究也指出，长期依赖 AI 获取新闻会带来显著问题。 这对越来越多将 AI 助手作为主要新闻获取方式的人具有重要意义：短期的准确率提升可能掩盖长期的认知代价。该发现对任何设计或使用 AI 介入式信息工作流的人都有可借鉴的启示。 该研究为期四周，测量参与者辨别真实与误导性新闻标题和图片的准确率，使用 AI 的组别起初高出 21%。由于原文内容被截断，具体的长期认知或依赖性影响细节在现有材料中未展开。 阅读 MIT Technology Review 的完整文章以了解研究指出的具体长期影响，并在自己的信息工作流中把 AI 聊天机器人视为直接阅读新闻的补充而非替代。

rss · MIT Technology Review · 8月25日 21:00

**背景**: MIT 媒体实验室是麻省理工学院著名的跨学科研究实验室，专注于技术、媒体与人类行为的交叉领域。Pattie Maes 是该实验室教授，研究方向为人机交互与人工智能，并联合主持实验室的“Advancing Humans with AI (AHA)”研究项目。随着 AI 聊天机器人日益成为信息的把关者，研究人员正在研究这种中介方式如何影响批判性思维、媒介素养以及用户独立评估信息的能力。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Pattie_Maes">Pattie Maes - Wikipedia</a></li>
<li><a href="https://www.media.mit.edu/people/pattie/overview/">Person Overview ‹ Pattie Maes – MIT Media Lab</a></li>

</ul>
</details>

**标签**: `#AI`, `#research`, `#human-computer interaction`, `#media literacy`, `#cognition`

---

<a id="item-4"></a>
## [mklinux v7.0-mk2 发布：无需管理程序在裸机上运行多个 Linux 内核](https://lwn.net/Articles/1090582/) ⭐️ 6.0/10

Cong Wang 发布了 mklinux v7.0-mk2，该版本允许一台机器在裸机上同时运行多个独立的 Linux 内核。宿主内核将 CPU、内存和 PCI 设备划分为多个实例，并通过 kexec_file_load() 在每个实例中启动一个派生内核，全程无需管理程序、模拟或陷入处理。 这提供了一种无需管理程序的虚拟机替代方案，消除了虚拟化开销，同时提供内核级隔离和裸机性能。研究多内核架构的系统研究人员和运维人员可以研究或复用其资源划分和基于 kexec 的启动方式。 每个派生内核都在自己的 CPU、物理内存和设备上原生运行；除了操作者明确选择共享的资源外，什么都不共享。注意该项目与上世纪 90 年代的 MkLinux 无关，后者是面向 PowerPC Macintosh 的 Linux 移植。 阅读 LWN 邮件列表归档中 Cong Wang 的发布公告，如果有闲置硬件，可以尝试构建并启动 mklinux v7.0-mk2，将一台机器划分为多个内核实例。

rss · LWN.net · 8月25日 20:34

**背景**: 传统虚拟化使用管理程序为客户虚拟机陷入并模拟硬件，会带来额外开销。kexec_file_load() 是一个 Linux 系统调用，可以在不经过固件的情况下从正在运行的内核启动新内核，mklinux 正是利用它来启动额外的内核。多内核思想是将硬件资源分区，让每个内核实例直接拥有自己的资源切片，以灵活性换取隔离性和性能。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.phoronix.com/news/Linux-7.0-mk2-Multikernel">Linux 7.0-mk2 Released For Multi-Kernel Linux With Promising Performance Results - Phoronix</a></li>
<li><a href="https://en.wikipedia.org/wiki/MkLinux">MkLinux - Wikipedia</a></li>

</ul>
</details>

**标签**: `#linux-kernel`, `#systems`, `#virtualization`, `#kexec`, `#open-source`

---

<a id="item-5"></a>
## [Python 的预声明常量：__debug__ 与其他怪癖](https://sebsite.pw/w/20260801-pythonconstants.html) ⭐️ 5.0/10

一篇博客文章探讨了 Python 奇怪的预声明常量，尤其是 __debug__，它是一个编译期常量：在使用 -O 或 PYTHONOPTIMIZE=1 运行时，被 `if __debug__:` 保护的代码块会从字节码中完全省略。文章还回顾了历史上的怪癖，例如 Python 2 中 True/False 可以被重新赋值。 理解 __debug__ 可以解释为什么 assert 语句在优化模式下会消失，以及为什么禁止给 __debug__ 赋值——因为那会破坏编译器的假设。这是 Python 中少数真正的“条件编译”机制之一，可用于实现零开销的调试代码。 __debug__ 和 assert 是 Python 中仅有的两种真正的条件编译结构；编译器在生成字节码时根据 -O 标志将 __debug__ 解析为常量。在 Python 2 中，`True, False = False, True` 是合法的，会让 `if False:` 实际执行；Python 3 将 True、False、None 和 Ellipsis 变成了真正不可重新赋值的常量。 尝试用 `python -O` 运行一个包含 `assert` 和 `if __debug__:` 代码块的脚本，然后用 `dis.dis()` 检查字节码，观察被保护的代码消失了。注意不要在生产逻辑中依赖 assert，因为它们在优化模式下会被移除。

hackernews · rbanffy · 8月25日 21:39 · [社区讨论](https://news.ycombinator.com/item?id=49441033)

**背景**: Python 源代码在执行前会被编译为字节码，编译器可以在这个阶段做出决策。当 Python 以 -O 标志或设置了 PYTHONOPTIMIZE 环境变量运行时，它会移除 assert 语句并省略 `if __debug__:` 代码块，生成优化的 .pyc 文件。历史上，早期的 Python 没有内置的 True/False——用户自己定义 True = 1、False = 0——即使后来加入了这两个名字，Python 2 仍允许重新赋值，直到 Python 3 才将其锁定为常量。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://stackoverflow.com/questions/66470849/compile-time-constants-in-python">debugging - Compile-time constants in Python - Stack Overflow</a></li>
<li><a href="https://realpython.com/lessons/disable-python-assertions/">Disabling Assertions in Production (Video) – Real Python</a></li>
<li><a href="https://www.ancisoft.com/blog/what-is-the-use-of-python-s-basic-optimizations-mode-python-o/">What is Python 's -O Flag? Understanding Basic Optimizations Mode...</a></li>

</ul>
</details>

**社区讨论**: 评论者强调 __debug__ 通过字节码省略实现了真正的条件编译，并解释了它不能被赋值的原因。其他人分享了历史趣闻，例如 Python 2 中 True/False 可以互换，以及 `...`（Ellipsis）表现得像一个硬编码的词法常量。还有一位评论者只是抱怨 Python 的不一致性，以及将 Jupyter notebook 生产化的痛苦。

**标签**: `#python`, `#language-design`, `#programming-trivia`, `#bytecode`

---

<a id="item-6"></a>
## [X 向开源项目 Nitter 发送停止侵权通知，指控其抓取数据](https://techcrunch.com/2026/08/25/x-sends-cease-and-desist-to-open-source-project-nitter-over-alleged-scraping/) ⭐️ 5.0/10

X 已向开源隐私前端项目 Nitter 发出停止侵权函，要求其关闭公共实例并下架代码仓库，理由是涉嫌抓取数据。这是针对一个本就处于法律灰色地带的项目的直接法律升级。 任何依赖 Nitter 获取 RSS 订阅、自动化流程或免登录浏览 X 的用户，一旦实例下线就会失去这些工作流。这也表明平台方越来越倾向于对开源替代前端使用法律手段，对类似项目是一个警示。 停止侵权函本身是非正式的、不具法律约束力，但如果收函方继续相关行为，X 若起诉，可据此支持侵入动产或违反服务条款等主张。据报道此次要求同时涵盖托管实例和源代码仓库，这一点较为罕见，因为发布代码与实际运营抓取服务通常被视为两回事。 如果你依赖 Nitter 提供 RSS 或自动化功能，应先排查哪些订阅源会失效，并在实例消失前迁移到替代方案，例如官方付费 API、RSS 桥接服务或其他前端。

rss · TechCrunch · 8月25日 20:44

**背景**: Nitter 是一个用 Nim 编写的免费开源 X/Twitter 替代前端，让用户无需广告、JavaScript、追踪或账号即可浏览平台内容。它长期被用于生成 RSS 订阅和轻量级的类 API 访问。由于它不通过官方 API 而是直接抓取 X 的内容，一直处于法律灰色地带；2023 年 X 的 API 定价调整已迫使许多实例关闭。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Nitter">Nitter - Wikipedia</a></li>
<li><a href="https://legaloverview.com/is-it-illegal-to-scrape-data/">Is It Illegal to Scrape Data? 2026 US Law Guide</a></li>
<li><a href="https://www.upcounsel.com/cease-and-desist">What is a Cease and Desist ? Everything You Need to... | UpCounsel</a></li>

</ul>
</details>

**标签**: `#nitter`, `#x-twitter`, `#scraping`, `#open-source`, `#legal`

---

<a id="item-7"></a>
## [加拿大宣布对美国商品征收最高 50%的报复性关税](https://www.bbc.co.uk/news/articles/c3v4xg5klx7o?at_medium=RSS&at_campaign=rss) ⭐️ 5.0/10

加拿大宣布对约 200 亿美元的美国商品征收最高 50%的报复性关税，涉及钢铁、家具、新鲜金枪鱼和化妆品等品类。此举是对上周生效的美国关税的回应，此前两国贸易谈判在最后时刻破裂。 拥有美加跨境供应链的企业将面临双边成本上升，因为美国关税已覆盖加拿大对美出口的约 5.5%。采购钢铁、家具或其他被加税商品的制造商应将这些关税纳入成本规划和定价考虑。 加拿大的措施是“对等金额”的报复，规模与美国约 200 亿美元的关税相当，税率最高达 50%。除反制关税外，加拿大还推出了保护本国工人和企业的额外措施。 审查供应链中涉及目标品类（钢铁、家具、海产品、化妆品）的美加跨境商品，并在重新谈判供应商合同前，按最高 50%的关税税率测算成本影响。

rss · BBC World · 8月25日 19:50

**背景**: 关税是对进口商品征收的税费，通常由进口商支付并通过涨价转嫁出去。美国和加拿大本是彼此最大的贸易伙伴，但在美国加征新关税且谈判破裂后，贸易战不断升级。Tax Foundation 等机构估计，美国新关税可能使长期 GDP 下降 0.4%，并减少数十万个就业岗位。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.bbc.com/news/live/cmd94dl9pyqgt">Canada announces response to Trump tariffs as trade war escalates</a></li>
<li><a href="https://www.firstpost.com/world/canada-hits-us-goods-with-tariffs-of-up-to-50-as-trade-war-escalates-14040752.html">Canada hits US goods with tariffs of up to 50% as trade war escalates</a></li>
<li><a href="https://taxfoundation.org/research/federal-tax/trump-tariffs-trade-war/">Tracking the Impact of the Trump Tariffs & Trade War - Tax Foundation</a></li>

</ul>
</details>

**标签**: `#trade-war`, `#tariffs`, `#manufacturing`, `#supply-chain`, `#economics`

---

<a id="item-8"></a>
## [IBM 发布 Granite Speech 5.0 Turbo CTC，实现极速本地语音转录](https://www.reddit.com/r/LocalLLaMA/comments/1vya9ok/granite_speech_50_turbo_ctc_extremely_fast_and/) ⭐️ 5.0/10

IBM 发布了 Granite Speech 5.0 Turbo CTC，这是一个 4700 万参数的语音转文字模型，已在 Hugging Face 上提供，它去掉了解码器，采用纯 CTC 架构进行英语转录。该模型宣称转录速度极快且准确，并在 OpenASR 排行榜的公开测试集上报告了结果。 基于 CTC 的模型比编码器-解码器架构的 ASR 系统快得多，因为它避免了自回归束搜索解码，因此非常适合实时和本地转录工作流。对于运行本地 AI 管道的用户来说，当速度比标点符号或复杂格式更重要时，这提供了一个可替代 Whisper 类模型的开源选择。 该模型有两个变体（granite-speech-5.0-470m-turboctc 和 -nc 变体），每个都有 4.7 亿参数，仅专注于英语语音转文字。它们使用自然数据与合成数据混合训练，而 CTC 模型通常输出无标点的小写文本，可能需要后处理来提升可读性。 从 Hugging Face 下载模型（ibm-granite/granite-speech-5.0-470m-turboctc），并在你自己的音频上与 Whisper 进行基准测试，比较本地转录场景下的速度和词错误率。

reddit · r/LocalLLaMA · /u/coder543 · 8月25日 19:44

**背景**: 连接主义时序分类（CTC）是一种用于训练 ASR 模型的损失函数，它将预测的音素或字符序列与音频帧对齐，而不需要预先分段的标签。与 Whisper 等逐个 token 生成文本的编码器-解码器模型不同，CTC 模型进行独立的帧级预测，这使得推理速度非常快，但限制了处理标点和格式的能力。Granite 是 IBM 的开放式企业级 AI 模型家族，涵盖语言、视觉、语音和安全任务。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/blog/ibm-granite/granite-speech-5-0-470m-turboctc">Extremely Fast and Accurate Transcription with Granite Speech ...</a></li>
<li><a href="https://korshunov.ai/en/article/20732-ibm-releases-granite-speech-5-0-turbo-ctc/">IBM releases Granite Speech 5 . 0 Turbo CTC · korshunov.ai</a></li>
<li><a href="https://runtimewire.com/article/ibm-granite-speech-5-turboctc-transcription">IBM cuts the decoder from Granite Speech , says transcription runs...</a></li>

</ul>
</details>

**标签**: `#speech-to-text`, `#local-llm`, `#ASR`, `#open-source-models`, `#automation`

---