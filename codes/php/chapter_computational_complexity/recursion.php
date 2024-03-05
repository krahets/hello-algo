<?php
/**
 * File: recursion.php
 * Created Time: 2024-02-27
 * Author: honghuabin (121826725@qq.com)
 */

/* 递归 */
function recur($n) {
    // 终止条件
    if ($n == 1) {
        return 1;
    }
    // 递：递归调用
    $res = recur($n - 1);
    // 归：返回结果
    return $n + $res;
}

/* 尾递归 */
function tailRecur(int $n, int $res) {
    // 终止条件
    if ($n == 0) {
        return $res;
    }
    // 尾递归调用
    return tailRecur($n - 1, $res + $n);
}

/* 斐波那契数列：递归 */
function fib(int $n) {
    // 终止条件 f(1) = 0, f(2) = 1
    if ($n == 1 || $n == 2) {
        return $n - 1;
    }
    // 递归调用 f(n) = f(n-1) + f(n-2)
    $res = fib($n - 1) + fib($n - 2);
    // 返回结果 f(n)
    return $res;
}

/* 使用迭代模拟递归 */
function forLoopRecur(int $n) {
    // 使用一个显式的栈来模拟系统调用栈
    $stack = array();
    $res = 0;
    // 递：递归调用
    for ($i = $n; $i > 0; $i--) {
        // 通过“入栈操作”模拟“递”
        array_push($stack, $i);
    }
    // 归：返回结果
    while (!empty($stack)) {
        // 通过“出栈操作”模拟“归”
        $res += array_pop($stack);
    }
    // res = 1+2+3+...+n
    return $res;
}

/* Driver Code */
$n = 5;

$res = recur($n);
echo "递归函数的求和结果 res = {$res}" . PHP_EOL;

$res = forLoopRecur($n);
echo "使用迭代模拟递归求和结果 res = {$res}" . PHP_EOL;

$res = tailRecur($n, 0);
echo "尾递归函数的求和结果 res = {$res}" . PHP_EOL;

$res = fib($n);
echo "斐波那契数列的第 {$n} 项为 {$res}";