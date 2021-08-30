const TAB_SPACE = "  ";

window.textAreaCodeOnKeyDown = function (o, e) {
  var kC = e.keyCode ? e.keyCode : e.charCode ? e.charCode : e.which;

  if (kC == 9 && !e.shiftKey && !e.ctrlKey && !e.altKey) {
    var oS = o.scrollTop;

    if (o.setSelectionRange) {
      var sS = o.selectionStart;
      var sE = o.selectionEnd;

      o.value = o.value.substring(0, sS) + TAB_SPACE + o.value.substr(sE);
      o.setSelectionRange(sS + TAB_SPACE.length, sS + TAB_SPACE.length);
      o.focus();

    } else if (o.createTextRange) {

      document.selection.createRange().text = TAB_SPACE;
      e.returnValue = false;
    }

    o.scrollTop = oS;

    if (e.preventDefault) {
      e.preventDefault();
    }

    return false;
  }

  return true;
}
