<?php

/**
 * File: PrintUtil.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

require_once 'TreeNode.php';

class Trunk
{
  public $prev;
  public $str;

  public function __construct($prev, $str)
  {
    $this->prev = $prev;
    $this->str = $str;
  }
}

class PrintUtil
{

  /* 打印矩阵（Array） */
  public static function printMatrix($matrix)
  {
    echo '[' . PHP_EOL;
    foreach ($matrix as $row) {
      echo '  [' . implode(', ', $row) . '],' . PHP_EOL;
    }
    echo ']' . PHP_EOL;
  }

  /* 打印链表 */
  public static function printLinkedList($head)
  {
    $list = [];
    while ($head !== null) {
      $list[] = $head->val;
      $head = $head->next;
    }
    echo join(' -> ', $list) . PHP_EOL;
  }

  /**
   * 打印二叉树
   * This tree printer is borrowed from TECHIE DELIGHT
   * https://www.techiedelight.com/c-program-print-binary-tree/
   */
  public static function printTree($root, $prev = null, $isRight = false)
  {
    if ($root === null) {
      return;
    }

    $prev_str = '    ';
    $trunk = new Trunk($prev, $prev_str);

    self::printTree($root->right, $trunk, true);

    if ($prev === null) {
      $trunk->str = '———';
    } else if ($isRight) {
      $trunk->str = '/———';
      $prev_str = '   |';
    } else {
      $trunk->str = '\\———';
      $prev->str = $prev_str;
    }

    self::showTrunks($trunk);
    echo ' ' . $root->val . PHP_EOL;

    if ($prev !== null) {
      $prev->str = $prev_str;
    }
    $trunk->str = '   |';

    self::printTree($root->left, $trunk, false);
  }

  public static function showTrunks($p)
  {
    if ($p === null) {
      return;
    }

    self::showTrunks($p->prev);
    echo $p->str;
  }

  /* 打印哈希表 */
  public static function printHashMap($map)
  {
    foreach ($map as $key => $value) {
      echo $key . ' -> ' . $value . PHP_EOL;
    }
  }

  /* 打印堆（优先队列） */
  public static function printHeap($queue)
  {
    echo '堆的数组表示：';
    echo '[' . join(', ', $queue) . ']' . PHP_EOL;
    echo '堆的树状表示：' . PHP_EOL;
    $root = TreeNode::listToTree($queue);
    self::printTree($root);
  }
}
