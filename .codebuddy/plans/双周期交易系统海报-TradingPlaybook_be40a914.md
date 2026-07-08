---
name: 双周期交易系统海报-TradingPlaybook
overview: 将用户提供的「双周期交易系统七问详解总览」内容,用纯 HTML+CSS(4K 可缩放海报)+ 纯手写 SVG 图表,做成一个可维护的"交易知识库(Trading Playbook)"网页:浏览器打开即 4K 海报,可无限放大、一键导出 PNG、支持打印 A2/A1,后续可自由新增/替换卡片与 SVG。
design:
  architecture:
    framework: html
  styleKeywords:
    - 金融数据海报
    - TradingView风格
    - 性冷淡商务
    - 扁平线性
    - 红涨绿跌
    - 可无限放大
  fontSystem:
    fontFamily: HarmonyOS Sans SC
    heading:
      size: 64px
      weight: 700
    subheading:
      size: 36px
      weight: 600
    body:
      size: 22px
      weight: 400
  colorSystem:
    primary:
      - "#0B5ED7"
      - "#198754"
    background:
      - "#f8f9fb"
      - "#FFFFFF"
    text:
      - "#111111"
      - "#444444"
    functional:
      - "#e63946"
      - "#2a9d8f"
      - "#D6D6D6"
todos:
  - id: init-repo
    content: 在 d:/我的项目/画图 初始化 git 仓库与项目骨架目录
    status: completed
  - id: build-svg-lib
    content: 手写 images/ 与 icons/ 下全部线性 SVG（红涨绿跌、CSS变量、180x120）
    status: completed
    dependencies:
      - init-repo
  - id: build-style
    content: 编写 style.css：CSS变量配色、3840画布、Grid矩阵、卡片三行、@media print
    status: completed
    dependencies:
      - init-repo
  - id: build-html
    content: 编写 index.html：标题、双周期七问决策卡（内联SVG+用户文案）、底部三模块
    status: completed
    dependencies:
      - build-svg-lib
      - build-style
  - id: export-print
    content: 实现导出PNG(html2canvas)与打印按钮及JS缩放复位逻辑
    status: completed
    dependencies:
      - build-html
  - id: readme-verify
    content: 编写 README.md 并自查4K渲染/导出/打印效果
    status: completed
    dependencies:
      - build-html
---

## 用户需求

将「双周期交易系统 七问详解总览」做成一张以 HTML + CSS + 纯手写 SVG 实现的 4K 海报网页（非图片），浏览器打开即是可无限放大的海报，可一键导出 PNG，可打印 A2/A1 不糊。项目需做成一个可维护的「交易知识库（Trading Playbook）」，而非一次性静态图。

## 产品概述

单一网页 `index.html`，采用以 3840 为基准的等比缩放容器，浏览器全屏自适应显示，导出时按 4K 渲染。整体布局自上而下：顶部主标题 → 蓝色趋势周期七问矩阵（图/解释/指标三行）→ 绿色交易周期七问矩阵（图/解释/指标三行）→ 底部三个模块（止损止盈、走势生长、执行 Checklist 六原则图标）。所有图表为统一风格的线性 SVG（2px、扁平、无渐变/3D、红涨绿跌 TradingView 风格），颜色通过 CSS 变量管理，方便换主题。

## 核心特性

- 可缩放 4K 画布：以 3840 为基准的等比缩放容器，全屏自适应，导出按 4K 像素渲染，无限放大不糊。
- 双周期七问矩阵：蓝色（趋势周期）与绿色（交易周期）各 7 张决策卡片，每卡含「图（SVG）/ 解释（一句话+判定规则）/ 指标（判断标准）」三行。
- 决策卡片化：每张卡片给出明确判定规则（如「满足 3 项以上判定强动能，否则放弃」「启动/加速允许交易，衰退/末期禁止开仓」），将培训教材转为交易检查清单。
- 纯手写 SVG 示意图库：平台突破、均线多头、四阶段、强/弱趋势、时间周期层级、HL 跌破、回调、空头衰竭、止损位、入场信号、等距目标等，统一线性风格、CSS 变量着色、可复用。
- 底部模块：止损止盈（口诀+三级止损/三档止盈）、走势生长（动态止盈逻辑）、执行 Checklist（六个核心原则图标卡）。
- 一键导出：内置「导出 PNG」按钮（html2canvas）与「打印」按钮，并配 `@media print` 适配 A2/A1 纸张排版，导出/打印不丢失 SVG。
- 知识库化架构：每张卡片、每个 SVG 独立成组件/文件，后续新增规则（趋势衰竭、假突破、MACD 等）只需新增 SVG + 卡片，不影响整体布局。

## 技术栈选择

- 形态：纯静态站点（无构建工具），直接浏览器打开。
- 语言/样式：HTML5 + CSS3（CSS 变量管理主题色）。
- 图表：纯手写 SVG（内联或独立 .svg 文件，inline 引用以保证导出不丢失）。
- 导出：html2canvas（CDN 引入）用于 PNG 导出；浏览器原生 `window.print()` + `@media print` 用于 PDF/A2/A1。
- 字体：HarmonyOS Sans SC（标题 Bold / 正文 Regular），数字用 DIN（回退 'DIN','Roboto Mono',monospace）；系统无字体时优雅回退到 sans-serif。
- 包管理：无，纯静态；git 用于版本管理（当前目录无仓库，需 `git init`）。

## 实现方案

策略：以 3840×N 的「画布容器」为根，内部全部用基于 3840 宽度的相对单位（vw 或固定 px + 外层 transform: scale 适配视口）布局；双周期七问用 CSS Grid 7 列矩阵，每格为「决策卡片」组件（图/解释/指标三区块）。SVG 作为独立文件存放 `images/`，HTML 中以内联方式（构建期粘贴或 `<img>`+内联兜底）引用。导出时 html2canvas 对 3840 实际像素容器截图。

关键技术决策与权衡：

1. **缩放方案**：采用「固定 3840px 宽度画布 + JS 按视口宽度计算 `transform: scale()` 整体缩放」而非纯 vw。理由：html2canvas 截图需真实像素尺寸，vw 缩放会导致导出分辨率不稳；固定像素 + transform 既能全屏自适应又保证导出 4K 精确。
2. **SVG 引用方式**：采用 inline SVG（直接写入 HTML 卡片内）而非 `<img src>`。理由：html2canvas 对 inline SVG 支持最稳，且 CSS 变量可穿透着色实现换主题；独立 .svg 文件仍保留作为源文件与复用资产。
3. **决策卡片数据化**：将 14 张七问卡 + 底部模块内容抽成 JS 数据数组（或直接在 HTML 中结构化），渲染逻辑与内容分离，新增规则只改数据/加 SVG。当前阶段以「HTML 结构化 + 注释分区」为主，避免过度工程；若后续规则大量增长再抽 JS 模板。
4. **红涨绿跌**：SVG 内 `var(--up)`=#e63946、`var(--down)`=#2a9d8f（中国习惯），通过 CSS 变量控制，避免写死。
5. **性能/可靠性**：画布为静态，无运行时重渲染开销；html2canvas 仅导出时触发，注意 `scale` 参数设为 1（容器已是 3840）+ `useCORS`、`backgroundColor` 显式设置；SVG 数量约 14+ 个，体积小，无网络请求。

## 实现备注

- 颜色全部走 CSS 变量（背景 #f8f9fb、标题 #111111、蓝 #0B5ED7、绿 #198754、边框 #D6D6D6、涨 #e63946、跌 #2a9d8f），禁止在卡片/SVG 内写死。
- 圆角 12px、阴影 `0 4px 12px rgba(0,0,0,.08)` 统一定义为变量/工具类。
- 导出按钮与打印按钮固定悬浮于视口角落（不随画布缩放变形，用 position:fixed 且不受 transform 父级影响——将按钮放在画布容器外）。
- html2canvas 对 `transform: scale` 的父容器截图需先临时重置 scale 为 1 再截，避免双重缩放；截图后恢复。
- @media print 设置 `@page { size: A1 landscape; margin: 0 }` 并隐藏按钮、确保背景色打印（`-webkit-print-color-adjust: exact`）。
- 每个 SVG 统一 viewBox（如 0 0 180 120），stroke-width=2，无渐变/3D，K 线 20~30 根、无坐标轴/网格。
- 不引入 Emoji，图标全部 SVG 线性。
- 当前目录无 git 仓库，实现完成后需 `git init` 并首提交（遵循用户自动 push 偏好，但无远程时需先创建/告知）。

## 架构设计

```
浏览器视口
 └─ 固定控制条 (position:fixed, 导出PNG / 打印 按钮, 不缩放)
 └─ 缩放容器 (transform: scale 适配视口)
     └─ 画布 3840px (海报根)
         ├─ 顶部标题区
         ├─ 趋势周期区块 (蓝色标题 + 7列 Grid 决策卡)
         │    └─ 卡片×7 [SVG图 | 解释+判定 | 指标标准]
         ├─ 交易周期区块 (绿色标题 + 7列 Grid 决策卡)
         │    └─ 卡片×7 [SVG图 | 解释+判定 | 指标标准]
         └─ 底部模块区
              ├─ 止损止盈卡 (口诀 + 三级止损/三档止盈 + measured-move SVG)
              ├─ 走势生长卡 (动态止盈说明)
              └─ 执行 Checklist (六原则图标卡, checklist SVG)
```

无复杂数据流，纯静态渲染；扩展性来自「卡片内容分区 + SVG 文件独立」。

## 目录结构

```
d:/我的项目/画图/
├── index.html              # [NEW] 海报主页面。含缩放容器、标题、双周期七问 Grid、底部三模块、控制条按钮；内联所有 SVG；引用 style.css 与 html2canvas CDN；含导出/打印 JS。
├── style.css               # [NEW] 全局样式。CSS 变量(配色/圆角/阴影/字体)、画布 3840 布局、Grid 矩阵、卡片三行结构、控制条、@media print(A1/A2)、字体回退。
├── images/                 # [NEW] 纯手写 SVG 示意图库（源文件 + 复用资产），统一 viewBox 180×120、2px 线宽、CSS 变量着色：
│   ├── breakout.svg        # [NEW] 平台突破 K线（红涨绿跌，突破箱体）
│   ├── ma-bull.svg         # [NEW] 均线多头排列（MA5>MA10>MA20）
│   ├── phases.svg          # [NEW] 四阶段示意（启动/加速/衰退/末期，语义色点）
│   ├── momentum.svg        # [NEW] 强趋势 VS 弱趋势对比
│   ├── timeframe.svg       # [NEW] 四层时间周期层级（周>日>4h>15m）
│   ├── hh-hl.svg           # [NEW] Higher Low 结构 + 跌破示意
│   ├── pullback.svg        # [NEW] 上涨→回调→继续上涨
│   ├── callback-start.svg  # [NEW] 回调开始（最近高点/起始K线）
│   ├── big-up-small-down.svg # [NEW] 日线上涨+15分钟回调
│   ├── adjust-end.svg      # [NEW] 调整末端（止跌信号）
│   ├── bear-exhaust.svg    # [NEW] 空头衰竭（阴线缩短/量缩）
│   ├── stoploss.svg        # [NEW] 止损位置示意
│   ├── entry-signal.svg    # [NEW] 突破回调结构/入场信号
│   └── measured-move.svg   # [NEW] 等距目标（Measured Move）
├── icons/                  # [NEW] 线性图标 SVG（六原则用），2px 统一风格：
│   ├── trend.svg           # [NEW] 顺势而为
│   ├── big-small.svg       # [NEW] 看大做小
│   ├── wait.svg            # [NEW] 等待回调
│   ├── risk.svg            # [NEW] 风险优先
│   ├── run.svg             # [NEW] 让利润奔跑
│   └── checklist.svg       # [NEW] 14问检查
└── README.md               # [NEW] 项目说明。架构、如何新增规则(加 SVG+卡片)、导出/打印方法、配色变量说明、字体依赖。
```

## 关键代码结构

SVG 统一规范（所有 images/*.svg 与 icons/*.svg 遵循）：

- 根元素 `<svg viewBox="0 0 180 120" ...>`，不使用固定 width/height 以适配卡片。
- 颜色引用 `stroke="var(--line)"` / `fill="var(--up)"` / `fill="var(--down)"`，由 style.css 的 `:root` 提供变量。
- K 线绘制：`<rect>` 表示实体（涨红/跌绿），`<line>` 表示影线，单根宽度约 6px、间距约 1px，总量 20~30 根，无坐标轴/网格。
- 决策卡片 HTML 结构（index.html 内复用）：

```
<article class="card card--blue">
<div class="card__media">[inline SVG]</div>
<div class="card__explain"><h3>标题</h3><p>一句话</p><p class="rule">判定规则</p></div>
<div class="card__criteria"><ul>✔ 标准项…</ul></div>
</article>
```

## 设计风格

采用 TradingView + Bloomberg + Apple Design 融合的「金融数据海报」风格：性冷淡商务底色（#f8f9fb 浅灰背景），模块用克制的功能色区分——趋势周期统一深蓝 #0B5ED7、交易周期统一深绿 #198754，黑色 #111111 标题。卡片圆角 12px、轻投影，扁平无装饰。图标与 K 线均为 2px 线性 SVG，红涨绿跌（中国习惯），无渐变、无 3D、无卡通、无 Emoji。

## 布局规划（单页海报，自上而下）

1. **顶部标题块**：居中大标题「双周期交易系统 七问详解总览」，副标题「（看大做小）」，底部细分隔线。
2. **趋势周期区（蓝）**：左侧蓝色竖条 + 区域标题「趋势周期 · 大周期」，右侧 7 列 Grid，每列一张决策卡（图/解释/指标三行）。
3. **交易周期区（绿）**：结构同趋势区，绿色标识，7 列决策卡。
4. **底部模块区**：三栏——左「止损止盈」（含口诀与三级止损/三档止盈 + measured-move SVG）、中「走势生长」（动态止盈说明）、右「执行 Checklist」（六原则横向图标卡，checklist SVG）。
5. **控制条**：固定视口右下角，「导出 PNG」「打印」两个按钮（不随画布缩放）。

## 交互与响应式

- 画布以 3840 为基准，JS 按视口宽度计算 `transform: scale()` 整体等比缩放，全屏自适应；鼠标滚轮/拖拽不做（海报静态）。
- 按钮 hover 微交互（颜色加深），导出时临时复位 scale 截图后恢复。
- 打印模式（@media print）隐藏按钮、铺满 A1/A2、保留背景色。

## Agent Extensions

### Skill

- **awesome-design-md**
- Purpose: 参考真实金融产品（Stripe/Linear/Vercel 等）设计系统，校准海报的视觉令牌、间距与排版节奏，确保达到「金融数据海报」级别的专业质感。
- Expected outcome: 产出符合 TradingView+Bloomberg+Apple 融合风格的设计令牌与布局规范，落地到 style.css 与 index.html。