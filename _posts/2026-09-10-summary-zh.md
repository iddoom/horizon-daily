---
layout: default
title: "Horizon Summary: 2026-09-10 (ZH)"
date: 2026-09-10
lang: zh
---

> 从 45 条内容中筛选出 8 条重要资讯。

---

1. [Shopify 从 React Native 回归原生移动开发](#item-1) ⭐️ 8.0/10
2. [Sber 发布 MIT 许可的 GigaChat-3.5 Reasoning，432B-A28B MoE 模型](#item-2) ⭐️ 8.0/10
3. [微软正式将 Rust 定为 Tier-1 编程语言](#item-3) ⭐️ 6.0/10
4. [用户报告 OpenAI 反复重新开启“允许训练”设置](#item-4) ⭐️ 6.0/10
5. [MIT 科技评论：AI 电力需求暴露电网架构风险](#item-5) ⭐️ 6.0/10
6. [维基页面整理索尼在数字游戏所有权诉讼中的相关声明](#item-6) ⭐️ 5.0/10
7. [美国储能市场高速增长，仍依赖中国电池](#item-7) ⭐️ 5.0/10
8. [Clearview AI 测试 InquiryIQ 工具，可将人脸关联到完整网络生活](#item-8) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [Shopify 从 React Native 回归原生移动开发](https://shopify.engineering/back-to-native) ⭐️ 8.0/10

Shopify 宣布将其移动应用从 React Native 迁回 iOS 和 Android 原生开发。一个关键驱动因素是 LLM 编码工具改变了两套原生代码库的维护成本，动摇了其 2020 年选择 React Native 时的核心假设。 这是近二十年跨平台与原生之争中的一个重要数据点，而 Shopify 曾是 React Native 最著名的采用者之一。它表明 AI 辅助编程可以通过降低并行原生开发的成本来改变技术栈决策，对任何正在选择移动架构的团队都有参考价值。 Shopify 强调此举并非 React Native 的失败，而是当核心假设发生变化后基于第一性原理的重新评估——尤其是 AI 工具降低了编写和维护各平台代码的成本。评论者指出，实践中跨平台框架往往仍需要大量平台专属工程师，人力成本的节省比承诺的要小。 如果你正在做移动技术栈决策，建议阅读 Shopify 的工程博客文章，并把 AI 编码工具纳入成本分析重新测算——各平台开发成本基线相比上次评估很可能已经下降。

hackernews · fnthawar2 · 9月10日 14:09 · [社区讨论](https://news.ycombinator.com/item?id=49643982)

**背景**: React Native 允许团队用 JavaScript/TypeScript 编写 iOS 和 Android 应用，同时渲染真正的原生视图，承诺一套代码覆盖两个平台。Shopify 在 2020 年前后大力投入 React Native 并对生态贡献良多。跨平台与原生之争自 Apache Cordova 等工具以来已持续约二十年，反复出现的模式是：跨平台框架以牺牲平台体验和能力为代价换取开发成本的降低。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://idealogic.io/blog/cross-platform-app-development">Cross - Platform App Development: Frameworks & Tradeoffs</a></li>
<li><a href="https://dev.to/apptagellc/hybrid-vs-native-mobile-apps-what-actually-matters-for-ux-in-2026-47ed">Hybrid vs Native Mobile Apps: What Actually... - DEV Community</a></li>

</ul>
</details>

**社区讨论**: 评论者普遍认为这是取决于具体情境的工程权衡，而非对 React Native 本身的否定。一位开发者报告用 Codex 在一夜之间把一个 15-20 个屏幕的 React Native 应用重写为原生 Android 和 iOS 版本，印证了重写经济学已经改变。一位资深观察者指出了反复出现的模式：采用跨平台方案并未真正减少人力，因为平台专属专业知识仍然不可或缺；一位 Shopify 工程师确认，当 LLM 改变了核心假设后，他们从第一性原理出发重新做了评估。

**标签**: `#mobile-development`, `#react-native`, `#shopify`, `#cross-platform`, `#engineering-decisions`

---

<a id="item-2"></a>
## [Sber 发布 MIT 许可的 GigaChat-3.5 Reasoning，432B-A28B MoE 模型](https://www.reddit.com/r/LocalLLaMA/comments/1wchl1x/gigachat35reasoning/) ⭐️ 8.0/10

Sber 旗下的 AI-Sage 团队发布了 GigaChat-3.5 Reasoning，这是一个总参数 432B、激活参数 28B 的混合专家（MoE）模型，采用 Gated DeltaNet 架构以提升长上下文效率。团队先用 CISPO 强化学习训练了代码、数学、通用等多个领域专家模型，再通过在线策略蒸馏（on-policy distillation）合并为单一模型，声称性能接近 DeepSeek V4 Flash Preview，且推理 token 用量减少 37%。 这是一个采用宽松 MIT 许可的完全开放权重发布，任何运行本地 LLM 的用户都可以下载、微调并无限制地商业部署。其领域专家蒸馏的训练方法对构建高效推理模型的团队也具有可复用价值。 432B-A28B 的 MoE 配置意味着每个 token 仅激活约 28B 参数，相对总模型规模大幅降低了推理成本。性能声明来自开发者自测，公告中未提供独立基准测试结果；而且即使有 MoE 稀疏性，在本地运行 432B 模型仍需要相当可观的硬件资源。 可以从 Hugging Face 上的 ai-sage/gigachat-35-reasoning 集合以 MIT 许可下载权重，或者先在 giga.chat 网站选择最右侧的 reasoning 标签页直接试用，再决定是否投入硬件进行本地部署。

reddit · r/LocalLLaMA · /u/netikas · 9月10日 12:19

**背景**: Gated DeltaNet 是 NVIDIA 提出的线性注意力架构（ICLR 2025），通过门控增量规则（gated delta rule）改进 Mamba2，在语言建模、长上下文理解等基准上优于 Mamba2 和 DeltaNet，训练吞吐量更高。CISPO 是 MiniMax-M1 论文提出的强化学习算法，属于 PPO 风格的策略优化，它将重要性采样权重裁剪为 stop-gradient 系数，保证每个有效 token 都有梯度流过，比 GRPO 更稳定、样本效率更高。在线策略蒸馏（on-policy distillation）让学生模型采样自己的轨迹，由教师模型提供稠密的 token 级监督，从而避免了传统离线蒸馏中训练与推理分布不匹配的问题。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://arxiv.org/abs/2412.06464">[2412.06464] Gated Delta Networks: Improving Mamba2 with ... Architecture | NVlabs/GatedDeltaNet | DeepWiki GitHub - NVlabs/GatedDeltaNet: [ICLR 2025] Official PyTorch ... Paper page - Gated Delta Networks: Improving Mamba2 with ... Gated DeltaNet | Sebastian Raschka, PhD NVlabs/GatedDeltaNet | DeepWiki Gated Delta Networks: Improving Mamba2 with Delta Rule | Research</a></li>
<li><a href="https://swift.readthedocs.io/en/latest/Instruction/GRPO/AdvancedResearch/CISPO.html">Clipped Importance Sampling Policy Optimization (CISPO)</a></li>
<li><a href="https://thinkingmachines.ai/blog/on-policy-distillation/">On-Policy Distillation - Thinking Machines Lab</a></li>

</ul>
</details>

**标签**: `#llm`, `#open-source`, `#reasoning-models`, `#moe`, `#model-release`

---

<a id="item-3"></a>
## [微软正式将 Rust 定为 Tier-1 编程语言](https://rustfoundation.org/media/guest-post-rust-is-tier-1-language-at-microsoft/) ⭐️ 6.0/10

微软正式将 Rust 定为系统编程的 Tier-1 语言，使其与 C 和 C++在公司内部语言战略中并列。继谷歌（Android）和苹果之后，微软成为最新一家在系统级开发中超越 C/C++的操作系统厂商。 这表明 Rust 技能正成为有价值的职业投资，微软将越来越多地在 Windows 和 Azure 的新系统代码中使用它。对于开发 Windows 原生软件的团队，这也引出了工具链成熟度的问题，例如 Visual Studio 支持和 WinRT 库绑定。 这一公告是战略层面的，而非工具发布：Rust 目前尚未在 Visual Studio 中获得完整支持，评论者也指出缺少用于构建 WinRT 3.0 原生应用的 Rust 库。微软此前在 Rust 方面的投入，包括 Rust-for-Windows 绑定和 MSVC 工具链集成，为这次定级奠定了基础。 阅读 Rust 基金会发布的公告客座文章；如果你的项目面向 Windows，可以尝试使用 rust-for-windows 这个 crate 从 Rust 调用 Windows API，以评估工具链在你自己项目中的成熟度。

hackernews · mmastrac · 9月10日 13:39 · [社区讨论](https://news.ycombinator.com/item?id=49643546)

**背景**: C/C++代码中的内存安全漏洞是安全漏洞的主要来源之一，这也是政府和厂商推动在系统代码中采用内存安全语言的原因。Rust 通过所有权和借用机制在编译期防止整类内存错误，且无需垃圾回收器，因此适合操作系统内核和驱动开发。微软已经用 Rust 重写了部分 Windows 内核，评论中也指出所有在 C/C++工具链中扮演重要角色的主流操作系统厂商现在都支持了额外的系统编程语言。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Memory_safety">Memory safety - Wikipedia</a></li>
<li><a href="https://www.memorysafety.org/docs/memory-safety/">What is memory safety and why does it matter? - Prossimo</a></li>

</ul>
</details>

**社区讨论**: 评论整体积极，许多人认为这是一个里程碑，确认了所有主流操作系统厂商都已实现系统编程语言的多元化。但也有实际担忧，包括 Visual Studio 缺少 Rust 支持、缺少 Rust 原生的 WinRT 库，还有人调侃希望此举能修复 Windows 天气应用占用超过 1GB 内存的问题。

**标签**: `#rust`, `#microsoft`, `#systems-programming`, `#language-adoption`, `#memory-safety`

---

<a id="item-4"></a>
## [用户报告 OpenAI 反复重新开启“允许训练”设置](https://news.ycombinator.com/item?id=49643556) ⭐️ 6.0/10

多名 Hacker News 用户报告，OpenAI 账号中的“允许使用我的内容进行训练”设置在被关闭后又被悄悄重新开启，至少一位用户仔细记录了关闭时间并确认了这一现象。目前 OpenAI 尚未确认原因或提供修复。 任何依赖应用内开关来防止 ChatGPT 对话被用于训练的用户，可能在不知情的情况下被重新纳入训练。这也说明仅靠复选框可能不够——还需要通过隐私门户单独提交退出请求。 有评论者指出，仅关闭复选框并不够：用户还需在 privacy.openai.com 提交“不要训练我的内容”的请求。一位欧盟用户报告其开关已保持关闭数月，暗示可能存在地区差异；另有用户质疑该开关是否真的有效。 立即检查你的 OpenAI 账号训练设置，确认它没有被重新开启，并在 privacy.openai.com 额外提交“不要训练我的内容”请求作为保障。

hackernews · jacquesm · 9月10日 13:39

**背景**: ChatGPT 的账号设置中包含一个控制项，决定你的对话和内容是否被用于改进 OpenAI 的模型。取消勾选该复选框是日常的退出方式，但 OpenAI 还运营着一个单独的隐私门户（privacy.openai.com），用户可在其中提交正式的数据控制请求，包括明确的“不要训练我的内容”退出请求。在同一账号上使用 Codex CLI 等工具的用户，可能还不确定该开关是否覆盖这类使用场景。

**社区讨论**: 评论者证实多个账号都出现了设置被重新开启的现象，一位用户不确定该开关是否覆盖 Codex CLI 的使用，随后删除了自己的 ChatGPT 历史。整体情绪偏向怀疑——有人怀疑复选框根本无效——而一位欧盟用户报告其设置一直保持关闭，另有评论者指出通过隐私门户提交退出请求才是更可靠的做法。

**标签**: `#privacy`, `#openai`, `#data-training`, `#account-settings`, `#hackernews`

---

<a id="item-5"></a>
## [MIT 科技评论：AI 电力需求暴露电网架构风险](https://www.technologyreview.com/2026/09/10/1141649/powering-ai-is-an-architecture-problem/) ⭐️ 6.0/10

MIT Technology Review 发表分析指出，AI 的巨大电力需求正使数据中心集群成为电网架构上的薄弱环节。2026 年 7 月 22 日，弗吉尼亚州 Ashburn 一处输电线路故障导致 PJM 电网在数秒内损失超过 3 吉瓦负荷，这与 2024 年一次单个避雷器失效导致约 60 个设施、1500 兆瓦负荷同时脱网的 incidents 相呼应。 这篇文章提供了具体事故数据，表明 AI 级数据中心园区既易受大电网扰动影响，也会反过来动摇电网稳定，这对规划 AI 算力、选址数据中心或评估基础设施风险的人都很重要。理解这些约束能帮助读者认识到，电力供应而非芯片，可能成为 AI 扩展的真正瓶颈。 2026 年 7 月的事件在数秒内使 PJM 电网损失超过 3 吉瓦需求，罕见地揭示了超大规模园区面对大电网扰动时的真实反应。文章的核心论点是，这本质上是架构问题——将吉瓦级 AI 负荷集中于单一集群——而非单纯的容量不足。 阅读 MIT Technology Review 原文全文；如果你负责规划或运营 AI 算力，应评估多区域分散部署以及本地发电/储能，以对冲单一集群的电网依赖风险。

rss · MIT Technology Review · 9月10日 11:00

**背景**: 弗吉尼亚州 Ashburn 的“数据中心巷”是全球最密集的数据中心聚集地，估计每天有 70%的全球互联网流量经过此地。PJM 是服务该地区的区域电网运营商。避雷器（surge arrester）是将雷击和开关过电压引入大地的保护装置，一旦失效可能引发输电故障。当电压或频率崩溃时，电力公司会采取“切负荷”（load shedding）手段，主动断开部分负荷以避免全网大面积停电，这就是整个数据中心园区会在数秒内脱网的原因。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://datacenters.economictimes.indiatimes.com/news/operations-resilience/data-centre-alley-fault-triggers-3-gw-load-drop-on-pjm-grid/132595232">Data Centre Alley Fault Triggers 3 GW Load Drop on PJM Grid, ETDatacenters</a></li>
<li><a href="https://lightyear.ai/blogs/ashburn-colocation-data-center-alley">Data Center Alley : Ashburn , VA 's Data Center Hub (2026 Guide)</a></li>
<li><a href="https://en.wikipedia.org/wiki/Lightning_arrester">Lightning arrester - Wikipedia</a></li>

</ul>
</details>

**标签**: `#data centers`, `#power infrastructure`, `#AI energy`, `#grid reliability`, `#AI infrastructure`

---

<a id="item-6"></a>
## [维基页面整理索尼在数字游戏所有权诉讼中的相关声明](https://consumerrights.wiki/w/Sony_PlayStation_digital_game_ownership_lawsuit) ⭐️ 5.0/10

一个消费者权利维基页面整理了索尼 PlayStation 关于玩家“拥有”数字游戏的相关声明，作为一起进行中的集体诉讼的证据。该诉讼主张 PlayStation 商店的“立即购买”和“确认购买”等措辞误导消费者以为自己在购买游戏的所有权，而实际上获得的只是可被撤销的许可。 此案凸显了数字商店的购买宣传与许可的法律现实之间的落差，这关系到每一位数字内容消费者。案件结果可能推动整个数字销售行业采用更清晰的披露方式，也为企业如何措辞自己的数字购买条款提供参考。 索尼的辩护称，如果购买者真正拥有游戏，那么一人购买后其他人就无法再购买同一款游戏——评论者用实体书的类比驳斥了这一说法：每个买家拥有的是各自的副本，而不是同一副本。索尼还援引 PlayStation 服务条款第 14 条的强制仲裁条款和集体诉讼豁免，要求用户在接受协议后 30 天内书面通知才能退出。 如果你是关注仲裁条款的 PlayStation 用户，请查阅服务条款第 14 条，并在接受协议后 30 天内提交书面退出通知；销售数字商品的企业应审查自己购买流程中的措辞是否存在所有权误导风险。

hackernews · haunter · 9月10日 12:18 · [社区讨论](https://news.ycombinator.com/item?id=49642531)

**背景**: 当用户“购买”数字游戏时，通常购买的只是访问内容的许可而非内容本身，平台可以随时撤销该访问权。服务条款中常见的强制仲裁条款会让消费者放弃在法庭起诉或参与集体诉讼的权利，批评者指出仲裁机构可能偏向作为常客的企业客户。Steam 现在也显示类似免责声明，提醒买家购买的是许可而非所有权。据报道 PlayStation 将从 2028 年起转向纯数字发行，这一所有权问题将变得更加重要。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://consumerrights.wiki/w/Sony_PlayStation_digital_game_ownership_lawsuit">Sony PlayStation digital game ownership lawsuit</a></li>
<li><a href="https://en.wikipedia.org/wiki/Consumer_arbitration">Consumer arbitration - Wikipedia</a></li>
<li><a href="https://www.thegamer.com/steam-digital-game-ownership-licence-disclaimer/?utm=syndication">Steam Update Addresses Digital Game Ownership</a></li>

</ul>
</details>

**社区讨论**: 评论者普遍批评索尼的辩护，有人指出实体书副本的类比直接驳斥了索尼关于“逐份所有权不可行”的说法，还有人认为这一论点可能弄巧成拙，打开索尼不愿面对的法律缺口。许多评论者认为针对个人的强制仲裁应当被认定为非法，也有人呼吁版权改革，实现真正的数字所有权，包括资产托管以及商店关闭后仍可继续访问。

**标签**: `#digital-ownership`, `#consumer-rights`, `#legal`, `#licensing`, `#sony`

---

<a id="item-7"></a>
## [美国储能市场高速增长，仍依赖中国电池](https://www.technologyreview.com/2026/09/10/1143791/us-china-batteries/) ⭐️ 5.0/10

《麻省理工科技评论》于 2026 年 9 月发布分析文章，探讨美国电网级储能市场在创纪录增长的同时，为何在中美供应链紧张的背景下仍然依赖廉价的中国电池，并评估美国电池市场能否真正与中国脱钩。 电网级储能是消纳风电、光伏等间歇性可再生能源、提升电网可靠性和减排的关键，因此电池的来源与成本直接影响美国能源转型的速度。理解中国电池供应链主导地位的深度，有助于开发者、政策制定者和投资者判断脱钩时间表的现实性。 文章指出，美国储能部署屡创新纪录，很大程度上是因为中国产磷酸铁锂（LFP）电池廉价且供应充足，这使得供应链独立的政策目标与短期经济效益之间存在矛盾。对 LFP 和 NMC 供应链的研究表明，中国在锂、镍、锰、钴等关键材料环节均占据主导地位。 阅读《麻省理工科技评论》原文，了解中美电池依赖的具体数据；如果你从事能源采购工作，应评估关税变化或国产化含量规定可能对储能项目成本和时间表产生的影响。

rss · MIT Technology Review · 9月10日 10:00

**背景**: 电网储能系统将多余电力储存以备后用，随着风电、光伏等波动性可再生能源占比提高，储能可帮助平衡供需。磷酸铁锂因成本低、安全性好、寿命长，已成为固定式储能的主流电池化学体系。中国用二十多年时间建成了从原材料加工到电芯制造的完整 LFP 供应链，形成了美国难以快速复制的成本优势。美国的关税和产业政策旨在刺激本土制造，但短期内部署仍严重依赖进口。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.sciencedirect.com/science/article/pii/S2666248525000071">China's hold on the lithium-ion battery supply chain ...</a></li>
<li><a href="https://bydtoday.com/china-lfp-battery-history-supply-chain/">How China Built the LFP Battery Supply Chain in 23 Years</a></li>
<li><a href="https://en.wikipedia.org/wiki/Grid_energy_storage">Grid energy storage - Wikipedia</a></li>

</ul>
</details>

**标签**: `#energy-storage`, `#supply-chain`, `#us-china`, `#batteries`, `#policy`

---

<a id="item-8"></a>
## [Clearview AI 测试 InquiryIQ 工具，可将人脸关联到完整网络生活](https://www.wired.com/story/clearview-ai-is-testing-an-ai-tool-that-lets-cops-instantly-unearth-your-online-activity/) ⭐️ 5.0/10

Wired 揭露，Clearview AI 悄悄测试了一个此前未被报道的原型工具 InquiryIQ，它使用 xAI（Grok 的开发商）的模型，在通过人脸识别确定身份后，汇总一个人的关联人物、社交账号和网络活动。这使 Clearview 从人脸匹配扩展到 AI 生成的个人档案。 这表明人脸识别正在与大语言模型结合，实现对普通人的自动化大规模画像，引发严重的隐私和公民自由担忧。由于 Clearview 的数据库是在未经同意的情况下抓取数十亿张图片建立的，任何有网络足迹的人都可能受到影响。 该工具依赖 xAI 的模型而非 Clearview 自有的人脸匹配引擎；由于这只是针对原型产品的调查报道，其准确性、防护措施、部署状态以及参与测试的机构等细节仍然有限。Clearview 长期陷于隐私争议，包括因非法抓取数据在欧洲和伊利诺伊州被处罚。 由于这是不面向公众的监控产品，没有可执行的技术操作；关注隐私的读者可以跟踪 Wired 的后续报道，审视自己在社交媒体上的曝光程度，并关注所在地区的隐私立法（如类似伊利诺伊州 BIPA 的法律）进展。

rss · Wired AI · 9月10日 10:00

**背景**: Clearview AI 通过抓取社交媒体和公开网络上的照片建立了包含数十亿张图片的人脸识别数据库，向执法部门销售，用于通过一张照片识别身份。xAI 是马斯克旗下的 AI 公司，开发了 Grok 系列大语言模型并可通过 API 使用。据报道，InquiryIQ 将两者结合：人脸匹配确定身份后，由大语言模型将此人的数字足迹汇总成调查报告。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.clearview.ai/">Clearview AI | Facial Recognition</a></li>
<li><a href="https://en.wikipedia.org/wiki/Grok_(chatbot)">Grok (chatbot) - Wikipedia</a></li>

</ul>
</details>

**标签**: `#surveillance`, `#privacy`, `#clearview-ai`, `#facial-recognition`, `#law-enforcement`

---