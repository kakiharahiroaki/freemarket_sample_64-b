


// $(function() {
//   $('input[type=file]').after('<span></span>');

//   // アップロードするファイルを選択
//   $('input[type=file]').change(function() {
//     var file = $(this).prop('files')[0];

//     // 画像以外は処理を停止
//     if (! file.type.match('image.*')) {
//       // クリア
//       $(this).val('');
//       $('.sells__sell__upload__items__container').html('');
//       return;
//     }

//     // 画像表示
//     var reader = new FileReader();
//     reader.onload = function() {
//       var img_src = $('<img>').attr('src', reader.result);
//       $('.sells__sell__upload__items__container').html(img_src);
//     }
//     reader.readAsDataURL(file);
//   });
// });

// $(function() {
//   $('input[type=file]').after('<span></span>');

//   // アップロードするファイルを複数選択
//   $('input[type=file]').change(function() {
//     $('.sells__sell__upload__items__container').html('');
//     var file = $(this).prop('files');


//     var img_count = 1;
//     $(file).each(function(i) {
//       // 5枚まで
//       if (img_count > 5) {
//         return false;
//       }

//       if (! file[i].type.match('image.*')) {
//         $(this).val('');
//         $('.sells__sell__upload__items__container').html('');
//         return;
//       }

//       var reader = new FileReader();
//       reader.onload = function() {
//         var img_src = $('<img>').attr('src', reader.result);
//         $('.sells__sell__upload__items__container').append(img_src);
//       }
//       reader.readAsDataURL(file[i]);
      
//       img_count = img_count + 1
//     });
//   });
// });

// 

// $(function(){
//   const uploadItems = '#sell-upload__containar__items';
//   const uploadDropBox = '#sell-upload__drop-box';

//   // 画像アップロード時プレビュー表示
//   $('#item_images').on('change', function(e){
//     console.log('発火')
//     //ファイルオブジェクトを取得する
//     let files = e.target.files;
//     $.each(files, function(index, file) {
//       let reader = new FileReader();
//       //画像でない場合は処理終了
//       if(file.type.indexOf("image") < 0){
//         alert("画像ファイルを指定してください。");
//         return false;
//       }
//       //アップロードした画像を設定する
//       reader.onload = (function(file){
//         return function(e){
//           let itemLength = $(uploadItems).children('li').length;
//           if (itemLength == 10) {
//             return false;
//           } else {
//             $(uploadItems).append(`          
//             <li class='sell-upload__containar__image'>
//               <figure class='sell-upload__containar__figure'>
//                 <img src='${e.target.result}'title='${file.name}' class='for-crop-class'>
//               </figure>
//               <div class='sell-upload__containar__button'>
//                 <div class='sell-upload__containar__button--edit'>編集</div>
//                 <div class='sell-upload__containar__button--delete' id="sell-upload__containar__button--delete">削除</div>
//               </div>
//             </li>
//             `);
//           $(uploadItems).removeClass().addClass(`sell-upload__containar__items sell-upload__containar__items--have-item-${(itemLength + 1) % 5}`);
//           if (itemLength == 9){
//             $(uploadDropBox).removeClass().addClass(`sell-upload state-image-number-10`);
//           } else{
//           $(uploadDropBox).removeClass().addClass(` sell-upload__drop-box sell-upload__drop-box--have-item-${(itemLength + 1) % 5}`);
//           }
//         }};
//       })(file);
//       reader.readAsDataURL(file);
//     });
//   });
// //画像プレビューから削除
// $(document).on('click', '.sell-upload__containar__button--delete', function(){
//   $(this).parents('.sell-upload__containar__image').remove();
//   let uploadItemLength = $(uploadItems).children('li').length;
//   $(uploadItems).removeClass().addClass(`sell-upload__containar__items sell-upload__containar__items--have-item-${uploadItemLength % 5}`);
//   $(uploadDropBox).removeClass().addClass(`sell-upload__drop-box sell-upload__drop-box--have-item-${uploadItemLength % 5}`);
// });
// });






// $(function(){
//   //DataTransferオブジェクトで、データを格納する箱を作る
//   var dataBox = new DataTransfer();
//   //querySelectorでfile_fieldを取得
//   var file_field = document.querySelector('input[type=file]')
//   //fileが選択された時に発火するイベント
//   $('#post_img_last').change(function(){
//     //選択したfileのオブジェクトをpropで取得
//     var files = $('input[type="file"]').prop('files')[0];
//     $.each(this.files, function(i, file){
//       //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
//       var fileReader = new FileReader();

//       //DataTransferオブジェクトに対して、fileを追加
//       dataBox.items.add(file)
//       //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
//       file_field.files = dataBox.files

//       var num = $('.item-image').length + 1 + i
//       fileReader.readAsDataURL(file);
// 　　　 //画像が10枚になったら超えたらドロップボックスを削除する
//       if (num == 10){
//         $('sell-main__upload-drop-bo').css('display', 'none')   
//       }
//       //読み込みが完了すると、srcにfileのURLを格納
//       fileReader.onloadend = function() {
//         var src = fileReader.result
//         var html= `<div class='item-image' data-image="${file.name}">
//                     <div class=' item-image__content'>
//                       <div class='item-image__content--icon'>
//                         <img src=${src} width="114" height="80" >
//                       </div>
//                     </div>
//                     <div class='item-image__operetion'>
//                       <div class='item-image__operetion--delete'>削除</div>
//                     </div>
//                   </div>`
//         //image_box__container要素の前にhtmlを差し込む
//         $('.sells__sell__upload__items__container').before(html);
//       };
//       //image-box__containerのクラスを変更し、CSSでドロップボックスの大きさを変えてやる。
//       $('.sells__sell__upload__items__container').attr('class', `item-num-${num}`)
//     });
//   });
//   //削除ボタンをクリックすると発火するイベント
//   $(document).on("click", '.item-image__operetion--delete', function(){
//     //プレビュー要素を取得
//     var target_image = $(this).parent().parent()
//     //プレビューを削除
//     target_image.remove();
//     //inputタグに入ったファイルを削除
//     file_field.val("")
//   })
// });






// $(function(){
//   //querySelectorでfile_fieldを取得
//   var file_field = document.querySelector('input[type=file]')
//   //fileが選択された時に発火するイベント
//   $('.sell-main__upload-drop-file').change(function(){
//     //選択したfileのオブジェクトをpropで取得
//     var file = $('input[type="file"]').prop('files')[0];
//     //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
//     var fileReader = new FileReader();
//     // inputs.push($(this));
//     var img = $('<div class= "img_view"><img></div>');
//     //読み込みが完了すると、srcにfileのURLを格納
//     var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
//     $('.sells__sell__upload__drop__box').append(btn_wrapper);
//     $(".btn_wrapper").css('color', 'blue');
//     $(".btn_wrapper").css('display', 'flex');
//     fileReader.onloadend = function() {
//       var src = fileReader.result
//       var html= '<img src="${src}" width="114" height="80">'
//       //image_box__container要素の前にhtmlを差し込む
//       $('.sells__sell__upload__drop__box').append(html);
//     }
//     fileReader.readAsDataURL(file);
//   });
// });


// $(function(){
//   //querySelectorでfile_fieldを取得
//   var file_field = document.querySelector('input[type=file]')
//   //fileが選択された時に発火するイベント
//   $('.sells__sell__upload__items__container').change(function(){
//     //選択したfileのオブジェクトをpropで取得
//     var file = $('input[type="file"]').prop('files')[0];
//     //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
//     var fileReader = new FileReader();
//     //読み込みが完了すると、srcにfileのURLを格納
//     fileReader.onloadend = function() {
//       var src = fileReader.result
//       var html= `<img src="${src}" width="114" height="110">`
//       //image_box__container要素の前にhtmlを差し込む
//       $('.sells__visible__pc').before(html);
//     }
//     fileReader.readAsDataURL(file);
//   });
// });