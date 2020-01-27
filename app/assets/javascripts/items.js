//setTimeout関数でfadeOut()の実行を遅延させる
//フラッシュが表示されて３秒後に自動で消える
  setTimeout(function() {
    $('.alert__notice').fadeOut();
  }, 3000);

  $(document).ready(function(){
    $('.contents__image').bxSlider({
        auto: true,
        pause: 5000,
    });
  });
