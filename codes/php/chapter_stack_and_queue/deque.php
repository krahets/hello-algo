<?php

/**
 * File: deque.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* Driver Code */
/* 初始化双向队列 */
// 使用SplDoublyLinkedList类实现双向队列
$deque = new SplDoublyLinkedList();
$deque->push(3);
$deque->push(2);
$deque->push(5);
echo '双向队列 deque = [' . join(', ', iterator_to_array($deque)) . ']' . PHP_EOL;

/* 访问元素 */
$peekFirst = $deque->bottom();
echo "队首元素 peekFirst = {$peekFirst}" . PHP_EOL;
$peekLast = $deque->top();
echo "队尾元素 peekLast = {$peekLast}" . PHP_EOL;

/* 元素入队 */
$deque->push(4);
echo '元素 4 队尾入队后 deque = [' . join(', ', iterator_to_array($deque)) . ']' . PHP_EOL;
$deque->unshift(1);
echo '元素 1 队首入队后 deque = [' . join(', ', iterator_to_array($deque)) . ']' . PHP_EOL;

/* 元素出队 */
$popLast = $deque->pop();
echo "队尾出队元素 = {$popLast}，队尾出队后 deque = [" . join(', ', iterator_to_array($deque)) . ']' . PHP_EOL;
$popFirst = $deque->shift();
echo "队首出队元素 = {$popFirst}，队首出队后 deque = [" . join(', ', iterator_to_array($deque)) . ']' . PHP_EOL;

/* 获取双向队列的长度 */
$size = $deque->count();
echo "双向队列长度 size = {$size}" . PHP_EOL;

/* 判断双向队列是否为空 */
$isEmpty = $deque->isEmpty();
$isEmptyStr = $isEmpty ? 'true' : 'false';
echo "双向队列是否为空 = {$isEmptyStr}" . PHP_EOL;
