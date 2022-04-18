import { Controller } from "@hotwired/stimulus";
import { DirectUpload } from "@rails/activestorage";

export default class extends Controller {
  static targets = ["input", "progress", "saveButton"];

  uploadFile() {
    Array.from(this.inputTarget.files).forEach((file) => {
      const upload = new DirectUpload(
        file,
        this.inputTarget.dataset.directUploadUrl,
        this // callback directUploadWillStoreFileWithXHR(request)
      );
      upload.create((error, blob) => {
        if (error) {
          console.log(error);
        } else {
          this.createHiddenBlobInput(blob);
          // if you're not submitting a form after upload. you need to attach
          // uploaded blob to some model here and skip hidden input.
        }
      });
    });
  }

  // add blob id to be submitted with the form
  createHiddenBlobInput(blob) {
    const hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("value", blob.signed_id);
    hiddenField.name = this.inputTarget.name;
    this.element.appendChild(hiddenField);
  }

  directUploadWillStoreFileWithXHR(request) {
    request.upload.addEventListener("progress", (event) => {
      this.progressUpdate(event);
    });
  }

  progressUpdate(event) {
    const progress = (event.loaded / event.total) * 100;
    const progressbar = '<div class="w-full h-7 mt-2 bg-gray-200 rounded-full"><div class="bg-blue-600 text-xs font-medium text-white text-center p-2 leading-none rounded-full" style="width: ' + progress + '%">' + progress.toFixed(0) + ' %</div></div>';
    this.progressTarget.innerHTML = progressbar;
    const available = "bg-blue-300";
    if (progress == 100) {
      //console.log("Video uploaded");
      this.saveButtonTarget.classList.remove('hidden');
    }
    // if you navigate away from the form, progress can still be displayed 
    // with something like this:
    // document.querySelector("#global-progress").innerHTML = progress;
  }
}