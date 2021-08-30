window.init = [];

window.addAppScript = function (fn) {
  window.init.push(fn);
};
