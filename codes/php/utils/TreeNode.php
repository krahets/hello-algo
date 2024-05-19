<?php

/**
 * File: TreeNode.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* 二叉树节点类 */
class TreeNode
{
  public $val; // 节点值
  public $height; // 节点高度
  public $left; // 左子节点引用
  public $right; // 右子节点引用

  /* 构造方法 */
  public function __construct($val = 0, $left = null, $right = null, $height = 0)
  {
    $this->val = $val;
    $this->left = $left;
    $this->right = $right;
    $this->height = $height;
  }

  /* 将列表反序列化为二叉树：递归 */
  private static function listToTreeDFS($arr, $i = 0)
  {
    if ($i < 0 || $i >= count($arr) || $arr[$i] === null) {
      return null;
    }
    $root = new TreeNode($arr[$i]);
    $root->left = self::listToTreeDFS($arr, 2 * $i + 1);
    $root->right = self::listToTreeDFS($arr, 2 * $i + 2);
    return $root;
  }

  /* 将列表反序列化为二叉树 */
  public static function listToTree($arr)
  {
    return self::listToTreeDFS($arr, 0);
  }

  /* 将二叉树序列化为列表：递归 */
  private static function treeToListDFS($root, $i, &$res)
  {
    if ($root === null) {
      return;
    }
    $res[$i] = $root->val;
    self::treeToListDFS($root->left, 2 * $i + 1, $res);
    self::treeToListDFS($root->right, 2 * $i + 2, $res);
  }

  /* 将二叉树序列化为列表 */
  public static function treeToList($root)
  {
    $res = [];
    self::treeToListDFS($root, 0, $res);
    return $res;
  }
}
