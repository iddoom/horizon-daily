---
layout: default
title: "Horizon Summary: 2026-09-10 (ZH)"
date: 2026-09-10
lang: zh
---

> 从 27 条内容中筛选出 2 条重要资讯。

---

1. [DeepSeek 发布 V4.1 Flash（552B 参数）并附详细技术报告](#item-1) ⭐️ 8.0/10
2. [Reddit 分析：DeepSeek V4.1 Flash 实际参数量为 748B](#item-2) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [DeepSeek 发布 V4.1 Flash（552B 参数）并附详细技术报告](https://twitter.com/deepseek_ai/status/2097930608790167907) ⭐️ 8.0/10

DeepSeek 在 HuggingFace 上发布了视觉-语言 MoE 模型 DeepSeek-V4.1-Flash，总参数约 552B（HN 讨论所述；vLLM recipes 列为 522B，每个输入 token 激活 8B），并附带一份细节异常丰富的技术报告。其规模约为上一代 V4 Flash（284B）的两倍，基准测试成绩显著提升，其中 Cyberbench 表现尤为突出。 作为附带透明工程报告的开放权重发布，它为研究者和从业者提供了可复用的架构思路，而不仅是营销宣传。但规模近乎翻倍，使其在许多消费级硬件上难以本地部署，这是关键的实用考量。 该模型采用两层稀疏注意力机制，包含 40 层 transformer（隐藏维度 5120）、一个 32 层 ViT 加对齐模块以实现原生视觉理解，每个输出 token 激活约 16B 参数，推理速度很快（测试构建据报可达约 400 tokens/秒）。评论者指出，权重超过约 470B 意味着在 Strix Halo 等 2x128GB 统一内存机器上需要低于 4-bit 的量化才能装下。 从 HuggingFace 页面（huggingface.co/deepseek-ai/DeepSeek-V4.1-Flash）下载权重和技术报告，并通过 vLLM 在你的实际任务上做评测；注意超过约 470B 的权重意味着需要规划多 GPU 部署或激进量化。

hackernews · Liwink · 9月10日 06:11 · [社区讨论](https://news.ycombinator.com/item?id=49639090)

**背景**: DeepSeek 是一家以开放权重发布著称的中国 AI 实验室，其技术报告会披露西方实验室通常保密的训练与架构细节。"开放权重"指训练好的模型参数可公开下载，可在本地运行或微调。前几代中 "Flash" 代表旗舰模型中更小、更易部署的版本；MoE（混合专家）架构则通过每个 token 只激活一小部分参数，在总规模很大的同时降低计算成本。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://recipes.vllm.ai/deepseek-ai/DeepSeek-V4.1-Flash">deepseek-ai/DeepSeek-V4.1-Flash | vLLM Recipes - recipes.vllm.ai</a></li>
<li><a href="https://www.deepseek.com/en/news/deepseek-v4-1-flash/">Introducing DeepSeek-V4.1-Flash: smarter, faster, more efficient.</a></li>
<li><a href="https://www.ai21.com/glossary/foundational-llm/open-weights-model/">What is an Open-Weights Model? | AI21</a></li>

</ul>
</details>

**社区讨论**: 评论者称赞 DeepSeek 技术报告细节丰富、敢于在前沿规模上尝试新想法，并与西方实验室以安全为主的系统卡形成鲜明对比。担忧主要集中在 552B 的翻倍规模使本地部署更困难（超过 2x128GB 机器约 470B 的现实上限，需要低于 4-bit 量化），以及基准提升是否代表真实性能，不过大家也认可 DeepSeek 一贯的可信度。

**标签**: `#AI models`, `#DeepSeek`, `#open-weights`, `#LLM release`, `#HuggingFace`

---

<a id="item-2"></a>
## [Reddit 分析：DeepSeek V4.1 Flash 实际参数量为 748B](https://www.reddit.com/r/LocalLLaMA/comments/1wcd4rx/deepseek_v41_flash_is_748b_not_552b/) ⭐️ 6.0/10

一位 Reddit 用户检查了 HuggingFace 上的 safetensors 文件，发现 DeepSeek V4.1 Flash 总参数量约为 748B：主模型 551.5B（其中 FFN 专家 543.6B，注意力/共享专家等约 8B），外加约 197B 的 engram、约 14B 的 MTP 和约 0.5B 的视觉编码器。HuggingFace 标注的 485B 偏小，因为它把 FP4 打包权重按字节数而非参数个数统计（每字节包含 2 个 FP4 参数）。 任何想在本地运行该模型的人都需要准确的参数量来估算显存/内存需求，约 748B 的总规模意味着 128GB 甚至 256GB 的 RAM/VRAM 都不够用。这也提醒大家：对于 FP4 量化的模型，不能直接采信 HuggingFace 页面上标注的参数规模。 主模型共 40 层，参数绝大部分来自 FFN 专家（551.57B 中的 543.58B），而视觉编码器出乎意料地小（约 0.485B）。engram、MTP（多 token 预测）和视觉组件在技术上属于检查点中的可选部分。 如果你想在本地运行该模型，请按约 748B 的真实参数量（再加 KV 缓存）来规划内存；对于 FP4 模型，先自行检查 safetensors 中的张量形状，不要轻信页面上标注的参数量。

reddit · r/LocalLLaMA · /u/DistanceSolar1449 · 9月10日 08:27

**背景**: safetensors 是一种安全且快速的张量存储格式，常用于保存模型检查点，通过查看其中张量的形状即可精确计算参数量。FP4 量化会把两个 4-bit 数值打包进一个字节，因此基于文件字节数的统计得到的参数量只有实际数量的一半。MTP（多 token 预测）由 DeepSeek-V3 引入，通过辅助预测头一次预测多个未来 token，并可通过投机解码加速推理。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/docs/safetensors/en/index">Safetensors · Hugging Face</a></li>
<li><a href="https://huggingface.co/deepseek-ai/DeepSeek-V3">deepseek -ai/ DeepSeek -V3 · Hugging Face</a></li>
<li><a href="https://tensara.org/problems/nvfp4-quantize">NVFP 4 Quantization | Tensara</a></li>

</ul>
</details>

**标签**: `#deepseek`, `#llm`, `#model-architecture`, `#local-inference`, `#parameter-count`

---