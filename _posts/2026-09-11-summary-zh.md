---
layout: default
title: "Horizon Summary: 2026-09-11 (ZH)"
date: 2026-09-11
lang: zh
---

> 从 27 条内容中筛选出 8 条重要资讯。

---

1. [OpenAI 的 Navier-Stokes 成果附带 Lean 4 形式化证明](#item-1) ⭐️ 8.0/10
2. [Forgejo 16.0.4 与 15.0.8 修复模板变量扩展导致的严重 RCE 漏洞](#item-2) ⭐️ 8.0/10
3. [OpenAI 推出基于 Codex 框架的托管式 Agents API](#item-3) ⭐️ 7.0/10
4. [trynix.dev 在浏览器 WASM 虚拟机中启动任意 Nix 包](#item-4) ⭐️ 7.0/10
5. [Shopify 借助 AI 编程代理回归原生 Swift/Kotlin 应用](#item-5) ⭐️ 7.0/10
6. [NVIDIA 发布 SoL-Pi：Pi 编码代理的效率扩展](#item-6) ⭐️ 7.0/10
7. [openai-python v3.13.0 新增 Agents API 支持](#item-7) ⭐️ 6.0/10
8. [Reddit 帖子为 Artificial Analysis 基准测评辩护，称其独立且可信](#item-8) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [OpenAI 的 Navier-Stokes 成果附带 Lean 4 形式化证明](https://www.johndcook.com/blog/2026/09/09/formal-method-revolution/) ⭐️ 8.0/10

2026 年 9 月 8 日，OpenAI 宣布由约 10000 个运行内部前沿模型的 AI 智能体群体构造出三维 Navier-Stokes 方程解破裂的反例，并附带 Lean 4 证明助手中的形式化验证。John Cook 的文章分析了这一发布，重点讨论验证成本、智能体投入以及形式数学经济学的变化。 这是 AI 定理证明领域的里程碑：一个重大千禧年大奖问题附带了可机器检验的证明，意味着验证不再依赖对人类审稿人的信任。它还提供了 AI 生成数学与人类努力相比成本的罕见具体数据，对评估形式化方法与 AI 能力融合速度的人很有价值。 该反例类似于一个旋转收紧至奇点、速度发散的陀螺，目前尚未经外部数学家或克雷数学研究所验证，OpenAI 也表示不会领取 100 万美元奖金。社区引用的数据显示：智能体算力成本约 4000 万美元，生成 Lean 代码约需 11 天，验证需约 15 小时和 230GB 内存——与宣称的“四个数量级”人机成本差距相去甚远。 阅读 John Cook 的文章和 OpenAI 的公告，再浏览其 Lean 形式化代码，了解研究成果如何被机器验证；感兴趣者可通过 lean4.dev 或 lean-lang.org 的免费教程上手 Lean 4。

hackernews · ibobev · 9月10日 21:22 · [社区讨论](https://news.ycombinator.com/item?id=49650326)

**背景**: Navier-Stokes 方程解的存在性与光滑性问题探讨三维流体方程是否总存在光滑解，2000 年被列为克雷千禧年大奖问题。Lean 是基于归纳构造演算的开源证明助手和函数式语言：其中的证明可被机器检查，正确性依赖小而可审计的 Lean 内核而非人工审稿。此次发布还涉及与 Anthropic 的 Levent Alpöge 及 Tristan Buckmaster 关于相关 Euler 方程结果的优先权争议，方法上基于 Córdoba 与 Martínez-Zoroa 2023 年的爆破技术。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Navier-Stokes_existence_and_smoothness_problem">Navier-Stokes existence and smoothness problem</a></li>
<li><a href="https://en.wikipedia.org/wiki/Lean_(proof_assistant)">Lean (proof assistant)</a></li>
<li><a href="https://lean4.dev/">Lean 4 - Learn Functional Programming & Theorem Proving</a></li>

</ul>
</details>

**社区讨论**: 评论者指出验证成本（15 小时、230GB 内存）与生成成本相比高得出人意料，并质疑 Lean 在不牺牲可审计性的前提下能优化到什么程度。也有人质疑“四个数量级”的成本对比（智能体约 4000 万美元 vs 人类估算约 1.32 亿美元），认为“每页四十小时”的形式化估算已过时，还提出了人类无法独立验证 AI 证明这一更深层担忧。

**标签**: `#AI`, `#formal-methods`, `#Lean-4`, `#theorem-proving`, `#machine-learning`

---

<a id="item-2"></a>
## [Forgejo 16.0.4 与 15.0.8 修复模板变量扩展导致的严重 RCE 漏洞](https://lwn.net/Articles/1093671/) ⭐️ 8.0/10

Forgejo 发布了 16.0.4 和 15.0.8 两个版本，修复了两个安全漏洞，其中包括一个严重的远程代码执行（RCE）漏洞。该漏洞利用从模板生成新仓库时的变量模板扩展，重建一个 .git 文件夹，随后 git 在初始化新仓库时会将其采纳。 任何能在受影响的 Forgejo 实例上发布恶意模板仓库的攻击者，都可以读取主机上的任意文件并执行任意进程，因此所有自托管 Forgejo 管理员都应立即升级。该利用路径也是一个很好的案例，展示了 git 自身的初始化行为如何被武器化。 漏洞流程为：克隆模板仓库、删除 .git 文件夹、对 .forgejo/template 中列出的文件进行变量扩展、然后执行 git init —— 而变量扩展可以重建一个被 git 采纳的 .git 文件夹。修复方案是在变量扩展完成后、git 初始化之前删除任何已存在的 .git 文件夹；此外还修复了另一个未详细说明的漏洞。 如果你运营 Forgejo 实例，请立即升级到 16.0.4 或 15.0.8，并检查已生成的仓库和审计日志，确认在修补之前是否曾被恶意模板仓库利用。

rss · LWN.net · 9月10日 20:05

**背景**: Forgejo 是一个自由、自托管的轻量级软件锻造平台（类似 Gitea/GitLab 的 Git 托管平台），由 Codeberg e.V.（德国注册的非营利组织）支持的开源社区维护。模板仓库允许用户通过预定义文件生成新仓库，并在生成过程中替换变量占位符。远程代码执行（RCE）是一类允许攻击者在目标服务器上运行任意代码的漏洞，通常被评为最严重的等级。git 的 .git/ 目录中的钩子和配置文件可以执行命令，这就是为什么在 git init 之前向目录注入一个精心构造的 .git 文件夹会导致服务器上的代码执行。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://forgejo.org/">Forgejo – Beyond coding. We forge .</a></li>
<li><a href="https://www.rapid7.com/fundamentals/what-is-remote-code-execution-rce/">What is Remote Code Execution (RCE)? Attack & Defense - Rapid7</a></li>

</ul>
</details>

**标签**: `#security`, `#forgejo`, `#devops`, `#git`, `#vulnerability`

---

<a id="item-3"></a>
## [OpenAI 推出基于 Codex 框架的托管式 Agents API](https://developers.openai.com/api/docs/guides/agents-api/overview) ⭐️ 7.0/10

OpenAI 推出了托管式 Agents API，它运行 Codex 代理框架并管理底层基础设施，包括自动上下文压缩、多代理编排、程序化工具调用以及对 MCP 服务器的支持。开发者只需插入自己的工具，无需从零构建代理框架。 自建代理框架是一项庞大的工程，涉及状态持久化、工具执行和上下文生命周期管理，托管服务为构建 AI 自动化的团队卸下了这一负担。对于无文件系统的无服务器环境（如 Cloudflare Workers）来说尤其有价值，因为代理状态本来就没地方存放。 该 API 将框架、工具和状态从你的执行环境中抽象出来，而且值得注意的是你可以选择自托管沙箱，这缓解了供应商锁定的问题。评论者指出的一个局限是：OpenAI 并不公开用户付费购买的推理 token。 阅读官方 Agents API 指南，用一两个工具搭建一个简单代理原型，评估其抽象是否符合你的场景；务必查看自托管沙箱选项以降低锁定风险。如果你更倾向自托管，可以尝试在 QEMU 虚拟机中运行 Codex 并通过远程控制作为个人助手替代方案。

hackernews · aquir · 9月10日 19:43 · [社区讨论](https://news.ycombinator.com/item?id=49649213)

**背景**: 代理框架（agent harness，又称 scaffolding）是围绕 LLM 的软件基础设施，负责管理工具调用、记忆、状态持久化、执行环境和反馈循环——模型本身只是生产级代理系统中很小的一部分。开源框架库虽然存在，但通常与特定环境耦合，状态在哪里持久化成了难题。该 API 把框架搬进了 OpenAI 的云端：LLM 端点与代理/框架层的界限正日益模糊，因为 ChatGPT 等消费级产品本身就运行在带工具的后端框架上，而非裸 LLM。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://developers.openai.com/api/docs/guides/agents">Agents | OpenAI API</a></li>
<li><a href="https://en.wikipedia.org/wiki/Agent_harness">Agent harness - Wikipedia</a></li>
<li><a href="https://www.mongodb.com/company/blog/technical/agent-harness-why-llm-is-smallest-part-of-your-agent-system">The Agent Harness: Why the LLM Is the Smallest Part of Your Agent System | MongoDB</a></li>

</ul>
</details>

**社区讨论**: 评论者讨论了将代理作为产品提供的合适抽象层次，有人指出框架解决了 Cloudflare Workers 等无状态环境下的状态持久化难题。担忧主要集中在供应商锁定以及 OpenAI 不公开付费推理 token；也有人指出可以自托管沙箱，或在 QEMU 虚拟机中自行运行 Codex，并认为 LLM 端点与框架之间的界限正变得毫无意义。

**标签**: `#AI-agents`, `#OpenAI`, `#API`, `#LLM-orchestration`, `#vendor-lock-in`

---

<a id="item-4"></a>
## [trynix.dev 在浏览器 WASM 虚拟机中启动任意 Nix 包](https://simonwillison.net/2026/Sep/10/trynix/) ⭐️ 7.0/10

Farid Zakaria 发布了 trynix.dev，它通过 qemu-wasm（QEMU 的 WebAssembly 移植）在浏览器中完整运行一个 x86_64 Linux 虚拟机，并能通过 URL 地址（如 ?pkg=python3@3.6.2）启动过去 13 年间的任意 Nix 包。他还发布了 trynix-preview，这是一个 GitHub Action，会在拉取请求上评论一个链接，让评审者直接在浏览器中启动该 PR 的构建产物，无需任何服务器。 这使得可复现环境测试变得触手可及：任何人都可以在几秒内启动一个精确的历史软件环境（例如 2017 年的 Python 3.6.2），无需安装任何东西。通过实际启动来评审拉取请求的工作流，也提供了一种通过运行代码而非仅阅读差异来验证变更的新方式。 qemu-wasm 为 QEMU 添加了一个将中间表示转换为 WebAssembly 的 TCG 后端，并利用浏览器 API（WebAssembly.Module 和 WebAssembly.Instance），因为 Wasm 不允许将控制权转移到内存中生成的代码。所有内容都在浏览器客户端运行，因此虚拟机和 PR 预览工作流均不需要服务器。 访问 https://trynix.dev/?pkg=python3@3.6.2，点击“Load”，然后在启动的虚拟机中探索交互式 shell；如果你维护基于 Nix 的项目，可以尝试在拉取请求工作流中添加 trynix-preview GitHub Action。

rss · Simon Willison · 9月10日 23:44

**背景**: Nix 是一个纯函数式包管理器，它将每个包版本安装到唯一且不可变的存储路径中，从而使构建可复现，并让历史版本的包可以共存且始终可用。QEMU 是一个开源机器模拟器，其 TCG 即时编译器将客户机 CPU 指令翻译为宿主代码。qemu-wasm 将 QEMU 移植到 WebAssembly，使未经修改的软件（包括完整的 Linux 虚拟机）可以在浏览器标签页中运行，而 trynix.dev 将它与 Nix 长达 13 年的包存档相结合。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/ktock/qemu-wasm">GitHub - ktock/qemu-wasm: QEMU on browser · GitHub</a></li>
<li><a href="https://en.wikipedia.org/wiki/Nix_(package_manager)">Nix (package manager) - Wikipedia</a></li>
<li><a href="https://nixos.org/">Nix & NixOS | Declarative builds and deployments</a></li>

</ul>
</details>

**标签**: `#nix`, `#webassembly`, `#virtualization`, `#reproducibility`, `#devops`

---

<a id="item-5"></a>
## [Shopify 借助 AI 编程代理回归原生 Swift/Kotlin 应用](https://simonwillison.net/2026/Sep/10/shopify-react-native/) ⭐️ 7.0/10

Shopify 宣布将其移动应用从 React Native 迁回 Swift（iOS）和 Kotlin（Android）两套原生代码库，推翻了 2020 年的架构决策。据称借助 AI 编程代理 Pi，团队仅用 12 周就从概念验证完成了 Shop 应用原生版本并上架应用商店。 这是一个有影响力的行业案例，说明 AI 编程代理正在改变基础的工程权衡：维护两套并行原生代码库的成本——当初选择跨平台框架的核心理由——已不再是决定性因素。任何主要为了避免重复开发而选择跨平台的团队都应重新评估这一假设。 Shopify 肯定了 React Native 在六年使用中的出色表现，原生开发的成本并未消失——只是代理能承担足够多的实现、翻译、测试和审查工作，从而改变了平衡。在 Shopify 维护的三个主要 React Native 库中，react-native-skia 和 flash-list 将寻找新维护者，而 restle 将于 2026 年底归档。 阅读 Shopify 的工程博客文章（《Back to Native》和 Shop 应用迁移实录），并假设 AI 代理能承担 30-50% 的跨平台翻译与维护工作，重新评估你自己团队的移动架构成本分析。

rss · Simon Willison · 9月10日 21:11

**背景**: React Native 允许开发者用单一的 JavaScript/TypeScript 代码库编写 iOS 和 Android 应用，历来以牺牲部分原生保真度和性能来换取更低的重复成本。Shopify 在 2020 年切换到它是为了不再重复构建功能、让开发者跨栈工作，并减少在功能对齐上花费的时间。原生开发（iOS 用 Swift，Android 用 Kotlin）能发挥完整的平台能力，但过去意味着实现和维护成本翻倍——而 AI 编程代理正在改变这一权衡。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://shopify.engineering/shop-app-migration">Migrating Shop app from React Native to native (2026) - Shopify</a></li>
<li><a href="https://aiengineerguide.com/til/shopify-react-native-app-migration-using-ai/">Shopify has moved from React Native to Native using AI</a></li>

</ul>
</details>

**标签**: `#mobile-development`, `#react-native`, `#ai-agents`, `#software-architecture`, `#case-study`

---

<a id="item-6"></a>
## [NVIDIA 发布 SoL-Pi：Pi 编码代理的效率扩展](https://www.reddit.com/r/LocalLLaMA/comments/1wcujgg/pi_agent_users_nvidia_released_solpi_a/) ⭐️ 7.0/10

NVIDIA 开源了 SoL-Pi，这是 Pi 编码代理的一个独立扩展，包含通过大规模自动研究循环发现的四种可选效率机制：Action Fusion（在同一次工具调用中执行编辑后的验证命令）、ObservationPack（将重复出现的大型工具结果替换为可分页检索的稳定句柄）、Evidence-Preserving Reducer（在保留引用与归档原文完全匹配的前提下把长日志压缩为紧凑收据），以及 Online Context Compact（将已完成的计划步骤交给 Pi 原生压缩机制处理）。它可直接安装在未修改的 Pi 版本上，只使用公开扩展 API，且所有机制默认关闭。 长时间运行的编码代理会在重复回合、上下文重放和过大的工具输出上浪费 token 和推理算力，推高成本和延迟；SoL-Pi 正是针对这些失效模式，同时不偷工减料、不隐藏证据。这四种机制是可复用的设计模式，任何代理或自动化框架的开发者都可以借鉴，其自动研究方法也展示了如何系统性地发现此类优化。 设计上的关键约束包括：不修改 Pi 本体（仅使用公开 API）、显式可选（缺少配置即保持关闭）、保留证据（原始观察结果在本地仍然可用，压缩失败则保持原结果不变），并且认证、提供商 URL、主模型和 shell 行为仍由 Pi 控制。压缩操作受经济性和上下文窗口压力检查约束，压缩成功后 Pi 会在新一轮中继续任务。 从 GitHub 仓库将 SoL-Pi 安装到现有的 Pi 环境上，然后逐个启用机制（例如先试 ObservationPack 或 Action Fusion），在一个有代表性的长时间任务上对比启用前后的 token 用量和回合数。

reddit · r/LocalLLaMA · /u/Thrumpwart · 9月10日 20:17

**背景**: Pi 是一个开源编码代理和代理框架（由 Earendil Works / Mario Zechner 开发），在终端中运行，让大语言模型读写和修改代码并执行 shell 命令；它通过公开扩展 API 高度可定制，并支持自定义压缩策略。“自动研究（auto-research）”指让 AI 代理围绕某个基准反复迭代改进系统、只保留确实有效的改动的循环。NVIDIA 的 SoL-Pi 源于一个问题：在扩大代理循环规模之前，能否先让框架本身更高效，其目标是减少 token 流量、推理工作量和回合数，同时不提前终止、不跳过验证。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Pi_(AI_agent)">Pi (AI agent) - Wikipedia</a></li>
<li><a href="https://pi.dev/">Pi Coding Agent</a></li>
<li><a href="https://www.datacamp.com/tutorial/guide-to-autoresearch">A Guide to Andrej Karpathy’s AutoResearch ... - DataCamp</a></li>

</ul>
</details>

**标签**: `#ai-agents`, `#nvidia`, `#llm-efficiency`, `#open-source`, `#automation`

---

<a id="item-7"></a>
## [openai-python v3.13.0 新增 Agents API 支持](https://github.com/openai/openai-python/releases/tag/v3.13.0) ⭐️ 6.0/10

OpenAI 于 2026 年 9 月 10 日发布了官方 Python SDK 的 v3.13.0 版本，唯一列出的功能是新增 Agents API。这使 Agents API 进入该 SDK 的类型化接口，Python 开发者可以直接通过 SDK 资源调用它。 在 Python 中构建智能体或自动化工作流的开发者，现在可以通过官方类型注解的 SDK 使用 Agents API，而无需手写 HTTP 调用或依赖第三方封装。这降低了使用 OpenAI 托管的智能体基础设施（如编排和工具调用）的门槛。 该发布说明没有提供实现细节、代码示例或迁移说明，只有一个提交引用。根据 OpenAI 文档，Agents API 运行 Codex harness，并提供上下文自动压缩、多智能体编排、程序化工具调用以及 MCP 服务器支持。 通过 `pip install -U openai` 升级到 v3.13.0，然后查看 SDK 的 API 参考中新增的 `agents` 资源，并按照 Agents API 指南尝试定义一个带指令、模型和工具的智能体。

github · openai-sdks[bot] · 9月10日 19:37

**背景**: openai-python 是 OpenAI 的官方 Python 客户端（支持 Python 3.10+），提供类型化的请求/响应模型，以及基于 HTTPX2 的同步和异步客户端。Agents API 是 OpenAI 的托管智能体服务：它负责运行智能体循环和底层基础设施，开发者只需关注指令、工具和上下文。它与独立的 Agents SDK 和 Responses API 互补，共同用于构建智能体工作流。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://developers.openai.com/api/docs/guides/agents">Agents | OpenAI API</a></li>
<li><a href="https://github.com/openai/openai-python">GitHub - openai/openai-python: The official Python library ...</a></li>
<li><a href="https://developers.openai.com/api/docs/guides/agents/define-agents">Agent definitions | OpenAI API</a></li>

</ul>
</details>

**标签**: `#openai`, `#python-sdk`, `#agents`, `#api`, `#release-notes`

---

<a id="item-8"></a>
## [Reddit 帖子为 Artificial Analysis 基准测评辩护，称其独立且可信](https://www.reddit.com/r/LocalLLaMA/comments/1wcxxm8/artificial_analysis_is_not_broken_and_they_prove/) ⭐️ 5.0/10

r/LocalLLaMA 上的一个帖子反驳了近几周社区中称 Artificial Analysis“已失效”或“被收买”的言论，认为其基准测评资金独立、方法透明。作者列举了 AA 公开的支出（例如花费 13,129 美元独立测试 Fable 5.1），并以 DeepSeek V4.1-Flash 为例说明综合分数可能掩盖各单项基准的优劣。 这篇帖子提供了正确解读基准排行榜的实用经验：单一综合指数可能隐藏各单项评估间的巨大差异，因此选择模型应基于与你使用场景相关的具体基准。它还澄清了 Artificial Analysis 的测试资金来源，对评估其可信度的人很有参考价值。 Artificial Analysis 智能指数是约 10 项评估的加权综合分，其中大多数评估在 arxiv 上发表了论文，AA-Briefcase 是唯一的私有基准。在所举例子中，DeepSeek V4.1-Flash（552B）与 Qwen 3.8-Flash-Next（180B）同为 40 分，但在 AutomationBench-AA 上击败了 GPT-6 Astra (Max)，而在 AA-Omniscience 非幻觉率指标上明显落后。 在相信或否定某个排行榜之前，先打开 artificialanalysis.ai 上各项单独评估的页面，阅读说明综合指数如何加权的方法论文档，再根据最接近你实际工作负载的基准来选择模型。

reddit · r/LocalLLaMA · /u/Antblue · 9月10日 22:26

**背景**: Artificial Analysis 是一个独立网站，对 AI 模型的推理、编程、知识和智能体任务进行基准测试，并发布将多项评估汇总为单一可比分数的智能指数。其私有基准 AA-Briefcase 衡量的是长周期、多步骤的知识型智能体工作，而非短小的独立问题。综合指数虽然方便，但天然会损失信息：总分相同的模型在各项评估上的能力分布可能截然不同。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://artificialanalysis.ai/evaluations/artificial-analysis-intelligence-index">Artificial Analysis Intelligence Index v4.3</a></li>
<li><a href="https://artificialanalysis.ai/evaluations/aa-briefcase?ref=foundevo.com">AA - Briefcase : Agentic Knowledge Work Benchmark | Artificial Analysis</a></li>

</ul>
</details>

**社区讨论**: 作者在编辑中提到评论者大多不认同该帖，他认为这证明了社区不理解基准测评的实际运作方式；整个讨论反映了综合指数批评者与支持透明单项分析者之间的持续争论。

**标签**: `#benchmarks`, `#llm-evaluation`, `#artificial-analysis`, `#local-llama`, `#ai-models`

---