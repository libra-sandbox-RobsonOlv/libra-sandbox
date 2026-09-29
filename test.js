const isNumber = require('is-number');
if (!isNumber(42) || isNumber('x')) { throw new Error('is-number misbehaves'); }
console.log('widgets: 2 checks passed');
