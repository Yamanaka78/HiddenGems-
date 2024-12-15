function initializeAutocomplete() {
  const inputSpot = document.getElementById("Spot"); // スポット名の入力フィールド
  const inputAddress = document.getElementById("Address"); // 住所の入力フィールド

  // 要素が存在しない場合は処理を終了
  if (!inputSpot || !inputAddress) return;

  // オートコンプリートのオプション
  const options = {
    types: ["establishment"], // 店舗や施設名に限定
    componentRestrictions: { country: "JP" }, // 日本国内に限定
  };

  // Google Maps の Autocomplete インスタンスを再生成
  const autocompleteSpot = new google.maps.places.Autocomplete(inputSpot, options);
  const autocompleteAddress = new google.maps.places.Autocomplete(inputAddress, options);

  // イベントリスナーの登録を確実に行う
  autocompleteSpot.addListener("place_changed", () => {
    const place = autocompleteSpot.getPlace();
    if (place.geometry) {
      inputSpot.value = place.name; // 選択したスポット名
      inputAddress.value = place.formatted_address; // 自動的に住所を入力
    }
  });

  autocompleteAddress.addListener("place_changed", () => {
    const place = autocompleteAddress.getPlace();
    if (place.geometry) {
      inputSpot.value = place.name; // 自動的にスポット名を入力
      inputAddress.value = place.formatted_address; // 選択した住所
    }
  });
}

// Turbo フレーム対応 & 初期化
document.addEventListener("turbo:load", initializeAutocomplete);
