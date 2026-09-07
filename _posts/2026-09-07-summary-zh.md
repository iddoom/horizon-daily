---
layout: default
title: "Horizon Summary: 2026-09-07 (ZH)"
date: 2026-09-07
lang: zh
---

> 从 21 条内容中筛选出 4 条重要资讯。

---

1. [Anubis 维护者历时一年为反爬虫系统引入 WebAssembly 工作量证明](#item-1) ⭐️ 7.0/10
2. [OpenAI 公布内部研究员编码智能体支出激增数据](#item-2) ⭐️ 7.0/10
3. [lm-eval-ledger：支持逐题浏览模型答案的开源基准测试工具](#item-3) ⭐️ 7.0/10
4. [用户在双 Strix Halo 上对比 DeepSeek-V4-Flash-Vision 与 Qwen3.8-Flash-Next 的 Q8 量化版](#item-4) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [Anubis 维护者历时一年为反爬虫系统引入 WebAssembly 工作量证明](https://anubis.techaro.lol/blog/2026/anubis-wasm/) ⭐️ 7.0/10

开源反爬虫工作量证明系统 Anubis 的维护者发布了一篇复盘文章，讲述耗时一年才在其挑战机制中引入 WebAssembly 实现，同时保持对 Chrome 66 等老浏览器的向后兼容。文章涵盖了 WASM 工具链限制、优雅回退到纯 JavaScript 方案，以及工作量证明难度的调校。 这是一篇少见的关于在严格兼容性约束下部署 WASM 的详细案例研究，许多需要在所有浏览器上运行的团队都会遇到类似问题。文中还记录了用于阻挡 AI 爬虫的真实工作量证明难度机制，对运营或评估反爬虫防御的人都很有参考价值。 值得注意的是，挑战难度每增加一个单位，最坏情况下的求解时间会放大 1024 倍，因此难度调校极其敏感——这一点也引发了社区讨论并由作者澄清。WASM 路径比纯 JavaScript 回退方案快得多，但上线它需要应对默认面向现代浏览器的 WASM 工具链，并为旧浏览器做优雅降级。 阅读原文（https://anubis.techaro.lol/blog/2026/anubis-wasm/）了解工具链与难度调校的经验，并可使用 https://wasm-feature-detect.surma.technology 检测自己浏览器支持的 WASM 特性，避免误判兼容性。

hackernews · xena · 9月6日 20:32 · [社区讨论](https://news.ycombinator.com/item?id=49590611)

**背景**: Anubis 是一个开源程序，在用户访问网站前插入一个基于 SHA-256 的小型工作量证明挑战，以劝退消耗资源的爬虫和 AI 爬虫，同时对真人用户仍可接受。它已被 Git 代码托管平台和众多自由开源软件项目广泛采用，作为对抗大规模自动抓取的轻量级防御手段。WebAssembly（WASM）能在浏览器中提供接近原生的性能，这让工作量证明求解更快、真人用户等待更短；难点在于 WASM 特性在不同年代的浏览器中支持差异很大。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Anubis_(software)">Anubis (software) - Wikipedia</a></li>
<li><a href="https://tilion.dev/blog/anubis-proof-of-work">How we beat Anubis | Blog</a></li>

</ul>
</details>

**社区讨论**: 评论者赞赏维护者对开源作者被对待方式的幽默态度，并对其针对 Chrome 66 的深度向后兼容工作表示敬佩。技术讨论包括对 1024 倍难度乘数的质疑与澄清、建议支持预先计算的 PoW 信用代币以避免用户阻塞等待，以及希望提供公开的浏览器兼容性测试页面。

**标签**: `#webassembly`, `#javascript`, `#browser-compatibility`, `#open-source`, `#engineering`

---

<a id="item-2"></a>
## [OpenAI 公布内部研究员编码智能体支出激增数据](https://simonwillison.net/2026/Sep/6/research-acceleration-the-view-inside-openai/) ⭐️ 7.0/10

OpenAI 发布报告《Research acceleration: The view inside OpenAI》，显示每位研究员的编码智能体日支出中位数从 2026 年 2 月的接近零增长到 6 月约 150 美元，再到 8 月底约 600 美元。Simon Willison 指出，该报告是 OpenAI 新的"RSI"（递归自我改进）叙事的一部分，与首席科学家 Jakub Pachocki 在 2026 年 9 月 6 日发表的《An Alien Mind》一同发布。 这是一份罕见的、量化的前沿实验室实地报告，展示了智能体工程在 OpenAI 内部的日常使用情况，为外部团队提供了采用曲线和人均 AI 支出的参考基准。它还表明 OpenAI 正围绕递归自我改进来构建其进展叙事。 支出曲线在 2026 年 7 月底出现急剧拐点；Willison 猜测这与内部员工提前使用后来发布为 GPT-6 Astra 的模型有关，但未经证实。值得注意的是，报告中甚至没有展开"RSI"这个缩写，而 Pachocki 的配套文章承认没有任何实验室充分解决对齐与监控问题，无法负责任地以最大速度扩张。 阅读 OpenAI 原报告和 Willison 的文章，然后对比自己团队每月人均 AI 智能体支出和使用趋势与已公布的曲线，评估自身在采用进程中所处的位置。

rss · Simon Willison · 9月6日 23:57

**背景**: 智能体工程（agentic engineering）指由 AI 编码智能体自主编辑文件、运行命令并完成多步骤任务的工作流，而不仅仅是给出代码建议。递归自我改进（RSI）描述的是 AI 系统帮助改进生产更强 AI 的过程本身、从而在迭代中产生复利效应的反馈循环——这一概念早已被广泛讨论，而 OpenAI 现在似乎将其作为核心叙事。Simon Willison 是知名的独立评论者，其对 AI 行业动态的批判性、注重细节的分析广受欢迎。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://openai.com/index/an-alien-mind/">An Alien Mind | OpenAI</a></li>
<li><a href="https://www.unite.ai/in-an-alien-mind-openais-jakub-pachocki-urges-shared-safety-bars/">In “ An Alien Mind ,” OpenAI ’s Jakub Pachocki Urges Shared Safety...</a></li>
<li><a href="https://en.wikipedia.org/wiki/Recursive_self-improvement">Recursive self-improvement - Wikipedia</a></li>

</ul>
</details>

**标签**: `#openai`, `#coding-agents`, `#agentic-engineering`, `#AI-research`, `#field-report`

---

<a id="item-3"></a>
## [lm-eval-ledger：支持逐题浏览模型答案的开源基准测试工具](https://www.reddit.com/r/LocalLLaMA/comments/1w9ad9q/i_built_an_llm_benchmark_harness_that_lets_you/) ⭐️ 7.0/10

一位开发者发布了 lm-eval-ledger，一个开源的、由 YAML 驱动的基准测试工具，将所有结果存入 SQLite，并通过 Flask 网页应用让用户逐题查看和比较各模型的回答。演示中在单张 RTX 5090 上对 Qwen3.5-9B、Nemotron-3.5-Lightning-30B-A3B 和 Gemma-4-12B-it 运行了 GPQA Diamond 和 LiveCodeBench 基准。 大多数基准工具只输出汇总数字到 JSONL/Parquet，评测者不得不写自定义代码才能查看单个答案；这个工具弥补了这一缺口，还提供双模型对比以及跨运行的“全错/全对”题目追踪。演示数据还揭示了具体的速度/精度权衡：Qwen 在 LiveCodeBench 上因思考时间过长，耗时 22 小时 57 分仅得 0.713 的准确率，而 Gemma 仅用 6 小时 13 分就达到 0.820。 逐题记录系统提示、生成内容、提取的答案、标准答案、停止原因和字符数；每个基准则记录准确率、tok/s、耗时和无答案数量。它支持 vLLM、SGLang、HF 和 llama.cpp server 后端（Linux 上全部验证过，Windows 上验证了 HF 和 llama.cpp），结果已实时托管在 Hugging Face Spaces 上。 通过 `pip install lm-eval-ledger` 安装，运行 `lm-eval-ledger init` 生成 YAML 配置，启动基准测试后在 localhost:8090 浏览结果；也可以先访问 Hugging Face Spaces 上的在线演示结果，自行判断各模型的权衡。

reddit · r/LocalLLaMA · /u/jayminban · 9月6日 22:32

**背景**: GPQA Diamond 是一个包含 198 道研究生级别科学题的基准，博士专家约得 65% 的准确率，而熟练的非专家仅有 34%，因此是很好的推理能力测试。LiveCodeBench 持续从编程竞赛中收集新题以避免数据污染，能反映真实的当前编码能力而非记忆的训练数据。演示模型采用不同的本地推理配置：MoE 架构的 Nemotron 使用 4-bit UD-Q4_K_XL GGUF 量化，Gemma 使用 QAT w4a16 权重，都是为了在单张消费级 GPU 上高效运行。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://epoch.ai/benchmarks/gpqa-diamond">GPQA Diamond | Epoch AI</a></li>
<li><a href="https://github.com/LiveCodeBench/LiveCodeBench">GitHub - LiveCodeBench / LiveCodeBench : Official repository for the...</a></li>
<li><a href="https://huggingface.co/unsloth/Qwen3-30B-A3B-GGUF/discussions/6">unsloth/Qwen3-30B-A3B-GGUF · `UD-Q4_K_XL` or `Q4_K_M`?</a></li>

</ul>
</details>

**标签**: `#LLM benchmarks`, `#LocalLLaMA`, `#open-source tools`, `#model evaluation`, `#inference cost`

---

<a id="item-4"></a>
## [用户在双 Strix Halo 上对比 DeepSeek-V4-Flash-Vision 与 Qwen3.8-Flash-Next 的 Q8 量化版](https://www.reddit.com/r/LocalLLaMA/comments/1w96xoi/deepseekv4flashvision_q8_vs_qwen38flashnext_q8/) ⭐️ 6.0/10

一位本地大模型用户在两台 128GB Strix Halo 主机（通过 USB4 连接，使用 llama.cpp RPC 推理）上对比了两个 Q8_K_XL 量化视觉模型，发现 DeepSeek-V4-Flash-Vision 的原始 token 生成速度慢约 40%，但完成实际任务的速度约为 Qwen3.8-Flash-Next 的两倍，且幻觉更少。用户还发现 Qwen3.8 的 'xhigh' 推理模式完全不可用：在 'medium' 模式下 25 分钟完成的任务，在 'xhigh' 模式下约 3 小时仍未完成。 这篇帖子为本地推理用户点出了一个关键实践教训：原始的每秒 token 数并不能代表实际生产力，因为幻觉更少、指令遵循更好可能让一个生成速度较慢的模型更快完成实际工作。它还表明，激进的推理强度设置在某些模型上会产生灾难性反效果，应该针对每个模型进行验证，而不能默认总是有帮助。 在同一任务上，Qwen3.8-Flash-Next 在 'medium' 模式下平均耗时 25 分钟，而 DSV4FV 在 'medium' 模式下最快 12 分钟完成，在 'max' 模式下耗时 37 到 44 分钟。用户指出 Qwen3.8 容易过度解读不够详细的指令并“添加过多”内容，而 DSV4FV 更适合专业编程工作。需要注意的是，这两个模型名称疑似未来或推测性发布，单用户经验也缺乏标准化基准验证。 如果你运行本地模型，应以端到端任务完成情况（得到正确结果的墙钟时间）而非每秒 token 数来评估，并在采用某个推理强度前逐一测试验证。请注意，文中提到的模型名称疑似指向无法验证的未来版本，因此应把方法论而非具体结果当作可借鉴的要点。

reddit · r/LocalLLaMA · /u/pabloodiablo · 9月6日 20:15

**背景**: Q8_K_XL 并非 llama.cpp 原生量化类型，而是 Unsloth 的“动态”GGUF 变体，在保留 8 位权重的同时将敏感层（嵌入、注意力、输出层）提升到更高精度，使质量接近 FP16。Strix Halo 指配备最高 128GB 统一内存的 AMD Ryzen AI Max+ 395 级别主机，已成为无需独立显卡本地运行 70B 以上模型的流行平台；llama.cpp 的 RPC 模式允许用户通过 USB4 集群两台此类主机以汇聚内存。'medium'、'high'、'xhigh' 等推理强度模式控制模型在回答前消耗多少思考 token；更高的强度可能提升质量，但会显著增加耗时，并可能导致过度回溯。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.promptquorum.com/local-llms/llm-quantization-explained">Q4_K_M vs Q4_0 vs Q8_0: LLM Quantization Explained (2026)</a></li>
<li><a href="https://specpicks.com/reviews/strix-halo-clustering-local-llm-2026">Strix Halo Clustering for Local LLMs: What | SpecPicks</a></li>
<li><a href="https://help.apiyi.com/en/claude-opus-4-7-xhigh-effort-mode-explained-en.html">Detailed explanation of Claude Opus 4.7 xhigh mode ... - Apiyi.com Blog</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#model-benchmark`, `#quantization`, `#llm-inference`, `#hardware`

---