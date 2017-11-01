---
id: 294
title: Name of calling class using static methods in PHP
date: 2007-11-05T14:53:39+00:00
author: Ben
layout: post
guid: http://www.benjaminoakes.com/?p=294
permalink: /2007/11/05/name-of-calling-class-using-static-methods-in-php/
categories:
  - PHP
  - Programming
---
From [my question on PHPBuilder](http://board.phpbuilder.com/showthread.php?10347048-Name-of-calling-class-using-static-methods):

> I&#8217;m trying to find the name of the current class when calling a static method. To illustrate, let me define a few classes:
> 
> <pre><code class="php">abstract class AbstractClass
{
  public function foo()
  {
    return class_name($this);
    # class_name(); gives just "AbstractClass"
  }

  public static function bar()
  {
    return class_name($this);
  }
}

class ConcreteClassOne extends AbstractClass
{
  public function test_non_static()
  {
     return foo();  # gives "ConcreteClassOne"
  }

  public static function test_static()
  {
     # doesn't work because there's not an instance of the class, obviously
     # However, I would like to find a way of getting "ConcreteClassOne" as the return value in this context
     return bar();
  }
}

class ConcreteClassTwo extends AbstractClass
{
  public function test_non_static()
  {
     return foo();  # gives "ConcreteClassTwo"
  }

  public static function test_static()
  {
     # See above
     return bar();
  }
}
</code></pre>
> 
> Any ideas on how to get the desired behavior? Being able to do this would really &#8220;DRY up&#8221; my code, but I can&#8217;t seem to find a way to do it&#8211;nothing that I&#8217;ve googled for or tried has yielded any results so far. 

> The reason for this is that I want to use that name in the function. I&#8217;m making an implementation of the Active Record design pattern. The classes specify the table names. So, for a subclass named &#8220;Ticket&#8221;, the table name is &#8220;tickets&#8221;. Say I&#8217;m implementing a static function called &#8220;count&#8221;, called like so:
> 
> <pre><code class="php">Ticket::count();
</code></pre>
> 
> It needs to execute a query like this:
> 
> <pre><code class="sql">select count(id) from tickets;
</code></pre>
> 
> There are other subclasses of this Active Record class, such as User:
> 
> <pre><code class="php">User::count();
</code></pre>
> 
> <pre><code class="sql">select count(id) from users;
</code></pre>
> 
> So on and so forth.