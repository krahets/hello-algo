<?php
/**
 * File: time_complexity.php
 * Created Time: 2024-02-27
 * Author: skating (121826725@qq.com)
 */

/* 常数阶 */
function constants(int $n) {
    $count = 0;
    $size = 100000;
    for ($i = 0; $i < $size; $i++) {
        $count++;
    }
    return $count;
}

/* 线性阶 */
function linear(int $n) {
    $count = 0;
    for ($i = 0; $i < $n; $i++) {
        $count++;
    }
    return $count;
}

/* 线性阶（遍历数组） */
function arrayTraversal(array $nums) {
    $count = 0;
    // 循环次数与数组长度成正比
    foreach ($nums as $row) {
        $count++;
    }
    return $count;
}

/* 平方阶 */
function quadratic(int $n) {
    $count = 0;
    // 循环次数与数组长度成平方关系
    for ($i = 0; $i < $n; $i++) {
        for ($j = 0; $j < $n; $j++) {
            $count++;
        }
    }
    return $count;
}

/* 平方阶（冒泡排序） */
function bubbleSort(array $nums) {
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
function exponential(int $n) {
    $count = 0;
    $base = 1;
    // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
    for ($i = 0; $i < $n; $i++) {
        for ($j = 0; $j < $base; $j++) {
            $count++;
        }
        $base *= 2;
    }
    // $count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return $count;
}

/* 指数阶（递归实现） */
function expRecur(int $n) {
    if ($n == 1) {
        return 1;
    }
    return expRecur($n - 1) + expRecur($n - 1) + 1;
}

/* 对数阶（循环实现） */
function logarithmic(float $n) {
    $count = 0;
    while ($n > 1) {
        $n = $n / 2;
        $count++;
    }
    return $count;
}

/* 对数阶（递归实现） */
function logRecur(float $n) {
    if ($n <= 1) {
        return 0;
    }
    return logRecur($n / 2) + 1;
}

/* 线性对数阶 */
function linearLogRecur(float $n) {
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
function factorialRecur(int $n) {
    if ($n == 0) {
        return 1;
    }
    $count = 0;
    // 从 1 个分裂出 n 个
    for ($i = 0; $i < $n; $i++) {
        $count += factorialRecur($n - 1);
    }
    return $count;
}

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
function randomNumbers(int $n) {
    // 生成数组 nums = { 1, 2, 3, ..., n }
    $nums = range(1, $n, 1);
    // 随机打乱数组元素
    shuffle($nums);
    return $nums;
}

/* 查找数组 nums 中数字 1 所在索引 */
function findOne(array $nums) {
    for ($i = 0; $i < count($nums); $i++) {
        // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
        // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
        if ($nums[$i] == 1) {
            return $i;
        }
    }
    return -1;
}

$n = 8;
$nums = array(8,7,6,5,4,3,2,1);

$count = constants($n);
echo "数据数据大小 n = {$n}，常数阶的操作数量 = {$count}" . PHP_EOL;

$count = linear($n);
echo "数据数据大小 n = {$n}，线性阶的操作数量 = {$count}" . PHP_EOL;
$count = arrayTraversal($nums);
echo "数据数据大小 n = {$n}，线性阶（遍历数组）的操作数量 = {$count}" . PHP_EOL;

$count = quadratic($n);
echo "数据数据大小 n = {$n}，平方阶的操作数量 = {$count}" . PHP_EOL;
$count = bubbleSort($nums);
echo "数据数据大小 n = {$n}，平方阶（冒泡排序）的操作数量 = {$count}" . PHP_EOL;

$count = exponential($n);
echo "数据数据大小 n = {$n}，数据数据大小 n = {$n}，指数阶（循环实现）的操作数量 = {$count}" . PHP_EOL;
$n = 7;
$count = expRecur($n);
echo "数据数据大小 n = {$n}，指数阶（递归实现）的操作数量 = {$count}" . PHP_EOL;

$n = 8;
$count = logarithmic($n);
echo "数据数据大小 n = {$n}，对数阶（循环实现）的操作数量 = {$count}" . PHP_EOL;
$count = logRecur($n);
echo "数据数据大小 n = {$n}，对数阶（递归实现）的操作数量 = {$count}" . PHP_EOL;

$count = linearLogRecur($n);
echo "数据数据大小 n = {$n}，线性对数阶（递归实现）的操作数量 = {$count}" . PHP_EOL;

$n = 4;
$count = factorialRecur($n);
echo "阶乘阶（递归实现）的操作数量 = {$count}" . PHP_EOL;