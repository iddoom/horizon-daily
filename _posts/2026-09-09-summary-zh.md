---
layout: default
title: "Horizon Summary: 2026-09-09 (ZH)"
date: 2026-09-09
lang: zh
---

> 从 47 条内容中筛选出 7 条重要资讯。

---

1. [在 10-12 块 RTX 3090 上运行 DeepSeek-V4-Flash-Vision-Exp（285B MoE）的完整指南](#item-1) ⭐️ 9.0/10
2. [Tailwind Labs 加入 Shopify，AI 冲击其商业模式](#item-2) ⭐️ 8.0/10
3. [我在谷歌广告上投放恶意软件广告](#item-3) ⭐️ 7.0/10
4. [DeepSeek V4.1 Flash 将于 2026 年 9 月 10 日发布，性能与成本全面超越 V4 Pro](#item-4) ⭐️ 7.0/10
5. [内核融合让 GLM-5.3-Flash Q4 在 M3 Ultra 上达到 40 t/s 解码与 550 t/s 预填充](#item-5) ⭐️ 7.0/10
6. [GitHub 支持批量使用智能体自动修复 Code Quality 发现的问题](#item-6) ⭐️ 6.0/10
7. [Suno 推出仅用授权音乐训练的 v6 模型，应对版权诉讼](#item-7) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [在 10-12 块 RTX 3090 上运行 DeepSeek-V4-Flash-Vision-Exp（285B MoE）的完整指南](https://www.reddit.com/r/LocalLLaMA/comments/1wbi5u1/deepseekv4flashvisionexp_285b_moe_on_1012x_rtx/) ⭐️ 9.0/10

一位 Reddit 用户发布了完全可复现的方案，通过打了补丁的 SM86 兼容 vLLM 构建，在 10-12 块消费级 RTX 3090 上运行 DeepSeek-V4-Flash-Vision-Exp（285B MoE，FP4 专家+FP8 注意力，权重共 157 GB）。该方案在 10 卡上借助 DSpark 投机解码（k=3）实现 60+ tok/s 的解码速度，在 12 卡上达到 120+ tok/s，且视觉、工具调用以及最高 1M（RAM 卸载下 4M）上下文均可正常工作。 这表明一个前沿规模的多模态 MoE 模型可以在廉价二手消费级 GPU（RTX 3090）上以可用速度自托管，对本地 LLM 爱好者和注重隐私的部署具有直接可操作性。预构建的 Docker 镜像、启动脚本以及详细记录的补丁（投机解码、视觉 OOM 修复、调度器行交叉修复）能为他人节省数周的调试时间。 该方案在 10 卡上采用 TP2xPP5 并行，在 12 卡上采用 TP4xPP3 并行，功耗限制在 240 W，长上下文预填充约 3,500 tok/s。补丁修复了 DSpark propose-gate（投机解码与视觉的交互）、调度器多模态/投机解码行交叉、语法位掩码校验、视觉 ViT OOM 以及 FlashInfer workspace-lane 键值等问题。 如果你有 10-12 块 RTX 3090，可执行 `docker pull ghcr.io/ciprianveg/3090-vllm:dsv4-flash-vision-sm86` 拉取预构建镜像，并按照 GitHub 仓库（https://github.com/ciprianveg/3090-vllm）中的构建指南和启动脚本进行部署。

reddit · r/LocalLLaMA · /u/ciprianveg · 9月9日 10:50

**背景**: DeepSeek-V4-Flash-Vision-Exp 是一个 285B 参数的混合专家（MoE）多模态模型，专家权重采用 FP4 量化、注意力采用 FP8，使总权重压缩至 157 GB。vLLM 是流行的开源推理引擎；投机解码通过让较小的模型提出候选 token、再由主模型批量验证来加速生成。RTX 3090 是 Ampere 架构（SM86）显卡，每块 24 GB 显存，二手市场供应充足，但不支持一些较新的算子特性，因此需要打了补丁的 SM86 兼容定制构建。

**标签**: `#local-llm`, `#vllm`, `#moe`, `#deepseek`, `#gpu-inference`

---

<a id="item-2"></a>
## [Tailwind Labs 加入 Shopify，AI 冲击其商业模式](https://tailwindcss.com/blog/tailwind-is-joining-shopify) ⭐️ 8.0/10

流行的实用优先 CSS 框架 Tailwind CSS 背后的公司 Tailwind Labs 宣布被 Shopify 收购。此前在 2026 年 1 月，由于 AI 导致流量和收入大幅下滑，该公司裁掉了 75% 的工程团队。 这是 AI 颠覆开源和开发者内容业务的具体案例：尽管框架比以往更流行，Tailwind 的文档流量自 2023 年初下降约 40%，因为开发者现在直接问 AI 助手而不读文档，破坏了带动 Tailwind Plus 模板销售的转化漏斗。任何依靠文档、模板或开发者教育变现的人都应关注这一信号。 Tailwind Labs 的收入模式依赖文档流量转化为 Tailwind Plus（原 Tailwind UI）模板和组件的购买；AI 代码生成同时减少了流量和模板需求，据报道收入下降约 80%。Shopify 收购的主要是团队和品牌，而非一项可持续的业务。 如果你的业务依赖文档流量或模板销售，请审计漏斗分析数据中 AI 造成的流量下滑，并向不易被 AI 替代的收入来源（如托管服务、企业支持）多元化转型。

hackernews · EdwinHoksberg · 9月9日 13:27 · [社区讨论](https://news.ycombinator.com/item?id=49626190)

**背景**: Tailwind CSS 是一个开源的实用优先 CSS 框架，与 Bootstrap 等组件框架不同，它通过在 HTML 中直接使用小型可组合的类来完成样式。与许多开源公司一样，Tailwind Labs 通过免费产品（框架加文档）吸引用户，再引导他们购买付费产品（如专业设计的 UI 模板）。如今在大量公开文档上训练的大语言模型可以直接回答开发者的问题，访问文档的开发者变少，切断了销售漏斗的顶端。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://chyshkala.com/blog/tailwindcss-layoffs-ai-impact-documentation-revenue">TailwindCSS Lays Off 75% of Team as AI Crushes Documentation ...</a></li>
<li><a href="https://www.remio.ai/post/tailwind-css-ai-impact-docs-traffic-collapse-triggers-75-engineering-layoffs">Tailwind CSS AI Impact: Docs Traffic Collapse Triggers 75% ...</a></li>
<li><a href="https://en.wikipedia.org/wiki/Tailwind_CSS">Tailwind CSS - Wikipedia</a></li>

</ul>
</details>

**社区讨论**: 评论者重点讨论了 simonw 引用的 Adam Wathan 一月的披露：因 AI 影响，75% 的工程师失业、文档流量下降 40%。有人认为 Shopify 买的是人和品牌，因为现在销售 UI 模板已是死路；也有人质疑在 AI 代理和现代原生 CSS 时代新项目是否还需要 Tailwind，还有人偏好 Bootstrap、jQuery 和 HTMX 这类简单且易于维护的技术栈。

**标签**: `#tailwind`, `#shopify`, `#acquisition`, `#ai-business-impact`, `#developer-tools`

---

<a id="item-3"></a>
## [我在谷歌广告上投放恶意软件广告](https://xlii.space/eng/malicious-software-on-google-ads/) ⭐️ 7.0/10

一位实验者记录了恶意软件广告如何轻易通过谷歌广告的审核，而正当提交却被拒绝，引发了对谷歌自动审核机制失效的讨论。

hackernews · xlii · 9月9日 11:43 · [社区讨论](https://news.ycombinator.com/item?id=49624856)

**标签**: `#google-ads`, `#security`, `#ad-fraud`, `#platform-moderation`, `#case-study`

---

<a id="item-4"></a>
## [DeepSeek V4.1 Flash 将于 2026 年 9 月 10 日发布，性能与成本全面超越 V4 Pro](https://news.ycombinator.com/item?id=49624603) ⭐️ 7.0/10

DeepSeek 宣布 V4.1 Flash 将于 2026 年 9 月 10 日（北京时间）前后正式发布，声称在性能、成本、速度和任务完成时间上全面超越 V4 Pro。所有发往 Pro 模型的请求将被自动路由到 V4.1 Flash 并按 Flash 价格计费；新定价于当天 12:00 生效，非高峰时段缓存命中输入 $0.003、缓存未命中输入 $0.15、输出 $0.6，高峰时段价格为两倍。 Pro 请求被强制路由到 Flash，意味着已在 V4 Pro 上验证过的生产工作流会被静默更换模型，任何依赖 API 的团队都应为此做预案。极低的缓存命中价格也使 Flash 成为高吞吐、缓存友好型负载（如编程智能体）中性价比最高的模型之一。 测试者现在即可通过 API 端点 "deepseek-v4.1-flash-expires-on-0910" 调用测试版；评论者反馈其速度快，但网页版聊天语言跟随能力不稳定（英文提问有时返回中文思维链或中文回答）。另需注意 DeepSeek API 默认会使用你的数据进行训练，且高缓存命中率下的实际成本可能与标价差异巨大。 如果你在生产环境中使用 DeepSeek，请立即显式固定模型选择，并在 9 月 10 日前用测试端点 "deepseek-v4.1-flash-expires-on-0910" 对照 V4 Pro 工作流做回归测试，发现问题及时向 DeepSeek 反馈以抵制强制换模。

hackernews · nickweb · 9月9日 11:19

**背景**: DeepSeek 的 Flash 系列是其成本优化型模型线，此前的 V4 Flash 已能以远低于 Pro 的价格提供接近 Pro 的推理性能。与 OpenAI 和 Anthropic 一样，DeepSeek 采用提示词缓存机制，重复输入的 token 计费远低于正常输入价格，并已转向峰谷计费（非高峰价格为高峰的一半）。自动路由做法反映了行业普遍的模型下线或静默替换模式，这可能破坏绑定特定模型行为的生产工作流。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.orcarouter.ai/blog/deepseek-v4-1-flash-leak">DeepSeek V 4 . 1 Flash API Beta: What We Know Before Launch</a></li>
<li><a href="https://huggingface.co/deepseek-ai/DeepSeek-V4-Flash">deepseek -ai/ DeepSeek - V 4 - Flash · Hugging Face</a></li>

</ul>
</details>

**社区讨论**: 社区评价褒贬不一：用户称赞 Flash 的速度和极低价格（"回答只需几美分，体验极佳"），但最主要的批评指向将 Pro 强制路由到 Flash 的做法，aftbit 认为应将弃用模型保留一段明确期限后再下线。还有用户提供了测试版端点、提醒 DeepSeek API 会用用户数据训练，并反馈网页版 Flash 语言跟随不稳定（英文提问可能随机得到中文思维链或中文回答）。

**标签**: `#AI models`, `#DeepSeek`, `#LLM APIs`, `#model deployment`, `#cost optimization`

---

<a id="item-5"></a>
## [内核融合让 GLM-5.3-Flash Q4 在 M3 Ultra 上达到 40 t/s 解码与 550 t/s 预填充](https://www.reddit.com/r/LocalLLaMA/comments/1wbkpnw/glm_53_flash_q4_60tps_550tps_on_m3_ultra/) ⭐️ 7.0/10

一位开发者修改了 DwarfStar（ds4）推理引擎的 Metal 内核，在 M3 Ultra 上运行 GLM-5.3-Flash Q4，将数十个小内核调度融合为更大的调度，达到约 81% 的实测内存带宽利用率。短上下文解码速度从 29 提升到 40 t/s，62k 上下文从 24 提升到 38 t/s；预填充从 366 提升到 550 t/s，300k 上下文端到端速度从 21.6 提升到 37.4 t/s。 这是一个可复现的开源本地大模型推理性能工程案例，展示了精心的内核融合与调度可以在不改变权重和质量的情况下带来 30-50% 的加速。在 Apple Silicon 上运行本地模型或开发推理引擎的人都可以直接借鉴这些技术和基准测试方法。 长上下文优化用并行扫描先缩小候选集再排序的方式，替代了原有的排序合并流程，每个 token 约节省 1 毫秒且输出完全一致；精度得到保持（相对 FP8 参考的平均 NLL 为 0.300766 对 0.300804，首 token 匹配同为 90/100）。该分支仅限 M3 Ultra，因为优化依赖该芯片的双芯内存行为、缓存以及 Metal 在 80 个 GPU 核心上的调度特性；可选的投机解码 drafter（--dflash）在结构化输出上提升 20-50%，但在普通文本上会自动退出。 克隆仓库并按照 glm53-m3ultra 分支的 README（github.com/IngeniousIdiocy/ds4）在 M3 Ultra 上复现基准测试，包括用 --dflash 构建 drafter 以加速结构化输出任务。

reddit · r/LocalLLaMA · /u/IngeniousIdiocy · 9月9日 12:51

**背景**: DwarfStar（ds4）是 antirez 开发的一个小型原生 C 推理引擎，专为在高内存 Mac 等 consumer 硬件上运行少数优秀大模型（DeepSeek V4 Flash/PRO、GLM 5.2/5.3 Flash）而优化，支持 Metal、CUDA 和 ROCm 后端。权重流式推理每次前向传播只加载当前活跃的 transformer 层，使大型量化（如 Q4）模型能在统一内存的 Apple Silicon 上运行。GPU 内核融合通过把多个小调度合并为更少的大调度来减少启动开销，当小内核让 GPU 空转并付出延迟代价时这一点尤为关键。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/antirez/ds4">GitHub - antirez/ds4: DeepSeek 4 Flash and PRO local inference engine for Metal, CUDA and ROCm · GitHub</a></li>
<li><a href="https://dwarfstar.sh/">DwarfStar 4 (ds4): Local DeepSeek V4 and GLM 5.3</a></li>

</ul>
</details>

**标签**: `#local-llm`, `#apple-silicon`, `#performance-optimization`, `#metal`, `#inference`

---

<a id="item-6"></a>
## [GitHub 支持批量使用智能体自动修复 Code Quality 发现的问题](https://github.blog/changelog/2026-09-09-remediate-code-quality-findings-with-agentic-autofix) ⭐️ 6.0/10

GitHub 宣布用户现在可以在一个页面上批量选择最多 25 条标准 Code Quality 发现，并将它们分配给智能体自动修复（agentic autofix）进行自动化处理。这大幅加快了清理代码质量积压问题的速度，而无需逐条处理。 拥有大量代码质量积压问题的团队现在可以批量将修复工作交给 Copilot 云端智能体，它会自动创建修复拉取请求。这将代码质量清理从人工分类变成了可监督的、基本自动化的工作流。 智能体自动修复要求仓库中可用 Copilot cloud agent 和 Copilot Autofix；如果云端智能体不可用，分配操作会回退到单条发现的 Copilot Autofix。也可以通过 Update a Code Scanning Alert REST API，将告警的 assignees 设为该机器人的标识符来以编程方式触发分配。 打开你的 Code Quality 仪表板，选择最多 25 条标准发现并分配给智能体自动修复，看看生成的修复拉取请求在你的代码库上效果如何。

rss · GitHub Changelog · 9月9日 12:21

**背景**: GitHub Code Quality 使用 CodeQL 扫描默认分支和拉取请求，并在仪表板上展示带有建议修复的发现结果。智能体自动修复超越了单行补丁：它可以跨多个文件重写相关联的代码，并创建包含修复的拉取请求。底层的代码扫描功能早已用于分析仓库中的安全漏洞和编码错误，本次公告将智能体修复扩展到 Code Quality 发现的批量处理。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://docs.github.com/en/code-security/concepts/code-quality/code-quality">GitHub Code Quality - GitHub Docs</a></li>
<li><a href="https://docs.github.com/en/code-security/concepts/code-scanning/autofix-for-code-scanning">About autofix for code scanning - GitHub Docs</a></li>
<li><a href="https://www.linkedin.com/pulse/github-copilot-introduces-multi-file-agentic-autofix-code-e6oqf">GitHub Copilot Introduces Multi-File Agentic Autofix for Code Scanning</a></li>

</ul>
</details>

**标签**: `#github`, `#code-quality`, `#agentic-ai`, `#automation`, `#devtools`

---

<a id="item-7"></a>
## [Suno 推出仅用授权音乐训练的 v6 模型，应对版权诉讼](https://techcrunch.com/2026/09/09/suno-replaces-its-ai-models-with-a-new-one-trained-on-licensed-music-as-copyright-suits-pile-up/) ⭐️ 5.0/10

Suno 发布了 Suno v6，并声称新模型仅使用获得授权的音乐进行训练，而此前版本的训练数据正是多起版权诉讼的核心争议。这一变化发生在多家唱片公司和音乐出版商持续起诉该公司之际。 这是迄今最明确的信号之一：对于面临版权索赔的生成式 AI 公司，训练数据的授权正在成为实际必要条件。开发者和创作者可以关注这一转变如何影响输出质量，它也可能为其他 AI 音乐和媒体工具树立先例。 该声明仅为官方口径，训练语料和授权范围尚无独立验证，且 Suno 早前的模型仍是正在进行的诉讼对象。v6 的架构、数据集规模或授权合作方等技术细节均未公布。 读者可以试用 Suno v6 并与早期版本的输出质量进行对比，同时关注后续法院判决，看授权转变是否会影响过去模型的法律责任。

rss · TechCrunch · 9月9日 12:05

**背景**: Suno 是领先的 AI 音乐生成平台之一，用户可通过文字提示生成完整歌曲。2024 年，环球、华纳等主要唱片公司起诉 Suno（以及竞争对手 Udio），指控其模型未经许可使用受版权保护的录音进行训练。改用授权训练数据是其他 AI 公司（如与新闻机构和图库达成交易的厂商）为降低法律风险而采取的类似策略。

**标签**: `#AI`, `#copyright`, `#music-generation`, `#legal`, `#licensing`

---