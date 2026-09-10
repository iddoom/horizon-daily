---
layout: default
title: "Horizon Summary: 2026-09-10 (ZH)"
date: 2026-09-10
lang: zh
---

> 从 57 条内容中筛选出 10 条重要资讯。

---

1. [Shopify 从 React Native 回归原生开发](#item-1) ⭐️ 9.0/10
2. [Forgejo <=16.0.3 严重远程代码执行漏洞已在 16.0.4 修复](#item-2) ⭐️ 8.0/10
3. [Forgejo 16.0.4 与 15.0.8 修复通过 .git 目录注入实现的关键 RCE 漏洞](#item-3) ⭐️ 7.0/10
4. [CyberTiel 35B-A3B 4-bit 量化模型在 SWE-bench-Live 上超越更大编程模型](#item-4) ⭐️ 7.0/10
5. [openai-python v3.13.0 新增原生 Agents API 端点](#item-5) ⭐️ 6.0/10
6. [openai-python v3.12.0 新增 Live API 支持并修复异步问题](#item-6) ⭐️ 6.0/10
7. [研究者用 Codex 和 ChatGPT 挖掘基因组寻找新型抗菌分子](#item-7) ⭐️ 6.0/10
8. [OpenAI 在 ChatGPT Work 中推出 Data agent](#item-8) ⭐️ 6.0/10
9. [PostgreSQL 19 因多个不稳定补丁面临发布质量担忧](#item-9) ⭐️ 6.0/10
10. [GitHub Actions 推出 cache-mode 设置，实现缓存最小权限访问](#item-10) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [Shopify 从 React Native 回归原生开发](https://shopify.engineering/back-to-native) ⭐️ 9.0/10

Shopify 解释了为何将其移动应用从 React Native 迁回完全原生开发，引发了社区关于跨平台框架何时适用以及 AI 代码生成如何改变这一权衡的热烈讨论。

hackernews · fnthawar2 · 9月10日 14:09 · [社区讨论](https://news.ycombinator.com/item?id=49643982)

**标签**: `#mobile-development`, `#react-native`, `#shopify`, `#engineering-decisions`, `#ai-code-generation`

---

<a id="item-2"></a>
## [Forgejo <=16.0.3 严重远程代码执行漏洞已在 16.0.4 修复](https://codeberg.org/forgejo/forgejo/src/branch/forgejo/release-notes-published/16.0.4.md) ⭐️ 8.0/10

Forgejo 16.0.4 修复了影响 16.0.3 及更早版本的严重远程代码执行（RCE）漏洞，该漏洞源于模板仓库的变量展开过程干扰了 git 仓库初始化。恶意模板仓库可以读取 Forgejo 主机上的任意数据并执行任意进程。 Forgejo 被广泛用于自托管场景，主机级 RCE 可能导致源代码、密钥和配置泄露，或被用来攻击其他服务。允许不受信任用户创建模板仓库的自托管用户首当其冲，应立即升级。 从模板生成仓库时，Forgejo 会克隆模板、删除 .git 目录、对 .forgejo/template 中列出的文件进行变量展开，然后初始化新的 git 仓库；漏洞正是发生在模板展开干扰初始化步骤时。据 Gitea 项目领导层确认，与 Forgejo 同源的 Gitea 不受此问题影响。 立即将 Forgejo 实例升级到 16.0.4 或更高版本，并审查由不受信任用户创建的模板仓库中是否含有恶意的 .forgejo/template 条目。如无法立即升级，应限制创建或使用模板仓库的权限。

hackernews · weierstass · 9月10日 15:57 · [社区讨论](https://news.ycombinator.com/item?id=49645907)

**背景**: Forgejo 是从 Gitea 分叉的开源自托管 Git 服务，Codeberg 等平台即在使用。模板仓库功能允许用户生成预填充文件的新仓库，并通过类似 Go 语言 os.Expand 的语法对文件内容进行变量替换。远程代码执行（RCE）漏洞使攻击者能以应用进程的权限在服务器上执行任意命令。修复已发布于 16.0.4 版本（对应 Codeberg 上的 issue #14300 和 PR #14301）。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://news.ycombinator.com/item?id=49645907">Forgejo <=16.0.3 Critical RCE | Hacker News</a></li>
<li><a href="https://codeberg.org/forgejo/forgejo/issues/14300">#14300 - 2026-09-10 security patches - forgejo/forgejo ...</a></li>
<li><a href="https://www.sentinelone.com/vulnerability-database/cve-2025-68937/">CVE-2025-68937: Forgejo RCE Vulnerability - SentinelOne</a></li>

</ul>
</details>

**社区讨论**: 评论者澄清了漏洞机制（从模板初始化 git 仓库时的变量展开），并确认 Gitea 不受影响。有用户批评 Codeberg 安全团队的响应态度，并猜测在 Forgejo 禁止 AI 贡献后攻击者会用 LLM 找漏洞；一位 Gitea 领导者则提醒不要因安全事件指责项目，以免减少漏洞报告。

**标签**: `#security`, `#cve`, `#forgejo`, `#rce`, `#devops`

---

<a id="item-3"></a>
## [Forgejo 16.0.4 与 15.0.8 修复通过 .git 目录注入实现的关键 RCE 漏洞](https://lwn.net/Articles/1093671/) ⭐️ 7.0/10

Forgejo 发布了 16.0.4 和 15.0.8 两个版本，修复了两个安全漏洞，其中包括一个可导致远程代码执行（RCE）的关键缺陷。该漏洞允许恶意模板仓库滥用变量展开机制重建 .git 目录，从而被 git 在初始化新仓库时采用。 任何运行自托管 Forgejo 且允许用户从模板创建仓库的实例，都可能遭受服务器上的任意文件读取和任意代码执行。这一攻击向量也很有技术参考价值：在处理流程的中间步骤之间信任文件系统内容，可能会破坏看似安全的工作流。 有缺陷的流程是：克隆模板仓库、删除 .git 目录、对 .forgejo/template 中列出的文件做变量展开，然后执行 git 初始化——但变量展开可以写出新的 .git 目录并被 git 采用。修复方式是在变量展开完成后、git 初始化之前，先删除任何已存在的 .git 目录。 立即将所有 Forgejo 实例升级到 16.0.4 或 15.0.8，并对托管不可信用户的实例进行审计，检查是否存在可疑仓库或通过模板展开产生的异常进程。

rss · LWN.net · 9月10日 20:05

**背景**: Forgejo 是一个轻量级的自托管软件锻造平台（源自 Gitea 分支），提供 Git 托管、问题跟踪、代码评审和持续集成等功能。与 Gitea 一样，它支持模板仓库：可以从模板生成新仓库，并在指定文件中展开预定义变量，通常通过 .gitea/template 或 .forgejo/template 之类的文件配置。由于 .git 目录包含仓库配置（包括钩子），在 git 初始化之前向目录注入伪造的 .git 文件夹，攻击者就能定义在特定操作时执行恶意命令的钩子。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://forgejo.org/">Forgejo – Beyond coding. We forge.</a></li>
<li><a href="https://docs.gitea.com/usage/repository/template-repositories/">Template Repository | Gitea Documentation Template Repositories | Gitea Documentation Variables for template repositories · community · Discussion ... Forge-Specific Repository Folders | Andrew Nesbitt templates - Set up a default directory structure on git init ... Richard Clayton - Templatizing Github "Template Repos"</a></li>
<li><a href="https://en.wikipedia.org/wiki/Forgejo">Forgejo - Wikipedia</a></li>

</ul>
</details>

**标签**: `#security`, `#forgejo`, `#git`, `#vulnerability`, `#self-hosting`

---

<a id="item-4"></a>
## [CyberTiel 35B-A3B 4-bit 量化模型在 SWE-bench-Live 上超越更大编程模型](https://www.reddit.com/r/LocalLLaMA/comments/1wcpppm/cybertiel_35ba3bs_uncensored_4bit_quant_beats/) ⭐️ 7.0/10

一位匿名研究者发布了 CyberTiel，一个经过 abliteration 去审查的 35B-A3B 编程模型，其 4-bit GGUF 量化版本据称在真实代码库问题上超越 Claude Opus 4.6 medium，且解题时间仅为 Qwen3.8-27b medium 的 27%。关键技术是使用由网络安全和智能体软件工程语料烘焙的 imatrix 进行量化，从而以更高精度保留与相关任务所需的权重。 这为本地大模型用户提供了实用方法：使用领域定制的 imatrix 时，Q4 量化下 abliteration 造成的损伤可以忽略不计，意味着去审查不必牺牲编程能力。这也是一次少见的基于 SWE-bench-Live 的实测对比，测试的是在真实代码库中解决真实问题，而非合成题目。 作者指出它仍是 35B-A3B 模型，以牺牲世界知识换取编程能力，定位介于 Opus 4.6 medium 与 Qwen3.8-27b medium 之间——凭借速度优势足够应对大多数日常工作。GGUF 和 MLX 权重（含与不含 MTP）已上传至 Hugging Face；相关结论来自单一作者，尚无独立验证。 从 Hugging Face 下载 CyberTiel 的 GGUF 或 MLX 权重，在你自己的代码库上用现有本地编程智能体测试一个真实 issue，并与当前使用的模型对比质量和速度。

reddit · r/LocalLLaMA · /u/peculiar-ragdoll · 9月10日 17:26

**背景**: Abliteration 是一种通过识别并削弱激活空间中的“拒绝方向”来移除大模型拒答行为的技术，但已知可能损害模型质量。量化（如 4-bit）可降低模型精度以节省内存；imatrix（重要性矩阵）由校准语料计算得出，在量化过程中决定哪些权重值得保留更高精度。使用领域定制的 imatrix 语料意味着与编程/安全相关的权重能得到更好保留。SWE-bench-Live 是一个持续更新的基准，用近期真实 GitHub issue 评估大模型，以解决传统基准过时的问题。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/blog/mlabonne/abliteration">Uncensor any LLM with abliteration</a></li>
<li><a href="https://ai-tldr.dev/learn/local-open-models/quantization-and-formats/imatrix-quantization/">What Is an imatrix? Smarter GGUF Quantization | AI/TLDR</a></li>
<li><a href="https://swe-bench-live.github.io/">SWE - bench - Live Leaderboard</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#quantization`, `#coding-models`, `#swe-bench`, `#open-source-ai`

---

<a id="item-5"></a>
## [openai-python v3.13.0 新增原生 Agents API 端点](https://github.com/openai/openai-python/releases/tag/v3.13.0) ⭐️ 6.0/10

OpenAI 于 2026 年 9 月 10 日发布了官方 openai-python SDK 的 v3.13.0 版本，唯一的新特性是新增了 Agents API 端点。这使 Python 开发者无需单独使用 Agents SDK，即可通过原生 SDK 访问 OpenAI 的服务端智能体基础设施。 构建智能体工作流的开发者现在可以直接通过主 API 客户端定义并运行智能体，简化了依赖管理，使智能体功能成为标准 REST SDK 的一等公民。对于已在生产环境使用 openai-python 的团队来说，这降低了采用智能体编排的门槛。 本次发布说明仅包含一个提交（新增 Agents API），变更日志中没有详细的文档或示例。根据 OpenAI 官方文档，Agents API 在服务端运行 Codex harness，支持自动上下文压缩、多智能体编排、程序化工具调用以及 MCP 服务器支持；该 SDK 支持 Python 3.10+，并提供同步和异步客户端。 运行 `pip install --upgrade openai` 升级，并阅读 Agents API 指南（developers.openai.com/api/docs/guides/agents），尝试通过新端点定义一个包含指令、模型和工具的简单智能体。

github · openai-sdks[bot] · 9月10日 19:37

**背景**: 此前 OpenAI 提供了两条智能体开发路径：用于带工具的基础模型调用的 Responses API，以及用于编排的独立 openai-agents Python SDK。Agents API 将大部分智能体循环移到了服务端——由 OpenAI 管理上下文、工具调用和 harness 执行——开发者只需专注于定义指令、模型和工具。openai-python 库为 OpenAI REST API 提供带类型定义的请求/响应模型，以及基于 HTTPX2 的同步/异步客户端。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://developers.openai.com/api/docs/guides/agents">Agents | OpenAI API</a></li>
<li><a href="https://github.com/openai/openai-python">GitHub - openai/openai-python: The official Python library ...</a></li>
<li><a href="https://openai.com/api/">API Platform | OpenAI</a></li>

</ul>
</details>

**标签**: `#openai`, `#python-sdk`, `#agents`, `#api-release`, `#ai-automation`

---

<a id="item-6"></a>
## [openai-python v3.12.0 新增 Live API 支持并修复异步问题](https://github.com/openai/openai-python/releases/tag/v3.12.0) ⭐️ 6.0/10

OpenAI 于 2026 年 9 月 10 日发布了 openai-python v3.12.0，为官方 Python SDK 新增了面向实时语音/音频会话的 Live API 支持。该版本还修复了三个问题：为 AsyncStream 添加标准的异步清理方法 aclose()、处理不带类型参数的裸 dict/list 类型注解，以及在补全返回空响应时保留已生成的输出。 构建实时低延迟语音或音频应用的 Python 开发者现在可以通过官方 SDK 直接使用 Live API，而不必借助变通方案。这些修复解决了实际开发中的边界问题——例如缺失 aclose() 曾导致 Langfuse 等包装/埋点库在对流对象执行标准异步清理时报 AttributeError。 aclose() 修复（issue #2854）使 AsyncStream 与 httpx.Response、asyncio.StreamWriter 的约定保持一致；同步的 Stream 类不受影响，因为其调用方使用的是 close()。空响应修复（issue #3345）确保在服务器返回空补全结果时，已经流式输出的内容不会丢失。 运行 `pip install --upgrade openai` 升级到 v3.12.0，然后查阅 OpenAI 文档中的 Realtime/Live API 指南，开始在 Python 中体验实时音频会话。

github · openai-sdks[bot] · 9月10日 17:28

**背景**: Live API（与 OpenAI 2024 年 10 月推出的 Realtime API 相关）通过单次 API 调用即可实现自然的全双工语音对话，适合需要低延迟的实时音频，而非基于文件或有边界的音频请求。在 Python 异步生态中，管理流的对象按惯例应提供 aclose() 用于协作式清理——此前 AsyncStream 只有 close()，导致期望标准接口的包装库出错。此外，不带类型参数的裸 dict/list 注解（如 dict 而非 dict[str, int]）也曾引发 SDK 的类型处理问题。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://developers.openai.com/api/docs/guides/realtime">Realtime and audio | OpenAI API</a></li>
<li><a href="https://github.com/openai/openai-python/issues/2853">AsyncStream missing aclose () causes AttributeError in ...</a></li>
<li><a href="https://openai.com/index/introducing-the-realtime-api/">Introducing the Realtime API - OpenAI</a></li>

</ul>
</details>

**标签**: `#openai`, `#python-sdk`, `#api`, `#release-notes`, `#live-api`

---

<a id="item-7"></a>
## [研究者用 Codex 和 ChatGPT 挖掘基因组寻找新型抗菌分子](https://openai.com/index/using-codex-chatgpt-to-search-for-new-antimicrobials) ⭐️ 6.0/10

OpenAI 发布了一篇案例研究，介绍宾夕法尼亚大学 César de la Fuente 实验室如何使用 Codex 和 ChatGPT 在现存和已灭绝生物的基因组中搜寻抗菌肽候选分子，以应对耐药菌感染。 它展示了在大语言模型编程智能体用于科学发现的一个具体应用模式：将原本需要大量人工编写代码的生物信息学数据处理和挖掘流程自动化。任何数据密集型领域的研究者都可以借鉴这种把探索性分析交给 AI 智能体的做法。 这是一篇带有宣传性质、技术细节和可复现方法有限的厂商博客文章；de la Fuente 此前经过同行评审的工作（例如挖掘 87,920 个细菌和古菌基因组、发现数十万候选抗菌肽）才是实质性的方法来源。报道中的工作流主要依赖提示词驱动的代码生成，而非已发表的流程。 可以先阅读 OpenAI 的文章了解工作流程，再研读 de la Fuente 经同行评审的论文（如 2024 年 Cell 上关于机器学习发现抗菌肽的论文）理解底层方法；也可以在自己的数据集上尝试搭建类似的 AI 智能体辅助数据处理流程。

rss · OpenAI Blog · 9月10日 16:00

**背景**: 抗菌素耐药性（AMR）是指细菌进化出在现有抗生素下存活的能力，使感染更难治疗、治疗成本更高。抗菌肽（AMP）是许多生物体内存在的短氨基酸序列，能够杀灭细菌，基因组是寻找候选分子的重要来源。de la Fuente 实验室一直致力于用机器学习方法在序列空间和全球微生物组中挖掘新的抗菌肽。Codex 是 OpenAI 的 AI 编程智能体，可以编写和运行代码，此处被用于加速基因组挖掘流程。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.cell.com/cell/fulltext/S0092-8674(24)00522-1">Discovery of antimicrobial peptides in the global microbiome with machine learning: Cell</a></li>
<li><a href="https://pubs.acs.org/doi/10.1021/acs.accounts.0c00594">AI-Driven Antimicrobial Peptide Discovery: Mining and Generation | Accounts of Chemical Research</a></li>
<li><a href="https://github.com/openai/codex">GitHub - openai/codex: Lightweight coding agent that runs in your terminal · GitHub</a></li>

</ul>
</details>

**标签**: `#AI`, `#LLM applications`, `#scientific research`, `#bioinformatics`, `#case study`

---

<a id="item-8"></a>
## [OpenAI 在 ChatGPT Work 中推出 Data agent](https://openai.com/index/put-data-to-work) ⭐️ 6.0/10

OpenAI 在 ChatGPT Work 中推出了新的 Data agent，它可以直接连接公司数据源，让用户用自然语言提问、获得基于实时数据的答案，并构建交互式仪表盘。该功能旨在用实时、对话式的数据访问取代基于过期数据构建的报告流程。 这项功能将商业智能的能力从专业分析师扩展到普通员工，无需 SQL 或 BI 工具专业知识即可查询和可视化公司数据。正在评估 AI 工具的团队可以将其视为传统 BI 平台的替代或补充方案。 该公告只是一份简短的产品宣传，未提供支持的数据连接器、权限控制或定价层级等技术细节。类似能力在其他产品中也存在（如 Amazon Quick 的自然语言仪表盘生成），采购前应对比准确性和数据治理能力。 如果你的团队使用 ChatGPT Work，可以先将 Data agent 连接到一个低风险的沙盒数据集，测试其答案和仪表盘是否与现有 BI 工具的结果一致，再接入生产数据。

rss · OpenAI Blog · 9月10日 15:00

**背景**: AI agent 是由大语言模型驱动的系统，能够执行操作（查询数据库、运行代码、生成图表），而不仅仅是生成文本。传统 BI 工作流需要分析师手工构建仪表盘和报告，往往滞后于实时业务数据。自然语言 BI 允许用户直接输入诸如"展示过去 30 天的每日收入"这样的问题，由系统自动生成查询和可视化，OpenAI、AWS 等厂商目前都在提供这一模式。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://openai.com/index/put-data-to-work/">Now everyone can put data to work | OpenAI</a></li>
<li><a href="https://aws.amazon.com/blogs/machine-learning/generate-dashboards-from-natural-language-prompts-in-amazon-quick/">Generate dashboards from natural language prompts in Amazon Quick | Artificial Intelligence</a></li>

</ul>
</details>

**标签**: `#OpenAI`, `#AI agents`, `#data analysis`, `#business intelligence`, `#product announcement`

---

<a id="item-9"></a>
## [PostgreSQL 19 因多个不稳定补丁面临发布质量担忧](https://lwn.net/Articles/1092003/) ⭐️ 6.0/10

8 月 25 日，PostgreSQL 贡献者 Robert Haas 发出主题为“scary patch contest”的邮件，指出 PostgreSQL 19 中多个补丁在发布前需要异常大量的错误修复。其中一个补丁已被回退，其余仍在密集修订中，项目还额外增加了一个 beta 版本以留出更多测试时间。 PostgreSQL 19 是一个包含重大特性的版本（如 SQL/PGQ 图查询、查询计划提示、在线表重组和并行 autovacuum），发布末期的不稳定性对早期采用者意味着较高风险。数据库运维人员在规划升级时间时应考虑这一点，尤其是生产环境中依赖受影响特性的场景。 争议焦点在于若干补丁在发布后期需要异常多的错误修复，Haas 以此判断这些补丁尚未达到稳定发布标准；一个补丁已被完全回退，其余仍在继续修订。项目组为此在原定 9 月发布之前增加了一个额外的 beta 测试周期。 如果你在生产环境运行 PostgreSQL，建议等待最终稳定版（最好还包括首个小版本修复）再升级；若打算尽早采用 PostgreSQL 19 的新特性，可先在新增的 beta 周期中用自己的工作负载进行测试。

rss · LWN.net · 9月10日 17:29

**背景**: PostgreSQL 遵循每年一个主版本的发布节奏，补丁通过正式的“commitfest”流程开发和评审，在功能冻结后进入多个 beta 版本测试。社区 beta 测试是关键的质量关卡——任何人都可以下载 beta 版本，用自己的工作负载做回归测试并报告 bug。PostgreSQL 19 的主要特性包括 SQL/PGQ 属性图查询、时态数据操作、查询计划提示、在线表重组以及逻辑复制改进。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://neon.com/postgresql/postgresql-19-new-features">PostgreSQL 19 New Features: What's New and Why It Matters</a></li>
<li><a href="https://wiki.postgresql.org/wiki/HowToBetaTest">HowToBetaTest - PostgreSQL wiki</a></li>
<li><a href="https://www.postgresql.org/docs/release/19.0/">Release Notes - PostgreSQL</a></li>

</ul>
</details>

**标签**: `#PostgreSQL`, `#database`, `#release management`, `#open source`, `#software quality`

---

<a id="item-10"></a>
## [GitHub Actions 推出 cache-mode 设置，实现缓存最小权限访问](https://github.blog/changelog/2026-09-10-control-github-actions-cache-access-with-cache-mode) ⭐️ 5.0/10

GitHub Actions 现在支持 cache-mode 设置，可以在工作流（workflow）或任务（job）级别对 Actions 缓存应用最小权限访问。每个工作流或任务只被授予其实际所需的缓存访问权限，这是继 2026 年 6 月针对不受信任触发器发放只读缓存令牌之后的进一步改进。 缓存投毒（cache poisoning）是 CI 中已知的提权路径：如果不受信任的工作流运行（例如来自 fork 的拉取请求）能写入共享缓存，后续受信任的运行就可能恢复恶意内容。该设置让维护者在保留缓存加速优势的同时加固流水线安全。 根据 GitHub 社区讨论中对这一功能的预告，其目标是在降低缓存投毒风险的同时保留现有行为（共享缓存访问）作为默认值，因此现有工作流不会中断。该功能建立在 2026 年 6 月的变更之上，即对无需写权限即可触发的事件，默认分支工作流只发放只读缓存令牌。 检查仓库中那些永远不应写缓存的工作流任务（例如处理 fork 拉取请求的任务），然后应用新的 cache-mode 设置，将这些任务限制为只读或隔离的缓存访问。

rss · GitHub Changelog · 9月10日 17:26

**背景**: GitHub Actions 缓存（通过 actions/cache 使用）是按仓库而非按工作流划分作用域的，因此任何具有写权限的运行都可以覆盖其他运行使用的缓存条目。攻击者可以通过提交拉取请求写入被投毒的缓存条目，随后被特权工作流恢复并执行——这就是典型的缓存投毒提权。此前应用于 Actions 其他部分的最小权限原则（如 permissions 块和 OIDC 短期凭证）现在扩展到了缓存本身。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/orgs/community/discussions/194493">Help Us Improve GitHub Actions Cache Isolation · community...</a></li>
<li><a href="https://github.blog/changelog/2026-06-26-read-only-actions-cache-for-untrusted-triggers/">Read-only Actions cache for untrusted triggers - GitHub Changelog</a></li>

</ul>
</details>

**社区讨论**: 该功能曾在 GitHub 社区讨论“Help Us Improve GitHub Actions Cache Isolation”中预告，团队强调将当前的共享缓存行为保留为默认，以避免破坏现有工作流，同时降低投毒风险。

**标签**: `#github-actions`, `#ci-cd`, `#devops`, `#security`

---