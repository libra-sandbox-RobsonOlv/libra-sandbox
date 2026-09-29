module.exports = function count(list) {
  if (!Array.isArray(list)) {
    throw new TypeError('count expects an array, got ' + (list === null ? 'null' : typeof list));
  }
  return list.length;
};
