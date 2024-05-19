<?php

/**
 * File: linkedlist_deque.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* 双向链表节点 */
class ListNode
{
  public $val; // 节点值
  public $next; // 后继节点引用
  public $prev; // 前驱节点引用

  /* 构造方法 */
  public function __construct($val)
  {
    $this->val = $val;
    $this->prev = null;
    $this->next = null;
  }
}

/* 基于双向链表实现的双向队列 */
class LinkedListDeque
{
  private $front; // 头节点 front
  private $rear; // 尾节点 rear
  private $queSize = 0; // 双向队列的长度

  /* 构造方法 */
  public function __construct()
  {
    $this->front = null;
    $this->rear = null;
  }

  /* 获取双向队列的长度 */
  public function size()
  {
    return $this->queSize;
  }

  /* 判断双向队列是否为空 */
  public function isEmpty()
  {
    return $this->size() === 0;
  }

  /* 入队操作 */
  private function push($num, $isFront)
  {
    $node = new ListNode($num);
    // 若链表为空，则令 front 和 rear 都指向 node
    if ($this->isEmpty()) {
      $this->front = $node;
      $this->rear = $node;
    }
    // 队首入队操作
    else if ($isFront) {
      // 将 node 添加至链表头部
      $this->front->prev = $node;
      $node->next = $this->front;
      $this->front = $node; // 更新头节点
    }
    // 队尾入队操作 
    else {
      // 将 node 添加至链表尾部
      $this->rear->next = $node;
      $node->prev = $this->rear;
      $this->rear = $node; // 更新尾节点
    }
    $this->queSize++; // 更新队列长度
  }

  /* 队首入队 */
  public function pushFirst($num)
  {
    $this->push($num, true);
  }

  /* 队尾入队 */
  public function pushLast($num)
  {
    $this->push($num, false);
  }

  /* 出队操作 */
  private function pop($isFront)
  {
    if ($this->isEmpty()) {
      throw new Exception('The Deque Is Empty.');
    }
    $val = 0;
    // 队首出队操作
    if ($isFront) {
      $val = $this->front->val; // 暂存头节点值
      // 删除头节点
      $fNext = $this->front->next;
      if ($fNext !== null) {
        $fNext->prev = null;
        $this->front->next = null;
      }
      $this->front = $fNext; // 更新头节点
    }
    // 队尾出队操作
    else {
      $val = $this->rear->val; // 暂存尾节点值
      // 删除尾节点
      $rPrev = $this->rear->prev;
      if ($rPrev !== null) {
        $rPrev->next = null;
        $this->rear->prev = null;
      }
      $this->rear = $rPrev; // 更新尾节点
    }
    $this->queSize--; // 更新队列长度
    return $val;
  }

  /* 队首出队 */
  public function popFirst()
  {
    return $this->pop(true);
  }

  /* 队尾出队 */
  public function popLast()
  {
    return $this->pop(false);
  }

  /* 访问队首元素 */
  public function peekFirst()
  {
    if ($this->isEmpty()) {
      throw new Exception('The Deque Is Empty.');
    }
    return $this->front->val;
  }

  /* 访问队尾元素 */
  public function peekLast()
  {
    if ($this->isEmpty()) {
      throw new Exception('The Deque Is Empty.');
    }
    return $this->rear->val;
  }

  /* 返回数组用于打印 */
  public function toArray()
  {
    $node = $this->front;
    $res = [];
    $length = $this->size();
    for ($i = 0; $i < $length; $i++) {
      $res[$i] = $node->val;
      $node = $node->next;
    }
    return $res;
  }
}

/* Driver Code */
/* 初始化双向队列 */
$deque = new LinkedListDeque();
$deque->pushLast(3);
$deque->pushLast(2);
$deque->pushLast(5);
echo '双向队列 deque = [' . join(', ', $deque->toArray()) . ']' . PHP_EOL;

/* 访问元素 */
$peekFirst = $deque->peekFirst();
echo "队首元素 peekFirst = {$peekFirst}" . PHP_EOL;
$peekLast = $deque->peekLast();
echo "队尾元素 peekLast = {$peekLast}" . PHP_EOL;

/* 元素入队 */
$deque->pushLast(4);
echo '元素 4 队尾入队后 deque = [' . join(', ', $deque->toArray()) . ']' . PHP_EOL;
$deque->pushFirst(1);
echo '元素 1 队首入队后 deque = [' . join(', ', $deque->toArray()) . ']' . PHP_EOL;

/* 元素出队 */
$popLast = $deque->popLast();
echo "队尾出队元素 = {$popLast}，队尾出队后 deque = [" . join(', ', $deque->toArray()) . ']' . PHP_EOL;
$popFirst = $deque->popFirst();
echo "队首出队元素 = {$popFirst}，队首出队后 deque = [" . join(', ', $deque->toArray()) . ']' . PHP_EOL;

/* 获取双向队列的长度 */
$size = $deque->size();
echo "双向队列长度 size = {$size}" . PHP_EOL;

/* 判断双向队列是否为空 */
$isEmpty = $deque->isEmpty();
$isEmptyStr = $isEmpty ? 'true' : 'false';
echo "双向队列是否为空 = {$isEmptyStr}" . PHP_EOL;
