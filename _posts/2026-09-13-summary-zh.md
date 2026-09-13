---
layout: default
title: "Horizon Summary: 2026-09-13 (ZH)"
date: 2026-09-13
lang: zh
---

> 从 20 条内容中筛选出 6 条重要资讯。

---

1. [InternLM 发布开源多模态科学基础模型 Intern-S2-397B](#item-1) ⭐️ 7.0/10
2. [工程师搭建 64GB 显存多 GPU 主机运行本地 SWE 智能体](#item-2) ⭐️ 7.0/10
3. [Revolut 因伪造政府请求泄露客户数据](#item-3) ⭐️ 6.0/10
4. [亲测约翰迪尔自助维修服务：农场主依然持怀疑态度](#item-4) ⭐️ 5.0/10
5. [硬件短缺引发本地 LLM 优化复兴](#item-5) ⭐️ 5.0/10
6. [LocalLLaMA 社区讨论哪些 2024-2025 年模型仍值得保留](#item-6) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [InternLM 发布开源多模态科学基础模型 Intern-S2-397B](https://www.reddit.com/r/LocalLLaMA/comments/1wf3wt2/internlminterns2_hugging_face/) ⭐️ 7.0/10

InternLM 发布了 Intern-S2-Preview-397B，一个面向科学智能与长程智能体的 3970 亿参数开源多模态基础模型，已以 Apache-2.0 许可在 Hugging Face 上提供。该模型结合了直接从科学文献原始页面进行视觉预训练的新范式、覆盖 20 多个领域的大规模多任务强化学习，以及在沙盒环境中的黑盒长程智能体强化学习。 这是目前最强大的开源科学多模态模型之一，其直接从论文原始页面联合学习符号语义与视觉关系、无需中间解析的预训练方法，为提升空间推理能力和数据效率提供了可复用的思路。从事科学 AI、文档理解或智能体框架研究的团队可以基于其开源权重进行研究和开发。 该模型默认启用思考模式以增强推理能力，并在生物分子相互作用设计、材料结构生成等专业任务上表现出色。需要注意的是，InternLM 同期还发布了较小的 Intern-S2-Mobius（约 35B），命名重叠已引发混淆，且 397B 模型对多数用户而言难以在本地运行。 访问 Hugging Face 上的 internlm/Intern-S2-Preview-397B 页面，查看许可证、基准测试结果和使用说明；考虑到其规模，多数本地用户应转而评估较小的 Intern-S2-Mobius（35B），或通过推理 API/服务商使用该旗舰模型。

reddit · r/LocalLLaMA · /u/jacek2023 · 9月13日 10:19

**背景**: 视觉-语言预训练（VLP）通常通过在精选图文对上的对比或生成目标来对齐图像与文本，这可能丢失文档中的版面和空间信息。Intern-S2 则直接在科学论文原始页面上训练，在共享表示空间中保留插图、表格、公式等文本-视觉对应关系。长程智能体强化学习则是在沙盒环境中，通过任务验证器奖励（而非监督微调）来训练大模型智能体完成多步骤任务（例如 300 多轮工具调用）。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/internlm/Intern-S2-Preview-397B">internlm/ Intern - S 2 -Preview-397B · Hugging Face</a></li>
<li><a href="https://www.orcarouter.ai/blog/intern-s2-vs-intern-s2-mobius">Intern - S 2 vs Intern - S 2 Mobius: The 397B Flagship vs the 35B Speed</a></li>

</ul>
</details>

**标签**: `#open-source-models`, `#multimodal-ai`, `#reinforcement-learning`, `#LLM-release`, `#LocalLLaMA`

---

<a id="item-2"></a>
## [工程师搭建 64GB 显存多 GPU 主机运行本地 SWE 智能体](https://www.reddit.com/r/LocalLLaMA/comments/1wf8ur9/my_experience_building_64gb_vram_ai_swe/) ⭐️ 7.0/10

一位软件工程师分享了详细的装机记录：在 Fractal Meshify 2 XL 机箱中用三张 RTX 3090（共 64GB 显存）、自制垂直显卡支架、PCIe v4 延长线和 Corsair HX1500i SHIFT 电源搭建工作站，用本地 LLM 编程助手替代 OpenAI/Anthropic 订阅服务。他通过自行编译的 llama.cpp 以 layer 切分模式跨三张 GPU 运行 Q8_0 量化的约 27B 模型，支持 256K 上下文，并启用 ngram/MTP 投机解码。 这篇文章是一份难得的多 GPU 本地推理端到端实战报告，涵盖电源 8-pin 接口限制、延长线长度与信号完整性、堆叠显卡散热等具体坑点，任何想自托管编程智能体的人都可以直接借鉴。它还证明一套二手 3090 平台已经能提供可用的、无需订阅、带大上下文窗口的 SWE 助手。 关键坑点包括：HX1500i SHIFT 电源仅有六个 8-pin 接口（只能接两张三 8-pin 显卡，迫使作者换成一张公版卡）；400mm PCIe 延长线不够长，需要 500-600mm；该长度的 PCIe 5 延长线大多不可靠且需要信号中继器；llama.cpp 的 layer 切分模式下只需要在 GPU 间传递层输出，PCIe 带宽足够。两张 3090 都限制到 300W 以保安全。 如果你计划类似装机，请确认电源的 8-pin/12VHPWR 接口数量满足目标显卡需求，购买 500-600mm 的 PCIe v4 延长线，并可以作者的 llama.cpp 参数（layer 切分、flash attention、投机解码）作为经过验证的基线配置。

reddit · r/LocalLLaMA · /u/trytoinfect74 · 9月13日 14:16

**背景**: 现代 27B-72B 规模的编程模型所需显存远超单张消费级显卡——72B 模型 Q4 量化约需 44GB，而 16-bit 下经验法则约为每 10 亿参数 2GB。二手 RTX 3090（每张 24GB）仍是最具性价比的显存扩展方案，因为 llama.cpp 可以通过 PCIe 将模型层按顺序切分到多张 GPU 而几乎没有性能损失。对于编程任务，Q8_0 量化相比更激进的 Q4 量化几乎无损，是推荐选择。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.compute-market.com/blog/multi-gpu-local-llm-setup-guide-2026">Multi-GPU LLM Setup 2026 — Run 70B-405B Locally | Compute Market</a></li>
<li><a href="https://llmhardware.io/guides/llm-quantization-guide">LLM Quantization Explained: Q4, Q8, FP16 and VRAM Tradeoffs (2026)</a></li>
<li><a href="https://modal.com/blog/how-much-vram-need-inference">How much VRAM do I need for LLM inference?</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#hardware`, `#swe-agents`, `#multi-gpu`, `#self-hosting`

---

<a id="item-3"></a>
## [Revolut 因伪造政府请求泄露客户数据](https://techcrunch.com/2026/09/12/revolut-confirms-customer-data-breach-through-fake-government-requests/) ⭐️ 6.0/10

Revolut 确认在收到发自合法政府机构邮箱域名的欺诈性请求后，将客户敏感信息（包括身份证件、住址、验证自拍和交易记录）泄露给了未经授权的第三方。该公司称受影响的客户数量“有限”且资金安全，但未披露受影响人数、涉及市场或相关政府机构。 这表明即使是处理身份验证的现代金融科技公司，也可能在执法数据请求流程中被社会工程攻击攻破，这对任何持有客户数据的公司都是相关威胁。它还暴露了政府与企业之间缺乏标准化的安全数据交付通道。 欺诈请求发自合法政府机构的邮箱域名并通过了 Revolut 的安全检查，这暗示该域名本身可能已被攻破或遭伪造。此次泄露可能针对高净值客户，且 Revolut 拒绝披露受害人数、涉及市场或被冒充的机构。 如果你的组织处理执法数据请求，应在披露任何客户数据前，使用独立查到的机构联系方式进行回拨验证。同时审视为何要保留验证自拍等敏感材料，并尽量缩短留存期限。

hackernews · tdrz · 9月13日 09:59 · [社区讨论](https://news.ycombinator.com/item?id=49682087)

**背景**: 企业经常响应执法机构的“紧急披露请求”，而实践中这些请求往往只是从类似.gov 邮箱发出的签名 PDF，验证手段薄弱。部分平台（如通过 Kodex 的 Badoo）使用第三方服务验证请求警官身份，但许多公司仍依赖人工核查。从业者公认最可靠的控制措施是拨打自行查到的机构电话回拨核实，而非请求函上印的号码。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://techcrunch.com/2026/09/12/revolut-confirms-customer-data-breach-through-fake-government-requests/">Revolut confirms customer data breach through fake government requests | TechCrunch</a></li>
<li><a href="https://www.coindesk.com/tech/2026/09/12/bitcoin-activity-passports-exposed-after-revolut-falls-for-fake-government-request">Bitcoin activity, passports exposed after Revolut falls for fake government request</a></li>

</ul>
</details>

**社区讨论**: 一位曾运营执法请求台的评论者表示，唯一真正的控制措施是用自己查到的号码回拨机构核实，因为请求只是来自类似.gov 邮箱的 PDF。其他人批评 Revolut 缺乏透明度（未披露受害人数和涉事机构），质疑为何要保留验证自拍，并追问为何政府不提供安全的数据交付通道。

**标签**: `#security`, `#data-breach`, `#social-engineering`, `#fintech`, `#privacy`

---

<a id="item-4"></a>
## [亲测约翰迪尔自助维修服务：农场主依然持怀疑态度](https://arstechnica.com/gadgets/2026/09/i-fixed-a-tractor-using-john-deeres-self-repair-service-farmers-arent-sold-on-it/) ⭐️ 5.0/10

Ars Technica 发布了一篇亲测报告，体验了约翰迪尔的自助维修服务，该服务允许设备所有者获取原厂配件、手册和诊断工具来自行维修设备。尽管服务可用，报告发现农场主对厂商支持的自助维修仍不买账。 对于制造业和农业企业主而言，厂商把控的维修生态直接影响停机时间、维护成本和对授权经销商的依赖。这篇报告提供了真实视角，帮助判断原厂自助维修计划是否真正兑现了维修权的承诺。 所提供的新闻内容仅为标题和摘要，因此缺少具体技术细节，例如测试了哪些工具、诊断软件或维修流程。以往的主要痛点是软件锁、配件配对限制以及诊断手册的访问限制，这些都促使车主转向经销商维修。 阅读 Ars Technica 的完整报告以了解实际操作流程细节；如果你拥有约翰迪尔设备，可以在 ShopDeere.com 上对比自助维修的价格和配件供应情况与本地经销商的维修收费。

rss · Ars Technica · 9月13日 11:00

**背景**: 维修权运动主张所有者拥有自由维护、修理或改装农机、电子产品和车辆等产品的合法权利。约翰迪尔等厂商长期以来因维修垄断受到批评——通过限制配件、手册和诊断工具的获取，迫使客户使用授权维修渠道，导致价格更高、等待更久。迫于舆论和立法压力，约翰迪尔推出了自助维修资源，通过 ShopDeere.com 和经销商网络向车主直供原厂配件及相关工具。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Right_to_repair_movement">Right to repair movement</a></li>
<li><a href="https://www.deere.com/en-us/our-company/service-repair-resources">Service & Repair Resources | John Deere | John Deere US</a></li>
<li><a href="https://qualityequip.com/service/self-repair/">John Deere Self Repair Resources & Tools | Quality Equipment</a></li>

</ul>
</details>

**标签**: `#right-to-repair`, `#manufacturing`, `#John Deere`, `#field-report`, `#equipment-maintenance`

---

<a id="item-5"></a>
## [硬件短缺引发本地 LLM 优化复兴](https://www.reddit.com/r/LocalLLaMA/comments/1wf3i1m/the_local_llm_community_feels_like_the_golden_era/) ⭐️ 5.0/10

一篇 Reddit 帖子认为，GPU/内存短缺正推动本地 LLM 社区回归动手优化，并举例称 Strix Halo 的 llama.cpp 分支和 halogen-flash-server 在 Qwen3.8 Flash Next 上实现了约 52 tok/s 的解码速度（翻倍）和约 1300 tok/s 的预填充速度（提升 5-6 倍）。作者将这种 DIY 复兴比作早期互联网时代的论坛排障与共享脚本。 这表明当前最有意思的推理优化成果来自受限硬件而非充足的云端算力——这些可供复用的具体分支、内核和量化调优对其他用户很有价值。尤其是 Strix Halo 级别硬件的用户能从这些社区驱动的提速中直接受益。 halogen-flash-server 是专为 gfx1151 芯片上的 Qwen3.8 Flash Next 打造的专用推理引擎，使用自有的 .hgn 权重格式，无法在 llama.cpp、vLLM 或 transformers 中加载。Qwen3.8 Flash Next 本身是一个总参数量 125B（每 token 激活 6B）的实验性 MoE 模型，采用 GDN + QSA 混合注意力架构，是 Qwen4 世代架构的预览。 如果你有 Strix Halo 设备，可以尝试 Nathanw1014/strix-halo-llamacpp 分支（提供 Docker/distrobox）或搭配 halogen 版 Qwen3.8 Flash Next 权重的 halogen-flash-server，并用 llama-bench 与原版 llama.cpp 做性能对比。

reddit · r/LocalLLaMA · /u/feelspeaceman · 9月13日 09:56

**背景**: AMD Strix Halo（Ryzen AI Max+，gfx1151）是一款拥有大容量统一内存的 APU，适合本地运行大模型，但主流推理引擎对其利用不足。llama.cpp 是领先的开源 C/C++ 本地推理引擎，像 strix-halo-llamacpp 这样的社区分支加入了 Flash Attention 和 MoE 预填充修复，并捆绑调优过的 Mesa 驱动，大幅提升吞吐量。硬件短缺使关注点从云端 GPU 扩展转向本地硬件的极致效率优化，这与早期互联网时代亲自动手折腾的氛围相似。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/Nathanw1014/strix-halo-llamacpp">GitHub - Nathanw1014/strix-halo-llamacpp: Performance-tuned llama.cpp for AMD Strix Halo (gfx1151): FA + MoE-prefill fixes with a bundled current Mesa driver. Vulkan and HIP; portable dir, Docker, and distrobox. · GitHub</a></li>
<li><a href="https://qwen.ai/blog?id=qwen3.8-flash-next">Qwen3.8-Flash-Next: A New Architecture, Towards Ultimate Cost ...</a></li>
<li><a href="https://github.com/peonist-ai/halogen-flash-server">GitHub - peonist-ai/halogen-flash-server: The fastest way to ...</a></li>

</ul>
</details>

**社区讨论**: 新闻条目未提供评论内容，因此无法总结社区讨论观点。

**标签**: `#local-llm`, `#llama.cpp`, `#quantization`, `#inference-optimization`, `#community`

---

<a id="item-6"></a>
## [LocalLLaMA 社区讨论哪些 2024-2025 年模型仍值得保留](https://www.reddit.com/r/LocalLLaMA/comments/1wf69ug/what_are_the_top_ai_models_that_are_still/) ⭐️ 5.0/10

一位 Reddit 用户在 r/LocalLLaMA 发帖，询问 2024 至 2025 年间发布的哪些 AI 模型在 2026 年仍值得本地运行，指出当前已是 MoE 架构主导的时代，稠密模型正在被淘汰。该用户拥有 28TB 存储空间，正在筛选值得备份的旧模型，并以 DeepSeek R1 为例。 本地模型管理是一个实际问题：存储空间有限，且大多数模型很快就会过时，因此社区对哪些旧模型仍有价值的共识可以节省磁盘空间和下载时间。运行本地 LLM 的读者在决定保留或删除模型时可以参考这些建议。 发帖人可以运行大参数模型，不限于小模型，但排除了大量化的 Kimi k3。DeepSeek R1 被明确举为仍然值得使用的旧模型示例——它有 671B 参数的完整 MoE 版本和 8B 蒸馏版本，R1-0528 更新显著提升了推理能力。 阅读链接的 Reddit 帖子获取具体模型推荐，然后审视自己的模型库，重新下载值得保留的模型（如 GGUF 量化版的 DeepSeek R1），删除过时的检查点以释放空间。

reddit · r/LocalLLaMA · /u/UltraFOV · 9月13日 12:23

**背景**: 混合专家（MoE）模型对每个 token 只激活一小部分专家参数，因此总容量可以大幅扩展而计算成本不成比例增长，这也是它们如今取代稠密模型成为主流的原因。DeepSeek R1 于 2025 年初发布，是第一代推理模型，总参数量达 671B。要在本地存储和运行这类大模型，用户通常依赖 GGUF 等量化格式压缩权重，使其能在 CPU、苹果设备或部分卸载到 GPU 的环境下运行。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/deepseek-ai/DeepSeek-R1">deepseek -ai/ DeepSeek - R 1 · Hugging Face</a></li>
<li><a href="https://ollama.com/library/deepseek-r1">deepseek - r 1</a></li>
<li><a href="https://www.e2enetworks.com/blog/which-quantization-method-is-best-for-you-gguf-gptq-or-awq">Which Quantization Method Is Best for You?: GGUF ... | E2E Networks</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#open-source-models`, `#model-selection`, `#community-discussion`

---