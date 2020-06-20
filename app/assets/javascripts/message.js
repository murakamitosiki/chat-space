$(function(){ 
  function buildHTML(message){
   if ( message.image ) {
     var html =
      `<div class="main__center__message">
         <div class="main__center__message__info">
           <div class="main__center__message__info__user">
             ${message.user_name}
           </div>
           <div class="main__center__message__info__date">
             ${message.created_at}
           </div>
         </div>
         <div class="main__center__message__text">
           <p class="lower-message__content">
             ${message.content}
           </p>
         </div>
         <img src=${message.image} >
       </div>`
     return html;
   } else {
     var html =
     `<div class="main__center__message">
         <div class="main__center__message__info">
           <div class="main__center__message__info__user">
             ${message.user_name}
           </div>
           <div class="main__center__message__info__date">
             ${message.created_at}
           </div>
         </div>
         <div class="main__center__message__text">
           <p class="lower-message__content">
             ${message.content}
           </p>
         </div>
       </div>`
     return html;
   };
 }
$('#new_message').on('submit', function(e){
 e.preventDefault();
 var formData = new FormData(this);
 var url = $(this).attr('action')
 $.ajax({
   url: url,
   type: "POST",
   data: formData,
   dataType: 'json',
   processData: false,
   contentType: false
 })
  .done(function(data){
    var html = buildHTML(data);
    $('.messages').append(html);
    $('.main__center').animate({ scrollTop: $('.main__center')[0].scrollHeight});
    $('form')[0].reset();
  })
  .always(function(){
    $('.main__bottom__text__send').prop('disabled', false);//連続でボタンをおす記述
  })
})
});