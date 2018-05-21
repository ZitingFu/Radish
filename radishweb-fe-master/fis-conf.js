// // 基础配置

// const APP = 'radishweb'; // APP的名称，根据项目的实际情况来制定

// //本地环境
// const lc_root = 'F:\\WWW\\'; //本地网站目录
// const lc_url = '/';

// //QA环境
// //const qa_tpl_receiver = 'http://123.57.146.16:8080/receiver.php';
// //const qa_img_receiver = 'http://123.57.146.16:8080/receiver2.php';
// const qa_tpl_receiver = 'http://dev.yunbix.cn/receiver.php';
// const qa_img_receiver = 'http://dev.yunbix.cn/receiver2.php';
// const qa_tpldir = '/home/work/pdp/template/' + APP;
// const qa_cdn = '//img1.yunbix.cn/';
// const qa_webroot = APP;
// const qa_url = '/' + APP;

// //线上环境
// const ol_cdn = '//img1.yunbix.com';
// const ol_root = 'output/';
// const ol_url = '/' + APP;





// 基础配置

const APP = 'radishweb'; // APP的名称，根据项目的实际情况来制定

//本地环境
const lc_root = 'D:\\WWW\\'; //本地网站目录
const lc_url = '/';

//QA环境
//const qa_tpl_receiver = 'http://123.57.146.16:8080/receiver.php';
//const qa_img_receiver = 'http://123.57.146.16:8080/receiver2.php';
//const qa_tpl_receiver = 'http://dev.yunbix.cn/receiver.php';
//const qa_img_receiver = 'http://dev.yunbix.cn/receiver2.php';
const qa_tpl_receiver = 'http://qa.xluob.com:8080/receiver.php';
const qa_img_receiver = 'http://qa.xluob.com:8080/receiver4.php';
const qa_tpldir = '/home/work/pdp/template/' + APP;
const qa_cdn = '//img.qa.xluob.com/';
const qa_webroot = APP;
const qa_url = '/' + APP; 
//QB环境
const qb_tpl_receiver = 'http://qa.xluob.com:8080/receiver.php';
const qb_img_receiver = 'http://qa.xluob.com:8080//receiver.php';
const qb_tpldir = '/home/work/pdp2/template/' + APP;
const qb_cdn = 'http://01.d.yunbix.cn/';
const qb_webroot = APP;
const qb_url = '/' + APP;
 
//线上环境
const ol_cdn = '//rd.xluob.com';
const ol_root = 'output/';
const ol_url = '/' + APP;


////////////////////////////////////
////////////////////////////////////
// 以下配置为当前目录的基本配置
// 一般情况下不用更改
// 注意：每个类别都需要独立配置才行

// 默认基础配置
//fis.set('project.ignore', );
fis
 .match('*.js', {
    optimizer: fis.plugin('uglify-js')
  })
  .match('*.css', {
    optimizer: fis.plugin('clean-css')
  });
//  .match('*.{png,jpg,gif}', {
//    optimizer: fis.plugin('png-compressor')
//  })


// 开发环境配置
fis.media('dev')
  //TPL JSON
  .match('*.{tpl,json}', {
    deploy: fis.plugin('local-deliver', {
      to: lc_root + APP
//    to: 'D:\\WWW\\guirenli'
    })
  })
///libs/font-awesome-4.1.0/fonts/fontawesome-webfont.ttf?v=4.3.0
  .match('*.{woff,ttf,woff2,otf,eot,svg,png,jpg,gif,css,js}', {
    deploy: fis.plugin('local-deliver', {
      to: lc_root + APP + '\\static'
    }),
    url: lc_url + APP + '/static$0',
    //optimizer: fis.plugin('png-compressor')
  })
  //ALL
  .match('**', {
    useHash: false
  });

// 联调环境配置
fis
  .media('qa')
  .match('**', {
    useHash: true,
    domain: qa_cdn
  })
  .match('*.tpl', {
    deploy: fis.plugin('http-push', {
      receiver: qa_tpl_receiver,
      to: qa_tpldir
    }),
    useHash: false
  })
  .match('*.{woff,ttf,woff2,otf,eot,svg,png,jpg,gif,css,js}', {
    deploy: fis.plugin('http-push', {
      receiver: qa_img_receiver,
      to: APP + '/static'
    }),
    url: APP + '/static$0'
  });

// 线上环境配置
fis.media('production')
  .match('**', {
    useHash: true,
    domain: ol_cdn
  })
  .match('*.tpl', {
    useHash: false
  })
  .match('*.js', {
    deploy: fis.plugin('local-deliver', {
      to: ol_root + APP + '/is'
    }),
    optimizer: fis.plugin('uglify-js'),
    url: ol_url + '/js$0'
  })
  .match('*.css', {
    deploy: fis.plugin('local-deliver', {
      to: ol_root + APP + '/css'
    }),
    optimizer: fis.plugin('clean-css'),
    url: ol_url + '/css$0'
  })

  .match('*.{png,jpg,gif}', {
    deploy: fis.plugin('local-deliver', {
      to: ol_root + APP + '/image'
    }),
    optimizer: fis.plugin('png-compressor'),
    url: ol_url + '/image$0',
  });


