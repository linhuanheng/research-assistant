# Research Assistant

面向经管类学术研究和量化交易策略开发的 Claude Code 项目脚手架技能。一键搭建研究项目框架，内置记录归档、审计防幻觉、钩子自动化等工程能力。

## 功能

- **三层模块架构**：依据（foundation）、执行（execution）、结果（results）三段式项目结构
- **双场景模板**：学术研究（论文写作、理论建模、实证分析）与量化策略（因子开发、回测、绩效归因）
- **子 agent 体系**：
  - `recorder` — 对话归档、文件变更追踪、阶段性成果记录，支持 GitHub 推送
  - `auditor` — 阶段性产出审计（来源可溯、反幻觉、无未来信息泄漏）
- **钩子自动化**：空闲超时自动唤醒 recorder，回测前强制审计门禁
- **技能协同**：与 quantitative-theory-kb、literature-review-economics、webofscience-literature-search、economic-model-derivation-guidance 深度集成

## 项目结构

```
research-assistant/
├── SKILL.md                     # 技能主文件
└── references/                  # 模板与定义文件
    ├── claude-academic.md       # 学术研究 CLAUDE.md 模板
    ├── claude-quant.md          # 量化策略 CLAUDE.md 模板
    ├── recorder-agent.md        # recorder agent 定义
    ├── auditor-agent.md         # auditor agent 定义
    └── hooks/
        ├── record-stop-time.sh
        └── check-idle-trigger.sh
```

## 安装

```bash
# 将 skill 部署到 Claude Code
cp -r research-assistant ~/.claude/skills/research-assistant
```

## License

MIT
