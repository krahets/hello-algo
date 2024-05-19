<?php

/**
 * File: array_deque.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* 基于环形数组实现的双向队列 */
class ArrayDeque
{
  private $nums; // 用于存储双向队列元素的数组
  private $front; // 队首指针，指向队首元素
  private $queSize; // 双向队列长度

  /* 构造方法 */
  public function __construct($capacity)
  {
    $this->nums = array_fill(0, $capacity, 0);
    $this->front = 0;
    $this->queSize = 0;
  }

  /* 获取双向队列的容量 */
  public function capacity()
  {
    return count($this->nums);
  }

  /* 获取双向队列的长度 */
  public function size()
  {
    return $this->queSize;
  }

  /* 判断双向队列是否为空 */
  public function isEmpty()
  {
    return $this->queSize === 0;
  }

  /* 计算环形数组索引 */
  private function index($i)
  {
    // 通过取余操作实现数组首尾相连
    // 当 i 越过数组尾部后，回到头部
    // 当 i 越过数组头部后，回到尾部
    return ($i + $this->capacity()) % $this->capacity();
  }

  /* 队首入队 */
  public function pushFirst($num)
  {
    if ($this->queSize === $this->capacity()) {
      echo '双向队列已满' . PHP_EOL;
      return;
    }
    // 队首指针向左移动一位
    // 通过取余操作实现 front 越过数组头部后回到尾部
    $this->front = $this->index($this->front - 1);
    // 将 num 添加至队首
    $this->nums[$this->front] = $num;
    $this->queSize++;
  }

  /* 队尾入队 */
  public function pushLast($num)
  {
    if ($this->queSize === $this->capacity()) {
      echo '双向队列已满' . PHP_EOL;
      return;
    }
    // 计算队尾指针，指向队尾索引 + 1
    $rear = $this->index($this->front + $this->queSize);
    // 将 num 添加至队尾
    $this->nums[$rear] = $num;
    $this->queSize++;
  }

  /* 队首出队 */
  public function popFirst()
  {
    $num = $this->peekFirst();
    // 队首指针向后移动一位
    $this->front = $this->index($this->front + 1);
    $this->queSize--;
    return $num;
  }

  /* 队尾出队 */
  public function popLast()
  {
    $num = $this->peekLast();
    $this->queSize--;
    return $num;
  }

  /* 访问队首元素 */
  public function peekFirst()
  {
    if ($this->isEmpty()) {
      throw new Error('The Deque Is Empty.');
    }
    return $this->nums[$this->front];
  }

  /* 访问队尾元素 */
  public function peekLast()
  {
    if ($this->isEmpty()) {
      throw new Error('The Deque Is Empty.');
    }
    // 计算尾元素索引
    $last = $this->index($this->front + $this->queSize - 1);
    return $this->nums[$last];
  }

  /* 返回数组用于打印 */
  public function toArray()
  {
    // 仅转换有效长度范围内的列表元素
    $res = [];
    for ($i = 0, $j = $this->front; $i < $this->queSize; $i++, $j++) {
      $res[$i] = $this->nums[$this->index($j)];
    }
    return $res;
  }
}

/* Driver Code */
/* 初始化双向队列 */
$deque = new ArrayDeque(10);
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
echo "队尾出队元素 = {$popLast}，队尾出队后 deque = [" . join(', ', $deque->toArray()) . "]" . PHP_EOL;
$popFirst = $deque->popFirst();
echo "队首出队元素 = {$popFirst}，队首出队后 deque = [" . join(', ', $deque->toArray()) . "]" . PHP_EOL;

/* 获取双向队列的长度 */
$size = $deque->size();
echo "双向队列长度 size = {$size}" . PHP_EOL;

/* 判断双向队列是否为空 */
$isEmpty = $deque->isEmpty();
$isEmptyStr = $isEmpty ? 'true' : 'false';
echo "双向队列是否为空 = {$isEmptyStr}" . PHP_EOL;
