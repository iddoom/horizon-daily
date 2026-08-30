---
layout: default
title: "Horizon Summary: 2026-08-30 (ZH)"
date: 2026-08-30
lang: zh
---

> 从 27 条内容中筛选出 5 条重要资讯。

---

1. [Omarchy 中任意用户进程均可提权至 root](#item-1) ⭐️ 7.0/10
2. [社区开发者发布多款无审查 GGUF 模型，含 LongCat-Flash-Lite-Sparse 及自定义 llama.cpp 分支](#item-2) ⭐️ 7.0/10
3. [欧盟委员会在 ProtectEU 战略中重启加密后门立法推动](#item-3) ⭐️ 6.0/10
4. [Qwen 3.8 Flash Next（80GB）在 12GB 安卓手机上以 3.5 tok/s 运行](#item-4) ⭐️ 6.0/10
5. [劣质 HDMI 接口 eGPU 延长线导致 PCIe 链路从 x4 永久降至 x1](#item-5) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [Omarchy 中任意用户进程均可提权至 root](https://0xcc.io/posts/omarchy-root-creds/) ⭐️ 7.0/10

一位安全研究人员演示了在 DHH 打造的基于 Arch 的发行版 Omarchy 中，任意用户进程都可以提权到 root。此前还有人发现 Omarchy 曾把 USB 描述符直接通过管道送入 shell。 这是一个具体的警示案例：不要把安全性寄托在炒作起来、快速拼凑（vibecoded）且权限隔离薄弱的发行版上，同时也暴露出桌面 Linux 整体上缺乏像 macOS 那样真正可用的沙箱机制。任何为安全敏感工作选择日常发行版的用户，都应认真评估对维护者和默认配置的信任程度。 评论者指出，类似风险在主流配置中也存在，例如把普通用户加入 docker 组；恶意软件还可以通过在 ~/.bashrc 中定义假的 sudo 函数来窃取密码。因此 Omarchy 的漏洞固然真实，但更深层的问题是未沙箱化的桌面 Linux 对所有用户态代码一视同仁地信任。 如果你在使用 Omarchy，请阅读披露文章并升级到修复后的版本，同时审计你所用 Linux 桌面上的 sudo 和用户组配置（如 docker 组成员身份）。如果需要更强的保障，也可以考虑用 archinstall 安装原生 Arch 或选择更成熟的发行版。

hackernews · trap0xcc · 8月30日 15:59 · [社区讨论](https://news.ycombinator.com/item?id=49499854)

**背景**: Omarchy 是由 David Heinemeier Hansson（DHH）创建的基于 Arch Linux 的发行版，捆绑了 Hyprland 平铺式窗口管理器和预制配置，并借助 YouTube 炒作迅速走红。权限提升指普通用户进程获得 root（管理员）权限，常因 sudo 规则配置不当、用户组归属或脚本不安全所致。与 macOS 或 ChromeOS 不同，桌面 Linux 上通过包管理器安装的应用大多完全没有沙箱或隔离。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://omarchy.org/">Omarchy — Beautiful, Fun & Opinionated Linux by DHH</a></li>
<li><a href="https://www.privacyguides.org/articles/2022/04/22/linux-application-sandboxing/">Sandboxing Applications on Desktop Linux - Privacy Guides</a></li>
<li><a href="https://ekholme.github.io/brain/Omarchy">Omarchy</a></li>

</ul>
</details>

**社区讨论**: 社区情绪总体上批评被炒作的 vibecoded 发行版，有人引用此前 USB 描述符直接进 shell 的 bug，直接劝退用户。也有人反驳称问题并非 Omarchy 独有：docker 组、可被伪造的 sudo 以及 Linux 缺乏真正的桌面沙箱，使得在任何主流发行版上提权都很容易，因此很多愤怒更像'安全表演'。

**标签**: `#linux`, `#security`, `#privilege-escalation`, `#vulnerability`, `#open-source`

---

<a id="item-2"></a>
## [社区开发者发布多款无审查 GGUF 模型，含 LongCat-Flash-Lite-Sparse 及自定义 llama.cpp 分支](https://www.reddit.com/r/LocalLLaMA/comments/1w2iqos/uncensored_multimodel_releases/) ⭐️ 7.0/10

开发者 LLMFan46 发布了 LongCat-Flash-Lite-Sparse（69B-A3B，支持稀疏注意力和 1M 上下文）、Qwen3.8-27B、Qwen3.5-122B-A10B、Qwen3-Coder-Next 以及带视觉能力的 Laguna-S2.1 的无审查 GGUF 版本，全部保留了 MTP（LongCat 还保留 LSA）。由于 LongCat-Flash-Lite-Sparse 未被 llama.cpp 主线支持，用户必须通过作者的自定义分支，用 llama-server.exe 加载并配合 llama-ui 使用。 这为本地大模型用户提供了开箱即用、低拒绝率且保留 MTP 头的模型，也是目前唯一能在 llama.cpp 中运行 LongCat-Flash-Lite-Sparse 百万上下文稀疏注意力的途径。发布还给出了具体的拒绝率和 KLD 散度数据（如 Qwen3.8-27B 为 3/100 拒绝、0.0244 KLD），量化了去审查质量。 LongCat-Flash-Lite-Sparse 必须使用作者的分支（erm14254/llama.cpp-minimax-m3-combined 的 claude/longcat-win11 分支），无法在 llama.cpp 主线运行；它有两个版本：Uncensored Heretic（9/100 拒绝，0.0157 KLD）和 Ultra Uncensored Heretic（4/100 拒绝，0.0779 KLD）。作者承认 Laguna-S2.1 的视觉能力尚不完美——不下载 mmproj 文件即可当作纯文本模型使用；此外作者还更新了 J-Wash Enhanced 工具，新增对 MoE 版 Qwen3.5/3.6/3.8 的支持。 从链接的 Hugging Face 仓库（用户 llmfan46）下载 GGUF 文件；LongCat-Flash-Lite-Sparse 需克隆作者的 llama.cpp 分支并通过 llama-server.exe 配合 llama-ui 加载，其他模型用标准 llama.cpp 构建即可运行。

reddit · r/LocalLLaMA · /u/LLMFan46 · 8月30日 14:16

**背景**: GGUF 是 llama.cpp 及 Ollama、LM Studio 等工具分发本地推理用量化大模型的标准单文件格式。LongCat-Flash-Lite-Sparse 是美团的 69B 参数 MoE 模型（每 token 激活约 3B 参数），用 LongCat 稀疏注意力（LSA）替代了密集的多头潜在注意力，将上下文从 256k 扩展到 1M token。MTP（多 token 预测）头允许模型每步预测多个 token，从而支持投机解码以加速推理。'Heretic'去审查技术通过修改模型激活值来减少拒绝回答，KLD（KL 散度）衡量修改后模型与原模型的偏离程度——KLD 越低表示行为变化越小。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/meituan-longcat/LongCat-Flash-Lite-Sparse">meituan-longcat/LongCat-Flash-Lite-Sparse · Hugging Face</a></li>
<li><a href="https://en.wikipedia.org/wiki/GGUF">GGUF - Wikipedia</a></li>
<li><a href="https://sebastianraschka.com/llm-architecture-gallery/mtp/">Multi-Token Prediction (MTP) | Sebastian Raschka, PhD</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#llama-cpp`, `#gguf`, `#uncensored-models`, `#sparse-attention`

---

<a id="item-3"></a>
## [欧盟委员会在 ProtectEU 战略中重启加密后门立法推动](https://reclaimthenet.org/eu-protecteu-strategy-encryption-backdoor-law-enforcement) ⭐️ 6.0/10

欧盟委员会在其 2025 年 4 月 1 日发布的 ProtectEU 内部安全战略中，重启了对加密后门的立法推动。这延续了此前备受争议的 Chat Control（CSAR）提案，该提案要求服务商扫描消息并绕过端到端加密。 任何削弱加密的强制要求都将影响欧盟境内所有加密软件的开发者和用户，因为执法机构可用的后门同样会被犯罪分子和敌对国家利用。这场政策博弈的结果将决定端到端加密产品在欧洲的法律存续性。 包括苹果和 Signal 在内的技术界共识是：不存在安全的后门——故意引入的漏洞会削弱整体网络安全。批评者指出，欧盟委员会可以像 Chat Control 一样反复重新包装被否决的提案，立法上只需成功一次即可。 欧盟公民可以通过 fightchatcontrol.eu 等倡议联系本国议员，在谈判重启前表达反对意见。加密产品开发者应跟踪立法进程，评估司法管辖合规影响。

hackernews · nickslaughter02 · 8月30日 15:12 · [社区讨论](https://news.ycombinator.com/item?id=49499394)

**背景**: 端到端加密确保只有通信双方能读取消息，因此执法机构主张获得例外访问权限，而安全专家警告这在技术上无法安全实现。欧盟此前的 Chat Control 2.0（CSAR）提案要求强制扫描所有消息以检测儿童性虐待材料，实质上破坏了加密，在议会和理事会遭遇持续抵制。ProtectEU 是欧盟委员会涵盖恐怖主义、有组织犯罪和数字监控能力的多年期内部安全战略。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://home-affairs.ec.europa.eu/news/commission-presents-protecteu-internal-security-strategy-2025-04-01_en">Commission presents ProtectEU Internal Security Strategy</a></li>
<li><a href="https://en.wikipedia.org/wiki/Regulation_to_Prevent_and_Combat_Child_Sexual_Abuse">Regulation to Prevent and Combat Child Sexual Abuse - Wikipedia</a></li>
<li><a href="https://fightchatcontrol.eu/">Fight Chat Control - Protect Digital Privacy in the EU</a></li>

</ul>
</details>

**社区讨论**: 评论者几乎一致反对该提案，批评欧盟制度结构允许未经选举的欧盟委员会反复重新提出被议会否决的立法。多人认为在 AI 驱动的攻击能力面前后门尤其危险，还有人援引剑桥分析事件影响脱欧的先例，警告数据滥用可能被威权者利用。

**标签**: `#encryption`, `#privacy`, `#EU policy`, `#security`, `#surveillance`

---

<a id="item-4"></a>
## [Qwen 3.8 Flash Next（80GB）在 12GB 安卓手机上以 3.5 tok/s 运行](https://www.reddit.com/r/LocalLLaMA/comments/1w2nz07/qwen_38_flash_next_locally_on_simple_mobile_phone/) ⭐️ 6.0/10

一位 Reddit 用户展示了在一台价值 400–500 美元、内存仅 12GB 的中端安卓手机上，以每秒 3.5 个 token 的速度运行约 80GB 的 MoE 模型 Qwen 3.8 Flash Next。这一成果得益于自定义优化以及对模型稠密层的低比特量化。 这表明超大的开源 MoE 模型不仅能在服务器上运行，还可以在普通消费级手机上使用，大幅降低了本地私有 AI 的门槛。其核心技巧——对稠密层进行重度量化——对任何做移动端 LLM 推理的人都具有借鉴价值。 原帖缺乏技术细节、代码或方法论，因此具体的量化方案和运行时无法验证。3.5 tok/s 对于交互式聊天来说较慢，但适合离线、不赶时间的使用场景；MoE 模型的优势在于每个 token 只激活少量专家，尽管总权重大，实际计算量较小。 在尝试复现之前，先关注该 Reddit 帖子及作者的项目以获取方法论细节，并使用 LLM Compressor 等工具的 MoE 量化方案，先在较小的模型上试验混合精度策略。

reddit · r/LocalLLaMA · /u/dai_app · 8月30日 17:39

**背景**: Qwen 3.8 Flash Next 是首个基于将支撑 Qwen 4 的架构的开源权重模型，阿里巴巴 API 中的生产版 Qwen 3.8 Flash 即基于此版本。MoE（混合专家）模型将前馈层拆分为多个“专家”，每个 token 只激活其中少数几个，因此在权重可以卸载的情况下，非常适合内存受限的设备。MxMoE 和 MoQa 等研究表明，稠密（非专家）层和 lm_head 对量化更敏感，因此量化策略通常会将它们与专家 FFN 区别对待。token 生成速度受内存带宽严重制约，这就是为什么内存带宽有限的手机在这类大模型上只能达到每秒几个 token。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://ollama.com/library/qwen3.8-flash-next:125b-a6b-nvfp4">qwen 3 . 8 - flash - next :125b-a6b-nvfp4</a></li>
<li><a href="https://docs.vllm.ai/projects/llm-compressor/en/latest/examples/quantizing_moe/">Quantizing Mixture of Experts (MoE) models - LLM Compressor Docs</a></li>
<li><a href="https://arxiv.org/html/2503.21135v2">MoQa: Rethinking MoE Quantization with Multi-stage Data-model Distribution Awareness</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#quantization`, `#mobile-inference`, `#qwen`, `#moe`

---

<a id="item-5"></a>
## [劣质 HDMI 接口 eGPU 延长线导致 PCIe 链路从 x4 永久降至 x1](https://www.reddit.com/r/LocalLLaMA/comments/1w2j0pc/oh_so_thats_where_my_pcie_lanes_went/) ⭐️ 5.0/10

一位 LocalLLaMA 用户在清理设备时才发现，其 eGPU 的 PCIe 链路从 x4 永久降级到 x1 的元凶是廉价延长线上劣质的 HDMI 式连接器。卖家发货时用 HDMI 接口的延长线冒充了他订购的 OCuLink 版本。 对于使用 eGPU 运行本地大模型的用户，PCIe 链路宽度直接限制模型加载和推理吞吐量，x4 静默降为 x1 会让带宽缩水四分之三且没有任何明显报错。这个帖子提供了廉价的排查经验和实用的 EMI 缓解技巧（在 PCB 背面贴绝缘胶带隔开的锡纸）。 PCIe 链路在信号质量差时会自动降速到更少的通道数，因此劣质连接器导致的是永久 x1 链路而非直接故障。用户提到连接器可以自行更换，并建议购买基于 OCuLink 的延长线——它提供直连的 PCIe 4.0 x4 连接，带宽最高 64 Gbps 且无需信号转换。 如果你的 eGPU 链路宽度低于预期，先用 GPU-Z 或 lspci 检查，然后检查延长线连接器是否损坏或屏蔽不良，而不要先怪显卡或主机。购买延长线时，选择明确标注正品 OCuLink 连接器的卖家；如果 EMI 问题持续，可以考虑在 PCB 背面加绝缘隔开的锡纸屏蔽。

reddit · r/LocalLLaMA · /u/milpster · 8月30日 14:27

**背景**: 迷你主机和笔记本的 eGPU 方案通常通过 M.2 或 OCuLink 端口的延长线连接显卡，廉价延长线有时会借用 HDMI 外形 的连接器传输 PCIe 信号，这类连接器缺乏 proper 屏蔽和阻抗控制。PCIe 在启动时协商链路宽度，如果某些通道不可靠会自动回退到 x1，这种内置容错机制反而掩盖了线缆问题。OCuLink 是首选连接器，因为它专为原生 PCIe 信号设计。无屏蔽延长线 PCB 上的电磁干扰（EMI）会进一步破坏高速信号，因此接地锡纸等简易屏蔽措施有时确实有效。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://acemagic.com/blogs/accessories-peripherals/oculink-vs-usb4">OCuLink vs USB4: Which eGPU Connection is Better for Mini PCs?</a></li>
<li><a href="https://en.wikipedia.org/wiki/PCI_Express">PCI Express - Wikipedia</a></li>

</ul>
</details>

**标签**: `#eGPU`, `#PCIe`, `#hardware debugging`, `#local LLM`, `#riser cables`

---