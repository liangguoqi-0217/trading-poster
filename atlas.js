/* 个人知识库 · 首页搜索
   纯前端，基于卡片 data-keywords，新增知识图无需改此处 */
(function () {
  var q = document.getElementById('q');
  var cards = Array.prototype.slice.call(document.querySelectorAll('#grid .card-atlas'));
  var empty = document.getElementById('empty');
  var countEl = document.getElementById('count');
  var totalEl = document.getElementById('mTotal');

  function render() {
    var kw = (q.value || '').trim().toLowerCase();
    var shown = 0;
    cards.forEach(function (c) {
      var keys = (c.getAttribute('data-keywords') || '').toLowerCase();
      var title = c.querySelector('h3').textContent.toLowerCase();
      var ok = (!kw) || keys.indexOf(kw) !== -1 || title.indexOf(kw) !== -1;
      c.style.display = ok ? '' : 'none';
      if (ok) shown++;
    });
    empty.classList.toggle('show', shown === 0);
    countEl.textContent = shown + ' / ' + cards.length;
  }

  q.addEventListener('input', render);

  if (totalEl) totalEl.textContent = cards.length;
  render();
})();
