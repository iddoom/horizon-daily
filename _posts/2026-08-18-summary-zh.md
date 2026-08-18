---
layout: default
title: "Horizon Summary: 2026-08-18 (ZH)"
date: 2026-08-18
lang: zh
---

> 从 56 条内容中筛选出 8 条重要资讯。

---

1. [在 4×RTX 3060 上运行 144 GiB 的 DeepSeek V4 Flash Q4_K_XL 并支持约 37 万上下文](#item-1) ⭐️ 8.0/10
2. [用约 20 美元的工具修复变砖的 AMD 版 Framework 13 笔记本](#item-2) ⭐️ 7.0/10
3. [O'Reilly Polars 书籍作者发布两页 Python 速查表](#item-3) ⭐️ 6.0/10
4. [Copilot 隐藏输入参数可被利用实施提示注入并窃取密码](#item-4) ⭐️ 6.0/10
5. [Fedora 计划限制已弃用的 AF_ALG 内核加密接口](#item-5) ⭐️ 6.0/10
6. [Linux 7.3 内核引入初步的显存管理改进](#item-6) ⭐️ 6.0/10
7. [促销结束，Claude Code 每周用量上限缩减三分之一](#item-7) ⭐️ 5.0/10
8. [苹果以 5%佣金取代欧盟按安装收费，放宽替代应用商店规则](#item-8) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [在 4×RTX 3060 上运行 144 GiB 的 DeepSeek V4 Flash Q4_K_XL 并支持约 37 万上下文](https://www.reddit.com/r/LocalLLaMA/comments/1vrqf4f/running_deepseek_v4_flash_q4_k_xl_at_100_toks/) ⭐️ 8.0/10

一位 Reddit 用户展示了完全可复现的 llama.cpp 配置（b10181 版本），在四块 RTX 3060 12GB 显卡上运行约 144 GiB 的 DeepSeek-V4-Flash-0731 UD-Q4_K_XL GGUF 模型，配置 368,640 token 上下文，实现 99.4 tok/s 的提示处理速度和 10.1 tok/s 的生成速度。关键技巧是通过-ncmoe 34 将第 0–33 块的 MoE 专家保留在系统内存中，并用-ot 覆盖参数将剩余九层专家显式分配到 GPU 1–3。 这证明了带有超大上下文窗口的大型 MoE 模型可以在成本远低于数据中心 GPU 的消费级硬件上运行，且提供了可直接复制的完整命令行。通过实测而非解析计算来确定张量布局的方法，对任何调优多 GPU llama.cpp 设置的人都具有可复用价值。 微批大小是最大的性能杠杆：-ub 2048 实现 99.4 tok/s 提示处理，而-ub 1024 仅 63.4 tok/s，但解码速度两者都在约 10 tok/s。Q8_0 KV 缓存必不可少（F16 KV 在 393k 上下文下仅剩 587 MiB 空闲），-ncmoe 33 会导致 CUDA 分配失败，-np 1 很重要因为多槽位会成倍增加 KV 缓存需求；368k 完整窗口已配置但尚未进行端到端填满测试。 复制帖子中完整的 llama-server 命令（包含-ncmoe 34、-ts 100,1,1,1、-ot 专家分配、-ctk/-ctv q8_0、-ub 2048 和-np 1），并适配到你自己的多 GPU MoE 环境中，对每种候选张量布局进行实测基准测试，而不是尝试解析计算。

reddit · r/LocalLLaMA · /u/syscomua · 8月18日 14:15

**背景**: DeepSeek-V4-Flash 是混合专家（MoE）模型，每个 token 只激活部分专家权重，因此大多数专家权重可以放在系统内存中，只要内存带宽足够（此处为四通道 DDR4-3200）速度仍可接受。llama.cpp 的-ts 参数设置卸载到每块 GPU 的权重比例，-ot（override-tensor）可将特定张量模式（如专家 FFN 层）分配到指定设备，-ncmoe 则将前 N 层的专家保留在 CPU 上。UD-Q4_K_XL 是 Unsloth 的动态量化方案，对重要矩阵使用更高精度（Q5_K），其余保持 Q4_K，在相近体积下比标准 Q4_K_M 质量更好。Q8_0 KV 缓存量化相比 FP16 大约减半缓存占用且精度损失极小，这对容纳约 37 万 token 的上下文至关重要。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/ggml-org/llama.cpp/blob/master/docs/multi-gpu.md">llama.cpp/docs/multi-gpu.md at master · ggml-org/llama.cpp</a></li>
<li><a href="https://huggingface.co/blog/Doctor-Shotgun/llamacpp-moe-offload-guide">Performant local mixture-of-experts CPU inference with GPU acceleration in llama.cpp</a></li>
<li><a href="https://www.reddit.com/r/LocalLLaMA/comments/1dalkm8/memory_tests_using_llamacpp_kv_cache_quantization/">r/LocalLLaMA on Reddit: Memory Tests using Llama.cpp KV cache quantization</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#llama.cpp`, `#gpu-inference`, `#quantization`, `#deepseek`

---

<a id="item-2"></a>
## [用约 20 美元的工具修复变砖的 AMD 版 Framework 13 笔记本](https://quantum5.ca/2026/08/16/fixing-bricked-amd-7040-series-framework-13-laptop-with-20-tools/) ⭐️ 7.0/10

一篇详细教程展示了如何修复一台因官方 BIOS 更新而变砖的 AMD 锐龙 7040 系列 Framework 13 笔记本，只需约 20 美元的工具直接重刷 SPI BIOS 芯片。该指南完整记录了将外部编程器连接到焊接式闪存芯片并恢复可用固件的全过程。 BIOS 更新导致变砖在各 PC 厂商中仍是常见故障，而这篇指南证明一台“报废”的笔记本往往只需低成本即可救回，不必变成电子垃圾。该技术可推广到大多数现代笔记本，因为几乎所有笔记本主板上都有可现场重刷的 8 脚 SPI 闪存芯片。 BIOS 闪存芯片焊在主板上（通常靠近 CMOS 电池附近），因此可使用 CH341A 等廉价 SPI 编程器配合测试夹进行在线重刷，无需拆焊。一个已知问题是 SOIC 测试夹对位困难、接触不良，刷写时需要耐心或用手按紧夹子。 如果你的笔记本变砖，可在主板上找到 8 脚 SPI 闪存芯片（通常在 CMOS 电池附近），购买带 SOIC8 测试夹的 CH341A 编程器，并按照该教程重刷已知良好的 BIOS 镜像。此外，在今后任何 BIOS 更新前先备份固件转储也是明智的预防措施。

hackernews · jp_sc · 8月18日 13:18 · [社区讨论](https://news.ycombinator.com/item?id=49345220)

**背景**: 当 BIOS 更新失败或闪存内容损坏时，笔记本可能完全无法开机或自检——俗称“变砖”——因为 CPU 启动所需的固件已丢失。大多数现代主板将固件存储在焊在板上的小型 8 脚 SPI EEPROM/闪存芯片中。使用 CH341A 等外部编程器（约 5-15 美元）配合 SOIC 测试夹连接芯片引脚，即可读取并重写该芯片，恢复已知良好的固件镜像。Framework 笔记本以模块化、可维修为卖点，因此此次官方支持缺位尤其引发争议。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://quantum5.ca/2026/08/16/fixing-bricked-amd-7040-series-framework-13-laptop-with-20-tools/">Fixing a bricked AMD 7040 series Framework 13” laptop with $20 tools</a></li>
<li><a href="https://linustechtips.com/topic/1592429-help-with-troubleshooting-a-dead-motherboard/">Help with troubleshooting a dead motherboard... - Linus Tech Tips</a></li>
<li><a href="https://carbonite.co.za/index.php?threads/motherboard-bios-reflashing-with-ch341-eeprom-programmer.542932/">Motherboard BIOS Reflashing with CH 341 EEPROM Programmer</a></li>

</ul>
</details>

**社区讨论**: 评论者对 BIOS 更新变砖仍然极其常见、厂商却几乎不提供支持表示不满，有人提到一台 ThinkPad Nano 只因社区分析了闪存转储才得以救回。多人特别批评 Framework 支持不力、且其商业模式是任何故障都要“从 Framework 买新部件”，还有人建议通过小额法庭等法律途径维权，并主张官方更新应延长而非取消保修。

**标签**: `#hardware-repair`, `#firmware`, `#BIOS`, `#framework-laptop`, `#right-to-repair`

---

<a id="item-3"></a>
## [O'Reilly Polars 书籍作者发布两页 Python 速查表](https://opensource.posit.co/resources/cheatsheets/polars/) ⭐️ 6.0/10

《Python Polars: The Definitive Guide》（近 500 页）的作者 Jeroen Janssens 及合著者将全书压缩成了一份两页速查表，涵盖 Polars 数据框的关键操作。该速查表在 Posit 的开源速查表网站上提供 PDF 和无障碍 HTML 两种版本。 一份紧凑、权威的快速参考降低了 Python 用户上手 Polars 的门槛——相比 Pandas，Polars 在处理表格数据时更快、使用体验更好。做数据清洗的人可以把它放在手边，而不必翻阅 500 页的书或零散的文档。 作者将其称为对原书的“高损耗压缩”，并明确邀请读者反馈遗漏的常用 Polars 操作以及排版组织建议。Polars 是一个基于 Rust、构建在 Apache Arrow 之上的数据框库，拥有表达式 API 和惰性求值机制，支持快速的 CSV/Parquet 读写、筛选、分组聚合和连接操作。 从 Posit 的速查表页面下载 PDF 或打开 HTML 版本，放在编辑器旁边；尝试用速查表中的 Polars 模式改写你现有的一个 Pandas 脚本。

hackernews · jeroenjanssens · 8月18日 13:38 · [社区讨论](https://news.ycombinator.com/item?id=49345476)

**背景**: Polars 是一个面向 Python 和 Rust 的高性能数据框库，构建在 Apache Arrow 之上，旨在成为任意规模表格数据处理的最快方式之一。其核心概念是上下文（context）和表达式（expression）：上下文（如 select 或 group_by）是表达式求值的环境，而惰性 API 让 Polars 在收集结果前优化整个查询计划。许多从 Pandas 迁移过来的用户认为 Polars 语法更少摩擦，而 R 用户则常将其与 dplyr 和 data.table 相比较。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://pola.rs/">Polars — DataFrames for the new era</a></li>
<li><a href="https://docs.pola.rs/user-guide/concepts/lazy-api/">Lazy API - Polars user guide</a></li>
<li><a href="https://en.wikipedia.org/wiki/Polars_(software)">Polars (software) - Wikipedia</a></li>

</ul>
</details>

**社区讨论**: 讨论整体积极且充满好奇。一位 R 用户表示 tidyverse 的使用体验很难超越，但 Polars 似乎解决了 Pandas 的许多摩擦，值得尝试；另一位评论者已从 Python/polars/pandas 完全转向 DuckDB 且不后悔；还有一位认为 R 的 data.table 仍是最好的数据框开发体验，打算再给 Polars 一次机会。

**标签**: `#python`, `#polars`, `#dataframe`, `#data-engineering`, `#cheatsheet`

---

<a id="item-4"></a>
## [Copilot 隐藏输入参数可被利用实施提示注入并窃取密码](https://arstechnica.com/security/2026/08/microsoft-copilot-reveals-secret-input-that-allowed-it-to-be-hacked/) ⭐️ 6.0/10

研究人员发现 Microsoft Copilot 中存在一个隐藏的输入参数，攻击者可借助恶意链接操纵该助手，从点击链接的目标用户那里窃取密码。这一披露表明 AI 助手中的隐藏参数可能成为提示注入攻击的攻击面。 任何部署处理凭据、邮件或网页内容的 LLM 助手或自动化系统的人都需要认识到，不可见的输入（URL 参数、网页内嵌文本）可能携带模型会执行的指令。这一教训不仅限于 Copilot，适用于所有将可信开发者指令与不可信用户或网页内容混合处理的智能体。 该攻击链依赖间接提示注入：精心构造的链接使 Copilot 处理攻击者控制的内容，进而指示其外泄密码等敏感数据。原始报道仅有标题级信息，因此具体的参数名称、披露时间线以及微软是否已修复均无法从现有内容确认。 阅读 Ars Technica 的完整报道了解技术细节，并审计你自己构建的 LLM 自动化，确保不可信的 URL 参数和抓取的网页内容在未经净化或权限隔离的情况下不会被拼接到模型的指令上下文中。

rss · Ars Technica · 8月18日 13:00

**背景**: 提示注入是一种利用看似无害的输入诱使 LLM 无视开发者定义的指令、转而执行攻击者命令的攻击方式。LLM 在根本上难以可靠地区分可信的系统提示与不可信的用户输入或检索到的网页内容，这使得间接注入（在模型读取的网页中隐藏恶意指令）尤其危险。Microsoft 365 Copilot 与 Microsoft Graph 集成，可访问邮件、文档等租户数据，因此任何成功的注入都会放大影响。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Prompt_injection">Prompt injection - Wikipedia</a></li>
<li><a href="https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-architecture">How does Microsoft 365 Copilot work? | Microsoft Learn</a></li>

</ul>
</details>

**标签**: `#security`, `#AI`, `#prompt-injection`, `#Microsoft Copilot`, `#vulnerability`

---

<a id="item-5"></a>
## [Fedora 计划限制已弃用的 AF_ALG 内核加密接口](https://lwn.net/Articles/1088489/) ⭐️ 6.0/10

Fedora 项目计划在下一个发行版中限制对 AF_ALG 用户态接口的使用，以促使仍在使用该接口的用户在它被从内核移除前完成迁移。AF_ALG 因与 Copy Fail（CVE-2026-31431）等高危漏洞相关，已于今年早些时候被标记为弃用。 任何依赖 AF_ALG 获取内核或硬件加速加密的 Linux 软件都需要尽快迁移，否则在接口被限制并最终移除后将面临故障。这也展示了内核社区与发行版如何协同淘汰存在安全问题的接口。 AF_ALG 通过 Eric Biggers 等开发者提交的内核补丁被正式弃用，且开发者正在推动将其完全移除。Copy Fail 漏洞表明 AF_ALG 的缺陷可被轻易利用实现本地提权（获取 root），影响近九年发布的所有主流发行版，甚至可通过页缓存写入穿透容器边界。 审计你的软件及依赖（如 OpenSSL 的 AF_ALG 引擎、wolfSSL 配置）是否使用了 AF_ALG，并在升级到下一个 Fedora 版本之前切换到纯用户态加密库或其他内核接口。

rss · LWN.net · 8月18日 13:48

**背景**: AF_ALG 是 Linux 内核 Crypto API 的基于套接字（地址族）的用户态接口，在内核 2.6.38 中合入，历史上被 OpenSSL、wolfSSL 等库用于访问内核或硬件加密加速。Copy Fail（CVE-2026-31431）由安全公司 Theori 于 2026 年 4 月 29 日披露，它将 AF_ALG 的一个逻辑缺陷转化为 4 字节页缓存写入，用一个小的可移植脚本即可获得本地 root 权限。由于该接口反复成为此类漏洞的入口，内核开发者决定弃用并移除它，而不是继续修补。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Copy_Fail">Copy Fail - Wikipedia</a></li>
<li><a href="https://xint.io/blog/copy-fail-linux-distributions">Copy Fail: 732 Bytes to Root on Linux - Xint</a></li>
<li><a href="https://en.wikipedia.org/wiki/Linux_kernel_crypto_API">Linux kernel crypto API - Wikipedia</a></li>

</ul>
</details>

**标签**: `#linux-kernel`, `#security`, `#fedora`, `#cryptography`, `#sysadmin`

---

<a id="item-6"></a>
## [Linux 7.3 内核引入初步的显存管理改进](https://www.reddit.com/r/LocalLLaMA/comments/1vro3vf/linux_improves_vram_management_in_73_kernel/) ⭐️ 6.0/10

即将发布的 Linux 7.3 内核将包含改进 GPU 驱动子系统中显存（VRAM）管理的初始代码，相关工作由开发者 Vock 在 TTM 内存管理器上推进。r/LocalLLaMA 上的这篇 Reddit 帖子指出这可能对本地 LLM 推理工作负载有利。 本地 LLM 推理受显存容量的严重制约，完全装入显存的模型比溢出到系统内存的模型快得多。内核层面更好的显存管理可以减少碎片和分配问题，帮助用户在相同硬件上运行更大的模型或更稳定的工作负载。 这篇 Reddit 帖子本身只有链接，没有基准测试或技术细节，因此对 LLM 推理的实际影响尚未验证。该内核工作被描述为“初始”代码，后续还有更多显存管理改进在推进中，因此首个版本的收益可能有限。 关注 Phoronix 对 Linux 7.3 显存工作的报道，并在 7.3 发布后，升级前后分别测试你的本地 LLM 推理环境（如 Ollama 或 llama.cpp），以衡量可用显存或稳定性是否有实际变化。

reddit · r/LocalLLaMA · /u/johnnyApplePRNG · 8月18日 12:43

**背景**: Linux GPU 驱动使用 TTM（Translation Table Maps）内存管理器在显存和系统内存（GTT）之间分配资源。显存管理不佳会导致不稳定、过多地换出到系统内存或在内存压力下崩溃——这在运行大型本地模型时很常见。相关的努力（如 Valve 使用 dmem cgroups 为前台应用优先分配显存的补丁）表明整个生态系统都在推动改善 Linux 上的 GPU 内存行为。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.phoronix.com/news/Linux-7.3-Improving-vRAM-Mgmt">Linux 7.3 To Land Initial Code Improving vRAM Management , More...</a></li>
<li><a href="https://www.linuxoperatingsystem.net/linux-kernel-vram-tuning-ttm-parameters-gpus-linux/">Linux Kernel VRAM Tuning via TTM Parameters for AMD GPUs...</a></li>
<li><a href="https://en.vidabytes.com/Valve-optimizes-VRAM-management-in-Linux-to-improve-gaming-with-modest-GPUs/">Valve improves VRAM management on Linux for better gaming</a></li>

</ul>
</details>

**标签**: `#linux`, `#vram`, `#local-llm`, `#gpu`, `#kernel`

---

<a id="item-7"></a>
## [促销结束，Claude Code 每周用量上限缩减三分之一](https://support.claude.com/en/articles/15910845-claude-code-may-august-2026-weekly-limits-promotion) ⭐️ 5.0/10

Anthropic 即将结束 2026 年 5 月至 8 月的 Claude Code 每周限额促销活动，从明天起每周用量上限缩减约三分之一。该变化影响此前享受临时提升额度的订阅用户。 月付 200 美元套餐的重度用户反映经常用到额度的 90–100%，因此此次缩减直接决定他们是继续订阅还是流失。HN 讨论中提到了具体的替代方案（OpenAI Codex、开源的 PI agent），并强调 token 效率是关键考量因素。 该额度本是临时促销，Anthropic 此前曾延长过一次，给订阅者带来持续的不确定性。用户还抱怨近期的服务中断以及对 Opus/Fable 模型实用性的不满，进一步加剧了对限额缩减的失望情绪。 如果你已接近每周用量上限，可以在限额生效前用 Codex（开源 CLI）或 PI 测试你的典型任务，提前准备好经过验证的备选方案。

hackernews · tyre · 8月18日 17:02 · [社区讨论](https://news.ycombinator.com/item?id=49348751)

**背景**: Claude Code 是 Anthropic 推出的智能体式终端/IDE 编程工具，可以编辑文件并在代码库上执行命令，采用订阅制并设有每周用量上限。它的主要竞争对手是 OpenAI 的 Codex，后者可通过 CLI、桌面应用和 IDE 集成使用，到 2026 年 3 月已有超过 200 万周活跃用户。PI 则是一个较新的开源 agent 工具包（统一 LLM API、agent 循环、TUI、编程 CLI），高度可定制，可接入不同的模型提供商。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Claude_Code">Claude Code</a></li>
<li><a href="https://en.wikipedia.org/wiki/OpenAI_Codex_(AI_agent)">OpenAI Codex (AI agent)</a></li>
<li><a href="https://github.com/earendil-works/pi">GitHub - earendil-works/pi: AI agent toolkit: unified LLM API, agent loop, TUI, coding agent CLI · GitHub</a></li>

</ul>
</details>

**社区讨论**: 社区情绪总体偏负面：用户提到服务中断、Opus/Fable 质量下滑，以及对促销是否延期的反复不确定性感到厌烦。多位评论者计划切换——有人推荐 PI，因其易于定制（但听说用 Anthropic 订阅接入会被封号）；另一位表示如果限额下降会'立刻'转投 Codex。一个反复出现的观点是：Anthropic 的高 token 消耗路线与 OpenAI 的效率路线之争将决定长期赢家。

**标签**: `#claude-code`, `#anthropic`, `#ai-tools`, `#pricing`, `#developer-tools`

---

<a id="item-8"></a>
## [苹果以 5%佣金取代欧盟按安装收费，放宽替代应用商店规则](https://techcrunch.com/2026/08/18/apple-overhauls-its-eu-app-store-fees-loosens-rules-for-alternative-app-stores/) ⭐️ 5.0/10

苹果正在改革其欧盟 App Store 收费结构，用针对 App Store 以外分发应用的 5%统一佣金取代备受争议的按安装收费的核心技术费（Core Technology Fee）。同时，苹果还放宽了开发者在欧盟运营替代应用市场的相关要求。 这一变化直接影响在欧盟分发 iOS 应用的经济账，使替代应用市场和网页分发对开发者来说在财务上更可预测。任何向欧盟用户发布 iOS 应用的开发者都应重新计算新模式下的分发成本。 此前的核心技术费对超过一百万次的首年安装每次收取 0.50 欧元，批评者认为这使免费应用在财务上难以维持；新的 5%佣金适用于在 App Store 之外分发的应用。根据苹果文档，自 2026 年 1 月 1 日起，该费用可作为单独佣金收取，或作为其他费用的组成部分。 如果你在欧盟分发 iOS 应用，请查阅苹果关于核心技术费和 DMA 的更新文档，并根据新的 5%佣金模式测算安装量和收入预测，以判断替代分发渠道对你是否可行。

rss · TechCrunch · 8月18日 17:12

**背景**: 欧盟《数字市场法》（DMA）将苹果指定为“守门人”，迫使它允许在欧盟的 iOS 上使用替代应用市场、网页分发和第三方支付方式。苹果在 2024 年最初以核心技术费（按安装收费）作为回应，遭到开发者广泛批评，认为这削弱了 DMA 的立法意图。新的 5%佣金模式是苹果在欧洲委员会持续监管压力下的最新调整。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://developer.apple.com/support/core-technology-fee/">Core Technology Fee - Support - Apple Developer</a></li>
<li><a href="https://developer.apple.com/support/dma-and-apps-in-the-eu/">Update on apps distributed in the European Union - Support - Apple Developer</a></li>
<li><a href="https://en.wikipedia.org/wiki/Digital_Markets_Act">Digital Markets Act - Wikipedia</a></li>

</ul>
</details>

**标签**: `#app-store`, `#apple`, `#eu-regulation`, `#developer-fees`, `#app-distribution`

---