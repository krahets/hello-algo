<?php

/**
 * File: time_complexity.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */


/* 常数阶 */
function timeConstant($n)
{
  $count = 0;
  $size = 100000;
  for ($i = 0; $i < $size; $i++) {
    $count++;
  }
  return $count;
}

/* 线性阶 */
function linear($n)
{
  $count = 0;
  for ($i = 0; $i < $n; $i++) {
    $count++;
  }
  return $count;
}

/* 线性阶（遍历数组） */
function arrayTraversal($nums)
{
  $count = 0;
  // 循环次数与数组长度成正比
  foreach ($nums as $num) {
    $count++;
  }
  return $count;
}

/* 平方阶 */
function quadratic($n)
{
  $count = 0;
  // 循环次数与数据大小 n 成平方关系
  for ($i = 0; $i < $n; $i++) {
    for ($j = 0; $j < $n; $j++) {
      $count++;
    }
  }
  return $count;
}

/* 平方阶（冒泡排序） */
function bubbleSort($nums)
{
  $count = 0; // 计数器
  // 外循环：未排序区间为 [0, i]
  for ($i = count($nums) - 1; $i > 0; $i--) {
    // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
    for ($j = 0; $j < $i; $j++) {
      if ($nums[$j] > $nums[$j + 1]) {
        // 交换 nums[j] 与 nums[j + 1]
        $tmp = $nums[$j];
        $nums[$j] = $nums[$j + 1];
        $nums[$j + 1] = $tmp;
        $count += 3; // 元素交换包含 3 个单元操作
      }
    }
  }
  return $count;
}

/* 指数阶（循环实现） */
function exponential($n)
{
  $count = 0;
  $base = 1;
  // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
  for ($i = 0; $i < $n; $i++) {
    for ($j = 0; $j < $base; $j++) {
      $count++;
    }
    $base *= 2;
  }
  // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  return $count;
}

/* 指数阶（递归实现） */
function expRecur($n)
{
  if ($n === 1) {
    return 1;
  }
  return expRecur($n - 1) + expRecur($n - 1) + 1;
}

/* 对数阶（循环实现） */
function logarithmic($n)
{
  $count = 0;
  while ($n > 1) {
    $n = $n / 2;
    $count++;
  }
  return $count;
}

/* 对数阶（递归实现） */
function logRecur($n)
{
  if ($n <= 1) {
    return 0;
  }
  return logRecur($n / 2) + 1;
}

/* 线性对数阶 */
function linearLogRecur($n)
{
  if ($n <= 1) {
    return 1;
  }
  $count = linearLogRecur($n / 2) + linearLogRecur($n / 2);
  for ($i = 0; $i < $n; $i++) {
    $count++;
  }
  return $count;
}

/* 阶乘阶（递归实现） */
function factorialRecur($n)
{
  if ($n === 0) {
    return 1;
  }
  $count = 0;
  // 从 1 个分裂出 n 个
  for ($i = 0; $i < $n; $i++) {
    $count += factorialRecur($n - 1);
  }
  return $count;
}

/* Driver Code */
// 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
$n = 8;
echo "输入数据大小 n = {$n}" . PHP_EOL;

$count = timeConstant($n);
echo "常数阶的操作数量 = {$count}" . PHP_EOL;

$count = linear($n);
echo "线性阶的操作数量 = {$count}" . PHP_EOL;
$count = arrayTraversal(array_fill(0, $n, 0));
echo "线性阶（遍历数组）的操作数量 = {$count}" . PHP_EOL;

$count = quadratic($n);
echo "平方阶的操作数量 = {$count}" . PHP_EOL;
$nums = [];
for ($i = 0; $i < $n; $i++) {
  $nums[$i] = $n - $i; // [n,n-1,...,2,1]
}
$count = bubbleSort($nums);
echo "平方阶（冒泡排序）的操作数量 = {$count}" . PHP_EOL;

$count = exponential($n);
echo "指数阶（循环实现）的操作数量 = {$count}" . PHP_EOL;
$count = expRecur($n);
echo "指数阶（递归实现）的操作数量 = {$count}" . PHP_EOL;

$count = logarithmic($n);
echo "对数阶（循环实现）的操作数量 = {$count}" . PHP_EOL;

$count = logRecur($n);
echo "对数阶（递归实现）的操作数量 = {$count}" . PHP_EOL;

$count = linearLogRecur($n);
echo "线性对数阶（递归实现）的操作数量 = {$count}" . PHP_EOL;

$count = factorialRecur($n);
echo "阶乘阶（递归实现）的操作数量 = {$count}" . PHP_EOL;
