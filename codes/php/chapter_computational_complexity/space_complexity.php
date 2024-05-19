<?php

/**
 * File: space_complexity.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

require_once '../utils/ListNode.php';
require_once '../utils/TreeNode.php';
require_once '../utils/PrintUtil.php';

/* 函数 */
function func()
{
  // 执行某些操作
  return 0;
}

/* 常数阶 */
function spaceConstant($n)
{
  // 常量、变量、对象占用 O(1) 空间
  define('A', 0);
  $b = 0;
  $nums = array_fill(0, 10000, 0);
  $node = new ListNode(0);
  // 循环中的变量占用 O(1) 空间
  for ($i = 0; $i < $n; $i++) {
    $c = 0;
  }
  // 循环中的函数占用 O(1) 空间
  for ($i = 0; $i < $n; $i++) {
    func();
  }
}

/* 线性阶 */
function linear($n)
{
  // 长度为 n 的数组占用 O(n) 空间
  $nums = array_fill(0, $n, 0);
  // 长度为 n 的列表占用 O(n) 空间
  $nodes = [];
  for ($i = 0; $i < $n; $i++) {
    $nodes[] = new ListNode($i);
  }
  // 长度为 n 的哈希表占用 O(n) 空间
  $map = [];
  for ($i = 0; $i < $n; $i++) {
    $map[$i] = strval($i);
  }
}

/* 线性阶（递归实现） */
function linearRecur($n)
{
  echo "递归 n = {$n}" . PHP_EOL;
  if ($n === 1) {
    return;
  }
  linearRecur($n - 1);
}

/* 平方阶 */
function quadratic($n)
{
  // 矩阵占用 O(n^2) 空间
  $numMatrix = array_fill(0, $n, array_fill(0, $n, 0));
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
function quadraticRecur($n)
{
  if ($n <= 0) {
    return 0;
  }
  // 数组 nums 长度为 n, n-1, ..., 2, 1
  $nums = array_fill(0, $n, 0);
  echo "递归 n = {$n} 中的 nums 长度 = " . count($nums) . PHP_EOL;
  return quadraticRecur($n - 1);
}

/* 指数阶（建立满二叉树） */
function buildTree($n)
{
  if ($n === 0) {
    return null;
  }
  $root = new TreeNode(0);
  $root->left = buildTree($n - 1);
  $root->right = buildTree($n - 1);
  return $root;
}

/* Driver Code */
$n = 5;
// 常数阶
spaceConstant($n);
// 线性阶
linear($n);
linearRecur($n);
// 平方阶
quadratic($n);
quadraticRecur($n);
// 指数阶
$root = buildTree($n);
PrintUtil::printTree($root);
