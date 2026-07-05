---
layout: default
title: "Horizon Summary: 2026-07-05 (ZH)"
date: 2026-07-05
lang: zh
---

> 从 20 条内容中筛选出 2 条重要资讯。

---

1. [OpenAI 发布面向 Anthropic Claude Code 的 Codex 插件](#item-1) ⭐️ 7.0/10
2. [集中收集主流 AI 模型泄露系统提示词的 GitHub 仓库](#item-2) ⭐️ 7.0/10

---

<a id="item-1"></a>
## [OpenAI 发布面向 Anthropic Claude Code 的 Codex 插件](https://github.com/openai/codex-plugin-cc) ⭐️ 7.0/10

OpenAI 发布了一款名为 codex-plugin-cc 的开源 JavaScript 插件，允许开发者直接在 Anthropic 的 Claude Code 环境中调用 OpenAI 的 Codex AI 编程助手。该仓库在过去 24 小时内获得了 55 颗星，反映出业界对这种跨平台集成的浓厚兴趣。 该插件将 OpenAI 的 Codex 和 Anthropic 的 Claude Code 这两大顶级 AI 编程助手连接起来，使开发者能够在单一工作流中发挥各自模型的优势。这标志着 AI 开发工具正朝着可互操作的多模型方向演进，而非被单一供应商绑定，这可能会从根本上改变工程团队构建 AI 辅助工作流的方式。 该插件使用 JavaScript 编写，目前规模较小，仅有 1 个开放的 Pull Request 和 2 个 Fork。它专门支持将代码审查和其他工程任务从 Claude Code 委托给 Codex，充当两个独立 AI 代理生态系统之间的桥梁层。

ossinsight · openai · 7月5日 12:59

**背景**: OpenAI Codex 是一套由 AI 驱动的编程代理，旨在自动化实现功能、审查代码等软件工程任务。Claude Code 是 Anthropic 推出的智能编程系统，它在开发者现有环境中运行，使用开发者的工具，同时由人类决定最终发布哪些代码。这两款工具传统上一直在各自的生态系统中运行，因此这种跨模型集成标志着对常规的一次重大突破。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://grokipedia.com/page/OpenAI_Codex">OpenAI Codex</a></li>
<li><a href="https://www.anthropic.com/product/claude-code">Claude Code | Anthropic's agentic coding system \ Anthropic</a></li>

</ul>
</details>

**标签**: `#AI`, `#Developer Tools`, `#OpenAI`, `#Claude`, `#LLM`

---

<a id="item-2"></a>
## [集中收集主流 AI 模型泄露系统提示词的 GitHub 仓库](https://github.com/asgeirtj/system_prompts_leaks) ⭐️ 7.0/10

GitHub 仓库 'asgeirtj/system_prompts_leaks' 近期获得了大量关注，在过去 24 小时内新增 49 颗星，该仓库定期更新并整理从各大 AI 产品中提取的系统提示词。该仓库涵盖了 Anthropic 的 Claude、OpenAI 的 ChatGPT 和 Codex、Google 的 Gemini、xAI 的 Grok，以及 Cursor、Copilot、VS Code 和 Perplexity 等开发者工具的提示词。 该仓库为 AI/ML 工程师和研究人员提供了一个集中化的资源，使他们能够获取控制主流 AI 模型行为、输出格式和安全防护机制的核心指令。通过研究这些生产级别的提示词，开发者可以深入了解提示词工程领域的行业最佳实践，并将这些技巧应用于改进自己的 LLM 应用。 该仓库使用 JavaScript 构建，按公司和产品分类整理提示词，涵盖了面向消费者的聊天机器人和面向开发者的编程工具。这些提示词是通过各种逆向工程技术提取的，而非由各公司官方发布。

ossinsight · asgeirtj · 7月5日 12:59

**背景**: 系统提示词是在任何用户交互之前输入给 AI 模型的一组隐藏指令，用于定义模型的整体行为、角色、安全边界和输出格式规则。用户提示词是用户输入的可见消息，而系统提示词则在后台无形地运行，塑造每一次回复。逆向提示词工程（RPE）是一种通过迭代优化、提示词攻击或分析客户端与服务器的通信来提取或重构这些隐藏系统提示词的技术。由于商业 LLM 提供商不会公开披露其系统提示词，因此此类仓库已成为了解生产级 AI 系统配置方式的宝贵资源。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://blog.promptlayer.com/system-prompt-vs-user-prompt-a-comprehensive-guide-for-ai-prompts/">System Prompt vs User Prompt in AI: What's the difference?</a></li>
<li><a href="https://learnprompting.org/docs/language-model-inversion/reverse-prompt-engineering">Reverse Prompt Engineering (RPE)</a></li>
<li><a href="https://medium.com/@david.p.lemon79/system-prompts-explained-how-ai-models-actually-work-behind-the-scenes-2265f14e3eba">System Prompts Explained: How AI Models Actually ... - Medium</a></li>

</ul>
</details>

**标签**: `#AI/ML`, `#System Prompts`, `#Prompt Engineering`, `#LLM`, `#Reverse Engineering`

---