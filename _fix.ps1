$ProgressPreference='SilentlyContinue'
$enc=[System.Text.UTF8Encoding]::new($false)

# ===== 首页 index.html =====
$p1='d:\我的项目\个人知识库\index.html'
$t1=[System.IO.File]::ReadAllText($p1)
$u1=$t1.Replace("`r`n","`n")
$old1=@'
    </a>

  </div>

  <div class="empty" id="empty">
'@
$new1=@'
    </a>

    <a class="card-atlas" href="sap/ml-ledger.html" data-cat="SAP" data-keywords="SAP 物料分类账 Material Ledger ML 实际成本核算 标准成本 标准价 实际成本 差异分配 单级 多级 生产订单 PP 采购差异 汇率差异 CKMLCP OMX1 OMX2 多级滚算 实际成本还原">
      <div class="thumb"><span class="cat-tag" style="color:var(--c-blue,#2563EB)">SAP</span><span class="glyph" style="color:#1E3A5F">ML</span></div>
      <div class="body">
        <h3>SAP 物料分类账 ML · 实际成本核算知识图</h3>
        <div class="desc">标准价→实际价：业务痛点 → 核心思想 → 三类差异（采购/生产/汇率）→ PP关联 → 单级+多级分配 → 阿胶口服液案例 → 配置点 → 10分钟汇报结构。</div>
        <div class="foot"><span>知识图 · 4K</span><span class="enter">点击查看 →</span></div>
      </div>
    </a>

  </div>

  <div class="empty" id="empty">
'@
if($u1.Contains($old1)){
  $u1=$u1.Replace($old1,$new1,1)
  [System.IO.File]::WriteAllText($p1, $u1.Replace("`n","`r`n"), $enc)
  Write-Output "HOME_UPDATED"
} else { Write-Output "HOME_NOTFOUND" }

# ===== sap/index.html =====
$p2='d:\我的项目\个人知识库\sap\index.html'
$t2=[System.IO.File]::ReadAllText($p2)
$u2=$t2.Replace("`r`n","`n")
$old2=@'
    </a>
  </div>

  <div class="foot-site">
'@
$new2=@'
    </a>
    <a href="ml-ledger.html" class="card-atlas" style="text-decoration:none;color:inherit;">
      <div class="thumb">
        <div class="glyph">ML</div>
        <div class="cat-tag">SAP</div>
      </div>
      <div class="body">
        <h3>物料分类账 ML · 实际成本核算知识图</h3>
        <div class="desc">标准价→实际价：业务痛点 → 核心思想 → 三类差异（采购/生产/汇率）→ PP关联 → 单级+多级分配 → 阿胶口服液案例 → 配置点(OMX1/OMX2/CKMLCP) → 汇报结构。</div>
        <div class="foot"><span>知识图 · 4K</span><span class="enter">查看 →</span></div>
      </div>
    </a>
  </div>

  <div class="foot-site">
'@
if($u2.Contains($old2)){
  $u2=$u2.Replace($old2,$new2,1)
  [System.IO.File]::WriteAllText($p2, $u2.Replace("`n","`r`n"), $enc)
  Write-Output "SAP_UPDATED"
} else { Write-Output "SAP_NOTFOUND" }
