var UPLOAD_URL = "/image";

var uploadAttachment = function(attachment) {
  window.onbeforeunload = function(e) {
    var e = e || window.event;
    var warn = 'Uploads are pending. If you quit this page they may not be saved.';
    if (e) {
      e.returnValue = warn;
    }
    return warn;
  };

  var file = attachment.file;
  if (file.size == 0) {
    window.onbeforeunload = function() {};
    attachment.remove();
    alert("The file you submitted looks empty.");
    return;
    // You may personalize max_file_size
  } else if (file.size > 37000000) {
    window.onbeforeunload = function() {};
    attachment.remove();
    alert("Your file seems too big for uploading.");
    return;
  }

  var form = new FormData;
  form.append("Content-Type", file.type);
  form.append("image", file);
  form.append(document.querySelector('[name=csrf-param]').content, document.querySelector('[name=csrf-token]').content)

  var xhr = new XMLHttpRequest;
  xhr.open("POST", UPLOAD_URL, true);
  xhr.upload.onprogress = function (event) {
    var progress = event.loaded / event.total * 100;
    return attachment.setUploadProgress(progress);
  };

  xhr.onload = function() {
    if (xhr.status === 200) {
      window.onbeforeunload = function() {};

      var responseJSON = JSON.parse(xhr.responseText)

        return attachment.setAttributes({
          url: responseJSON.url,
                href: null
        });
    } else {
      window.onbeforeunload = function() {};
      attachment.remove();
      alert("Upload failed. Try to reload the page.");
    }
  };
  return xhr.send(form);
};

// Adding upload button to Trix toolbar on initialization
document.addEventListener('trix-initialize', function (e) {
  var trix = e.target;
  var toolBar = trix.toolbarElement;

  // Creation of the button
  var button = document.createElement("button");
  button.setAttribute("type", "button");
  button.setAttribute("class", "trix-button trix-button--icon trix-button--icon-attach");
  button.setAttribute("data-trix-action", "x-attach");
  button.setAttribute("title", "Attach a file");
  button.setAttribute("tabindex", "-1");
  button.innerText = "Attach a file";

  // Attachment of the button to the toolBar
  var uploadButton = toolBar.querySelector('.trix-button-group--block-tools').appendChild(button);

  // When the button is clicked
  uploadButton.addEventListener('click', function () {
    // Create a temporary file input
    var fileInput = document.createElement("input");
    fileInput.setAttribute("type", "file");
    fileInput.setAttribute("multiple", "");
    // Add listener on change for this file input
    fileInput.addEventListener("change", function (event) {
      var _results = [];
      // Getting files
      for (var _i = 0; _i < this.files.length; _i++) {
        var file = this.files[_i];
        // pushing them to Trix
        _results.push(trix.editor.insertFile(file));
      }
      return _results;
    });

    // Then virtually click on it
    fileInput.click()
  });

  return;
});

document.addEventListener('trix-attachment-remove', function(e) {
  // file = e.attachment;
  // Here you could send a request to your app to delete the file
  window.onbeforeunload = function() {};
});


document.addEventListener("trix-attachment-add", function(event) {
  var attachment = event.attachment;
  if (attachment.file) {
    return uploadAttachment(attachment);
  }
});
