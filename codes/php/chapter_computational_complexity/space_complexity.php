<?php
/**
 * File: space_complexity.php
 * Created Time: 2025-11-06
 * Author: Leo Mu (whatissrc@gmail.com)
 */

namespace chapter_computational_complexity;
class space_complexity
{
    /* 函数 */
    public static function functionMethod(): int
    {
        // 执行某些操作
        return 0;
    }

    /* 常数阶 */
    public static function constant(int $n): void
    {
        // 常量、变量、对象占用 O(1) 空间
        $a = 0;
        $b = 0;
        $nums = array_fill(0, 10000, 0);
        // 循环中的变量占用 O(1) 空间
        for ($i = 0; $i < $n; $i++) {
            $c = 0;
        }
        // 循环中的函数占用 O(1) 空间
        for ($i = 0; $i < $n; $i++) {
            self::functionMethod();
        }
    }

    /* 线性阶 */
    public static function linear(int $n): void
    {
        // 长度为 n 的数组占用 O(n) 空间
        $nums = array_fill(0, $n, 0);
        // 长度为 n 的列表占用 O(n) 空间
        $nodes = [];
        for ($i = 0; $i < $n; $i++) {
            $nodes[] = ['val' => $i];
        }
        // 长度为 n 的哈希表占用 O(n) 空间
        $map = [];
        for ($i = 0; $i < $n; $i++) {
            $map[$i] = strval($i);
        }
    }

    /* 线性阶（递归实现）*/
    public static function linearRecur(int $n): void
    {
        echo "递归 n = " . $n . "\n";
        if ($n == 1) {
            return;
        }
        self::linearRecur($n - 1);
    }

    /* 平方阶 */
    public static function quadratic(int $n): void
    {
        // 矩阵占用 O(n^2) 空间
        $numMatrix = [];
        for ($i = 0; $i < $n; $i++) {
            $numMatrix[$i] = array_fill(0, $n, 0);
        }
        // 二维列表占用 O(n^2) 空间
        $numList = [];
        for ($i = 0; $i < $n; $i++) {
            $tmp = [];
            for ($j = 0; $j < $n; $j++) {
                $tmp[] = 0;
            }
            $numList[] = $tmp;
        }
    }

    /* 平方阶（递归实现） */
    public static function quadraticRecur(int $n): int
    {
        if ($n <= 0) {
            return 0;
        }
        // 数组 nums 长度为 n, n-1, ..., 2, 1
        $nums = array_fill(0, $n, 0);
        echo "递归 n = " . $n . " 中的 nums 长度 = " . count($nums) . "\n";
        return self::quadraticRecur($n - 1);
    }

    /* 指数阶（建立满二叉树）*/
    public static function buildTree(int $n)
    {
        if ($n == 0) {
            return null;
        }
        $root = ['val' => 0, 'left' => null, 'right' => null];
        $root['left'] = self::buildTree($n - 1);
        $root['right'] = self::buildTree($n - 1);
        return $root;
    }
}

/* Driver Code */
$n = 5;
// 常数阶
space_complexity::constant($n);
// 线性阶
space_complexity::linear($n);
space_complexity::linearRecur($n);
// 平方阶
space_complexity::quadratic($n);
space_complexity::quadraticRecur($n);
// 指数阶
$root = space_complexity::buildTree($n);
echo "指数阶（建立满二叉树）完成\n";
