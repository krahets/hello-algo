<?php

/**
 * File: array_stack.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* 基于数组实现的栈 */
class ArrayStack
{
  private $stack;

  /* 构造方法 */
  public function __construct()
  {
    // 初始化列表（动态数组）
    $this->stack = [];
  }

  /* 获取栈的长度 */
  public function size()
  {
    return count($this->stack);
  }

  /* 判断栈是否为空 */
  public function isEmpty()
  {
    return $this->size() === 0;
  }

  /* 入栈 */
  public function push($num)
  {
    array_push($this->stack, $num);
  }

  /* 出栈 */
  public function pop()
  {
    if ($this->isEmpty()) {
      throw new Exception('The Stack Is Empty.');
    }
    return array_pop($this->stack);
  }

  /* 访问栈顶元素 */
  public function peek()
  {
    if ($this->isEmpty()) {
      throw new Exception('The Stack Is Empty.');
    }
    return end($this->stack);
  }

  /* 将 List 转化为 Array 并返回 */
  public function toArray()
  {
    return $this->stack;
  }
}

/* Driver Code */
/* 初始化栈 */
$stack = new ArrayStack();

/* 元素入栈 */
$stack->push(1);
$stack->push(3);
$stack->push(2);
$stack->push(5);
$stack->push(4);
echo '栈 stack = [' . join(', ', $stack->toArray()) . ']' . PHP_EOL;

/* 访问栈顶元素 */
$peek = $stack->peek();
echo "栈顶元素 peek = {$peek}" . PHP_EOL;

/* 元素出栈 */
$pop = $stack->pop();
echo "出栈元素 pop = {$pop}，出栈后 stack = [" . join(', ', $stack->toArray()) . ']' . PHP_EOL;

/* 获取栈的长度 */
$size = $stack->size();
echo "栈的长度 size = {$size}" . PHP_EOL;

/* 判断是否为空 */
$isEmpty = $stack->isEmpty();
$isEmptyStr = $isEmpty ? 'true' : 'false';
echo "栈是否为空 = {$isEmptyStr}" . PHP_EOL;
