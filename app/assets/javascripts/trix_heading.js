// Adding heading 2
document.addEventListener('trix-initialize', function (e) {
  var trix = e.target;
  var toolBar = trix.toolbarElement;

  var button = document.createElement('button');
  button.setAttribute('type', 'button');
  button.setAttribute('class', 'trix-button trix-button--icon trix-button--icon-heading-2');
  button.setAttribute('data-trix-attribute', 'heading2');
  button.setAttribute('title', 'Heading 2');
  button.setAttribute('tabindex', '-1');
  button.innerText = 'Heading 2'

  // Attachment of the button to the toolBar
  toolBar.querySelector('.trix-button-group--block-tools').prepend(button);
});
