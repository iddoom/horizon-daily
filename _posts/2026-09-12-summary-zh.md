---
layout: default
title: "Horizon Summary: 2026-09-12 (ZH)"
date: 2026-09-12
lang: zh
---

> 从 10 条内容中筛选出 3 条重要资讯。

---

1. [克雷数学研究所就纳维-斯托克斯问题解决方案发表谨慎声明](#item-1) ⭐️ 7.0/10
2. [Perplexity 使用 GPT-6 Astra 实现端到端生产系统自主运行](#item-2) ⭐️ 7.0/10
3. [Reddit 指南：用富含人格设定的系统提示词让任意 LLM 表现得像真人，无需微调](#item-3) ⭐️ 5.0/10

---

<a id="item-1"></a>
## [克雷数学研究所就纳维-斯托克斯问题解决方案发表谨慎声明](https://www.claymath.org/news/navier-stokes-announcement/) ⭐️ 7.0/10

克雷数学研究所（CMI）就 OpenAI 宣布的纳维-斯托克斯解破裂证明发布了刻意中立的声明，指出其千禧年大奖规则要求成果先在同行评审期刊上正式发表，再经过两年的社区评审期，才可能考虑颁奖。由于 OpenAI 是将证明发布在自己的网站上而非合格期刊，两年的计时尚未开始。 这澄清了数学界最重大突破之一所涉及的机构验证流程，也凸显了 AI 生成证明的宣布与数学界正式认可之间的差距。这为人们理解重大科学奖项如何处理未经核实的高调声明提供了可借鉴的范例。 克雷研究所的规则要求在合格的同行评审期刊上发表；自行发布或 arXiv 预印本不算数，因此 OpenAI 在很长时间内不具备获奖资格——而且 OpenAI 自己也表示不会申领 100 万美元奖金。该证明（由约一万个 AI 代理生成并经 Lean 形式化的反例）尚未得到外部数学家验证，且与 Levent Alpöge 和 Tristan Buckmaster 就相关欧拉方程成果的优先权争议仍在进行中。 阅读克雷研究所官网的千禧年大奖规则（claymath.org/millennium-problems/rules/），准确了解什么样的成果才算合格提交；并持续关注 OpenAI 证明在同行评审和 Lean 形式化验证方面的进展，而不是将其视为已定论。

hackernews · rvz · 9月12日 04:09 · [社区讨论](https://news.ycombinator.com/item?id=49668706)

**背景**: 纳维-斯托克斯存在性与光滑性问题问的是：描述流体运动的基本偏微分方程——纳维-斯托克斯方程——的解在三维空间中是否总是保持光滑；该问题在 2000 年被克雷数学研究所列为七大千禧年大奖问题之一，每题奖金 100 万美元。2026 年 9 月 8 日，OpenAI 宣布证明这类解可能出现破裂，其方法建立在 Córdoba 和 Martínez-Zoroa 于 2023 年提出的爆破方法之上。克雷研究所 2018 年修订的规则刻意放缓流程：解必须在期刊发表后至少经受两年的审查才能获奖，这是从庞加莱猜想（迄今唯一被解决的千禧年问题）的风波中吸取的教训。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://en.wikipedia.org/wiki/Navier-Stokes_existence_and_smoothness_problem">Navier-Stokes existence and smoothness problem</a></li>
<li><a href="https://www.claymath.org/millennium-problems/rules/">Rules for the Millennium Prize Problems - Clay Mathematics ...</a></li>
<li><a href="https://en.wikipedia.org/wiki/Millennium_Prize_Problems">Millennium Prize Problems - Wikipedia</a></li>

</ul>
</details>

**社区讨论**: 评论者普遍认为克雷研究所的声明刻意保持中立——全文没有提及 OpenAI 的名字，且“似乎已被解决”中的“似乎”一词被指出分量很重。多位评论者指出，发表后两年的等待规则意味着 OpenAI 距离获奖资格还很遥远，因为其证明是自行发布的；而 swyx 则将声明解读为在概念上启动了评审计时，同时克雷研究所避免在优先权争议和菲尔兹奖得主公开信问题上表态。

**标签**: `#mathematics`, `#AI research`, `#Navier-Stokes`, `#Millennium Prize`, `#OpenAI`

---

<a id="item-2"></a>
## [Perplexity 使用 GPT-6 Astra 实现端到端生产系统自主运行](https://openai.com/index/perplexity-improving-accuracy-with-astra) ⭐️ 7.0/10

Perplexity 报告称正在使用 OpenAI 的 GPT-6 Astra 自主撰写对外沟通内容、修改软件并监控生产系统。值得注意的是，与早期模型相比，Perplexity 需要人工介入检查的频率大大降低。 这是一个 AI 智能体在生产环境中端到端管理高风险工作流(代码修改、生产监控)且人工监督减少的真实案例，反映了自主性信任门槛正在快速提升。正在评估 AI 智能体的团队可以将其作为参考，了解前沿模型在生产中被信任执行无监督任务的程度。 该公告属于厂商案例研究,带有宣传性质,缺少诸如防护机制、失败率或回滚机制等实现细节。OpenAI 将 Astra 描述为其首个达到“关键(Critical)”网络安全阈值的模型,并在高能力工作流周围部署了额外防护措施,这是将其信任用于生产环境访问的重要背景。 阅读 OpenAI 官网上的完整案例研究,了解 Perplexity 具体委派了哪些任务以及采用了怎样的监督频率,然后将这些与你自己部署智能体时的检查点和升级策略进行对照。

rss · OpenAI Blog · 9月14日 00:00

**背景**: GPT-6 Astra 是 OpenAI 的前沿智能体模型,其设计目标不仅是回答问题,更是执行任务:它将目标分解为多个步骤,像人一样使用工具和浏览器,自我检查工作成果并从错误中恢复。将这类智能体部署到生产环境会引发经典的“监督悖论”:过多的人工检查会抵消效率收益,而过少则可能导致静默失败或破坏性的自动化操作。关于信任校准和动态干预框架(例如随任务展开调整人工参与度的架构)的研究,正是为解决企业部署中的这一矛盾而兴起的活跃领域。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://happycapy.ai/models/gpt-6-astra">GPT - 6 Astra on Happycapy | OpenAI frontier agentic model</a></li>
<li><a href="https://www.cometapi.com/gpt-6-astra-vs-claude-fable-5-1/">GPT - 6 Astra vs Claude Fable 5.1: Which Frontier Model Is... - CometAPI</a></li>
<li><a href="https://link.springer.com/article/10.1007/s44163-026-01373-2">Balancing autonomy and oversight in reliable agentic ...</a></li>

</ul>
</details>

**标签**: `#AI agents`, `#automation`, `#case study`, `#OpenAI`, `#production systems`

---

<a id="item-3"></a>
## [Reddit 指南：用富含人格设定的系统提示词让任意 LLM 表现得像真人，无需微调](https://www.reddit.com/r/LocalLLaMA/comments/1we2rp2/concerning_humanlike_models_and_chatbot_rp_in/) ⭐️ 5.0/10

r/LocalLLaMA 上的一篇帖子给出了一个具体方法，仅用系统提示词就能把大多数现成 LLM 变成有说服力的“拟人”聊天对象，并指出像“humanlike Qwen”这类流行的微调模型并非必需。该方法结合了人物传记、少样本问答示例、明确界定的对话模式、性格特质描述以及技术性约束。 它向本地运行模型爱好者展示了如何通过提示词工程免费获得丰富的角色扮演和人格化聊天行为，无需下载专门的微调模型或自己训练。诸如在示例对话中填充模型会当作事实采纳的一致信息等技巧，可直接复用于 SillyTavern 类工具或自定义聊天机器人项目。 值得注意的细节包括：示例中的角色标签对某些模型有帮助、对另一些则无所谓；在抑制冗长的助手式回答时，必须清楚陈述正向目标而不要生动描述你想避免的行为，否则可能用不想要的想法“污染”模型注意力。帖子还建议将表情符号列表标注为“最喜欢的表情”，因为积极措辞能让模型更牢固地采纳，并可将传记事实注入性格指令中加以放大。 选一个你正在运行的本地模型，按照帖子给出的结构构建人格系统提示词：简短生平、5-10 组包含一致事实的问答示例、精确定义的“短消息闲聊”模式，以及带小标题的性格段落——然后不断迭代直到人格声音稳定为止。

reddit · r/LocalLLaMA · /u/BestGirlAhagonUmiko · 9月12日 04:36

**背景**: 系统提示词是置于用户输入之前的常设指令，为整个对话设定 LLM 的运行上下文、语气和行为，被普遍认为是提升本地 LLM 输出效果成本最低的手段。角色提示（即告诉模型“你是 X”）是一种成熟的提示词工程技术，但研究表明在需要专业领域知识的任务上，它并不总能匹敌微调模型。这篇帖子的起因是 Qwen 模型的社区“拟人”微调版本在专注本地运行 LLM 的 r/LocalLLaMA 版块走红。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://promptengineering.org/system-prompts-in-large-language-models/">System Prompts for LLMs: Definition and Examples</a></li>
<li><a href="https://learnprompting.org/docs/advanced/zero_shot/role_prompting">Role Prompting: Guide LLMs with Persona-Based Tasks</a></li>
<li><a href="https://llmconfigurator.com/en/guides/system-prompts-local-llm">System Prompts 101: Get Better Answers From Your Local LLM | Local AI Guide | LLM Configurator</a></li>

</ul>
</details>

**标签**: `#LLM`, `#prompt-engineering`, `#chatbots`, `#roleplay`, `#LocalLLaMA`

---