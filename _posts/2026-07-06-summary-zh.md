---
layout: default
title: "Horizon Summary: 2026-07-06 (ZH)"
date: 2026-07-06
lang: zh
---

> 从 22 条内容中筛选出 2 条重要资讯。

---

1. [收集主流 AI 模型泄露系统提示词的仓库走红](#item-1) ⭐️ 7.0/10
2. [LangChain 发布 OpenWiki：面向代码库文档的 AI Agent 命令行工具](#item-2) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [收集主流 AI 模型泄露系统提示词的仓库走红](https://github.com/asgeirtj/system_prompts_leaks) ⭐️ 7.0/10

GitHub 仓库'asgeirtj/system_prompts_leaks'在过去 24 小时内获得了 49 颗星标，该仓库专门收集和整理从主流 AI 模型及工具中提取的系统提示词。该仓库涵盖了来自 ChatGPT、Claude、Gemini、Grok、Cursor、Copilot、VS Code、Perplexity 等工具的提示词，并随着新提示词的发现而定期更新。 该仓库为 AI 工程师和研究人员提供了集中访问主流 AI 模型隐藏指令的途径，揭示了各公司如何实现安全防护、能力边界和行为规则。它为提示词工程最佳实践提供了有价值的参考，并让外界得以罕见地了解大型科技公司所采用的对齐策略。 该仓库使用 JavaScript 编写，包含了从多种产品中提取的系统提示词，涵盖 Anthropic 的 Claude 系列、OpenAI 的 ChatGPT 和 Codex、Google 的 Gemini 模型、xAI 的 Grok，以及 Cursor 和 VS Code 等开发工具。这些提示词通常通过提示词注入技术或其他方法提取，诱导模型暴露其初始指令。

ossinsight · asgeirtj · 7月6日 01:31

**背景**: 系统提示词是在任何用户交互之前提供给大语言模型的一组隐藏指令，用于定义模型的角色、行为规则、安全约束和响应格式。与用户可见的消息不同，系统提示词通常被 AI 公司隐藏，以防止被操纵并保护专有的对齐技术。研究人员和开发者一直希望获取这些提示词，以了解主流模型的引导方式，由此催生了能够绕过这些隐藏措施的提取技术。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://medium.com/@david.p.lemon79/system-prompts-explained-how-ai-models-actually-work-behind-the-scenes-2265f14e3eba">System Prompts Explained: How AI Models Actually Work Behind ... - Medium</a></li>
<li><a href="https://promptengineering.org/system-prompts-in-large-language-models/">System Prompts in Large Language Models - Prompt Engineering</a></li>

</ul>
</details>

**标签**: `#system-prompts`, `#prompt-engineering`, `#llm`, `#ai-security`, `#resources`

---

<a id="item-2"></a>
## [LangChain 发布 OpenWiki：面向代码库文档的 AI Agent 命令行工具](https://github.com/langchain-ai/openwiki) ⭐️ 6.0/10

LangChain 推出了 OpenWiki，这是一个基于 TypeScript 的命令行界面（CLI）工具，利用 AI Agent 自动为代码库编写和维护文档。这个新发布的开源项目迅速获得了关注，在过去 24 小时内在 GitHub 上新增了 71 颗星。 该工具通过自动化代码库文档的创建和维护，解决了软件开发中一个持续的痛点，因为开发者往往忽视文档维护。在 LangChain 的 AI Agent 编排专业能力的支持下，OpenWiki 标志着行业正朝着使用自主 Agent 来简化开发工作流程和提高代码可维护性的更广泛转变。 OpenWiki 使用 TypeScript 构建并作为 CLI 运行，允许其轻松集成到现有的开发流水线和持续集成工作流中。虽然它使用 AI Agent 主动生成文档，但用户仍应审查输出内容，以确保复杂代码库的技术准确性和上下文相关性。

ossinsight · langchain-ai · 7月6日 01:31

**背景**: LangChain 是一个著名的开源框架，专为构建由大型语言模型（LLM）和自主 AI Agent 驱动的应用程序而设计。它为开发者提供了预构建的架构和集成功能，以将 AI 模型与外部工具、数据库和复杂逻辑无缝连接。通过利用这些 Agent 编排能力，开发者可以创建能够自主执行多步骤任务的 AI 系统，例如分析软件存储库并生成上下文文档。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.langchain.com/langchain">LangChain: Open Source AI Agent Framework | Build Agents Faster</a></li>
<li><a href="https://github.com/langchain-ai/langchain">GitHub - langchain-ai/langchain: The agent engineering platform. · GitHub</a></li>

</ul>
</details>

**标签**: `#ai-agents`, `#documentation`, `#developer-tools`, `#langchain`, `#cli`

---