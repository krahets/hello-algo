<?php

/**
 * File: iteration.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* for 循环 */
function forLoop($n)
{
  $res = 0;
  // 循环求和 1, 2, ..., n-1, n
  for ($i = 1; $i <= $n; $i++) {
    $res += $i;
  }
  return $res;
}

/* while 循环 */
function whileLoop($n)
{
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
function whileLoopII($n)
{
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
function nestedForLoop($n)
{
  $res = '';
  // 循环 i = 1, 2, ..., n-1, n
  for ($i = 1; $i <= $n; $i++) {
    // 循环 j = 1, 2, ..., n-1, n
    for ($j = 1; $j <= $n; $j++) {
      $res .= '(' . $i . ', ' . $j . '), ';
    }
  }
  return $res;
}

/* Driver Code */
$n = 5;
$res = 0;

$res = forLoop($n);
echo "\nfor 循环的求和结果 res = {$res}" . PHP_EOL;

$res = whileLoop($n);
echo "\nwhile 循环的求和结果 res = {$res}" . PHP_EOL;

$res = whileLoopII($n);
echo "\nwhile 循环（两次更新）求和结果 res = {$res}" . PHP_EOL;

$resStr = nestedForLoop($n);
echo "\n双层 for 循环的遍历结果 {$resStr}" . PHP_EOL;
