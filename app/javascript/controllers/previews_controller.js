import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="previews"
export default class extends Controller {
  static targets = ["input", "preview"]

  connect() {
    // コントローラ接続時に実行される初期化処理
  }

  preview() {
    let input = this.inputTarget;
    let previewContainer = document.getElementById('image-preview');

    // プレビューエリアをクリア
    previewContainer.innerHTML = '';

    // ファイルが選択されている場合、プレビューを表示
    if (input.files && input.files.length > 0) {
      Array.from(input.files).forEach(file => {
        let reader = new FileReader();
        let previewImage = document.createElement('img');
        previewImage.classList.add('w-32', 'h-32', 'object-cover', 'rounded', 'mr-2', 'mb-2');

        reader.onloadend = function() {
          previewImage.src = reader.result;
        };

        // ファイルをData URLとして読み込む
        reader.readAsDataURL(file);

        // プレビューエリアに追加
        previewContainer.appendChild(previewImage);
      });
    }
  }
}
