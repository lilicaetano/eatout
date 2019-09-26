import 'jquery';

const initFakeNotify = () => {
  let foo = $('#fake-notification');
  if (foo){
    setTimeout(function(){
      foo.html('<h2>fooooo</h2>');
      foo.class('')
    }, 2);
  }
}

export { initFakeNotify }
