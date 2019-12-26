$(function(){
 
  var file_field = document.querySelector('input[type=file]')

  $('.sells__sell__upload__items__container').change(function(){
 
    var file = $('input[type="file"]').prop('files')[0];
  
    var fileReader = new FileReader();
    
    fileReader.onloadend = function() {
      var src = fileReader.result
      var html= `<img src="${src}" width="114" height="110">`
     
      $('.sells__visible__pc').before(html);
    }
    fileReader.readAsDataURL(file);
  });
});