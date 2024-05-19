<?php

/**
 * File: list.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* 初始化列表 */
$nums = [1, 3, 2, 5, 4];
echo '列表 nums = [' . join(', ', $nums) . ']' . PHP_EOL;

/* 访问元素 */
$num = $nums[1];
echo "访问索引 1 处的元素，得到 num = {$num}" . PHP_EOL;

/* 更新元素 */
$nums[1] = 0;
echo '将索引 1 处的元素更新为 0 ，得到 nums = [' . join(', ', $nums) . ']' . PHP_EOL;

/* 清空列表 */
$nums = [];
echo '清空列表后 nums = [' . join(', ', $nums) . ']' . PHP_EOL;

/* 在尾部添加元素 */
array_push($nums, 1);
array_push($nums, 3);
array_push($nums, 2);
array_push($nums, 5);
array_push($nums, 4);
echo '添加元素后 nums = [' . join(', ', $nums) . ']' . PHP_EOL;

/* 在中间插入元素 */
array_splice($nums, 3, 0, [6]);
echo '在索引 3 处插入数字 6 ，得到 nums = [' . join(', ', $nums) . ']' . PHP_EOL;

/* 删除元素 */
array_splice($nums, 3, 1);
echo '删除索引 3 处的元素，得到 nums = [' . join(', ', $nums) . ']' . PHP_EOL;

/* 通过索引遍历列表 */
$count = 0;
for ($i = 0; $i < count($nums); $i++) {
  $count += $nums[$i];
}
/* 直接遍历列表元素 */
foreach ($nums as $x) {
  $count += $x;
}

/* 拼接两个列表 */
$nums1 = [6, 8, 7, 10, 9];
$nums = array_merge($nums, $nums1);
echo '将列表 nums1 拼接到 nums 之后，得到 nums = [' . join(', ', $nums) . ']' . PHP_EOL;

/* 排序列表 */
sort($nums);
echo '排序列表后 nums = [' . join(', ', $nums) . ']' . PHP_EOL;
