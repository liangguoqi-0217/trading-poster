# 个人知识库 · Knowledge Atlas

一个**长期维护的个人知识操作系统**。打开一个网址，即可检索、浏览、打印、导出你所有由 AI 生成的知识作品——交易海报、流程图、思维导图、框架图，统一沉淀、随时查阅。

> 风格：Bloomberg Terminal + TradingView + Apple Design + 企业知识门户。
> 设计：固定宽度（非响应式）· PC / 4K 优先 · 打印优先 · 统一设计令牌。

## 三个一级栏目

| 栏目 | 定位 |
|---|---|
| ⚙ **SAP相关** | MM / PP / PM / QM / PS 等所有 SAP 知识图 |
| 📈 **投资相关** | 交易系统、K线形态、策略、风控、复盘图 |
| 📁 **其他** | 护理学、制药采购流程等暂未归入前两类的知识图 |

## 目录结构

```
Knowledge-Atlas/
├── index.html              # 首页 Dashboard（搜索 + 分类 + 卡片网格）
├── global.css             # 全站统一设计令牌 + 布局（固定宽度）
├── atlas.js               # 首页搜索/筛选交互（纯前端）
├── SAP相关/               # ⚙ SAP 知识图
│   ├── index.html        # 栏目页
│   ├── ml-ledger.html    # 物料分类账 ML · 实际成本核算
│   └── ...（其余 SAP 页）
├── 投资相关/              # 📈 投资知识图
│   ├── index.html        # 栏目页
│   ├── seven-questions/
│   │   └── index.html    # 双周期交易系统 · 七问详解（4K 海报）
│   ├── kline-patterns.html
│   └── trading_seven_temp.html
├── 其他/                  # 📁 护理学 / 制药采购等
│   ├── index.html        # 栏目页
│   ├── nursing-*.html    # 护理学四张
│   └── procurement-flow/
│       └── index.html    # 制药采购需求流程
└── (images/ icons/)       # 复用 SVG 资产
```

> 注：根目录尚残留若干空脚手架文件夹（MES / Business / Components / Dashboard / DesignSystem / Favorites / Search / SupplyChain / Assets）与占位子页（ai / maps / pharma），待手动清理。

## 如何使用

1. 用浏览器打开 `index.html`（无需服务器、无构建步骤）。
2. 顶部搜索框按关键词检索；分类标签按栏目筛选（SAP相关 / 投资相关 / 其他）。
3. 点击任意知识卡片 → 进入对应知识图页面。
4. 知识图页支持：
   - **整体等比例缩放**（以 3840 为基准，位置恒定，仅缩放）
   - **导出 PNG**：点击右下角「导出 PNG」→ 复位到真实 4K 像素渲染下载
   - **打印 / 存 PDF**：点击「打印 / 存PDF」→ 浏览器打印（已隐藏导航与按钮）

## 如何新增一个知识图（不改已有页面）

1. 在对应栏目目录新建子目录，如 `投资相关/atr/index.html`。
2. 复制 `投资相关/seven-questions/index.html` 为模板，替换导航 active、面包屑、标题与海报内容（沿用 `style.css` 的 4K 卡片模板 + `global.css` 的导航外壳）。
3. 在**首页** `index.html` 的 `#grid` 内追加一张卡片（data-cat 取 `sap` / `investment` / `other`）：
   ```html
   <a class="card-atlas" href="投资相关/atr/index.html"
      data-cat="investment" data-keywords="ATR 止损 波动">
     <div class="thumb"><span class="cat-tag">投资</span><span class="glyph">A</span></div>
     <div class="body"><h3>标题</h3><div class="desc">简介</div>
       <div class="foot"><span>2026-07</span><span class="enter">点击进入 →</span></div></div>
   </a>
   ```
4. （可选）在栏目页 `投资相关/index.html` 的 `.subgrid` 也加一张入口卡片。
5. 提交推送，GitHub Pages 自动更新。

> 所有颜色集中在 `global.css` 的 `:root` 与 `style.css` 的 `:root` CSS 变量，改一处即全站换色。

## 技术备注

- 纯静态站点，无构建工具；`html2canvas` 通过 CDN 引入（联网导出 PNG，打印离线可用）。
- 全站**固定宽度 1600px 容器**，海报页固定 3840×2160 画布 + `transform: scale()` 等比缩放。
- **无任何响应式 / Media Query / flex-wrap / auto-fit / vw-vh**：布局恒定，任何缩放比例下元素位置一致。
- 字体依赖系统/浏览器字体回退，未内置字体文件。
