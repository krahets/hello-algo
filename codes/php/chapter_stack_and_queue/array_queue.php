<?php

/**
 * File: array_queue.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* 基于环形数组实现的队列 */
class ArrayQueue
{
  private $nums; // 用于存储队列元素的数组
  private $front; // 队首指针，指向队首元素
  private $queSize; // 队列长度

  /* 构造方法 */
  public function __construct($capacity)
  {
    $this->nums = array_fill(0, $capacity, 0);
    $this->front = 0;
    $this->queSize = 0;
  }

  /* 获取队列的容量 */
  public function capacity()
  {
    return count($this->nums);
  }

  /* 获取队列的长度 */
  public function size()
  {
    return $this->queSize;
  }

  /* 判断队列是否为空 */
  public function isEmpty()
  {
    return $this->queSize === 0;
  }

  /* 入队 */
  public function push($num)
  {
    if ($this->queSize === $this->capacity()) {
      echo '队列已满' . PHP_EOL;
      return;
    }
    // 计算队尾指针，指向队尾索引 + 1
    // 通过取余操作实现 rear 越过数组尾部后回到头部
    $rear = ($this->front + $this->queSize) % $this->capacity();
    // 将 num 添加至队尾
    $this->nums[$rear] = $num;
    $this->queSize++;
  }

  /* 出队 */
  public function pop()
  {
    $num = $this->peek();
    // 队首指针向后移动一位，若越过尾部，则返回到数组头部
    $this->front = ($this->front + 1) % $this->capacity();
    $this->queSize--;
    return $num;
  }

  /* 访问队首元素 */
  public function peek()
  {
    if ($this->isEmpty()) {
      throw new Exception('The Quque Is Empty.');
    }
    return $this->nums[$this->front];
  }

  /* 返回数组 */
  public function toArray()
  {
    // 仅转换有效长度范围内的列表元素
    $res = [];
    for ($i = 0, $j = $this->front; $i < $this->queSize; $i++, $j++) {
      $res[$i] = $this->nums[$j % $this->capacity()];
    }
    return $res;
  }
}

/* Driver Code */
/* 初始化队列 */
$capacity = 10;
$queue = new ArrayQueue($capacity);

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
echo "出队元素 pop = {$pop}，出队后 queue = [" . join(', ', $queue->toArray()) . "]" . PHP_EOL;

/* 获取队列的长度 */
$size = $queue->size();
echo "队列长度 size = {$size}" . PHP_EOL;

/* 判断队列是否为空 */
$isEmpty = $queue->isEmpty();
$isEmptyStr = $isEmpty ? 'true' : 'false';
echo "队列是否为空 = {$isEmptyStr}" . PHP_EOL;

/* 测试环形数组 */
for ($i = 0; $i < 10; $i++) {
  $queue->push($i);
  $queue->pop();
  echo "第 {$i} 轮入队 + 出队后 queue = [" . join(', ', $queue->toArray()) . "]" . PHP_EOL;
}
