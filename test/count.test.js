const assert = require('assert');
const count = require('../src/count');

// AC-001: an empty list counts zero.
assert.strictEqual(count([]), 0);
// AC-002: a non-array input is refused with a TypeError.
assert.throws(() => count(null), TypeError);
console.log('count: 2 checks passed');
