--- html:doctype
<!DOCTYPE HTML PUBLIC 
  "-//W3C//DTD XHTML 1.0 Transitional//EN" 
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
--- html:page
{html:doctype}
<html xml:lang="ru" xmlns="http://www.w3.org/1999/xhtml" lang="ru">
{html:head}
{html:body}
</html>
--- html:meta.ru
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Language" content="ru">
--- html:head
<head>
<title>%title%</title>
{html:meta.ru}
{html:stylesheets}
{html:javascripts}
%custom.javascript%
</head>
--- html:stylesheets
<link rel="stylesheet" href="/stylesheets/blueprint/screen.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/stylesheets/blueprint/print.css" type="text/css" media="print" />
<!--[if lt IE 8]><link rel="stylesheet" href="/stylesheets/blueprint/ie.css" type="text/css" media="screen, projection"><![endif]-->

<link rel="stylesheet" href="/stylesheets/screen.css" type="text/css" />
--- html:javascripts
<script src="/javascripts/jquery.js" />
--- html:body
<body>
%content%
</body>
---
