<?php

/**
 * File: linkedlist_queue.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

require_once '../utils/ListNode.php';

/* 基于链表实现的队列 */
class LinkedListQueue
{
  private $front; // 头节点 front
  private $rear; // 尾节点 rear
  private $queSize = 0;

  /* 构造方法 */
  public function __construct()
  {
    $this->front = null;
    $this->rear = null;
  }

  /* 获取队列的长度 */
  public function size()
  {
    return $this->queSize;
  }

  /* 判断队列是否为空 */
  public function isEmpty()
  {
    return $this->size() === 0;
  }

  /* 入队 */
  public function push($num)
  {
    // 在尾节点后添加 num
    $node = new ListNode($num);
    // 如果队列为空，则令头、尾节点都指向该节点
    if ($this->front === null) {
      $this->front = $node;
      $this->rear = $node;
    }
    // 如果队列不为空，则将该节点添加到尾节点后
    else {
      $this->rear->next = $node;
      $this->rear = $node;
    }
    $this->queSize++;
  }

  /* 出队 */
  public function pop()
  {
    $num = $this->peek();
    // 删除头节点
    $this->front = $this->front->next;
    $this->queSize--;
    return $num;
  }

  /* 访问队首元素 */
  public function peek()
  {
    if ($this->isEmpty()) {
      throw new Exception('The Queue Is Empty.');
    }
    return $this->front->val;
  }

  /* 将链表转化为 Array 并返回 */
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
/* 初始化队列 */
$queue = new LinkedListQueue();

/* 元素入队 */
$queue->push(1);
$queue->push(3);
$queue->push(2);
$queue->push(5);
$queue->push(4);
echo '队列 queue = [' . join(', ', $queue->toArray()) . ']' . PHP_EOL;

/* 访问队首元素 */
$peek = $queue->peek();
echo "队首元素 peek = {$peek}" . PHP_EOL;

/* 元素出队 */
$pop = $queue->pop();
echo "出队元素 pop = {$pop}，出队后 queue = [" . join(', ', $queue->toArray()) . ']' . PHP_EOL;

/* 获取队列的长度 */
$size = $queue->size();
echo "队列长度 size = {$size}" . PHP_EOL;

/* 判断队列是否为空 */
$isEmpty = $queue->isEmpty();
$isEmptyStr = $isEmpty ? 'true' : 'false';
echo "队列是否为空 = {$isEmptyStr}" . PHP_EOL;
