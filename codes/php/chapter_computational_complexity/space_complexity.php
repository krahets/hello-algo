<?php
/**
 * File: time_complexity.php
 * Created Time: 2024-02-27
 * Author: honghuabin (121826725@qq.com)
 */

/* 函数 */
function func() {
    // 执行某些操作
    return 0;
}

const a = 0;    // 常量
/* 常数阶 */
function constants(int $n) {
    // 常量、变量、对象占用 O(1) 空间
    $b = 0;
    $nums = array_pad(array(),10000,0);
    $node = new stdClass();
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
function linear(int $n) {
    // 长度为 n 的数组占用 O(n) 空间
    $nums = array_pad(array(), $n,0);
    // 长度为 n 的列表占用 O(n) 空间
    $nodes = array();
    for ($i = 0; $i < $n; $i++) {
        $nodes[] = $i;
    }
    // 长度为 n 的哈希表占用 O(n) 空间
    $map = array();
    for ($i = 0; $i < $n; $i++) {
        $map[$i] = $i;
    }
}

/* 线性阶（递归实现） */
function linearRecur(int $n) {
    echo "递归 n = {$n}" . PHP_EOL;
    if ($n == 1)
        return;
    linearRecur($n - 1);
}

/* 平方阶 */
function quadratic(int $n) {
    // 二维列表占用 O(n^2) 空间
    $tmp = array_pad(array(), $n, 0);
    $numMatrix = array_pad(array(), $n, $tmp);
}

/* 平方阶（递归实现） */
function quadraticRecur(int $n) {
    if ($n <= 0) {
        return 0;
    }
    // 数组 nums 长度为 n, n-1, ..., 2, 1
    $nums = array_pad(array(), $n,0);
    echo "递归 n = {$n} 中的 nums 长度 = " . count($nums) . PHP_EOL;
    return quadraticRecur($n - 1);
}

/* 指数阶（建立满二叉树） */
class TreeNode {
    public $left;
    public $right;
    public $val;
    public function __construct($val) {
        $this->val = $val;
    }
}
function buildTree(int $n) {
    if ($n == 0) {
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
constants($n);
// 线性阶
linear($n);
linearRecur($n);
// 平方阶
quadratic($n);
quadraticRecur($n);
// 指数阶
$root = buildTree($n);
print_r($root);