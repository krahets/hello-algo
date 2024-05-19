<?php

/**
 * File: linkedlist_stack.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

require_once '../utils/ListNode.php';

/* 基于链表实现的栈 */
class LinkedListStack
{
  private $stackPeek; // 将头节点作为栈顶
  private $stkSize = 0; // 栈的长度

  /* 构造方法 */
  public function __construct()
  {
    $this->stackPeek = null;
  }

  /* 获取栈的长度 */
  public function size()
  {
    return $this->stkSize;
  }

  /* 判断栈是否为空 */
  public function isEmpty()
  {
    return $this->size() === 0;
  }

  /* 入栈 */
  public function push($num)
  {
    $node = new ListNode($num);
    $node->next = $this->stackPeek;
    $this->stackPeek = $node;
    $this->stkSize++;
  }

  /* 出栈 */
  public function pop()
  {
    $num = $this->peek();
    $this->stackPeek = $this->stackPeek->next;
    $this->stkSize--;
    return $num;
  }

  /* 访问栈顶元素 */
  public function peek()
  {
    if ($this->isEmpty()) {
      throw new Exception('The Stack Is Empty.');
    }
    return $this->stackPeek->val;
  }

  /* 将 List 转化为 Array 并返回 */
  public function toArray()
  {
    $node = $this->stackPeek;
    $length = $this->size();
    $res = array_fill(0, $length, 0);
    for ($i = $length - 1; $i >= 0; $i--) {
      $res[$i] = $node->val;
      $node = $node->next;
    }
    return $res;
  }
}

/* Driver Code */
/* 初始化栈 */
$stack = new LinkedListStack();

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
