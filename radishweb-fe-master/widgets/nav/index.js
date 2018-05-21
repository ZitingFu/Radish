(function (window, $, undefined) {
  $(function () {
    //nav active font-color   2018-3-20
    var navListName2 = window.location.pathname.split('/')[2];
    var navListName3 = window.location.pathname.split('/')[3];
    if(navListName3 =='index'){
      console.log('index--------------');
      $('.nav-index').addClass('active');
    }
    if(navListName3 == 'list'){
      $('.nav-list').addClass('active');
    }
    if(navListName2 == 'question'){
      if(navListName3 == 'create'){
        $('.nav-login').addClass('active');
        console.log('question-------------create')
      }
    }
    
    if(navListName3 == 'about'){
      $('.nav-about').addClass('active');
    }
    if(navListName3 == 'manual'){
      $('.nav-about').addClass('active');
    }
    if(navListName2 == 'advertise'){
      if(navListName3 == 'create'){
        $('.nav-about').addClass('active');
      }
    }


    //fa fa-caret-down
    $('.logined').hover(function () {
      $(this).find('i').attr('class','fa fa-caret-down');
    },function () {
      $(this).find('i').attr('class','fa fa-caret-right');
    });
    
    var pathname = location.pathname.slice(1);
    var module = pathname.split('/').pop();
    if(!module){
      module='index'
    }
    $('.wrapper-navbar ul li').removeClass('active');
    $('.wrapper-navbar ul li'+'.'+module).addClass('active');
    var footerheight = $('.footer').offset().top;
    if(footerheight < 530){
      $('.footer').addClass('posation'); 
    };
    
    
    var height = $(window).height();
    var contentheight = height - 333;
    $('.wrap-content').attr('style','min-height:'+contentheight+'px');


    
     
  })
})(window, $, undefined) ;