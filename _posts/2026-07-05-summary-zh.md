---
layout: default
title: "Horizon Summary: 2026-07-05 (ZH)"
date: 2026-07-05
lang: zh
---

> 从 30 条内容中筛选出 3 条重要资讯。

---

1. [亚马逊将停止接受 Mechanical Turk 的新客户](#item-1) ⭐️ 8.0/10
2. [asgeirtj/system_prompts_leaks（过去 24 小时新增 49 星）](#item-2) ⭐️ 8.0/10
3. [Meetily：基于 Rust 的开源隐私优先本地 AI 会议助手](#item-3) ⭐️ 7.0/10

---

<a id="item-1"></a>
## [亚马逊将停止接受 Mechanical Turk 的新客户](https://techcrunch.com/2026/07/05/amazon-will-stop-accepting-new-customers-for-mechanical-turk/) ⭐️ 8.0/10

据报道，亚马逊将停止其长期运营的众包平台 Mechanical Turk（MTurk）接受新客户注册，这标志着这一先驱平台可能即将关闭。此举实际上对新需求方关闭了服务，但现有客户在过渡期内可能仍可使用。 近二十年来，MTurk 一直是 AI/ML 数据标注、学术行为研究和人在回路工作流的基础设施，其关闭标志着一个重要的转折点。这一决定反映了由专业数据标注平台的兴起以及 AI 生成的合成数据日益取代传统众包模式所驱动的更广泛行业转变。 MTurk 由 Amazon Web Services（AWS）运营，允许被称为需求方的企业和研究人员发布计算机尚无法经济高效地完成的人类智能任务（HIT）。该平台以 18 世纪的机械国际象棋机幻术命名，并支持来自数十个获批国家的工作者。

rss · TechCrunch · 7月5日 17:43

**背景**: Amazon Mechanical Turk 于 2005 年推出，是一个众包市场，将需要完成人类智能任务的企业与分布式的全球劳动力连接起来。需求方可以通过开放 API 发布图像识别、内容审核、问卷调查或数据标注等任务，而工作者（俗称 Turkers）则通过完成这些微任务获得小额报酬。该平台对机器学习生态系统尤为关键，提供了经济实惠的大规模数据标注，支撑了整个行业的模型训练。它也成为学术研究的常用工具，特别是在心理学和行为科学领域，用于快速招募多样化的研究参与者。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Amazon_Mechanical_Turk">Amazon Mechanical Turk</a></li>
<li><a href="https://www.mturk.com/">Amazon Mechanical Turk</a></li>
<li><a href="https://en.wikipedia.org/wiki/Data_annotation">Data annotation</a></li>

</ul>
</details>

**标签**: `#amazon`, `#mechanical-turk`, `#crowdsourcing`, `#data-annotation`, `#industry-news`

---

<a id="item-2"></a>
## [asgeirtj/system_prompts_leaks（过去 24 小时新增 49 星）](https://github.com/asgeirtj/system_prompts_leaks) ⭐️ 8.0/10

这是一个精心整理并定期更新的 GitHub 仓库，收集了从众多知名 AI 模型和编程助手中提取的系统提示词。

ossinsight · asgeirtj · 7月5日 18:53

**标签**: `#system-prompts`, `#prompt-engineering`, `#llm`, `#ai-security`, `#reverse-engineering`

---

<a id="item-3"></a>
## [Meetily：基于 Rust 的开源隐私优先本地 AI 会议助手](https://github.com/Zackriya-Solutions/meetily) ⭐️ 7.0/10

由 Zackriya Solutions 使用 Rust 构建的开源 AI 会议助手 Meetily 正在 GitHub 上获得大量关注，它能够实现 100% 的本地实时转录和摘要。该项目利用 NVIDIA 的 Parakeet 和 OpenAI 的 Whisper 模型进行带有说话人分离的语音转文字，并结合 Ollama 进行设备端的 LLM 摘要生成，全程无需任何云端连接。 该项目满足了市场对商业云端会议助手（如 Otter.ai 或 Fireflies）的隐私保护替代方案日益增长的需求。通过完全在 macOS 和 Windows 上本地运行，Meetily 确保了敏感的会议音频和记录永远不会离开用户的设备，这对于受监管行业的合规性至关重要。 Meetily 使用 Rust 编写，以实现高性能和内存安全，号称实时转录速度提升了 4 倍。它将自动语音识别（ASR）与说话人分离（即根据说话人身份对音频进行分段的过程）相结合，并通过 Ollama 使用本地 LLM 来生成最终摘要。

ossinsight · Zackriya-Solutions · 7月5日 18:53

**背景**: 说话人分离是会议转录中的一项核心技术，它通过根据说话人身份将音频流分割为同质片段，从而解决“谁在何时发言”的问题。Ollama 是一款广受欢迎的开源工具，能够简化在消费级硬件上本地运行大型语言模型的过程，为 Meetily 等工具提供隐私保护和离线能力。NVIDIA 的 Parakeet 则是一系列以高吞吐量和精准转录著称的、最先进的自动语音识别模型。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Speaker_diarisation">Speaker diarisation</a></li>
<li><a href="https://dev.to/ajitkumar/the-complete-guide-to-ollama-run-large-language-models-locally-2mge">The Complete Guide to Ollama: Run Large Language Models Locally - DEV Community</a></li>
<li><a href="https://developer.nvidia.com/blog/pushing-the-boundaries-of-speech-recognition-with-nemo-parakeet-asr-models/">Pushing the Boundaries of Speech Recognition with NVIDIA NeMo Parakeet ASR Models | NVIDIA Technical Blog</a></li>

</ul>
</details>

**标签**: `#rust`, `#local-ai`, `#speech-to-text`, `#privacy`, `#ollama`

---