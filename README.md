# Knowledge Atlas · 个人知识图谱

一个**长期维护的个人知识操作系统**。打开一个网址，即可检索、浏览、打印、导出你所有由 AI 生成的知识作品——交易海报、流程图、思维导图、框架图，统一沉淀、随时查阅。

> 风格：Bloomberg Terminal + TradingView + Apple Design + 企业知识门户。
> 设计：固定宽度（非响应式）· PC / 4K 优先 · 打印优先 · 统一设计令牌。

## 五个一级栏目

| 栏目 | 定位 |
|---|---|
| 📈 **Trading Playbook** | 交易系统、策略、风控、复盘图 |
| 🏭 **Pharma Digital** | 制药数字化：MES、LIMS、SAP、稳定性研究、质量管理 |
| ⚙ **SAP Playbook** | MM / PP / PM / QM / PS 等所有 SAP 知识图 |
| 🤖 **AI Toolkit** | AI 工具、Agent、工作流、提示词、自动化 |
| 🧠 **Knowledge Maps** | 商业分析、供应链、投资、长期思考 |

## 目录结构

```
Knowledge-Atlas/
├── index.html              # 首页 Dashboard（搜索 + 分类 + 卡片网格）
├── global.css             # 全站统一设计令牌 + 布局（固定宽度）
├── atlas.js               # 首页搜索/筛选交互（纯前端）
├── trading/              # 📈 Trading Playbook
│   ├── index.html        # 栏目页
│   └── seven-questions/
│       └── index.html    # 双周期交易系统 · 七问详解（4K 海报）
├── pharma/  sap/  ai/  maps/   # 各栏目页（占位，待填充）
└── (images/ icons/)     # 复用 SVG 资产
```

## 如何使用

1. 用浏览器打开 `index.html`（无需服务器、无构建步骤）。
2. 顶部搜索框按关键词检索；分类标签按栏目筛选。
3. 点击任意知识卡片 → 进入对应知识图页面。
4. 知识图页支持：
   - **整体等比例缩放**（以 3840 为基准，位置恒定，仅缩放）
   - **导出 PNG**：点击右下角「导出 PNG」→ 复位到真实 4K 像素渲染下载
   - **打印 / 存 PDF**：点击「打印 / 存PDF」→ 浏览器打印（已隐藏导航与按钮）

## 如何新增一个知识图（不改已有页面）

1. 在对应栏目目录新建子目录，如 `trading/atr/index.html`。
2. 复制 `trading/seven-questions/index.html` 为模板，替换导航 active、面包屑、标题与海报内容（沿用 `style.css` 的 4K 卡片模板 + `global.css` 的导航外壳）。
3. 在**首页** `index.html` 的 `#grid` 内追加一张卡片：
   ```html
   <a class="card-atlas" href="trading/atr/index.html"
      data-cat="trading" data-keywords="ATR 止损 波动">
     <div class="thumb"><span class="cat-tag" style="color:var(--cat-trading)">TRADING</span><span class="glyph" style="color:var(--cat-trading)">A</span></div>
     <div class="body"><h3>标题</h3><div class="desc">简介</div>
       <div class="foot"><span>2026-07</span><span class="enter">点击进入 →</span></div></div>
   </a>
   ```
4. （可选）在栏目页 `trading/index.html` 的 `.subgrid` 也加一张入口卡片。
5. 提交推送，GitHub Pages 自动更新。

> 所有颜色集中在 `global.css` 的 `:root` 与 `style.css` 的 `:root` CSS 变量，改一处即全站换色。

## 技术备注

- 纯静态站点，无构建工具；`html2canvas` 通过 CDN 引入（联网导出 PNG，打印离线可用）。
- 全站**固定宽度 1600px 容器**，海报页固定 3840×2160 画布 + `transform: scale()` 等比缩放。
- **无任何响应式 / Media Query / flex-wrap / auto-fit / vw-vh**：布局恒定，任何缩放比例下元素位置一致。
- 字体依赖系统/浏览器字体回退，未内置字体文件。
