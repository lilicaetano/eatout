import 'jquery';

const initFakeNotify = () => {
  console.log('loaded')
  let foo = document.getElementById('fake-notification');
  if (foo){
    console.log('in');
    setTimeout(function(){
      $('#fake-notification').html("ARRRRRRGGGHHH");
    }, 10);

    console.log('out');
  }
}

export { initFakeNotify }
