<?php
/**
 * File: time_complexity.php
 * Created Time: 2025-11-06
 * Author: Leo Mu (whatissrc@gmail.com)
 */

namespace chapter_computational_complexity;

class time_complexity
{
    /* 常数阶 */
    public static function constant(int $n): int
    {
        $count = 0;
        $size = 100000;
        for ($i = 0; $i < $size; $i++) {
            $count++;
        }
        return $count;
    }

    /* 线性阶 */
    public static function linear(int $n): int
    {
        $count = 0;
        for ($i = 0; $i < $n; $i++) {
            $count++;
        }
        return $count;
    }

    /* 线性阶（遍历数组）*/
    public static function arrayTraversal(array $nums): int
    {
        $count = 0;
        // 循环次数与数组长度成正比
        foreach ($nums as $num) {
            $count++;
        }
        return $count;
    }

    /* 平方阶 */
    public static function quadratic(int $n): int
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

    /* 平方阶（冒泡排序）*/
    public static function bubbleSort(array &$nums): int
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

    /* 指数阶（循环实现）*/
    public static function exponential(int $n): int
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

    /* 指数阶（递归实现）*/
    public static function expRecur(int $n): int
    {
        if ($n == 1) {
            return 1;
        }
        return self::expRecur($n - 1) + self::expRecur($n - 1) + 1;
    }

    /* 对数阶（循环实现）*/
    public static function logarithmic(int $n): int
    {
        $count = 0;
        while ($n > 1) {
            $n = (int) ($n / 2);
            $count++;
        }
        return $count;
    }

    /* 对数阶（递归实现）*/
    public static function logRecur(int $n): int
    {
        if ($n <= 1) {
            return 0;
        }
        return self::logRecur((int) ($n / 2)) + 1;
    }

    /* 线性对数阶 */
    public static function linearLogRecur(int $n): int
    {
        if ($n <= 1) {
            return 1;
        }
        $count = self::linearLogRecur((int) ($n / 2)) + self::linearLogRecur((int) ($n / 2));
        for ($i = 0; $i < $n; $i++) {
            $count++;
        }
        return $count;
    }

    /* 阶乘阶（递归实现）*/
    public static function factorialRecur(int $n): int
    {
        if ($n == 0) {
            return 1;
        }
        $count = 0;
        // 从 1 个分裂出 n 个
        for ($i = 0; $i < $n; $i++) {
            $count += self::factorialRecur($n - 1);
        }
        return $count;
    }

}

/* Driver Code */
$n = 8;
echo "输入数据大小 n = ".$n."\n";

$count = time_complexity::constant($n);
echo "常数阶的操作数量 = ".$count."\n";

$count = time_complexity::linear($n);
echo "线性阶的操作数量 = ".$count."\n";
$count = time_complexity::arrayTraversal(array_fill(0, $n, 0));
echo "线性阶（遍历数组）的操作数量 = ".$count."\n";

$count = time_complexity::quadratic($n);
echo "平方阶的操作数量 = ".$count."\n";
$nums = array_fill(0, $n, 0);
for ($i = 0; $i < $n; $i++) {
    $nums[$i] = $n - $i; // [n,n-1,...,2,1]
}
$count = time_complexity::bubbleSort($nums);
echo "平方阶（冒泡排序）的操作数量 = ".$count."\n";

$count = time_complexity::exponential($n);
echo "指数阶（循环实现）的操作数量 = ".$count."\n";
$count = time_complexity::expRecur($n);
echo "指数阶（递归实现）的操作数量 = ".$count."\n";

$count = time_complexity::logarithmic($n);
echo "对数阶（循环实现）的操作数量 = ".$count."\n";
$count = time_complexity::logRecur($n);
echo "对数阶（递归实现）的操作数量 = ".$count."\n";

$count = time_complexity::linearLogRecur($n);
echo "线性对数阶（递归实现）的操作数量 = ".$count."\n";

$count = time_complexity::factorialRecur($n);
echo "阶乘阶（递归实现）的操作数量 = ".$count."\n";
