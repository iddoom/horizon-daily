---
layout: default
title: "Horizon Summary: 2026-08-12 (ZH)"
date: 2026-08-12
lang: zh
---

> 从 10 条内容中筛选出 2 条重要资讯。

---

1. [OpenAI Python SDK v3.0.0 将默认 HTTP 客户端迁移至 HTTPX2](#item-1) ⭐️ 8.0/10
2. [承诺“100%纯人工撰写、绝不用 AI”的医学研究公司，实为 100%由 AI 生成](#item-2) ⭐️ 7.0/10

---

<a id="item-1"></a>
## [OpenAI Python SDK v3.0.0 将默认 HTTP 客户端迁移至 HTTPX2](https://github.com/openai/openai-python/releases/tag/v3.0.0) ⭐️ 8.0/10

OpenAI 于 2026 年 8 月 12 日发布了官方 Python SDK 的 3.0.0 版本，将 HTTPX2 设为默认 HTTP 客户端，并不再自动安装原有的 httpx 包。这是一项破坏性变更，所有使用自定义 HTTPX 客户端、传输层或配置对象的应用都必须迁移到 HTTPX2 的等效替代方案，或使用临时的旧版兼容机制。 作为无数 Python 应用调用 OpenAI API 所依赖的官方 SDK，此次大版本更新将迫使开发者主动修改代码，否则将面临运行时错误。这一转变也标志着 HTTPX2 这一由 Pydantic Services 维护的新一代 HTTP 客户端正被业界广泛采纳，为 Python HTTP 生态系统带来了改进。 标准的 httpx 包不再作为依赖项自动安装，这意味着现有的自定义 HTTPX 配置在没有手动干预的情况下将无法正常工作。开发者可以使用临时的、仅限运行时的旧版 HTTPX 兼容方案来应对短期需求，但项目方已提供专门的 HTTPX2 迁移指南以帮助完成正式过渡。

github · openai-sdks[bot] · 8月12日 01:54

**背景**: HTTPX 一直是一款广受欢迎且功能丰富的 Python HTTP 客户端库，同时支持同步和异步请求。2026 年，Pydantic Services 以 HTTPX2 的新名称接管了该项目的维护工作，标志着该库的发展迈出了重要一步。OpenAI Python SDK 依赖底层的 HTTP 客户端来处理所有 REST API 通信，因此从 httpx 到 HTTPX2 的过渡是该项目一次基础性的架构变更。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://github.com/pydantic/httpx2">GitHub - pydantic/httpx2: A next generation HTTP client for Python. 🦋</a></li>
<li><a href="https://manueltgomes.com/python/pydantic-httpx2-whats-new-and-how-to-take-proper-advantage-of-it/">Pydantic & HTTPX2: What's New and How to Use It</a></li>
<li><a href="https://github.com/openai/openai-python">GitHub - openai/ openai - python : The official Python library for the...</a></li>

</ul>
</details>

**标签**: `#python`, `#openai`, `#breaking-changes`, `#httpx`, `#sdk`

---

<a id="item-2"></a>
## [承诺“100%纯人工撰写、绝不用 AI”的医学研究公司，实为 100%由 AI 生成](https://www.404media.co/company-offering-100-human-written-never-ai-peer-review-is-entirely-ai/) ⭐️ 7.0/10

一份调查报告揭露，一家保证提供“100%纯人工撰写”医学同行评审研究的公司，其内容实际上完全是由 AI 生成的。

hackernews · Anon84 · 8月12日 02:05 · [社区讨论](https://news.ycombinator.com/item?id=49267057)

**标签**: `#AI`, `#Academic-Fraud`, `#Ethics`, `#Industry-News`

---