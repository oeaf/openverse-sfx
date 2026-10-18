# Openverse SFX

> ⭐ **Support This Project**
>
> [![GitHub stars](https://img.shields.io/github/stars/oeaf/openverse-sfx?style=social)](https://github.com/oeaf/openverse-sfx)
> [![GitHub forks](https://img.shields.io/github/forks/oeaf/openverse-sfx?style=social)](https://github.com/oeaf/openverse-sfx)
> [![GitHub issues](https://img.shields.io/github/issues/oeaf/openverse-sfx)](https://github.com/oeaf/openverse-sfx)
>
> 如果这个项目对你有用，欢迎点个 ⭐ Star！你的支持是我持续更新的动力。

给 AI Agent 用的免费音效搜索 skill：需要音效时，用 Openverse API 搜 Freesound 等来源，挑最合适的配进视频里。

## 为什么是 Openverse

- 聚合 Freesound / Jamendo / Wikimedia Audio，全部开放授权
- 一次 API 请求返回：试听直链、时长（毫秒）、授权类型、**现成署名文案**
- `license=cc0` 过滤后，搜到的直接拿去商用，零署名负担

## 30 秒上手

```bash
curl "https://api.openverse.org/v1/audio/?q=whoosh&source=freesound&license=cc0"
```

或用配套脚本：

```bash
./scripts/search.sh whoosh cc0
```

## Skill 文件

- `SKILL.md` —— 完整 skill：参数表、结果字段、工作流、实测坑点
- `scripts/search.sh` —— 命令行快速搜索

## 实测坑点

- 不要按 `category` 筛"音效"，会返回 0 条；直接用 `source=freesound`
- 关键词必须英文；匿名请求有频率限制（429 就降频）

## License

MIT
