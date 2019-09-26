import 'jquery';

const initFakeNotify = () => {
  let foo = $('#fake-notification');
  if (foo){
    foo.hide();
    setTimeout(function(){

      foo.append('<h2>fooooo</h2>');
      foo.addClass('fake');
      foo.fadeIn(500);
    }, 1000);
  }
}

export { initFakeNotify }
