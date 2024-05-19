<?php

/**
 * File: worst_best_time_complexity.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
function randomNumbers($n)
{
  $nums = [];
  // 生成数组 nums = { 1, 2, 3, ..., n }
  for ($i = 0; $i < $n; $i++) {
    $nums[$i] = $i + 1;
  }
  // 随机打乱数组元素
  shuffle($nums);
  return $nums;
}

/* 查找数组 nums 中数字 1 所在索引 */
function findOne($nums)
{
  foreach ($nums as $key => $value) {
    // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
    // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
    if ($value === 1) {
      return $key;
    }
  }
  return -1;
}

/* Driver Code */
for ($i = 0; $i < 10; $i++) {
  $n = 100;
  $nums = randomNumbers($n);
  $index = findOne($nums);
  echo "\n数组 [ 1, 2, ..., n ] 被打乱后 = [" . join(', ', $nums) . "]" . PHP_EOL;
  echo "数字 1 的索引为 {$index}" . PHP_EOL;
}
