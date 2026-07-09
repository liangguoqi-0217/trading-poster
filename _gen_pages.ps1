# -*- coding: utf-8 -*-
$ErrorActionPreference = 'Stop'
$ROOT = 'd:\我的项目\画图'

# 用 UTF-8 无 BOM 写入
function Write-Utf8($path, $content) {
    $sw = New-Object System.IO.StreamWriter($path, $false, [System.Text.Encoding]::UTF8)
    $sw.Write($content)
    $sw.Close()
}

# 占位栏目页模板
function Tpl-Section($catKey, $catName, $lead, $entries) {
    $cards = ''
    foreach ($e in $entries) {
        $cards += @"
    <a class="card-atlas" href="#" data-cat="$catKey" data-keywords="$($e[2])">
      <div class="thumb"><span class="cat-tag">$($e[0])</span><span class="glyph">$($e[1])</span></div>
      <div class="body">
        <h3>$($e[0])</h3>
        <div class="desc">$($e[3])</div>
        <div class="foot"><span>规划中</span><span class="enter">敬请期待 →</span></div>
      </div>
    </a>

"@
    }
    return @"
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1600">
<title>$catName · Knowledge OS</title>
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
    <div class="crumb"><a href="../index.html">Knowledge OS</a> / $catName</div>
    <h1>$catName</h1>
    <p class="lead">$lead</p>
  </header>

  <div class="subgrid">
$cards  </div>

  <div class="foot-site">
    <span>Knowledge OS · 个人知识操作系统</span>
    <span>PC / 4K 优先 · 固定布局 · 打印优先</span>
  </div>
</div>

</body>
</html>
"@
}

# Trading (含七问作为待重建条目)
$trading = Tpl-Section 'trading' 'Trading Playbook' '所有交易体系、策略、风控、复盘图统一沉淀于此。' @(
    @('双周期交易系统 · 七问详解', '七', '交易系统 双周期 七问 看大做小 趋势 止损 止盈', '看大做小的完整决策框架：趋势周期 7 问 + 交易周期 7 问 + 止损止盈/走势生长/执行原则。（待重建）'),
    @('趋势阶段与动能判断', '趋', '趋势阶段 启动 加速 衰退 末期 动能 级别 防守', '趋势四阶段与强弱动能判定，配合级别与防守位。'),
    @('止盈体系', '盈', '止盈 体系 等距目标 measured move T1 T2 T3 跟踪止损', '固定目标 + 动态跟踪止损，把利润锁进趋势生长里。'),
    @('ATR 与仓位管理', '险', 'ATR 止损 波动 仓位管理 风险 头寸', '以 ATR 衡量波动、反推止损距离与仓位大小的完整风控框架。')
)
Write-Utf8 (Join-Path $ROOT 'Trading\index.html') $trading

$sap = Tpl-Section 'sap' 'SAP Playbook' 'MM / PP / PM / QM / PS 等模块知识图，统一沉淀 SAP 实施经验。' @(
    @('SAP 模块全景', 'S', 'SAP MM 物料管理 库存 采购 PP 生产 PM 设备 QM 质量 PS 项目', 'SAP 各模块知识图索引与实施经验。'),
    @('SAP 库存设计框架', '库', 'SAP 库存 设计 框架 物料 仓库', '库存组织、评估、批次与移动类型设计的整体框架图。')
)
Write-Utf8 (Join-Path $ROOT 'SAP\index.html') $sap

$pharma = Tpl-Section 'pharma' 'Pharma Digital' 'MES、LIMS、SAP、稳定性研究、质量管理等医药数字化知识图。' @(
    @('制药 MES 框架', 'M', 'MES 制药 生产执行 批次 电子批记录 ebr 质量管理', '制药制造执行系统：电子批记录、工序、物料平衡与合规追溯。'),
    @('LIMS 与稳定性研究', 'L', 'LIMS 实验室 检验 稳定性研究 质量', '实验室信息管理系统与药品稳定性考察计划的设计框架。')
)
Write-Utf8 (Join-Path $ROOT 'Pharma\index.html') $pharma

$ai = Tpl-Section 'ai' 'AI Toolkit' 'AI 工具、Agent、工作流、提示词、自动化统一索引。' @(
    @('AI 工具箱', 'A', 'AI 工具 Agent 工作流 提示词 自动化 提示工程', 'AI 工具、Agent 架构、自动化工作流与提示词模板统一索引。'),
    @('提示词框架', 'P', '提示词 框架 结构化 prompt 思维链', '结构化 Prompt 设计与思维链模板，沉淀可复用的提示工程方法。')
)
Write-Utf8 (Join-Path $ROOT 'AI\index.html') $ai

$maps = Tpl-Section 'maps' 'Knowledge Maps' '商业分析、供应链、投资、长期思考的可视化框架。' @(
    @('商业与供应链图谱', '商', '商业分析 供应链 投资 长期思考 框架 思维', '商业分析、供应链网络、投资逻辑与长期思考的可视化框架。'),
    @('投资框架', '投', '投资 价值 框架 资产配置', '资产配置、估值与周期判断的个人投资方法论图谱。')
)
Write-Utf8 (Join-Path $ROOT 'Maps\index.html') $maps

# MES / Business / SupplyChain / Favorites / Search 占位（空列表）
$mes = Tpl-Section 'mes' 'MES' '制造执行系统知识图：工序、排产、物料平衡、设备联网与合规。' @()
Write-Utf8 (Join-Path $ROOT 'MES\index.html') $mes

$biz = Tpl-Section 'business' 'Business' '商业分析、战略、组织与运营框架图。' @()
Write-Utf8 (Join-Path $ROOT 'Business\index.html') $biz

$sc = Tpl-Section 'supplychain' 'Supply Chain' '采购、仓储、物流、计划与网络设计的知识图。' @()
Write-Utf8 (Join-Path $ROOT 'SupplyChain\index.html') $sc

$fav = Tpl-Section 'favorites' 'Favorites' '收藏的高频知识图，快速入口。' @()
Write-Utf8 (Join-Path $ROOT 'Favorites\index.html') $fav

$search = Tpl-Section 'search' 'Search' '全站知识图检索结果页（与首页搜索联动）。' @()
Write-Utf8 (Join-Path $ROOT 'Search\index.html') $search

Write-Host 'pages generated'
