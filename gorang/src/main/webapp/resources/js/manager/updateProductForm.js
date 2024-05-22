window.onload = function () {

  function fileInputClick() {
    const imgContainer = document.getElementById('input-img-container');
    const fileInput = document.getElementById('file-input');

    imgContainer.addEventListener('click', () => {
      fileInput.click();
    });
  }

  function displaySelectedImage() {
    const fileInput = document.getElementById('file-input');
    const mainImgContainer = document.getElementById('main-img-container');

    fileInput.addEventListener('change', (event) => {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
          mainImgContainer.innerHTML = `<img id="main-img" src="${e.target.result}" alt="Selected Image">`;
        };
        reader.readAsDataURL(file);
      }
    });
  }

  fileInputClick();
  displaySelectedImage();

  $('.summernote').summernote({
    width:1000,
    height: 329,
    lang: "ko-KR",
    toolbar: [
        ['insert', ['link', 'picture']],
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['font', ['strikethrough']],
        ['fontsize', ['fontsize']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],

    ]
});
}


