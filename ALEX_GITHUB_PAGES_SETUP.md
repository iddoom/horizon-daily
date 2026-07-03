# Alex Horizon Daily - GitHub Pages 部署说明

## 目标

把 Horizon 每天生成的 AI 简报自动发布成 GitHub Pages 站点。

默认站点形式：

```text
https://iddoom.github.io/horizon-daily/
```

## 1. 创建 GitHub 仓库

建议仓库名：

```text
horizon-daily
```

创建后，把本地项目推到这个仓库。当前本地项目位置：

```text
C:\Users\Alex\Developer\Horizon
```

如果仓库名不是 `horizon-daily`，需要同步修改：

```text
docs/_config.yml
```

把：

```yaml
baseurl: "/horizon-daily"
```

改成：

```yaml
baseurl: "/你的仓库名"
```

当前已配置为 `https://iddoom.github.io`。

## 2. 设置 GitHub Actions Secrets

在 GitHub 仓库中进入：

```text
Settings → Secrets and variables → Actions → New repository secret
```

至少添加：

| Secret 名称 | 内容 |
|---|---|
| `ANTHROPIC_AUTH_TOKEN` | BigModel / Anthropic 兼容接口 token |

可选：

| Secret 名称 | 用途 |
|---|---|
| `APIFY_TOKEN` | 抓取 X/Twitter 指定账号内容 |
| `HORIZON_WEBHOOK_URL` | 后续推送飞书/钉钉/Slack |
| `GITHUB_TOKEN` | GitHub Actions 自动内置，一般不用手动加 |

不要把真实 token 写进 `data/config.github.json`、README 或笔记正文。

## 3. 开启 GitHub Pages

进入仓库：

```text
Settings → Pages
```

配置：

| 项目 | 设置 |
|---|---|
| Source | Deploy from a branch |
| Branch | `gh-pages` |
| Folder | `/ (root)` |

第一次运行工作流后才会出现 `gh-pages` 分支。

## 4. 手动触发日报

进入：

```text
Actions → Daily Horizon Summary → Run workflow
```

运行成功后，站点会发布到：

```text
https://iddoom.github.io/horizon-daily/
```

## 5. 当前本地状态

已准备：

- `.github/workflows/daily-summary.yml`
- `data/config.github.json`
- `docs/_config.yml`
- `docs/index.md`
- GitHub 仓库：`https://github.com/iddoom/horizon-daily`
- GitHub Pages 站点：`https://iddoom.github.io/horizon-daily/`

已知阻塞：

- 当前本机 BigModel token 已过期；GitHub Actions 里必须填新的 `ANTHROPIC_AUTH_TOKEN` 才能生成真正的 AI 日报。

## 6. 发布前检查

- [x] `docs/_config.yml` 的 `url` 已替换为你的 GitHub 用户名。
- [x] `docs/_config.yml` 的 `baseurl` 与仓库名一致。
- [ ] GitHub Secrets 已添加新的 `ANTHROPIC_AUTH_TOKEN`。
- [ ] 如需 X/Twitter 内容，GitHub Secrets 已添加 `APIFY_TOKEN`，并把 `data/config.github.json` 里的 `twitter.enabled` 改为 `true`。
- [ ] Actions 第一次运行成功。
- [x] Pages 选择了 `gh-pages` 分支。
