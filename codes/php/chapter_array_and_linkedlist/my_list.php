<?php

/**
 * File: my_list.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* 列表类 */
class MyList
{
  private $arr = []; // 数组（存储列表元素）
  private $capacity = 10; // 列表容量
  private $size = 0; // 列表长度（当前元素数量）
  private $extendRatio = 2; // 每次列表扩容的倍数

  /* 构造方法 */
  public function __construct()
  {
    $this->arr = array_fill(0, $this->capacity, 0);
  }

  /* 获取列表长度（当前元素数量） */
  public function size()
  {
    return $this->size;
  }

  /* 获取列表容量 */
  public function capacity()
  {
    return $this->capacity;
  }

  /* 访问元素 */
  public function get($index)
  {
    // 索引如果越界，则抛出异常，下同
    if ($index < 0 || $index >= $this->size) {
      throw new Exception('索引越界');
    }
    return $this->arr[$index];
  }

  /* 更新元素 */
  public function set($index, $num)
  {
    if ($index < 0 || $index >= $this->size) {
      throw new Exception('索引越界');
    }
    $this->arr[$index] = $num;
  }

  /* 在尾部添加元素 */
  public function add($num)
  {
    // 元素数量超出容量时，触发扩容机制
    if ($this->size === $this->capacity()) {
      $this->extendCapacity();
    }
    $this->arr[$this->size] = $num;
    // 更新元素数量
    $this->size++;
  }

  /* 在中间插入元素 */
  public function insert($index, $num)
  {
    if ($index < 0 || $index >= $this->size) {
      throw new Exception('索引越界');
    }
    // 元素数量超出容量时，触发扩容机制
    if ($this->size === $this->capacity()) {
      $this->extendCapacity();
    }
    // 将索引 index 以及之后的元素都向后移动一位
    for ($j = $this->size - 1; $j >= $index; $j--) {
      $this->arr[$j + 1] = $this->arr[$j];
    }
    $this->arr[$index] = $num;
    // 更新元素数量
    $this->size++;
  }

  /* 删除元素 */
  public function remove($index)
  {
    if ($index < 0 || $index >= $this->size) {
      throw new Exception('索引越界');
    }
    $num = $this->arr[$index];
    // 将索引 index 之后的元素都向前移动一位
    for ($j = $index; $j < $this->size - 1; $j++) {
      $this->arr[$j] = $this->arr[$j + 1];
    }
    // 更新元素数量
    $this->size--;
    // 返回被删除的元素
    return $num;
  }

  /* 列表扩容 */
  public function extendCapacity()
  {
    // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
    $this->arr = array_pad($this->arr, $this->capacity() * $this->extendRatio, 0);
    // 更新列表容量
    $this->capacity = count($this->arr);
  }

  /* 将列表转换为数组 */
  public function toArray()
  {
    $size = $this->size();
    // 仅转换有效长度范围内的列表元素
    $arr = [];
    for ($i = 0; $i < $size; $i++) {
      $arr[$i] = $this->get($i);
    }
    return $arr;
  }
}

/* Driver Code */
/* 初始化列表 */
$nums = new MyList();
/* 在尾部添加元素 */
$nums->add(1);
$nums->add(3);
$nums->add(2);
$nums->add(5);
$nums->add(4);
echo "列表 nums = [" . join(', ', $nums->toArray()) . "] ，容量 = {$nums->capacity()} ，长度 = {$nums->size()}" . PHP_EOL;

/* 在中间插入元素 */
$nums->insert(3, 6);
echo '在索引 3 处插入数字 6 ，得到 nums = [' .  join(', ', $nums->toArray()) . ']' . PHP_EOL;

/* 删除元素 */
$nums->remove(3);
echo '删除索引 3 处的元素，得到 nums = [' .  join(', ', $nums->toArray()) . ']' . PHP_EOL;

/* 访问元素 */
$num = $nums->get(1);
echo "访问索引 1 处的元素，得到 num = {$num}" . PHP_EOL;

/* 更新元素 */
$nums->set(1, 0);
echo '将索引 1 处的元素更新为 0 ，得到 nums = [' .  join(', ', $nums->toArray()) . ']' . PHP_EOL;

/* 测试扩容机制 */
for ($i = 0; $i < 10; $i++) {
  // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
  $nums->add($i);
}
echo "扩容后的列表 nums = [" . join(', ', $nums->toArray()) . "] ，容量 = {$nums->capacity()} ，长度 = {$nums->size()}" . PHP_EOL;
