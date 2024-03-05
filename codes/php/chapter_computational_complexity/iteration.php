<?php
/**
 * File: iteration.php
 * Created Time: 2024-02-27
 * Author: honghuabin (121826725@qq.com)
 */

/* for 循环 */
function forLoop(int $n){
    $res = 0;
    // 循环求和 1, 2, ..., n-1, n
    for ($i = 1; $i <= $n; $i++) {
        $res += $i;
    }
    return $res;
}

/* while 循环 */
function whileLoop(int $n) {
    $res = 0;
    $i = 1; // 初始化条件变量
    // 循环求和 1, 2, ..., n-1, n
    while ($i <= $n) {
        $res += $i;
        $i++; // 更新条件变量
    }
    return $res;
}

/* while 循环（两次更新） */
function whileLoopII($n) {
    $res = 0;
    $i = 1; // 初始化条件变量
    // 循环求和 1, 4, 10, ...
    while ($i <= $n) {
        $res += $i;
        // 更新条件变量
        $i++;
        $i *= 2;
    }
    return $res;
}

/* 双层 for 循环 */
function nestedForLoop(int $n) {
    $res = "";
    // 循环 i = 1, 2, ..., n-1, n
    for ($i = 1; $i <= $n; $i++) {
        // 循环 j = 1, 2, ..., n-1, n
        for ($j = 1; $j <= $n; $j++) {
            $res .= "({$i},{$j}), ";
        }
    }
    return $res;
}

/* Driver Code */
$n = 5;

$res = forLoop($n);
echo "for 循环的求和结果 res = {$res}" . PHP_EOL;

$res = whileLoop($n);
echo "while 循环的求和结果 res = {$res}" . PHP_EOL;

$res = whileLoopII($n);
echo "while 循环（两次更新）求和结果 res = {$res}" . PHP_EOL;

$res = nestedForLoop($n);
echo "双层 for 循环的遍历结果 res = {$res}";