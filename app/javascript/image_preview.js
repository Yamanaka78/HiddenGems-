function initializeImagePreview() {
  const fileInput = document.getElementById("image-upload");
  const previewContainer = document.getElementById("image-preview");

  // 要素が存在しない場合は処理を終了
  if (!fileInput || !previewContainer) return;

  // イベントリスナーが多重登録されないよう解除
  fileInput.removeEventListener("change", handleFileChange);
  fileInput.addEventListener("change", handleFileChange);

  function handleFileChange() {
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
  }
}

// Turbo フレーム対応 & 初期化
document.addEventListener("turbo:load", initializeImagePreview);
