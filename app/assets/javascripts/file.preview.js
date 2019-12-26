
$(function(){
  //querySelectorでfile_fieldを取得
  var file_field = document.querySelector('input[type=file]')
  //fileが選択された時に発火するイベント
  $('.sell-main__upload-drop-file').change(function(){
    //選択したfileのオブジェクトをpropで取得
    var file = $('input[type="file"]').prop('files')[0];
    //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
    var fileReader = new FileReader();
    // inputs.push($(this));
    // var img = $(`<div class= "img_view"><img></div>`);
    //読み込みが完了すると、srcにfileのURLを格納
    var btn_wrapper = $('<div class="btn-wrapper"><div class="btn__edit">編集</div><div class="btn__delete">削除</div></div>');
    $('.sells__icon__camera').append(btn_wrapper);
    $(".btn-wrapper").css('color', 'blue');
    $(".btn-wrapper").css('display', 'flex');
    fileReader.onloadend = function() {
      var src = fileReader.result
      var html= `<img src="${src}" width="114" height="80" class = "photo-image" >`
      $('.sells__sell__upload__drop__box').append(html)
    }
    fileReader.readAsDataURL(file);
  });

  $(document).on('click','.btn__delete', function(e){
    
    e.preventDefault();
    $(this).parent().remove();
  });

  
});

