const assert = require('assert');
const count = require('../src/count');

// AC-002 (rework): the TypeError names what it got.
assert.throws(() => count(null), /got null/);
console.log('count message: 1 check passed');
