---
layout: default
title: "Horizon Summary: 2026-07-14 (ZH)"
date: 2026-07-14
lang: zh
---

> 从 13 条内容中筛选出 5 条重要资讯。

---

1. [Anthropic 揭示 Claude 内部推理机制及世界模型的未来](#item-1) ⭐️ 8.0/10
2. [纽约州成为美国首个颁布数据中心建设禁令的州](#item-2) ⭐️ 8.0/10
3. [OpenAI Codex 开始加密子代理提示词，隐藏中间推理过程](#item-3) ⭐️ 7.0/10
4. [PsiQuantum 的光量子计算机计划](#item-4) ⭐️ 7.0/10
5. [Google DeepMind CEO 呼吁建立美国主导的全球 AI 监管机构](#item-5) ⭐️ 7.0/10

---

<a id="item-1"></a>
## [Anthropic 揭示 Claude 内部推理机制及世界模型的未来](https://www.technologyreview.com/2026/07/14/1140391/the-download-anthropic-claude-internal-thoughts-world-models/) ⭐️ 8.0/10

Anthropic 宣布了一项可解释性研究的突破，发现 Claude 拥有一种涌现的"心理工作区"，其中包含了模型输出中不可见的内部思维。这一窥探模型内部机制的新"显微镜"为了解 AI 在生成答案前如何进行推理提供了窗口。 这一发现是解决大语言模型"黑箱"问题的关键步骤，有望帮助开发者更好地评估 AI 安全性并与终端用户建立信任。理解内部推理还可能推动 AI 世界模型的发展，而世界模型是自主行动的智能体 AI 系统的基础，使其能够通过预测结果和适应环境来执行任务。 Anthropic 的研究发现 Claude 具有有限但功能性的内省能力，能够报告自身的内部状态。然而，分析也强调了这一发现的局限性，表明虽然我们可以观察到内部思维，但对模型推理过程的完全理解仍然不够充分。

rss · MIT Technology Review · 7月14日 12:10

**背景**: AI 可解释性是可解释 AI（XAI）的一个子领域，旨在使机器学习模型的决策过程对人类透明且可理解，以应对即使设计者也无法解释模型为何做出特定决策的"黑箱"倾向。AI 世界模型是在海量数据集上训练的系统，能够生成和探索响应式环境，通过使系统能够预测结果和设定目标，成为智能体 AI 的基础组件。Anthropic 一直在积极研究可解释性，以探究语言模型的内部特征及其内省能力。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.anthropic.com/research/tracing-thoughts-language-model">Tracing the thoughts of a large language model \ Anthropic</a></li>
<li><a href="https://en.wikipedia.org/wiki/AI_interpretability">AI interpretability</a></li>
<li><a href="https://en.wikipedia.org/wiki/Ai_world_model">Ai world model</a></li>

</ul>
</details>

**标签**: `#AI`, `#Machine Learning`, `#Anthropic`, `#AI Interpretability`, `#LLM`

---

<a id="item-2"></a>
## [纽约州成为美国首个颁布数据中心建设禁令的州](https://www.theverge.com/policy/965110/new-york-ai-data-center-moratorium) ⭐️ 8.0/10

州长 Kathy Hochul 签署了美国首个全州范围的暂停令，在长达一年的时间内暂时阻止新的超大规模数据中心在纽约州落户。此外，由州议会通过的另一项可能进一步限制数据中心开发的限制性法案目前仍在等待她的签署。 这一开创先例的政策转变将直接影响美国人工智能和云计算基础设施的未来扩张。它确立了由环境和电网压力驱动的重大监管里程碑，标志着科技公司在规划大规模计算设施时可能面临越来越多的监管壁垒。 该禁令专门阻止向超大规模数据中心发放新的环境许可，这类设施通常包含超过 5000 台服务器，并为云服务提供商提供极高的可扩展性。该命令旨在为州政府争取时间，以评估这些耗电量巨大的设施对环境造成的影响以及对电网造成的压力。

rss · The Verge · 7月14日 09:00

**背景**: 超大规模数据中心是由 Amazon Web Services 和 Microsoft Azure 等云服务提供商使用的大型设施，用于支持包括 AI 训练在内的海量计算工作负载。这些设施消耗大量的电力和水资源，据国际能源署估计，2024 年数据中心的耗电量约占全球总耗电量的 1.5%，预计到 2030 年这一数字可能翻倍。随着人工智能发展的加速，当地社区对新建数据中心的反对声浪日益高涨，民众担忧这会导致电费上涨、水资源消耗以及化石燃料发电厂推迟退役。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Hyperscale_data_center">Hyperscale data center</a></li>
<li><a href="https://www.eany.org/memo/data-center-moratorium">Data Center Moratorium - Environmental Advocates NY</a></li>
<li><a href="https://debatearguments.substack.com/p/data-center-moratorium-or-ban-what">Data Center Moratorium or Ban: What a Pause Would Actually Accomplish?</a></li>

</ul>
</details>

**标签**: `#data-centers`, `#policy`, `#infrastructure`, `#sustainability`, `#regulation`

---

<a id="item-3"></a>
## [OpenAI Codex 开始加密子代理提示词，隐藏中间推理过程](https://github.com/openai/codex/issues/28058) ⭐️ 7.0/10

OpenAI 的 Codex 已开始对其子代理使用的提示词进行加密，阻止用户查看代理在任务执行期间生成的中间指令和推理步骤。这一变化意味着，当 Codex 将工作委托给子代理时，发送给模型的具体提示词不再以明文形式对检查系统行为的开发者或用户可见。 这一举措引发了关于 AI 代理架构中透明度和开发者控制权的重大担忧，因为用户无法再检查或理解驱动代理行为的完整提示词链。它还表明 OpenAI 正在战略性地推动用户转向 Responses API，远离更透明的 Chat Completions 端点，这可能限制了依赖推理链可见性进行调试、定制和构建替代代理框架的开发者。 加密专门针对子代理提示词——即 Codex 在将任务委托给并行或专用代理时生成的中间指令——而非直接加密用户输入或模型输出。Chat Completions API 端点仍然向开发者公开完整的推理内容，使其成为需要了解模型思考过程的用户的更透明替代方案。

hackernews · embedding-shape · 7月14日 11:21 · [社区讨论](https://news.ycombinator.com/item?id=48905028)

**背景**: Codex 是 OpenAI 专为软件工程任务设计的 AI 编程代理，可通过 ChatGPT 网页应用、CLI 工具和桌面应用程序使用。子代理是一项允许 Codex 将复杂任务分解为更小部分并委托给专用并行代理的功能，该子代理功能于 2026 年 3 月发布。OpenAI 的 Chat Completions API 与较新的 Responses API 之间的区别在此尤为关键：前者赋予开发者对推理过程的完全控制和可见性，而后者支持更多不透明的工作流程，OpenAI 一直在加大对其的推广力度。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Codex_(AI_agent)">OpenAI Codex (AI agent ) - Wikipedia</a></li>
<li><a href="https://www.baristalabs.io/blog/openai-codex-subagents-parallel-agents-2026">OpenAI Codex Subagents Turn One Coding Task Into a…</a></li>
<li><a href="https://shortspan.ai/defenders-deploy-encrypted-prompts-to-blunt-ai-attacks.html">Encrypted Prompts and Decoupled Architectures... | ShortSpan. ai</a></li>

</ul>
</details>

**社区讨论**: 社区迅速纠正了最初具有误导性的标题，澄清这是关于向用户隐藏子代理提示词，而非对加密数据执行推理（后者需要高级同态加密技术）。多位评论者对 OpenAI 将开发者推向 Responses 端点等透明度较低的 API 的更广泛模式表示担忧，其中一人指出他们刻意坚持使用 Chat Completions 以保持对推理链的完全控制。另一位评论者指出，如果 OpenAI 不阻止替代框架使用 GPT 订阅，那么加密的影响微乎其微，因为 Codex CLI 本身被认为只是一个平庸的封装工具。

**标签**: `#openai`, `#codex`, `#ai-agents`, `#prompt-engineering`, `#transparency`

---

<a id="item-4"></a>
## [PsiQuantum 的光量子计算机计划](https://www.technologyreview.com/2026/07/14/1140356/psiquantum-plan-massive-quantum-computer-out-of-light/) ⭐️ 7.0/10

PsiQuantum 正在开发一种大规模、具有商业可行性的量子计算机，该计算机使用基于光的光子量子比特，放置在约 100 个由液氦冷却至接近绝对零度的不锈钢低温机柜中。该设施类似于数据中心与工业冷却工厂的结合体，代表了一种构建容错量子机器的全尺寸工程方法。 这代表了与主流量子计算架构（如 IBM 和 Google 使用的超导量子比特或离子阱技术）截然不同的重要替代范式，在可扩展性和抗噪性方面可能具有优势。如果成功，PsiQuantum 的光子方法可能会加速开发出能够解决经典计算机无法处理的问题的商用量子计算机。 该系统由大约 100 个六英尺高的不锈钢机柜组成，使用液氦低温冷却技术将温度维持在仅比绝对零度高几度的水平。尽管使用了本质上比其他量子比特类型更具抗噪性的光子量子比特，该机器仍需要极端的低温条件，这凸显了大规模量子计算面临的重大工程挑战。

rss · MIT Technology Review · 7月14日 08:00

**背景**: 光子量子比特使用光子（光的粒子）作为量子信息的载体，与其他量子比特技术相比，在可扩展性、能效和抗环境噪声方面具有潜在优势。大多数领先的量子计算机制造商（如 IBM、Google 和 IonQ）使用超导电路或离子阱技术，因此 PsiQuantum 的光子方法与主流路线明显不同。使用液氦的低温冷却在量子计算中被广泛使用，因为量子态极其脆弱，必须屏蔽热噪声以维持相干性。构建容错量子计算机需要大规模的纠错能力，这要求数千到数百万个物理量子比特协同工作。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.findlight.net/blog/photonic-qubits-quantum-computing/">Photonic Qubits : The Future of Quantum Computing</a></li>
<li><a href="https://sqmscenter.fnal.gov/large-scale-cryogenics/">Large-Scale Cryogenics – SQMS Center</a></li>
<li><a href="https://en.wikipedia.org/wiki/Helium_cryogenics">Helium cryogenics - Wikipedia</a></li>

</ul>
</details>

**标签**: `#quantum-computing`, `#photonics`, `#hardware`, `#emerging-tech`

---

<a id="item-5"></a>
## [Google DeepMind CEO 呼吁建立美国主导的全球 AI 监管机构](https://www.theverge.com/tech/965270/google-deepmind-demis-hassabis-global-ai-watchdog) ⭐️ 7.0/10

Google DeepMind CEO 兼联合创始人 Demis Hassabis 在一篇博客文章中公开呼吁建立一个由美国主导的全球 AI 监管机构，并主张该机构应有权在前沿 AI 模型变得过于危险时进行干预。他认为，鉴于美国的经济和技术领导地位，该国是制定全球标准的最佳人选。 这一立场来自全球顶尖 AI 实验室之一的领导者，正值各国政府竞相监管快速发展的 AI 技术之际，意义重大。Hassabis 对主动干预型监管机构的支持，可能会影响政策辩论，并向立法者传递信号：主要 AI 开发商对外部监管持开放态度，甚至主动寻求对前沿模型的监管。 Hassabis 特别强调，拟议中的监管机构应有权在风险升级时为前沿 AI 开发"踩刹车"。前沿 AI 模型是目前最先进的通用系统，具备推理、多模态生成和智能体工作流能力，目前由包括 Google DeepMind、OpenAI 和 Anthropic 在内的少数机构开发。

rss · The Verge · 7月14日 11:43

**背景**: Google DeepMind 是一家人工智能研究实验室，为 Alphabet Inc.的子公司，2010 年由 Demis Hassabis 在伦敦创立，2014 年被 Google 收购。2023 年 4 月，它与 Google Brain 部门合并成为 Google DeepMind，现负责开发 Google 的 Gemini 大语言模型系列及其他生成式 AI 工具。前沿 AI 模型代表了 AI 能力的最前沿——与为单一任务设计的传统窄 AI 不同，这些通用模型可应用于广泛的使用场景，带来了独特的治理挑战。随着这些模型日益强大，全球关于 AI 监管的辩论不断加剧，欧盟已通过《AI 法案》，美国也发布了关于 AI 安全的行政命令。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Google_DeepMind">Google DeepMind</a></li>
<li><a href="https://www.nvidia.com/en-us/glossary/frontier-models/">What Are Frontier AI Models and How They Work | NVIDIA Glossary</a></li>
<li><a href="https://www.crowdstrike.com/en-us/cybersecurity-101/artificial-intelligence/frontier-ai/">Frontier AI Explained: Key Models, Players, and Business Impact</a></li>

</ul>
</details>

**标签**: `#AI Regulation`, `#Google DeepMind`, `#AI Safety`, `#Tech Policy`

---