import io, os
base = r'd:\我的项目\个人知识库'
sep = "\r\n"
log = []

ml_home = [
    '    <a class="card-atlas" href="sap/ml-ledger.html" data-cat="SAP" data-keywords="SAP 物料分类账 Material Ledger ML 实际成本核算 标准成本 标准价 实际成本 差异分配 单级 多级 生产订单 PP 采购差异 汇率差异 CKMLCP OMX1 OMX2 多级滚算 实际成本还原">',
    '      <div class="thumb"><span class="cat-tag" style="color:var(--c-blue,#2563EB)">SAP</span><span class="glyph" style="color:#1E3A5F">ML</span></div>',
    '      <div class="body">',
    '        <h3>SAP 物料分类账 ML · 实际成本核算知识图</h3>',
    '        <div class="desc">标准价→实际价：业务痛点 → 核心思想 → 三类差异（采购/生产/汇率）→ PP关联 → 单级+多级分配 → 阿胶口服液案例 → 配置点 → 10分钟汇报结构。</div>',
    '        <div class="foot"><span>知识图 · 4K</span><span class="enter">点击查看 →</span></div>',
    '      </div>',
    '    </a>',
]
ml_sap = [
    '    <a href="ml-ledger.html" class="card-atlas" style="text-decoration:none;color:inherit;">',
    '      <div class="thumb">',
    '        <div class="glyph">ML</div>',
    '        <div class="cat-tag">SAP</div>',
    '      </div>',
    '      <div class="body">',
    '        <h3>物料分类账 ML · 实际成本核算知识图</h3>',
    '        <div class="desc">标准价→实际价：业务痛点 → 核心思想 → 三类差异（采购/生产/汇率）→ PP关联 → 单级+多级分配 → 阿胶口服液案例 → 配置点(OMX1/OMX2/CKMLCP) → 汇报结构。</div>',
    '        <div class="foot"><span>知识图 · 4K</span><span class="enter">查看 →</span></div>',
    '      </div>',
    '    </a>',
]

old1 = sep.join(["    </a>", "", "  </div>", "", '  <div class="empty" id="empty">'])
new1 = sep.join(["    </a>", ""] + ml_home + ["", "  </div>", "", '  <div class="empty" id="empty">'])

old2 = sep.join(["    </a>", "  </div>", "", '  <div class="foot-site">'])
new2 = sep.join(["    </a>"] + ml_sap + ["  </div>", "", '  <div class="foot-site">'])

jobs = [('index.html', old1, new1), ('sap/index.html', old2, new2)]
for fn, old, new in jobs:
    p = os.path.join(base, fn)
    raw = io.open(p, 'r', encoding='utf-8', newline='').read()
    has = old in raw
    log.append("%s | len=%d | has_cr=%s | old_in=%s" % (fn, len(raw), ('\r' in raw), has))
    if has:
        raw = raw.replace(old, new, 1)
        io.open(p, 'w', encoding='utf-8', newline='').write(raw)
        log.append("%s | WRITTEN OK" % fn)
    else:
        log.append("%s | NOT FOUND" % fn)

io.open(os.path.join(base, '_fix_log.txt'), 'w', encoding='utf-8').write("\n".join(log))
