<?php
/**
 * File: recursion.php
 * Created Time: 2025-11-06
 * Author: Leo Mu (whatissrc@gmail.com)
 */

namespace chapter_computational_complexity;

class Recursion
{
    // 递归
    public static function recur(int $n): int
    {
        // 终止条件
        if ($n == 1) {
            return 1;
        }
        // 递：递归调用
        $res = self::recur($n - 1);
        // 归：返回结果
        return $n + $res;
    }

    // 使用迭代模拟递归
    public static function forLoopRecur(int $n): int
    {
        // 使用一个显式的数组来模拟系统调用栈
        $stack = [];
        $res = 0;
        // 递：递归调用
        for ($i = $n; $i > 0; $i--) {
            // 通过"入栈操作"模拟"递"
            array_push($stack, $i);
        }
        // 归：返回结果
        while (!empty($stack)) {
            // 通过"出栈操作"模拟"归"
            $res += array_pop($stack);
        }
        // res = 1+2+3+...+n
        return $res;
    }

    // 尾递归
    public static function tailRecur(int $n, int $res): int
    {
        // 终止条件
        if ($n == 0) {
            return $res;
        }
        // 尾递归调用
        return self::tailRecur($n - 1, $res + $n);
    }

    // 斐波那契数列：递归
    public static function fib(int $n): int
    {
        // 终止条件 f(1) = 0, f(2) = 1
        if ($n == 1 || $n == 2) {
            return $n - 1;
        }
        // 递归调用 f(n) = f(n-1) + f(n-2)
        $res = self::fib($n - 1) + self::fib($n - 2);
        // 返回结果 f(n)
        return $res;
    }


}

// Driver Code
$n = 5;
$res = 0;
Recursion::recur($n);
echo "\n递归函数的求和结果 res = {$res}\n";

$res = Recursion::forLoopRecur($n);
echo "\n使用迭代模拟递归求和结果 res = {$res}\n";

$res = Recursion::tailRecur($n, 0);
echo "\n尾递归函数的求和结果 res = {$res}\n";

$res = Recursion::fib($n);
echo "\n斐波那契数列的第 {$n} 项为 {$res}\n";
