import 'jquery';

const initFakeNotify = () => {
  let foo = $('#fake-notification');
  if (foo){
    foo.hide();
    setTimeout(function(){

      foo.append('<h3>Your host has accepted your request to join!</h3>');
      foo.addClass('fake');
      foo.fadeIn(500);
    }, 7000);
  }
}

export { initFakeNotify }
