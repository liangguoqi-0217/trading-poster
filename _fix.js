const fs = require('fs');
const p = 'Trading/seven-questions/index.html';
let h = fs.readFileSync(p, 'utf8');

const marker = '<script>';
const idx = h.lastIndexOf(marker);
const end = h.indexOf('</script>', idx);
const js = h.substring(idx + marker.length, end);

console.log('canvas in js:', js.includes('canvas'));
console.log('cavas in js:', js.includes('cavas'));
console.log('useCORS in js:', js.includes('useCORS'));
console.log('image/png in js:', js.includes('image/png'));
console.log('avial in js:', js.includes('avial'));

let fixed = js.split('cavas').join('canvas').split('image/pgn').join('image/png');
fs.writeFileSync('_t.js', fixed);
console.log('written _t.js len', fixed.length);
