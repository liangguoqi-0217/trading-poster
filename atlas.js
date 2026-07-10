/* 个人知识库 · 首页搜索 + 分类筛选
   纯前端，基于卡片 data-cat / data-keywords，新增知识图无需改此处 */
(function () {
  var q = document.getElementById('q');
  var chips = document.querySelectorAll('#cats .cat-chip');
  var cards = Array.prototype.slice.call(document.querySelectorAll('#grid .card-atlas'));
  var empty = document.getElementById('empty');
  var countEl = document.getElementById('count');
  var totalEl = document.getElementById('mTotal');

  var curCat = 'all';

  function render() {
    var kw = (q.value || '').trim().toLowerCase();
    var shown = 0;
    cards.forEach(function (c) {
      var cat = c.getAttribute('data-cat');
      var keys = (c.getAttribute('data-keywords') || '').toLowerCase();
      var title = c.querySelector('h3').textContent.toLowerCase();
      var hitCat = (curCat === 'all' || cat === curCat);
      var hitKw = (!kw) || keys.indexOf(kw) !== -1 || title.indexOf(kw) !== -1;
      var ok = hitCat && hitKw;
      c.style.display = ok ? '' : 'none';
      if (ok) shown++;
    });
    empty.classList.toggle('show', shown === 0);
    countEl.textContent = shown + ' / ' + cards.length;
  }

  q.addEventListener('input', render);
  chips.forEach(function (ch) {
    ch.addEventListener('click', function () {
      chips.forEach(function (x) { x.classList.remove('active'); });
      ch.classList.add('active');
      curCat = ch.getAttribute('data-cat');
      render();
    });
  });

  if (totalEl) totalEl.textContent = cards.length;
  render();
})();
