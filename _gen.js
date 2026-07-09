// -*- coding: utf-8 -*-
const fs = require('fs');
const ROOT = 'd:\\我的项目\\画图';

function writeUtf8(p, c) {
  fs.writeFileSync(p, c, { encoding: 'utf8' });
}

function tpl(catKey, catName, lead, entries) {
  let cards = '';
  for (const e of entries) {
    cards += `    <a class="card-atlas" href="#" data-cat="${e[2]}" data-keywords="${e[4]}">
      <div class="thumb"><span class="cat-tag">${e[0]}</span><span class="glyph">${e[1]}</span></div>
      <div class="body">
        <h3>${e[0]}</h3>
        <div class="desc">${e[3]}</div>
        <div class="foot"><span>规划中</span><span class="enter">敬请期待 →</span></div>
      </div>
    </a>\n\n`;
  }
  return `<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1600">
<title>${catName} · Knowledge OS</title>
<link rel="stylesheet" href="../global.css">
</head>
<body>

<div class="topbar">
  <div class="inner">
    <a class="brand" href="../index.html"><span class="logo">K</span><span>Knowledge OS</span></a>
    <nav>
      <a href="../index.html">首页</a>
      <a href="../Trading/index.html">Trading</a>
      <a href="../SAP/index.html">SAP</a>
      <a href="../MES/index.html">MES</a>
      <a href="../AI/index.html">AI</a>
      <a href="../Business/index.html">Business</a>
      <a href="../SupplyChain/index.html">SupplyChain</a>
      <a href="../maps/index.html">Maps</a>
    </nav>
  </div>
</div>

<div class="container">
  <header class="page-head">
    <div class="crumb"><a href="../index.html">Knowledge OS</a> / ${catName}</div>
    <h1>${catName}</h1>
    <p class="lead">${lead}</p>
  </header>

  <div class="subgrid">
${cards}  </div>

  <div class="foot-site">
    <span>Knowledge OS · 个人知识操作系统</span>
    <span>PC / 4K 优先 · 固定布局 · 打印优先</span>
  </div>
</div>

</body>
</html>
`;
}

const nav = (k, n, l, e) => writeUtf8(ROOT + '\\' + k + '\\index.html', tpl(k, n, l, e));

nav('Trading', 'Trading Playbook', '所有交易体系、策略、风控、复盘图统一沉淀于此。', [
  ['双周期交易系统 · 七问详解', '七', 'trading', '看大做小的完整决策框架：趋势周期 7 问 + 交易周期 7 问 + 止损止盈/走势生长/执行原则。（待重建）', '交易系统 双周期 七问 看大做小 趋势 止损 止盈'],
  ['趋势阶段与动能判断', '趋', 'trading', '趋势四阶段（启动/加速/衰退/末期）与强弱动能判定，配合级别与防守位。', '趋势阶段 启动 加速 衰退 末期 动能 级别 防守'],
  ['止盈体系', '盈', 'trading', '固定目标（前高/等距）+ 动态跟踪止损，把利润锁进趋势生长里。', '止盈 体系 等距目标 measured move T1 T2 T3 跟踪止损'],
  ['ATR 与仓位管理', '险', 'trading', '以 ATR 衡量波动、反推止损距离与仓位大小的完整风控框架。', 'ATR 止损 波动 仓位管理 风险 头寸'],
]);

nav('SAP', 'SAP Playbook', 'MM / PP / PM / QM / PS 等模块知识图，统一沉淀 SAP 实施经验。', [
  ['SAP 模块全景', 'S', 'sap', 'SAP 各模块知识图索引与实施经验。', 'SAP MM 物料管理 库存 采购 PP 生产 PM 设备 QM 质量 PS 项目'],
  ['SAP 库存设计框架', '库', 'sap', '库存组织、评估、批次与移动类型设计的整体框架图。', 'SAP 库存 设计 框架 物料 仓库'],
]);

nav('Pharma', 'Pharma Digital', 'MES、LIMS、SAP、稳定性研究、质量管理等医药数字化知识图。', [
  ['制药 MES 框架', 'M', 'pharma', '制药制造执行系统：电子批记录、工序、物料平衡与合规追溯。', 'MES 制药 生产执行 批次 电子批记录 ebr 质量管理'],
  ['LIMS 与稳定性研究', 'L', 'pharma', '实验室信息管理系统与药品稳定性考察计划的设计框架。', 'LIMS 实验室 检验 稳定性研究 质量'],
]);

nav('AI', 'AI Toolkit', 'AI 工具、Agent、工作流、提示词、自动化统一索引。', [
  ['AI 工具箱', 'A', 'ai', 'AI 工具、Agent 架构、自动化工作流与提示词模板统一索引。', 'AI 工具 Agent 工作流 提示词 自动化 提示工程'],
  ['提示词框架', 'P', 'ai', '结构化 Prompt 设计与思维链模板，沉淀可复用的提示工程方法。', '提示词 框架 结构化 prompt 思维链'],
]);

nav('Maps', 'Knowledge Maps', '商业分析、供应链、投资、长期思考的可视化框架。', [
  ['商业与供应链图谱', '商', 'maps', '商业分析、供应链网络、投资逻辑与长期思考的可视化框架。', '商业分析 供应链 投资 长期思考 框架 思维'],
  ['投资框架', '投', 'maps', '资产配置、估值与周期判断的个人投资方法论图谱。', '投资 价值 框架 资产配置'],
]);

nav('MES', 'MES', '制造执行系统知识图：工序、排产、物料平衡、设备联网与合规。', []);
nav('Business', 'Business', '商业分析、战略、组织与运营框架图。', []);
nav('SupplyChain', 'Supply Chain', '采购、仓储、物流、计划与网络设计的知识图。', []);
nav('Favorites', 'Favorites', '收藏的高频知识图，快速入口。', []);
nav('Search', 'Search', '全站知识图检索结果页（与首页搜索联动）。', []);

console.log('pages generated');
