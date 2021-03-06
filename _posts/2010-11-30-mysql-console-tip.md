---
title: MySQL console tip
date: 2010-11-30T20:31:48+00:00
author: Ben
layout: post
permalink: /2010/11/30/mysql-console-tip/
categories:
  - MySQL
tags:
  - console
  - database
  - Rails
  - sql
  - terminal
---
If you terminate statements with `\G` instead of `;`, the MySQL console will print the result set vertically rather than as a horizontal table.

For example, instead of:

```
+----+--------+--------+
| id | foo_id | bar_id |
+----+--------+--------+
| 1  | 6      | 2      |
+----+--------+--------+
```

You will have:

```
*************************** 1. row ***************************
                         id: 186
                     foo_id: 6
                     bar_id: 2
```

It&#8217;s really useful for wide tables, or ones with text columns.

I&#8217;m always surprised that the MySQL docs don&#8217;t make it easier to find this -- it&#8217;s one of the better tricks for using the database console.