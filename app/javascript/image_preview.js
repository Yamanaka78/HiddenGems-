document.addEventListener("DOMContentLoaded", function () {
  const fileInput = document.getElementById("image-upload");
  const previewContainer = document.getElementById("image-preview");

  // ファイル選択時のプレビュー表示
  fileInput.addEventListener("change", function () {
    // プレビューエリアをクリア
    previewContainer.innerHTML = "";

    // 選択されたファイルを取得
    const files = fileInput.files;
    Array.from(files).forEach((file) => {
      const reader = new FileReader();

      // ファイル読み込み完了時の処理
      reader.onload = function (e) {
        const img = document.createElement("img");
        img.src = e.target.result;
        img.className = "w-32 h-32 object-cover rounded";
        previewContainer.appendChild(img);
      };

      // ファイルをData URLとして読み込む
      reader.readAsDataURL(file);
    });
  });
});
