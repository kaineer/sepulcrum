--- html:page
{html:doctype}
<html>
{html:head}
{html:body}
</html>
--- html:doctype
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
--- html:head
<head>
  <title>%title%</title>
{html:head:meta.ru}
%html:style%
</head>
--- html:style:inline
  <style type="text/css">
%contents%
  </style>
--- html:style:link
  <link rel="stylesheet" href="%stylesheet%" type="text/css" />
--- html:head:meta.ru
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="Content-Language" content="ru" />
--- html:body
<body>
%contents%
</body>
---
