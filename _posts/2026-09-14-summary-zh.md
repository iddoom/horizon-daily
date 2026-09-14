---
layout: default
title: "Horizon Summary: 2026-09-14 (ZH)"
date: 2026-09-14
lang: zh
---

> 从 16 条内容中筛选出 5 条重要资讯。

---

1. [ZLUDA Windows 版让 CUDA 应用在 AMD GPU 上运行，性能损失仅约 3%](#item-1) ⭐️ 7.0/10
2. [Claude Fable 5.1 破解 370 年历史的 Cyphral Distich 密码](#item-2) ⭐️ 6.0/10
3. [Bryan Cantrill 发文批评煽动性的 AI 灭绝论调](#item-3) ⭐️ 6.0/10
4. [Simon Willison 发布 commit-rewriter 0.1，用于编辑 git 提交信息](#item-4) ⭐️ 6.0/10
5. [shot-scraper 1.12 新增 WebP 截图输出](#item-5) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [ZLUDA Windows 版让 CUDA 应用在 AMD GPU 上运行，性能损失仅约 3%](https://www.reddit.com/r/LocalLLaMA/comments/1wfij7a/cudaforamdwindows_run_cudatargeted_windows/) ⭐️ 7.0/10

一位 Reddit 用户分享了一个正确编译为 Windows 版的 ZLUDA 构建，使面向 CUDA 的 Windows 应用可以通过 ROCm/HIP 在 AMD GPU 上运行。据报告，相比原生执行仅有约 3%的性能损失。 大多数本地大模型工具和 GPU 软件都基于 NVIDIA 的 CUDA 编写，AMD GPU 用户往往无法直接运行。一个近乎无损的即插即用翻译层可以为 Windows 上的 AMD 用户解锁大量仅支持 CUDA 的软件。 ZLUDA 是一个即插即用替代层，拦截 CUDA 调用并将其翻译为 AMD 的 HIP 运行时，无需修改或重新编译原始应用。该项目历史较为复杂——曾获 AMD 资助但后来被部分撤回，其开源状态在许可和厂商支持方面仍有限制。 如果你在 Windows 上用 AMD GPU 运行本地大模型，可以从 vosen/ZLUDA 的 GitHub 仓库获取该构建，安装 ROCm，并在仅支持 CUDA 的负载（如 llama.cpp 的 CUDA 版本）上实测兼容性和性能。

reddit · r/LocalLLaMA · /u/_underlines_ · 9月13日 20:19

**背景**: CUDA 是 NVIDIA 的专有 GPU 计算平台，与 NVIDIA 硬件和驱动深度绑定。AMD 的对应方案是 ROCm，其中的 HIP API 允许开发者用单一源码编写可在 AMD GPU 上运行的程序。ZLUDA 在运行时充当翻译层，将两者打通，使已编译的 CUDA 二进制文件无需移植源码即可在 AMD 硬件上执行。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/vosen/ZLUDA">GitHub - vosen/ZLUDA: CUDA on non-NVIDIA GPUs · GitHub</a></li>
<li><a href="https://www.theregister.com/2024/08/09/amd_zluda_take_down/">AMD lawyers claw back CUDA compatibility layer ZLUDA</a></li>
<li><a href="https://en.wikipedia.org/wiki/ROCm">ROCm - Wikipedia</a></li>

</ul>
</details>

**社区讨论**: Reddit 发帖人指出这个 Windows 构建此前似乎无人提及，约 3%的减速令人满意，希望它能被各种受 CUDA 限制的项目采用；链接的 Hacker News 讨论串提供了更多技术层面的探讨。

**标签**: `#CUDA`, `#AMD`, `#ZLUDA`, `#LocalLLM`, `#GPU-computing`

---

<a id="item-2"></a>
## [Claude Fable 5.1 破解 370 年历史的 Cyphral Distich 密码](https://www.vals.ai/blogs/fable-solves-cyphral-distich) ⭐️ 6.0/10

Vals AI 报告称，其模型 Claude Fable 5.1 破解了 Cyphral Distich 密码——这是 Thomas Urquhart 爵士 1653 年著作《Logopandecteision》末尾的 64 个数字组成的密文，370 年来一直无人破解。该模型在开放式任务下于一天内给出答案，相关文章在 Hacker News 上迅速走红。 这表明前沿 LLM 已经能够解决此前受限于人类专家精力稀缺的未解历史密码分析问题。它还提供了一个可复用的启示：可以将 LLM 用于有外部验证方式的开放式谜题，以低成本探索模型能力边界。 该密码由两行各 32 个数字组成，学者至少自 1899 年起便争论不休，并被密码学研究者在 Klaus Schmeh 的“50 大未解密文”榜单收录。一个关键注意事项是 LLM 运行间的差异性：研究表明同一模型在多次运行中可能产生差别极大的结果，因此这次成功未必能稳定复现。 阅读 Vals AI 博客上的完整文章，了解确切的提示词和破译步骤，然后尝试用另一个前沿模型对同一密文复现该结果，亲自检验模型能力的差异性。

hackernews · u1hcw9nx · 9月13日 21:06 · [社区讨论](https://news.ycombinator.com/item?id=49688695)

**背景**: 对历史密码的经典密码分析通常需要猜测编码方案、进行频率分析，并用合理的明文进行交叉验证。Klaus Schmeh 维护着知名的“50 大未解密文”榜单，它是人类和 AI 破译者天然的能力基准。近期关于 LLM 稳定性的研究（如 arXiv 上的相关论文）表明，同一提示词在多次运行下的输出和准确率可能差异很大，这也正是社区争论此类一次性成功是否代表稳定能力的基础。

**社区讨论**: 评论者对 LLM 能力态度矛盾，在乐观与生存性担忧之间摇摆，有人将 LLM 比作“有限猴子”——对某些用户写出莎士比亚，对另一些则产出乱码。也有人分享了趣闻式成功案例（如 ChatGPT 在 20 分钟内破解家人童年写的密码），还有人指出这类问题历史上受限于人类注意力而非纯粹的难度。

**标签**: `#AI`, `#LLM`, `#cryptography`, `#benchmark`, `#AI capabilities`

---

<a id="item-3"></a>
## [Bryan Cantrill 发文批评煽动性的 AI 灭绝论调](https://bcantrill.dtrace.org/2026/09/13/the-contagion-of-fear/) ⭐️ 6.0/10

Oxide Computer 联合创始人兼 CTO Bryan Cantrill 发表文章《恐惧的传染》，批评关于 AI 导致人类灭绝的煽动性、最大化论断，主张进行基于证据的讨论，同时承认真实存在但更迫近的风险。该文在 Hacker News 上引发了一场实质性辩论，恰逢 OpenAI 和 Anthropic 研究人员的灭绝风险警告引发公众广泛关注之际。 这篇文章为评估 AI 风险论断提供了一个有分寸的框架，对工程师、政策制定者以及任何试图将严谨威胁分析与修辞恐慌区分开来的人都很有价值。它还强调了推测性的生存场景与人类行为者滥用 AI 造成的具体近期危害之间的区别，这一分歧正日益影响 AI 安全领域的优先级。 Cantrill 并不否认 AI 存在风险；他的核心反对对象是缺乏依据、无法证伪的概率性论断（例如"2036 年前灭绝概率为 10%"），他认为这类说法不负责任。背景方面：RAND 的一项研究认为 AI 造成灭绝虽然极其困难但并非完全不可能，而不少生存风险推理被批评为无法证伪、近乎宗教式思维。 阅读原文，并在下次遇到 AI 风险论断时应用其证据标准：在接受或转述之前，先追问支持它的具体机制、证据和可证伪的预测是什么。

hackernews · elffjs · 9月13日 22:38 · [社区讨论](https://news.ycombinator.com/item?id=49689460)

**背景**: Bryan Cantrill 是知名系统工程师，曾任职于 Sun Microsystems 和 Joyent，现任 Oxide Computer 的 CTO，以直言不讳的技术随笔著称。AI 灭绝风险辩论在 2023 年数百位专家联署声明后升温，该声明将减轻 AI 灭绝风险列为与流行病和核战争同等的全球优先事项。近期，OpenAI 和 Anthropic 的研究人员公开呼吁放缓 AI 开发，关于"p(doom)"概率的讨论也从小众论坛进入主流媒体并引起立法者关注。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Existential_risk_from_artificial_intelligence">Existential risk from artificial intelligence - Wikipedia</a></li>
<li><a href="https://www.rand.org/pubs/research_reports/RRA3034-1.html">On the Extinction Risk from Artificial Intelligence | RAND</a></li>
<li><a href="https://www.cnbc.com/2026/09/10/openai-anthropic-ai-safety-slowdown-extinction.html">OpenAI, Anthropic researchers ramp up calls for AI slowdown ... Existential risk from artificial intelligence - Wikipedia On the Extinction Risk from Artificial Intelligence | RAND AI safety debate ignites after viral warning from ex ... AI's extinction debate breaks containment - Axios Artificial intelligence could lead to extinction, experts warn Will AI Cause Human Extinction Within 10 Years? We Asked AI</a></li>

</ul>
</details>

**社区讨论**: 评论者普遍认同 Cantrill 对最大化论断的怀疑，同时强调对 AI 近期被人类滥用的担忧；机器人专家 GlenTheMachine 认为实体经济的完全自动化还很遥远，恶意的人类行为者才是更迫近的威胁。fasterik 强调 Cantrill 并非否认 AI 风险，而是反对缺乏强有力证据的煽动性说法；ggm 提到 Hinton 虽使用过多拟人化表述，但也承认近期的恶意行为者风险可能大于理论风险。sobellian 则更进一步，认为很多生存风险思维带有宗教色彩且无法证伪，因为任何具体的毁灭假说被质疑后总会被另一个假说替代。

**标签**: `#AI safety`, `#AI risk`, `#opinion essay`, `#tech industry`, `#discussion`

---

<a id="item-4"></a>
## [Simon Willison 发布 commit-rewriter 0.1，用于编辑 git 提交信息](https://simonwillison.net/2026/Sep/14/commit-rewriter/) ⭐️ 6.0/10

Simon Willison 发布了 commit-rewriter 0.1，这是一个用于编辑 git 提交信息的 Python Web 应用，最初是为了在发布 Datasette 安全更新前清理提交中的编程代理痕迹和私有仓库的 issue 编号。只需一条命令即可运行：`uvx commit-rewriter path/to/repo`。 使用编程代理（或在私有仓库中工作）的人经常会得到不适合公开发布的提交信息，这个工具提供了友好的 Web 界面，省去了繁琐的交互式 rebase 操作。对于准备开源或发布仓库的维护者尤其有用。 提交编辑时，工具会先创建一个带时间戳的备份分支以便回滚，然后从你编辑的第一条提交开始重写到最新提交。界面以卡片形式展示每条提交的哈希、作者、时间戳和可编辑的消息区域，还支持完整 diff 查看、搜索以及"仅显示已编辑"过滤。 在需要清理提交信息的 git 仓库中运行 `uvx commit-rewriter`（在仓库目录内执行即可）进行试用；在强制推送重写后的历史之前，先确认自动创建的备份分支存在。

rss · Simon Willison · 9月14日 00:28

**背景**: 修改历史中的提交信息通常需要交互式 rebase（git rebase -i）或 git-filter-repo 等工具，它们会从被修改的提交点开始改变之后所有提交的哈希。由于编程代理经常生成充满内部引用和套话的提交信息，发布安全更新或开源仓库的维护者需要干净地重写历史。uvx（即 uv tool run）可在临时隔离环境中运行 Python 命令行工具而无需永久安装，让这类一次性工具的试用变得非常简单。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://simonwillison.net/2026/Sep/14/commit-rewriter/">Release: commit-rewriter 0.1</a></li>
<li><a href="https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History">7.6 Git Tools - Rewriting History</a></li>
<li><a href="https://docs.astral.sh/uv/guides/tools/">Using tools | uv - Astral Docs</a></li>

</ul>
</details>

**标签**: `#git`, `#developer-tools`, `#open-source`, `#release`, `#simon-willison`

---

<a id="item-5"></a>
## [shot-scraper 1.12 新增 WebP 截图输出](https://simonwillison.net/2026/Sep/13/shot-scraper/) ⭐️ 5.0/10

Simon Willison 基于 Playwright 的截图命令行工具 shot-scraper 发布 1.12 版本，新增 WebP 输出支持，只需将输出文件扩展名设为 .webp 即可。新增的 --quality 选项（如 --quality 80）可生成有损 WebP，不指定该选项则输出无损 WebP。 任何为文档、测试或网页自动化生成截图的用户都可以降低存储和带宽成本，因为 WebP 文件几乎总是比同等质量的 PNG 或 JPEG 截图小得多。这是一项即插即用的改动——只需修改输出文件名——无需重构工作流程。 该功能在 GitHub 的 PR #210 中实现，其中包含文件大小对比示例。默认输出为无损 WebP（无质量损失），而 --quality 则启用有损压缩；作者发布该功能的具体目的是为其新的 commit-rewriter 工具生成截图。 运行 pip install -U shot-scraper 升级，然后执行 shot-scraper https://example.com -o screenshot.webp --quality 80，并与常用的 PNG 输出对比文件大小。

rss · Simon Willison · 9月13日 23:58

**背景**: shot-scraper 是 Simon Willison 基于 Playwright 构建的命令行工具，用于自动化网页截图和抓取，支持自定义选择器和执行 JavaScript 等选项。WebP 是 Google 开发的图像格式，同时支持有损和无损压缩，在相近视觉质量下通常比 JPEG 或 PNG 文件更小。无损 WebP 适合要求像素级精确的截图，而设置了质量参数的有损 WebP 更适合更看重小体积的视觉丰富页面。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/simonw/shot-scraper">GitHub - simonw/shot-scraper: A CLI utility for taking ...</a></li>
<li><a href="https://getwebp.com/blog/lossy-vs-lossless-webp-explained">Lossy vs Lossless WebP: Practical Differences | GetWebP</a></li>
<li><a href="https://simonwillison.net/2026/Sep/14/commit-rewriter/">Release: commit-rewriter 0.1 - simonwillison.net</a></li>

</ul>
</details>

**标签**: `#shot-scraper`, `#web-scraping`, `#automation`, `#playwright`, `#release-notes`

---