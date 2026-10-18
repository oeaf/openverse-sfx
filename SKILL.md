# Openverse SFX

需要音效的时候，就去 Openverse 搜，挑最合适的配进视频里。

> Trigger: *whenever you need sound effects, search Openverse to find the best options and use them for tasteful sound design within my video.*

Openverse（WordPress 旗下开放素材库）的音频 API，聚合 Freesound 等来源的免费音效，一次请求返回试听直链、时长、授权和现成署名文案。

## 快速上手

```bash
curl "https://api.openverse.org/v1/audio/?q=whoosh&source=freesound&license=cc0"
```

返回示例（已精简）：

```json
{
  "results": [
    {"title": "Deep Whoosh #1", "creator": "Kinoton", "duration": 3200, "license": "cc0",
     "url": "https://cdn.freesound.org/.../deep-whoosh.mp3"},
    {"title": "Swosh swoosh whoosh air sound", "creator": "qubodup", "duration": 500, "license": "cc0",
     "url": "https://cdn.freesound.org/.../swosh.mp3"}
  ]
}
```

## 参数

| 参数 | 说明 | 推荐值 |
|---|---|---|
| `q` | 关键词，**必须用英文**（whoosh / rain / applause / doorbell） | 按需 |
| `source` | 音频来源 | `freesound`（音效主来源；另有 `jamendo`、`wikimedia_audio`） |
| `license` | 授权过滤 | `cc0`（最省心：免署名、可商用） |
| `page_size` / `page` | 分页 | 默认 20 条/页 |

License 可选值：`cc0`、`pdm`、`by`、`by-sa`、`by-nc`、`by-nd`、`by-nc-sa`、`by-nc-nd`、`all`、`all-cc`、`all-pd`。

## 结果字段（每条都有）

- `title` / `creator` —— 标题和作者
- `duration` —— 时长（毫秒），挑和镜头长度接近的
- `url` —— 音频文件直链，直接下载
- `license` —— 授权类型
- `attribution` —— 现成署名文案，by 系列授权直接复制使用

署名格式示例：

> "Rain, Moderate, C.wav" by InspectorJ is licensed under CC BY 4.0.

## 工作流

1. 按场景想英文关键词（转场→whoosh / 环境→rain, cafe / 情绪→applause, gasp）
2. `license=cc0` 先搜一轮；不够再放宽到 `all-cc` 并保留署名
3. 按 `duration` 挑长度最接近的 2–3 条，下载试听
4. 非 CC0 的，把 `attribution` 写进视频描述或片尾字幕

## 坑（实测）

- **不要按 category 筛"音效"**：`category` 过滤返回 0 条，直接用 `source=freesound`。
- 关键词用中文搜不到结果，一律英文。
- 匿名请求有频率限制；遇到 429 就降频，或去 Openverse 官网注册 OAuth 应用拿更高配额。

## 配套脚本

`scripts/search.sh`：一句话搜 + 列出标题/作者/时长/授权/直链。

```bash
./scripts/search.sh whoosh cc0
```
