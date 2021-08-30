var UPLOAD_URL = "/image";

window.uploadImage = function (contextToBind, onSuccess) {
  var imageUploadingFunction = event => {
    window.startSpinner(window.i18n['image_uploader.loading_image']);

    var callBackImageUploadingFunction = () => {
      if (xhr.status === 200) {
        var responseJSON = JSON.parse(xhr.responseText);

        onSuccess.bind(contextToBind)(responseJSON);
      } else {
        alert("Erro ao salvar imagem!");
      }

      window.stopSpinner();
    };

    var file = event.target.files[0];

    var form = new FormData();
    form.append("Content-Type", file.type);
    form.append("image", file);
    form.append(document.querySelector('[name=csrf-param]').content, document.querySelector('[name=csrf-token]').content);

    var xhr = new XMLHttpRequest();
    xhr.open("POST", UPLOAD_URL, true);
    xhr.onload = callBackImageUploadingFunction.bind(contextToBind);
    return xhr.send(form);
  };

  // Create a temporary file input
  var fileInput = document.createElement("input");
  fileInput.setAttribute("type", "file");
  fileInput.setAttribute("multiple", "");
  fileInput.addEventListener("change", imageUploadingFunction.bind(contextToBind));
  fileInput.click();
}
