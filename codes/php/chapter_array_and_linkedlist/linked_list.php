<?php

/**
 * File: linked_list.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

require_once '../utils/ListNode.php';
require_once '../utils/PrintUtil.php';

/* 在链表的节点 n0 之后插入节点 P */
function insert($n0, $P)
{
  $n1 = $n0->next;
  $P->next = $n1;
  $n0->next = $P;
}

/* 删除链表的节点 n0 之后的首个节点 */
function remove($n0)
{
  if ($n0->next === null) {
    return;
  }
  // n0 -> P -> n1
  $P = $n0->next;
  $n1 = $P->next;
  $n0->next = $n1;
}

/* 访问链表中索引为 index 的节点 */
function access($head, $index)
{
  for ($i = 0; $i < $index; $i++) {
    if ($head === null) {
      return null;
    }
    $head = $head->next;
  }
  return $head;
}

/* 在链表中查找值为 target 的首个节点 */
function find($head, $target)
{
  $index = 0;
  while ($head !== null) {
    if ($head->val === $target) {
      return $index;
    }
    $head = $head->next;
    $index++;
  }
  return -1;
}

/* Driver Code */
/* 初始化链表 */
// 初始化各个节点
$n0 = new ListNode(1);
$n1 = new ListNode(3);
$n2 = new ListNode(2);
$n3 = new ListNode(5);
$n4 = new ListNode(4);
// 构建节点之间的引用
$n0->next = $n1;
$n1->next = $n2;
$n2->next = $n3;
$n3->next = $n4;
echo '初始化的链表为' . PHP_EOL;
PrintUtil::printLinkedList($n0);

/* 插入节点 */
insert($n0, new ListNode(0));
echo '插入节点后的链表为' . PHP_EOL;
PrintUtil::printLinkedList($n0);

/* 删除节点 */
remove($n0);
echo '删除节点后的链表为' . PHP_EOL;
PrintUtil::printLinkedList($n0);

/* 访问节点 */
$node = access($n0, 3);
echo "链表中索引 3 处的节点的值 = {$node->val}" . PHP_EOL;

/* 查找节点 */
$index = find($n0, 2);
echo "链表中值为 2 的节点的索引 = {$index}" . PHP_EOL;
