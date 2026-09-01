---
layout: default
title: "Horizon Summary: 2026-09-01 (ZH)"
date: 2026-09-01
lang: zh
---

> 从 32 条内容中筛选出 6 条重要资讯。

---

1. [Qwen3.8-Flash-Next 在 llama.cpp 中的基准测试：从纯 CPU 到 96GB 显存](#item-1) ⭐️ 8.0/10
2. [具备视觉能力的本地模型通过截图发现隐性编码错误](#item-2) ⭐️ 7.0/10
3. [谷歌从 Chrome 应用商店下架 Manifest V2 扩展，包括 uBlock Origin](#item-3) ⭐️ 6.0/10
4. [Graham Dumpleton 发布 wrapture：Python 统一模拟与追踪库](#item-4) ⭐️ 6.0/10
5. [DarlingHQ：在 Linux 上运行 macOS 软件的开源翻译层](#item-5) ⭐️ 5.0/10
6. [Archify：生成动画式 HTML 架构图的开源 Agent 技能](#item-6) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [Qwen3.8-Flash-Next 在 llama.cpp 中的基准测试：从纯 CPU 到 96GB 显存](https://www.reddit.com/r/LocalLLaMA/comments/1w3pl64/qwen38flashnext_in_llamacpp_from_cpuonly_to_96gb/) ⭐️ 8.0/10

一位 Reddit 用户在 96GB RTX PRO 6000 上对 Qwen3.8-Flash-Next（UD-IQ4_XS 量化，87.2 GiB）进行了系统性的 llama.cpp（b10666 版本）基准测试，测得从纯 CPU（解码 8.34 tok/s）到全 GPU（解码 109.07 tok/s）的吞吐量。关键发现包括：将 27.2 GiB 的 PLE 表强制放到 CUDA 上会使解码速度下降 55.6 倍，以及在 245K 上下文时各显存档位的性能差距收敛。 这些具体且可复现的数字直接指导本地大模型部署决策：在短上下文与长上下文下增加显存分别能带来多少收益、该 MoE 模型纯 CPU 推理也可用、以及不应覆盖默认的 PLE 表驻留内存设置。任何在本地运行大型 MoE 模型的人都可以复用这套方法和结论。 96GB 相对 24GB 的优势从 2K 提示词时的 2.80 倍缩小到 245K 上下文时的 1.45 倍（21.61 对 14.89 tok/s），部分原因是 48 层中只有 12 层使用增长的注意力 KV 缓存，其余 36 层使用 Gated DeltaNet。PLE 表放到 CUDA 上的减速（108.5 降至 1.95 tok/s，每 token 约 513 毫秒对 9.2 毫秒）已通过 A-B-B-A 测试和显存遥测验证，但根本原因（可能是同步或逐 token 传输）尚未定位；此外，各显存档位是通过在同一块 GPU 上预留显存模拟的，因此测试的是容量而非小显卡的算力。 如果你在 llama.cpp 中运行 Qwen3.8-Flash-Next 或类似的 MoE 模型，请将 PLE/逐层嵌入表保留在系统内存中（默认设置），并使用常驻内存加载而非 mmap 以获得更快预填充；同时要现实地规划显存预算，因为在长上下文下超过约 24GB 后收益会大幅缩水。

reddit · r/LocalLLaMA · /u/FantasticNature7590 · 8月31日 20:17

**背景**: Qwen3.8-Flash-Next 是一个混合专家（MoE）模型，每个 token 仅激活约 6B 参数，因此即使纯 CPU 推理也能保持交互式体验。llama.cpp 是流行的本地推理引擎，使用 GGUF 格式和量化（本文使用约 4.25 比特/权重的 UD-IQ4_XS）来压缩模型体积，使大模型能装入有限内存。KV 缓存存储键值计算结果以在自回归生成中复用，但其内存随上下文长度线性增长，这就是长上下文解码下所有配置都变慢的原因；Gated DeltaNet 等混合架构在部分层替代完整注意力以降低这一开销。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/ggml-org/llama.cpp/blob/master/tools/quantize/README.md">llama.cpp/tools/quantize/README.md at master · ggml-org/llama.cpp</a></li>
<li><a href="https://magazine.sebastianraschka.com/p/coding-the-kv-cache-in-llms">Understanding and Coding the KV Cache in LLMs from Scratch</a></li>
<li><a href="https://kaitchup.substack.com/p/choosing-a-gguf-model-k-quants-i">GGUF Quantization Compared: Q4_K_M vs IQ4_XS vs IQ4_NL</a></li>

</ul>
</details>

**标签**: `#llama.cpp`, `#local-llm`, `#benchmarking`, `#gpu`, `#qwen`

---

<a id="item-2"></a>
## [具备视觉能力的本地模型通过截图发现隐性编码错误](https://www.reddit.com/r/LocalLLaMA/comments/1w3vcvh/dont_sleep_on_vision_support_for_coding/) ⭐️ 7.0/10

一位 LocalLLaMA 用户报告称，使用支持视觉的 Qwen 27B 模型（通过 Hermes 在 RTX 5090 上运行 Q5_K_XL 量化版本）进行自主编码时，模型会主动截图来视觉验证自己的工作，并反复迭代直到确认错误被修复。这捕获了代码审查和测试都无法发现的隐性 UI 错误。 许多本地大模型用户为了节省显存而选择无视觉版本，以为视觉功能只在用户主动发送图片时才有用。这一经验表明，视觉能力让智能体能够自己验证渲染结果、形成闭环反馈，对所有运行本地编码智能体的用户都是具体的工作流升级。 该用户在单张 RTX 5090 上通过 Hermes 框架运行 Qwen3.8-27B-UD-Q5_K_XL 量化版本。关键行为在于：视觉模型会循环截图直到视觉上确认修复完成，而无视觉模型则直接宣布任务完成。 如果你运行的本地编码智能体还有富余显存，可以尝试换成支持视觉的版本（例如 Qwen-VL 系列模型），并在智能体的工作循环中加入截图工具，让它在宣布任务完成前先视觉验证渲染结果。

reddit · r/LocalLLaMA · /u/ChemistNo8486 · 8月31日 23:49

**背景**: 像 Qwen-VL 系列这样的视觉语言模型将视觉 Transformer 与大语言模型结合，能够同时理解图像和文本。在自主编码智能体中，智能体执行代码并报告结果；没有视觉能力时，它只能依赖代码内容和测试输出，这往往会漏掉错误页面或布局损坏等视觉性问题。视觉支持通常需要额外显存，因此许多显存有限的本地用户会选择纯文本版本。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/QwenLM/Qwen3-VL">GitHub - QwenLM/Qwen3-VL: Qwen3-VL is the multimodal large language model series developed by Qwen team, Alibaba Cloud. · GitHub</a></li>
<li><a href="https://en.wikipedia.org/wiki/Qwen">Qwen - Wikipedia</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#vision-models`, `#autonomous-coding`, `#ai-agents`, `#workflow`

---

<a id="item-3"></a>
## [谷歌从 Chrome 应用商店下架 Manifest V2 扩展，包括 uBlock Origin](https://webiterate.dev/google-removed-extensions-ublock-origin-108/) ⭐️ 6.0/10

谷歌已从 Chrome 应用商店下架 Manifest V2（MV2）扩展，包括 uBlock Origin，完成了对旧扩展平台的淘汰。依赖 uBlock Origin 的 Chrome 用户现在必须改用兼容 MV3 的拦截工具或更换浏览器。 这是一次直接影响数百万用户广告拦截能力的具体生态变化。读者可以采取行动：迁移到 Firefox（uBlock Origin 在那里仍完整可用），或改用 uBlock Origin Lite、AdGuard 等 MV3 替代品。 MV3 用 declarativeNetRequest 取代了 blockingWebRequest API，后者基于预定义过滤规则，限制了 uBlock Origin 依赖的动态过滤能力。最后一个 MV2 重新启用标志将在 Chrome 151（2026 年 7 月 28 日进入稳定版）中删除，此后 Chrome 中将完全不存在任何 MV2 机制。 如果你想要完整强度的广告拦截，请安装 Firefox 和 uBlock Origin；如果必须留在 Chrome，请从 Chrome 应用商店安装 uBlock Origin Lite 或 AdGuard 的 MV3 扩展。

hackernews · twapi · 8月31日 21:10 · [社区讨论](https://news.ycombinator.com/item?id=49514878)

**背景**: Manifest V2 是 Chrome 的扩展平台，允许 uBlock Origin 等扩展通过 blockingWebRequest API 动态拦截网络请求。谷歌的 Manifest V3 用 declarativeNetRequest 取而代之，这是一个限制更多的基于规则的系统，谷歌称其提升了安全性、隐私和性能，但削弱了高级广告拦截能力。Mozilla 在 Firefox 中以不同方式实现了 MV3，保留了强大的拦截 API，因此 uBlock Origin 在 Firefox 上仍可完整运行。uBlock Origin Lite 是官方的 MV3 重写版，但功能比原版少。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://blog.mozilla.org/en/firefox/firefox-manifest-v3-adblockers/">Mozilla’s approach to Manifest V3: What’s different and why it matters for extension users | The Mozilla Blog</a></li>
<li><a href="https://www.superchargebrowser.com/library/chrome-manifest-v2-vs-v3-extensions/">Manifest V2 vs V3: What Actually Dies in August 2026</a></li>
<li><a href="https://developer.chrome.com/docs/extensions/develop/migrate">Migrate to Manifest V3 | Chrome for Developers</a></li>

</ul>
</details>

**社区讨论**: 评论者压倒性地建议切换到 Firefox，指出 uBlock Origin 本来就在 Firefox 上表现最佳，且迁移后几乎没人怀念 Chrome。一些人将广告拦截视为安全问题，因为年长亲属容易点击诈骗广告；还有人批评谷歌对网络的单边控制，并回忆起 Chrome 曾被誉为改善网络的浏览器的时代。

**标签**: `#chrome`, `#ad-blocking`, `#browser-extensions`, `#manifest-v3`, `#google`

---

<a id="item-4"></a>
## [Graham Dumpleton 发布 wrapture：Python 统一模拟与追踪库](https://simonwillison.net/2026/Aug/31/introducing-wrapture/) ⭐️ 6.0/10

wrapt 和 mod_wsgi 的作者 Graham Dumpleton 发布了 wrapture，这是一个新的 Python 库，将 wrapt 的猴子补丁思想扩展为把 unittest.mock 式的覆盖与对现有代码的函数级追踪结合起来。值得注意的是，其全部代码和文档均由 AI 助手在他的精心工程指导下完成，这是他首个大型智能体驱动的项目。 wrapture 为测试和可观测性团队提供了一个单一工具，既能像 unittest.mock 那样替换依赖，又能记录不受你控制的代码中函数的输入输出，且不干扰被观察的程序。其基于配置的追踪机制和 OpenTelemetry 导出支持，使得向现有 Python 项目添加可观测性几乎不需要改动代码。 追踪可以完全通过 TOML 配置声明，指定如 "domain:Calculator" 的目标、方法名、捕获模式（如 "summary"）以及 JSON lines 文件等输出端。该项目仅诞生数周（目前为 1.0.0 alpha 版本），Dumpleton 明确将这种 AI 辅助流程与“氛围编程”区分开，强调架构设计由他本人完成。 从 PyPI 安装 wrapture 并阅读其文档，然后在一个小型现有项目上尝试基于 TOML 的追踪配置，或在测试中尝试用 binding().on_call.returns() 模式替代 unittest.mock。

rss · Simon Willison · 8月31日 23:59

**背景**: 猴子补丁（monkeypatching）指在运行时替换现有代码的函数或方法，wrapt 通过透明对象代理使这一技术变得可靠。unittest.mock 是 Python 标准库中用于在测试中给对象打补丁的工具，可以用模拟对象替换依赖并对其调用做断言。追踪（可观测性）记录生产代码中函数间流动的数据；OpenTelemetry 是导出此类遥测数据的厂商中立标准。wrapture 在 wrapt 的代理基础之上，将这两个原本分离的场景统一起来。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://grahamdumpleton.me/posts/2026/08/introducing-wrapture/">Introducing wrapture - Graham Dumpleton</a></li>
<li><a href="https://wrapture.readthedocs.io/en/latest/how-wrapture-was-built.html">How wrapture was built — wrapture 1.0.0a11 documentation</a></li>
<li><a href="https://pypi.org/project/wrapture/">wrapture · PyPI</a></li>

</ul>
</details>

**标签**: `#python`, `#testing`, `#tracing`, `#observability`, `#open-source`

---

<a id="item-5"></a>
## [DarlingHQ：在 Linux 上运行 macOS 软件的开源翻译层](https://www.darlinghq.org/) ⭐️ 5.0/10

DarlingHQ 是一个开源翻译层，通过重新实现 macOS 程序调用的库和框架，让 macOS 软件无需硬件模拟即可直接在 Linux 上运行。它主要基于苹果公开的 Darwin 源代码构建，其 Cocoa 实现基于 The Cocotron、Apportable Foundation 以及部分 GNUstep。 它展示了将 Wine 式兼容层方法应用于 macOS 的思路，比模拟更快，适合偶尔需要 macOS 专属工具的 Linux 用户。但其实用范围有限，主要吸引研究操作系统兼容技术的开发者。 Darling 仅支持 x86_64 软件，无法运行 Apple Silicon（ARM64）应用，且开发进度缓慢、更新稀少。ARM64 的一个关键技术障碍是 macOS 将 x18 寄存器保留为平台用途而 Linux 没有，这使二进制翻译变得复杂。 如果你使用 x86_64 Linux 系统并需要某个 macOS 命令行工具，可按照 darlinghq.org 上的说明从源码构建 Darling 并测试该应用；不要指望现代图形应用或 Apple Silicon 二进制能正常运行。

hackernews · Bluestein · 8月31日 22:53 · [社区讨论](https://news.ycombinator.com/item?id=49515830)

**背景**: Darling 的名字由 "Darwin"（macOS 和 iOS 的核心操作系统）与 "Linux" 组合而成。与在 Linux 上运行 Windows 程序的 Wine 类似，翻译层通过提供系统库的替代实现来复制操作系统功能，避免完整硬件模拟的开销。相关历史项目包括 GNUstep（跨平台 Cocoa 兼容框架）、The Cocotron，以及 2011 年 YC 孵化的初创公司 Apportable，其 Foundation 仓库最后一次更新是在 2014 年 12 月。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Darling_(software)">Darling (software) - Wikipedia</a></li>
<li><a href="https://darlinghq.org/">Darling | macOS translation layer for Linux</a></li>
<li><a href="https://www.gnustep.org/">GNUstep .org</a></li>

</ul>
</details>

**社区讨论**: 评论者指出 Darling 仅支持 x86_64 的局限并感叹其开发缓慢，一位用户分享了反方向实验（fakelinux，在 macOS 上编译 Linux 软件），在 ARM64 上遇到 x18 寄存器冲突。其他人讨论了 GNUstep、Cocotron 和 Apportable 的渊源，也有人遗憾 Mac 应用最终看起来像 Linux 应用。

**标签**: `#linux`, `#macos`, `#compatibility-layer`, `#open-source`, `#emulation`

---

<a id="item-6"></a>
## [Archify：生成动画式 HTML 架构图的开源 Agent 技能](https://github.com/tt-a1i/archify) ⭐️ 5.0/10

GitHub 仓库 tt-a1i/archify 在过去 24 小时内获得 29 个 star 和 5 个 fork，进入趋势榜。它提供了一个 AI agent 技能，可以生成架构图、工作流图、时序图、数据流图和生命周期图，输出为带动画且可清晰导出的自包含 HTML 文件。 通过 agent 技能自动生成图表可以大幅减少维护技术文档的手工工作量，而自包含 HTML 输出无需外部依赖即可分享和嵌入。已经在使用 Claude 或 Codex 等 AI agent 的开发者和技术写作者可以直接将其纳入文档工作流。 该项目仍处于极早期，仅有约 29 个 star、一次 push 且没有 pull request，成熟度和代码审查情况均未经验证。仓库以 HTML 为主，其关于图表“可验证”的说法也尚无独立验证。 从 https://github.com/tt-a1i/archify 克隆仓库，查看技能定义，并尝试为你熟悉的系统生成一张图表，在将其用于正式文档前先评估输出质量。

ossinsight · tt-a1i · 9月1日 02:07

**背景**: Agent 技能是可复用的能力包，可以安装到 AI agent（如 Claude 或 Codex）中，为其提供完成特定任务的过程性知识；skills.sh 等市场已经聚合了来自公开 GitHub 仓库的大量此类技能。时序图展示模块之间随时间的交互，而数据流图只描述数据在系统中的流动，不建模时间或错误路径。以自包含 HTML 生成图表意味着输出文件包含所有样式和动画逻辑，无需服务器或额外库即可在任何地方渲染。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.skills.sh/">Discover and install skills for AI agents .</a></li>
<li><a href="https://skillsmp.com/">Agent Skills Marketplace | Codex & Claude Skills | SkillsMP</a></li>

</ul>
</details>

**标签**: `#open-source`, `#AI agents`, `#diagramming`, `#documentation`, `#developer tools`

---