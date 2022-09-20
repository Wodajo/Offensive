Login failed. Please try again. - for `hydra`
Name of service is `Webmin`

****
`nc -vn 10.10.42.179 10000`
```
10.10.42.179 10000 (ndmp) open
GET index.html
HTTP/1.0 200 Document follows
Server: MiniServ/1.890
Date: Tue, 20 Sep 2022 17:15:00 GMT
Content-type: text/html; Charset=iso-8859-1
Connection: close

<h1>Error - Document follows</h1>
<p>This web server is running in SSL mode. Try the URL <a href='https://ip-10-10-42-179.eu-west-1.compute.internal:10000/'>https://ip-10-10-42-179.eu-west-1.compute.internal:10000/</a> instead.<br></p>
```
or in `browser`
```
This web server is running in SSL mode.
```

so it has to be ran with `SSL`:
connect with `https://10.10.42.179:10000`

After login fail:
``` Response
<!DOCTYPE HTML>
<html data-background-style="gainsboro" class="session_login">
<head>
 <noscript> <style> html[data-background-style="gainsboro"] { background-color: #d6d6d6; } html[data-background-style="nightRider"] { background-color: #1a1c20; } html[data-background-style="nightRider"] div[data-noscript] { color: #979ba080; } html[data-slider-fixed='1'] { margin-right: 0 !important; } body > div[data-noscript] ~ * { display: none !important; } div[data-noscript] { visibility: hidden; animation: 2s noscript-fadein; animation-delay: 1s; text-align: center; animation-fill-mode: forwards; } @keyframes noscript-fadein { 0% { opacity: 0; } 100% { visibility: visible; opacity: 1; } } </style> <div data-noscript> <div class="fa fa-3x fa-exclamation-triangle margined-top-20 text-danger"></div> <h2>JavaScript is disabled</h2> <p>Please enable javascript and refresh the page</p> </div> </noscript>
<meta charset="utf-8">
<title>Login to Webmin</title>
<link rel="shortcut icon" href="/images/favicon-webmin.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/unauthenticated/css/bundle.min.css?1919999999999911" rel="stylesheet">
<script>setTimeout(function(){var a=document.querySelectorAll('input[type="password"]');i=0;
for(length=a.length;i<length;i++){var b=document.createElement("span"),d=30<a[i].offsetHeight?1:0;b.classList.add("input_warning_caps");b.setAttribute("title","Caps Lock");d&&b.classList.add("large");a[i].classList.add("use_input_warning_caps");a[i].parentNode.insertBefore(b,a[i].nextSibling);a[i].addEventListener("blur",function(){this.nextSibling.classList.remove("visible")});a[i].addEventListener("keydown",function(c){"function"===typeof c.getModifierState&&((state=20===c.keyCode?!c.getModifierState("CapsLock"):
c.getModifierState("CapsLock"))?this.nextSibling.classList.add("visible"):this.nextSibling.classList.remove("visible"))})};},100);function spinner() {var x = document.querySelector('.fa-sign-in:not(.invisible)'),s = '<span class="cspinner_container"><span class="cspinner"><span class="cspinner-icon white small"></span></span></span>';if(x){x.classList.add("invisible"); x.insertAdjacentHTML('afterend', s);x.parentNode.classList.add("disabled");x.parentNode.disabled=true}}</script> <link href="/unauthenticated/css/fonts-roboto.min.css?1919999999999911" rel="stylesheet">
</head>
<body class="session_login">
<div class="container session_login" data-dcontainer="1">
<div class="alert alert-warning">
<strong><i class ="fa fa-exclamation-triangle"></i> Warning!</strong><br />
<span>Login failed. Please try again.</span>
</div>

<form method="post" target="_top" action="/session_login.cgi" class="form-signin session_login clearfix" role="form" onsubmit="spinner()">
<i class="wbm-webmin"></i><h2 class="form-signin-heading">
     <span>Webmin</span></h2>
<p class="form-signin-paragraph">You must enter a username and password to login to the server on<strong> 10.10.42.179</strong></p>
<div class="input-group form-group">
<span class="input-group-addon"><i class="fa fa-fw fa-user"></i></span>
<input type="text" class="form-control session_login" name="user" autocomplete="off" autocapitalize="none" placeholder="Username"  autofocus>
</div>
<div class="input-group form-group">
<span class="input-group-addon"><i class="fa fa-fw fa-lock"></i></span>
<input type="password" class="form-control session_login" name="pass" autocomplete="off" placeholder="Password"  >
</div>
<div class="input-group form-group">
            <span class="awcheckbox awobject"><input class="iawobject" name="save" value="1" id="save" type="checkbox"> <label class="lawobject" for="save">Remember me</label></span>
         </div>
<div class="form-group form-signin-group"><button class="btn btn-primary" type="submit"><i class="fa fa-sign-in"></i>&nbsp;&nbsp;Sign in</button>
</div></form>
</div>
</body>
</html>
```

