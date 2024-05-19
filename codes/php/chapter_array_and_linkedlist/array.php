<?php

/**
 * File: array.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* 随机访问元素 */
function randomAccess($nums)
{
  // 在区间 [0, nums.length) 中随机抽取一个数字
  $length = count($nums);
  $randomIndex = mt_rand(0, $length - 1);
  // 获取并返回随机元素
  $randomNum = $nums[$randomIndex];
  return $randomNum;
}

/* 扩展数组长度 */
// 请注意，PHP 的 Array 是动态数组，可以直接扩展
// 为了方便学习，本函数将 Array 看作长度不可变的数组
function extend($nums, $enlarge)
{
  // 初始化一个扩展长度后的数组
  $res = array_fill(0, count($nums) + $enlarge, 0);
  // 将原数组中的所有元素复制到新数组
  for ($i = 0; $i < count($nums); $i++) {
    $res[$i] = $nums[$i];
  }
  // 返回扩展后的新数组
  return $res;
}

/* 在数组的索引 index 处插入元素 num */
function insert(&$nums, $num, $index)
{
  // 把索引 index 以及之后的所有元素向后移动一位
  for ($i = count($nums) - 1; $i > $index; $i--) {
    $nums[$i] = $nums[$i - 1];
  }
  // 将 num 赋给 index 处的元素
  $nums[$index] = $num;
}

/* 删除索引 index 处的元素 */
function remove(&$nums, $index)
{
  // 把索引 index 之后的所有元素向前移动一位
  for ($i = $index; $i < count($nums) - 1; $i++) {
    $nums[$i] = $nums[$i + 1];
  }
}

/* 遍历数组 */
function traverse($nums)
{
  $count = 0;
  // 通过索引遍历数组
  for ($i = 0; $i < count($nums); $i++) {
    $count += $nums[$i];
  }
  // 直接遍历数组元素
  foreach ($nums as $num) {
    $count += $num;
  }
}

/* 在数组中查找指定元素 */
function find($nums, $target)
{
  for ($i = 0; $i < count($nums); $i++) {
    if ($nums[$i] === $target) {
      return $i;
    }
  }
  return -1;
}

/* Driver Code */
/* 初始化数组 */
$arr = array_fill(0, 5, 0);
echo '数组 arr = [' . join(', ', $arr) . ']' . PHP_EOL;
$nums = [1, 3, 2, 5, 4];
echo '数组 nums = [' . join(', ', $nums) . ']' . PHP_EOL;

/* 随机访问 */
$randomNum = randomAccess($nums);
echo "在 nums 中获取随机元素 {$randomNum}" . PHP_EOL;

/* 长度扩展 */
$nums = extend($nums, 3);
echo '将数组长度扩展至 8 ，得到 nums = [' . join(', ', $nums) . ']' . PHP_EOL;

/* 插入元素 */
insert($nums, 6, 3);
echo '在索引 3 处插入数字 6 ，得到 nums = [' . join(', ', $nums) . ']' . PHP_EOL;

/* 删除元素 */
remove($nums, 2);
echo '删除索引 2 处的元素，得到 nums = [' . join(', ', $nums) . ']' . PHP_EOL;

/* 遍历数组 */
traverse($nums);

/* 查找元素 */
$index = find($nums, 3);
echo "在 nums 中查找元素 3 ，得到索引 = {$index}" . PHP_EOL;
