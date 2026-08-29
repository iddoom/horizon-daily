---
layout: default
title: "Horizon Summary: 2026-08-29 (ZH)"
date: 2026-08-29
lang: zh
---

> 从 11 条内容中筛选出 4 条重要资讯。

---

1. [git.kernel.org 约 98%流量来自 AI 爬虫，Anubis 挑战正被绕过](#item-1) ⭐️ 7.0/10
2. [Chips and Cheese 深度解析三星存内计算（PIM）设计](#item-2) ⭐️ 6.0/10
3. [Terminal Bench 4.0 发布，GLM-5.3 与 Fable 5 水平相当](#item-3) ⭐️ 6.0/10
4. [Archify：生成可导出动效图的智能体技能](#item-4) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [git.kernel.org 约 98%流量来自 AI 爬虫，Anubis 挑战正被绕过](https://lwn.net/Articles/1091203/) ⭐️ 7.0/10

Konstantin Ryabitsev 发布的流量数据显示，git.kernel.org 每天收到约 600 万次请求随机 commit 的访问，其中约 98%来自 AI 爬虫而非真实用户。值得注意的是，虽然 66%的请求仍被 Anubis 工作量证明挑战拦截，但已有 33%的爬虫能够解开挑战并访问主站。 这是少见的量化数据，说明 AI 爬虫正在压垮大型公共开源基础设施，同时也表明工作量证明防御已不再是可靠屏障，因为爬虫运营方愿意消耗算力来通过挑战。任何运营公共 Git 托管、代码仓库或文档站点的人都面临同样的成本不断上升的问题。 Ryabitsev 指出无法百分之百区分爬虫与真人，但请求随机旧 fork 中的旧 commit 几乎可以肯定不是真正的开发者。约 2%的合法流量估算基于宽松假设，实际人类流量占比可能更低。 如果你运营公共仓库或网站，建议阅读 Ryabitsev 在 people.kernel.org 上的完整文章，并审计自己的流量日志以识别爬虫模式（例如随机 commit 请求），然后考虑采用 Anubis 加限流等多层防御，而不是依赖单一挑战机制。

rss · LWN.net · 8月29日 09:32

**背景**: Anubis 是由 Xe Iaso 开发的开源反爬虫工具，要求访问者在进入站点前完成类似 Hashcash 的 SHA-256 工作量证明挑战，已被众多 Git 托管平台和开源项目广泛采用。它最初是为了应对无视 robots.txt 并压垮 Git 服务器的爬虫（如亚马逊的爬虫）而开发的。git.kernel.org 是 Linux 内核源码仓库的官方托管站点，为全球内核开发者提供服务。如今三分之一的爬虫流量愿意支付挑战的计算成本，说明抓取内核数据的价值已高到值得烧掉大量 CPU 周期。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Anubis_(software)">Anubis (software) - Wikipedia</a></li>
<li><a href="https://anubis.techaro.lol/docs/design/how-anubis-works/">How Anubis works | Anubis</a></li>

</ul>
</details>

**标签**: `#ai-crawlers`, `#infrastructure`, `#linux-kernel`, `#web-scraping`, `#bot-mitigation`

---

<a id="item-2"></a>
## [Chips and Cheese 深度解析三星存内计算（PIM）设计](https://chipsandcheese.com/p/hot-chips-2026-samsungs-processing) ⭐️ 6.0/10

Chips and Cheese 发表了一篇关于三星在 Hot Chips 大会上展示的存内计算（PIM）架构的技术深度文章，分析其如何在 DRAM/HBM 内部嵌入计算逻辑以加速矩阵乘法。这是三星 PIM 研究的延续，早在 2021 年 Hot Chips 上三星就展示过 Aquabolt-XL HBM2-PIM 器件。 PIM 针对的是主导 AI 负载的内存带宽瓶颈：在 DRAM 与计算单元之间搬运数据所消耗的能量和时间远超算术运算本身。如果 PIM 设计能大规模落地，将显著降低推理和矩阵密集型计算的数据搬运成本，但从业者应对展会上的加速器宣传保持谨慎。 三星早期的 Aquabolt-XL 实现了 1.23 TB/s 片外和 4.92 TB/s 片内 PIM 计算带宽，功耗仅比标准 HBM2 高约 5.4%。评论者指出的一个关键技术疑点是：矩阵乘法需要将 N^2 个矩阵元素汇聚到乘法器，因此存储器内部的数据搬运仍可能主导能耗和硅面积成本。 阅读 Chips and Cheese 的完整文章了解架构细节；如需实践视角，可查阅三星公开的 Aquabolt-XL Hot Chips 幻灯片，了解真实 HBM-PIM 芯片的实测带宽与功耗权衡。

hackernews · ingve · 8月29日 06:06 · [社区讨论](https://news.ycombinator.com/item?id=49487341)

**背景**: 存内计算（PIM）将处理逻辑（简单核心或固定功能单元）置于 DRAM 子系统内部（近存或阵列内），从而避免数据在内存总线上来回搬运。其动机在于：在现代 AI 加速器中，数据搬运而非算术运算占据了大部分能耗和延迟。三星是该方向的主要推动者，曾将商用 HBM2 'Aquabolt' 设计改造为 2021 年 Hot Chips 上展示的 HBM-PIM 'Aquabolt-XL'。类似思路可追溯到几十年前，例如 1980 年代带板载 CPU 的 ISA 扩展卡，说明计算机架构的趋势具有周期性。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://thememoryguy.com/samsungs-aquabolt-xl-processor-in-memory-part-1/">Samsung’s Aquabolt-XL Processor-In-Memory (Part 1)</a></li>
<li><a href="https://hc33.hotchips.org/assets/program/conference/day1/20210813_HC33_Aquabolt-XL_PIM_Jin_Kim_slide.pdf">Aquabolt-XL: Samsung HBM2-PIM with in-memory processing for ...</a></li>
<li><a href="https://arxiv.org/pdf/1802.00320">Enabling the Adoption of Processing - in - Memory : Challenges...</a></li>

</ul>
</details>

**社区讨论**: 评论者普遍持怀疑态度：有人指出三星在 2020/2021 年的 Hot Chips 上就展示过类似概念，且每年展会上都有数十种最终无疾而终的另类加速器设计。另一位评论者认为该实现缺乏说服力，因为矩阵乘法本质上需要大量数据搬运才能把 N^2 个元素汇聚到乘法器，真正的成本在于搬运而非计算。还有人将其与 1980 年代内存卡上带 CPU 的设计做历史类比，并质疑 PIM 这类优化是否会削弱 AI 数据中心建设热潮的必要性。

**标签**: `#hardware`, `#processing-in-memory`, `#ai-accelerators`, `#computer-architecture`, `#semiconductors`

---

<a id="item-3"></a>
## [Terminal Bench 4.0 发布，GLM-5.3 与 Fable 5 水平相当](https://www.reddit.com/r/LocalLLaMA/comments/1w1fpxi/terminal_bench_40_just_dropped_glm53_is_at_the/) ⭐️ 6.0/10

Terminal Bench 4.0 已发布，更新后的排行榜显示智谱的 GLM-5.3 得分与 Fable 5 大致相当，处于误差范围之内。维护者强调会快速迭代该基准，以跟上新模型发布的节奏并对抗基准饱和问题。 Terminal Bench 是衡量智能体在真实终端环境中编码能力的主要基准之一，其版本更新直接影响我们对编码智能体的排名。该帖子还提出了一个实际问题：完整跑一次需要 50-100 亿 token，对想客观测量自己 harness 和工具的个人来说成本过高。 TerminalBench 目前的最高分在 52-58% 左右，远低于 SWE-Bench Verified 的 74-78%，反映出其更贴近真实世界的终端任务设计。排行榜报告了 95% 置信区间，因此 GLM-5.3 与 Fable 5 被描述为统计上的平手，而非明确的胜负。 在对比模型之前，先到 tbench.ai 查看 Terminal Bench 4.0 的公告和排行榜上的得分及置信区间。如果想做低成本的个人评估，可以构建一个固定的小任务集（几十个任务），跟踪 harness 变化前后的 token 用量和成功率，作为方向性参考。

reddit · r/LocalLLaMA · /u/SorosAhaverom · 8月29日 07:17

**背景**: Terminal Bench 通过 shell 命令、调试、系统管理和多步骤 CLI 工作流等复杂终端任务来评估 AI 模型，衡量的是智能体能力而非单纯的代码生成。当头部模型得分过于接近时，基准就会失去区分能力，即所谓基准饱和；近期研究发现约 37% 的百分比制基准已经饱和。像 Terminal Bench 4.0 这样的快速更新是应对饱和和训练数据污染的常见手段。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.tbench.ai/">TERMINAL-BENCH</a></li>
<li><a href="https://presenc.ai/research/coding-agent-benchmarks-2026">Coding Agent Benchmarks 2026 (SWE-Bench, TerminalBench, Live ...</a></li>
<li><a href="https://arxiv.org/html/2602.16763v1">When AI Benchmarks Plateau: A Systematic Study of Benchmark Saturation</a></li>

</ul>
</details>

**标签**: `#benchmarks`, `#coding-agents`, `#LLM-evaluation`, `#LocalLLaMA`, `#GLM`

---

<a id="item-4"></a>
## [Archify：生成可导出动效图的智能体技能](https://github.com/tt-a1i/archify) ⭐️ 5.0/10

GitHub 仓库 tt-a1i/archify 在过去 24 小时内获得 34 颗星并登上趋势榜。它是一个 AI 智能体技能，能生成架构图、时序图、工作流图、数据流图和生命周期图，输出为带动画效果且可清晰导出的自包含 HTML 文件。 自包含的 HTML 图表无需任何外部工具或依赖即可分享、查看和导出，非常适合用于文档编写和设计评审。使用 AI 智能体的开发者和团队可以把画图工作交给智能体，并获得可验证、可展示的成果。 该仓库主要用 HTML 编写，仍处于非常早期的阶段，绝对星数很低，也没有可见的拉取请求或详细的实现文档。因此其质量和可靠性尚未得到验证，在生产文档中依赖它之前应先自行评估。 访问该仓库，阅读其 SKILL.md，并尝试将其安装到兼容的智能体（如 Claude 或支持技能的智能体框架）中，用它为你已熟悉的系统生成一张图，然后自行验证输出的准确性。

ossinsight · tt-a1i · 8月29日 11:48

**背景**: 智能体技能（Agent Skills）是可复用的指令包，教会 AI 智能体在何时以及如何完成某项任务，通常遵循开放的 Agent Skills 标准：一个包含激活元数据和分步指导的 SKILL.md 文件，外加可选的脚本和资源。时序图是 Archify 支持的图表类型之一，属于 UML 交互图，用于描述对象或组件之间随时间的协作过程。与 Mermaid 或 draw.io 等需要手动绘制的传统工具不同，智能体技能可以让 AI 助手根据自然语言描述自动生成图表。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/seb1n/awesome-ai-agent-skills">GitHub - seb1n/awesome-ai-agent-skills: 103 ready-to-use AI ...</a></li>
<li><a href="https://learn.microsoft.com/en-us/agent-framework/agents/skills">Agent Skills | Microsoft Learn</a></li>
<li><a href="https://en.wikipedia.org/wiki/Sequence_diagram">Sequence diagram</a></li>

</ul>
</details>

**标签**: `#open-source`, `#diagrams`, `#AI agents`, `#documentation`, `#developer tools`

---