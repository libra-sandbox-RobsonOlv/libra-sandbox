module.exports = function count(list) {
  if (!Array.isArray(list)) {
    throw new TypeError('count expects an array');
  }
  return list.length;
};
