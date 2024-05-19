<?php

/**
 * File: ListNode.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* 链表节点 */
class ListNode
{
  public $val; // 节点值
  public $next; // 指向下一个节点的引用

  /* 构造方法 */
  public function __construct($val = 0, $next = null)
  {
    $this->val = $val;
    $this->next = $next;
  }

  /* 将列表反序列化为链表 */
  public static function arrToLinkedList($arr)
  {
    $dum = new ListNode(0);
    $head = $dum;
    foreach ($arr as $val) {
      $head->next = new ListNode($val);
      $head = $head->next;
    }
    return $dum->next;
  }
}
