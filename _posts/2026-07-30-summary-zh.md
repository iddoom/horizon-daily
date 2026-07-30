---
layout: default
title: "Horizon Summary: 2026-07-30 (ZH)"
date: 2026-07-30
lang: zh
---

> 从 18 条内容中筛选出 4 条重要资讯。

---

1. [研究人员揭示大语言模型无法被完全防御的根本性缺陷](#item-1) ⭐️ 9.0/10
2. [Zoox 获联邦豁免，即将推出付费无人驾驶出租车服务](#item-2) ⭐️ 8.0/10
3. [OpenAI 黑客事件后，特朗普正考虑实施 AI 管控](#item-3) ⭐️ 7.0/10
4. [Google 将于年底前在全球 Android 设备上扩展年龄验证](#item-4) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [研究人员揭示大语言模型无法被完全防御的根本性缺陷](https://www.technologyreview.com/2026/07/30/1140927/a-fundamental-flaw-leaves-llms-vulnerable-to-attack/) ⭐️ 9.0/10

一个研究团队在国际机器学习大会（ICML）上发表论文指出，大语言模型运作方式中存在一个根本性缺陷，使得对其进行完全安全防护以抵御对抗性攻击成为不可能。这一发现挑战了目前的主流假设，即足够先进的训练或对齐技术最终能够消除这些漏洞。 这项研究对 AI 安全以及在安全关键环境中部署基于大语言模型的系统具有重大影响，表明当前的防御策略可能存在固有的局限性。它向行业发出信号：保障 AI 应用的安全可能需要从根本上全新的架构设计，而非渐进式的修补。 该漏洞源于大语言模型处理和生成文本的根本方式，这种机制本质上允许对抗性输入通过精心构造的提示词或扰动来操纵模型行为。这些对抗性攻击可以诱导模型生成有害内容、泄露私有训练数据，或绕过已建立的安全防护机制。

rss · MIT Technology Review · 7月30日 10:15

**背景**: 针对机器学习模型的对抗性攻击是指通过操纵输入来导致模型犯错或产生异常行为。在大语言模型的语境下，这些攻击通常以提示词注入或细微的文本扰动形式出现，旨在绕过安全过滤器。研究人员一直在系统地研究这些漏洞，根据攻击媒介对其进行分类并探索防御机制，尽管完全消除这些威胁仍然难以实现。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://link.springer.com/chapter/10.1007/978-981-97-5501-1_7">Adversarial Attacks on Large Language Models - Springer</a></li>
<li><a href="https://arxiv.org/html/2505.01177v1">LLM Security: Vulnerabilities, Attacks, Defenses, and ...</a></li>

</ul>
</details>

**标签**: `#AI Safety`, `#LLMs`, `#Machine Learning`, `#Cybersecurity`, `#Adversarial Attacks`

---

<a id="item-2"></a>
## [Zoox 获联邦豁免，即将推出付费无人驾驶出租车服务](https://techcrunch.com/2026/07/30/zoox-clears-final-federal-hurdle-to-launch-paid-robotaxi-service/) ⭐️ 8.0/10

联邦安全监管机构已根据 Part 555 条款向 Zoox 授予临时豁免权，允许这家亚马逊旗下的公司正式向乘客收取其定制无人驾驶出租车的乘车费用。此举扫除了 Zoox 商业化无人驾驶网约车服务面临的最后一道联邦监管障碍。 这是自动驾驶行业的一个关键监管里程碑，因为这是美国首款没有方向盘或踏板等传统驾驶控制装置的专用无人驾驶出租车获准进行商业付费运营。此举为美国国家公路交通安全管理局（NHTSA）简化的豁免审批流程树立了先例，有望加速其他非常规自动驾驶车辆设计的落地部署。 该豁免是根据《美国联邦法规》第 49 篇第 555 部分（49 CFR Part 555）授予的，该条款允许 NHTSA 临时豁免车辆遵守那些与自动驾驶设计根本冲突的《联邦机动车安全标准》（FMVSS）。Zoox 的车辆采用了双向对称的“传感器优先”设计，彻底取消了传统的人类驾驶操作界面。

rss · TechCrunch · 7月30日 13:09

**背景**: 现行的《联邦机动车安全标准》（FMVSS）是基于人类驾驶员制定的，在法律上强制要求车辆配备方向盘、后视镜和脚踏板等部件，这使得专门设计的无人驾驶出租车在默认情况下无法合规。为解决这一问题，NHTSA 利用临时豁免程序（Part 555），允许少量偏离现行规则但配备了自动驾驶系统（ADS）的车辆进行商业化部署。被亚马逊收购的 Zoox 从零开始设计了一款纯粹为乘客（而非驾驶员）打造的车辆，这使其有别于 Waymo 等在传统乘用车基础上进行自动驾驶改装的竞争对手。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.ecfr.gov/current/title-49/subtitle-B/chapter-V/part-555">49 CFR Part 555 -- Temporary Exemption from Motor Vehicle ...</a></li>
<li><a href="https://www.nhtsa.gov/sites/nhtsa.gov/files/2025-06/part-555-letter-june-2025.pdf">Part 555 Letter | June 2025 - NHTSA</a></li>
<li><a href="https://arstechnica.com/cars/2026/04/start-with-the-sensors-then-design-the-rest-how-zoox-built-its-robotaxi/">Start with the sensors, then design the rest: How Zoox built its robotaxi</a></li>

</ul>
</details>

**标签**: `#autonomous-vehicles`, `#robotaxis`, `#zoox`, `#regulation`, `#transportation`

---

<a id="item-3"></a>
## [OpenAI 黑客事件后，特朗普正考虑实施 AI 管控](https://www.bbc.co.uk/news/articles/c20dppq3y90o?at_medium=RSS&at_campaign=rss) ⭐️ 7.0/10

据报道，继 OpenAI 近期发生黑客入侵事件后，特朗普政府正考虑实施人工智能管控措施。

rss · BBC World · 7月30日 07:23

**标签**: `#AI Policy`, `#AI Regulation`, `#OpenAI`, `#Cybersecurity`, `#Government`

---

<a id="item-4"></a>
## [Google 将于年底前在全球 Android 设备上扩展年龄验证](https://android-developers.googleblog.com/2026/07/google-play-age-signals-api-safer-experiences.html) ⭐️ 6.0/10

Google 宣布将于年底前利用全新的 Play Age Signals API 在全球范围内的 Android 设备上扩展年龄验证。该 API 将年龄共享控制集中在 Google Family Link 应用中，允许家长选择性地将孩子的年龄段信息分享给所有集成了该 API 的 Play 应用。 这一政策变化将从根本上影响全球 Android 开发者处理适龄内容分发的方式，在整个生态系统中创建标准化的年龄验证方案。但同时也引发了重大的隐私担忧，用户和社区成员担心集中式的年龄验证可能导致强制账户创建，并进一步巩固 Google 的平台垄断地位。 Play Age Signals API 目前处于测试阶段，支持运行 Android 6.0（API 级别 23）及更高版本的手机、折叠屏设备和平板电脑。开发者可以通过 'com.google.android.play:age-signals:0.0.3' 库进行集成，若将该 API 用于禁止用途，可能导致 API 访问权限被终止以及应用从 Google Play 下架。

hackernews · dmantis · 7月30日 10:13 · [社区讨论](https://news.ycombinator.com/item?id=49107950)

**背景**: 数字平台上的年龄验证已成为全球日益关注的监管焦点，各国政府正推动科技公司保护未成年人免受不当内容的影响。传统的年龄验证方法通常涉及收集官方身份证件、扫描文件或使用生物识别比对，这些都引发了隐私方面的担忧。Google 的 Play Age Signals API 方案试图通过 Family Link 中的家长控制功能提供一种更注重隐私的替代方案，而非要求用户直接上传身份证件。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://developer.android.com/google/play/age-signals/overview">Play Age Signals overview | Android Developers</a></li>
<li><a href="https://developer.android.google.cn/google/play/age-signals/v3/use-age-signals-api">Use Play Age Signals API (beta) | V3 | Android Developers</a></li>
<li><a href="https://android-developers.googleblog.com/2026/07/google-play-age-signals-api-safer-experiences.html">Android Developers Blog: Delivering safer, age -appropriate...</a></li>

</ul>
</details>

**社区讨论**: 社区情绪总体上持怀疑态度，用户对年龄验证表示根本性的反对，担心这会导致强制账户创建并加剧科技垄断。一些评论者承认确实需要监管，因为自律和家长责任已被证明不够有效，但他们担心公司会滥用收集到的任何个人数据。还有少数评论者以讽刺的方式质疑，既然老年人更容易成为网络诈骗的受害者，为何只关注保护年轻人。

**标签**: `#google`, `#android`, `#privacy`, `#age-verification`, `#policy`

---