// place_autocomplete.js

document.addEventListener('DOMContentLoaded', function () {
  const inputSpot = document.getElementById('Spot'); // スポット名の入力フィールド
  const inputAddress = document.getElementById('Address'); // 住所の入力フィールド

  // オートコンプリートのオプション
  const options = {
    types: ['establishment'], // 店舗や施設名に限定
    componentRestrictions: { country: 'JP' }, // 日本国内に限定
  };

  // スポット名フィールドにオートコンプリートを適用
  const autocompleteSpot = new google.maps.places.Autocomplete(inputSpot, options);

  // 住所フィールドにオートコンプリートを適用
  const autocompleteAddress = new google.maps.places.Autocomplete(inputAddress, options);

  // スポット名のオートコンプリートが選択されたとき
  autocompleteSpot.addListener('place_changed', function () {
    const place = autocompleteSpot.getPlace();
    if (place.geometry) {
      inputSpot.value = place.name; // 選択したスポット名
      inputAddress.value = place.formatted_address; // 自動的に住所を入力
    }
  });

  // 住所のオートコンプリートが選択されたとき
  autocompleteAddress.addListener('place_changed', function () {
    const place = autocompleteAddress.getPlace();
    if (place.geometry) {
      inputSpot.value = place.name; // 自動的にスポット名を入力
      inputAddress.value = place.formatted_address; // 選択した住所
    }
  });
});
