---
layout: default
title: "Horizon Summary: 2026-08-30 (ZH)"
date: 2026-08-30
lang: zh
---

> 从 12 条内容中筛选出 3 条重要资讯。

---

1. [双 DGX Spark 实测：GLM5.3 Flash NVFP4 在 HumanEval 上胜过 DeepSeek V4 Flash](#item-1) ⭐️ 7.0/10
2. [腾讯发布 Hy4 Preview：770B 参数开源权重 MoE 大模型，支持 100 万 token 上下文](#item-2) ⭐️ 6.0/10
3. [Archify：生成动画式 HTML 架构图的开源 Agent 技能走红](#item-3) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [双 DGX Spark 实测：GLM5.3 Flash NVFP4 在 HumanEval 上胜过 DeepSeek V4 Flash](https://www.reddit.com/r/LocalLLaMA/comments/1w215qm/humaneval_benchmark_for_deepseek_v4_flash_0731_vs/) ⭐️ 7.0/10

一位 DGX Spark 用户进行了可复现的 HumanEval/HumanEval+基准测试，对比 DeepSeek V4 Flash 0731（官方权重、fp8 KV 缓存、1M 上下文）与 GLM5.3 Flash（NVFP4 量化、Dflash2 投机解码、fp8_e4m3 KV 缓存、256k 上下文）。开启思考模式后，GLM5.3 Flash NVFP4 在 HumanEval 上得分 97.0%、HumanEval+上 92.1%，超过 DeepSeek V4 Flash 的 94.5%和 88.4%。 该测试直接回应了社区对 GLM5.3 Flash NVFP4 量化质量的普遍质疑，证明其表现良好（甚至超过 Unsloth 声称其 Q4 量化约 92%的准确率），是可行的本地部署选项。拥有类似硬件、纠结于选哪个模型的用户可以获得基于真实硬件的具体数据，而非互相矛盾的说法。 主要权衡在于上下文长度：GLM5.3 Flash NVFP4 只能跑 256k 上下文，而 DeepSeek 支持 1M；作者指出需要 512GB 以上显存（如 4 台 Spark）才能以 fp8 运行并支持 1M 上下文。DeepSeek 的流式速度更快（MTP-5 下约 70 tok/s），高于 GLM（DFlash2 下约 50 tok/s），且 GLM 思考模式总耗时更短（20 分 52 秒，而 DeepSeek 思考模式为 38 分 16 秒）。 如果你也使用双 DGX Spark 配置，可以尝试 GLM5.3 Flash 的 NVFP4 方案（NVFP4 量化、Dflash2 投机解码、fp8_e4m3 KV 缓存），并自行复现 HumanEval/HumanEval+测试——作者强调亲身实践比任何基准测试都更重要。

reddit · r/LocalLLaMA · /u/serige · 8月29日 23:18

**背景**: NVFP4 是 NVIDIA 的 4 位浮点格式，通过每 16 个值一个 FP8 微块缩放因子加张量级 FP32 标量，相比 FP8 精度损失约 1%以内，同时显存占用减半。DGX Spark 是基于 GB10 Grace Blackwell 芯片的桌面 AI 超级计算机，配备 128GB 统一内存，两台即可提供 256GB 用于本地运行大型 MoE 模型。HumanEval 是经典的 164 道 Python 函数生成基准，通过单元测试评分；HumanEval+则增加了对抗性边界用例以减少误判。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://developer.nvidia.com/blog/introducing-nvfp4-for-efficient-and-accurate-low-precision-inference/">Introducing NVFP4 for Efficient and Accurate Low-Precision Inference | NVIDIA Technical Blog</a></li>
<li><a href="https://www.nvidia.com/en-us/products/workstations/dgx-spark/">Personal AI Supercomputer Powered by Blackwell | NVIDIA DGX Spark</a></li>
<li><a href="https://llm-stats.com/benchmarks/humaneval">HumanEval Leaderboard - llm-stats.com</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#benchmark`, `#humaneval`, `#nvfp4-quantization`, `#dgx-spark`

---

<a id="item-2"></a>
## [腾讯发布 Hy4 Preview：770B 参数开源权重 MoE 大模型，支持 100 万 token 上下文](https://simonwillison.net/2026/Aug/29/hy4/) ⭐️ 6.0/10

腾讯发布了 Hy4 Preview，这是一个开源权重的纯文本 MoE 大模型，总参数量 770B（激活参数 49B），上下文窗口达 100 万 token，在 Hugging Face 上的文件大小为 1.56TB。Simon Willison 还通过其聊天模板发现，该模型仅支持两档推理强度：默认的 "high" 和 "no_think"。 相比两个月前的 Hy3（295B 参数、25.6 万上下文），这是一次大幅跃升，为开源权重生态提供了一个超大规模的长上下文模型。Willison 提出的通过查看 chat_template.jinja 来发现模型未公开功能的方法，是任何大模型从业者都可以复用的实用技巧。 该模型仅支持文本输入（无视觉能力），其聊天模板在 reasoning_effort 被设为 "high" 或 "no_think" 之外的值时会直接抛出异常——这与 OpenAI 风格 API 提供的 low/medium/high 多档设置不同。Willison 还注意到，模型的推理轨迹使用了略显简略的英语，而非完全合乎语法的文字， presumably 为了节省 token。 可以通过 OpenRouter 亲自试用 Hy4 Preview；在部署任何开源权重模型之前，先打开其在 Hugging Face 上的 chat_template.jinja，检查是否存在 reasoning_effort 或工具调用等隐藏参数。

rss · Simon Willison · 8月29日 23:53

**背景**: 混合专家（MoE）模型每个 token 只激活总参数中的一小部分，因此 770B 参数、49B 激活的模型能以低得多的推理成本提供大模型的质量。聊天模板是 Hugging Face 上随模型发布的 Jinja 文件，定义了对话消息如何被格式化为模型期望的输入；查看这些模板常常能发现推理模式、工具调用等未在文档中说明的功能。reasoning_effort 概念由 OpenAI 的推理模型推广，用于控制模型在回答前进行多少内部"思考"。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/blog/moe">Mixture of Experts Explained - Hugging Face</a></li>
<li><a href="https://www.vellum.ai/llm-parameters/reasoning-effort">Reasoning effort - LLM Parameter Guide - Vellum</a></li>
<li><a href="https://deepwiki.com/huggingface/alignment-handbook/6.3-chat-templates-and-message-formatting">Chat Templates and Message Formatting - deepwiki.com</a></li>

</ul>
</details>

**标签**: `#LLM`, `#open-weights`, `#Tencent`, `#chat-templates`, `#model-release`

---

<a id="item-3"></a>
## [Archify：生成动画式 HTML 架构图的开源 Agent 技能走红](https://github.com/tt-a1i/archify) ⭐️ 5.0/10

GitHub 仓库 tt-a1i/archify 在过去 24 小时内获得 34 颗星。该项目是一个 agent 技能，能够生成自包含、带动画效果的 HTML 图表，涵盖架构图、工作流、时序图、数据流和生命周期可视化。 用 AI agent 自动生成图表可以大幅减少维护技术文档的手工工作量，因为文档通常很快就会过时。使用编码 agent 的开发者和文档作者可以复用这个技能，生成可分享、无外部依赖的 HTML 图表。 该项目仍处于非常早期的阶段：一天仅增加 34 颗星和 3 个 fork，且趋势列表中没有可见的 pull request 或代码示例。所谓“可验证”图表的说法目前缺乏公开的技术细节支撑，输出质量和可靠性尚未得到证明。 访问 https://github.com/tt-a1i/archify，查看其 SKILL.md 和示例输出，并尝试为自己的系统生成一张图表，在纳入文档工作流之前先评估其质量。

ossinsight · tt-a1i · 8月30日 01:49

**背景**: Agent Skills 是一种轻量级的开放格式，用于扩展 AI agent 的能力，通常以包含 SKILL.md 文件的文件夹形式实现，为编码 agent 提供专业知识和工作流程。时序图（UML 交互图，按时间顺序展示消息交换）和数据流图（表示数据在系统中的流动）是软件文档中的经典图表类型。将它们生成为自包含的 HTML 文件，意味着查看、播放动画或导出时无需任何外部工具或库。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://agentskills.io/home">Agent Skills Overview - Agent Skills</a></li>
<li><a href="https://en.wikipedia.org/wiki/Sequence_diagram">Sequence diagram</a></li>
<li><a href="https://en.wikipedia.org/wiki/Data-flow_diagram">Data-flow diagram</a></li>

</ul>
</details>

**标签**: `#open-source`, `#AI agents`, `#diagramming`, `#documentation`, `#developer tools`

---