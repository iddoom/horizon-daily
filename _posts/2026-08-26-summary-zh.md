---
layout: default
title: "Horizon Summary: 2026-08-26 (ZH)"
date: 2026-08-26
lang: zh
---

> 从 4 条内容中筛选出 2 条重要资讯。

---

1. [QUASAR 通过量化感知蒸馏发布全 NVFP4 量化的 Qwen3.8-27B](#item-1) ⭐️ 8.0/10
2. [汤森路透发布法律与税务专用模型 Thomson-1.0-Small](#item-2) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [QUASAR 通过量化感知蒸馏发布全 NVFP4 量化的 Qwen3.8-27B](https://www.reddit.com/r/LocalLLaMA/comments/1vyie86/fully_quantized_nvfp4_qwen3827b_with_quasar_qad/) ⭐️ 8.0/10

QUASAR 发布了 Qwen3.8-27B 的全 NVFP4（W4A4）量化检查点，使用其新的量化感知蒸馏（QAD）算法，以原始 BF16 模型为教师训练了 2,446 步。与通常将注意力层保留在 FP8/BF16 精度的 NVFP4 检查点不同，该模型包括注意力和 GDN 层在内的所有线性层都被量化到 4 比特，但仍保持接近 BF16 的性能，并可在 Blackwell GPU 上通过 vLLM 运行。 该检查点将模型从 55.6 GB 压缩到 19.7 GB，GPQA-Diamond 得分 0.9091（BF16 为 0.9141），AIME26 满分 1.0000，在精度和体积上均优于 unsloth 和 Inferact 的其他 NVFP4 版本。在 Blackwell 硬件上运行本地大模型的用户可以用约三分之一的内存占用获得几乎无损的质量，且有现成的 vLLM 命令可用。 量化和注意力与 GDN 层通常会导致显著的质量下降，这也是大多数 NVFP4 检查点将它们保留在高精度的原因；QUASAR 的 QAD 方法正是实现全 W4A4 量化且损失极小的关键。该模型在 vLLM 上支持 262,144 token 的上下文长度（gpu-memory-utilization 0.85），方法细节见 arXiv 论文（2608.13966）。 如果你有 Blackwell GPU，可以直接运行：vllm serve QUASAR-QAT/Qwen3.8-27B-QUASAR-NVFP4 --max-model-len 262144 --gpu-memory-utilization 0.85，并在自己的工作负载上与 BF16 原版进行对比测试。

reddit · r/LocalLLaMA · /u/arty_photography · 8月26日 01:04

**背景**: NVFP4 是 NVIDIA 的 4 比特浮点量化格式，由 Blackwell 代 Tensor Core 原生支持，相比 16 比特精度提供 2-3 倍的算术吞吐量和约四分之一的内存占用。训练后量化（PTQ）只是对已训练模型做校准，往往会损失精度，尤其是在敏感层上。量化感知蒸馏（QAD）则用全精度“教师”模型提供的软目标，通过 KL 散度损失重新训练量化后的“学生”模型，使其适应低精度环境，在校准不足之处恢复精度。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://developer.nvidia.com/blog/how-quantization-aware-training-enables-low-precision-accuracy-recovery/">How Quantization Aware Training Enables Low-Precision Accuracy Recovery | NVIDIA Technical Blog</a></li>
<li><a href="https://huggingface.co/docs/transformers/main/quantization/nvfp4">NVFP 4 · Hugging Face</a></li>
<li><a href="https://developer.nvidia.com/blog/introducing-nvfp4-for-efficient-and-accurate-low-precision-inference/">Introducing NVFP4 for Efficient and Accurate Low-Precision Inference | NVIDIA Technical Blog</a></li>

</ul>
</details>

**标签**: `#quantization`, `#NVFP4`, `#LLM`, `#vLLM`, `#open-source-models`

---

<a id="item-2"></a>
## [汤森路透发布法律与税务专用模型 Thomson-1.0-Small](https://www.reddit.com/r/LocalLLaMA/comments/1vyl6yj/thomson_reuters_releases_thomson10small_a_law_and/) ⭐️ 5.0/10

汤森路透发布了 Thomson-1.0-Small，这是一个专注于法律和税务任务的开源权重语言模型，现已在 Hugging Face 的 tri-fair-lab 组织下提供。该模型采用 35B 参数的混合专家（MoE）架构，激活参数约 3B，上下文窗口为 262,144 token，在其评测框架下的总体平均分为 74.6。 这是由大型法律信息公司专门为法律和税务工作构建的少数开源权重模型之一，为本地 LLM 用户提供了通用模型之外的领域专用选择。由于它是仅约 3B 激活参数的稀疏 MoE 模型，尽管总参数量大，仍可能在消费级硬件上运行。 据报道，该模型的训练成本仅为 4000 万美元，使用了汤森路透不到 10% 的法律数据，基于其收购的剑桥 AI 团队 Safe Sign 的工作。模型采用 Polyform Strict 1.0.0 许可证发布，这是一种带限制的源码可用许可，用户在商业使用前应仔细审查条款。 访问 Hugging Face 上的 tri-fair-lab/Thomson-1.0-Small 页面，查看模型卡、基准测试和 Polyform 许可条款，如果许可符合你的使用场景，可用 llama.cpp 或 vLLM 等支持 MoE 的推理框架在本地测试。

reddit · r/LocalLLaMA · /u/RedditUsr2 · 8月26日 03:10

**背景**: 汤森路透是全球最大的法律和税务信息提供商之一，Thomson 模型系列的首次部署是在 CoCounsel Legal 的 Tabular Analysis 功能中。混合专家（MoE）模型每个 token 只激活一小部分参数，因此 35B 总参数、3B 激活参数的模型能以低得多的推理成本提供大模型级的能力。领域专用模型通常在精选的专业语料上训练，在法律推理、引文处理和税务分析等任务上优于通用模型。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://huggingface.co/tri-fair-lab/Thomson-1.0-Small">tri-fair-lab/Thomson-1.0-Small · Hugging Face</a></li>
<li><a href="https://www.artificiallawyer.com/2026/08/24/tr-launches-thomson-1-0-its-own-llm/">TR Launches Thomson 1.0 – Its Own LLM – Artificial Lawyer</a></li>
<li><a href="https://ccleaks.com/news/thomson-reuters-thomson-1-0-small-hf-aug-2026">Thomson-1.0-Small: 35B MoE, 74.6 avg, on Hugging Face</a></li>

</ul>
</details>

**标签**: `#LLM`, `#domain-specific-models`, `#legal-tech`, `#local-llama`, `#model-release`

---