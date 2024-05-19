<?php

/**
 * File: queue.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* Driver Code */
/* 初始化队列 */
$queue = new SplQueue();

/* 元素入队 */
$queue->enqueue(1);
$queue->enqueue(3);
$queue->enqueue(2);
$queue->enqueue(5);
$queue->enqueue(4);
echo '队列 queue = [' . join(', ', iterator_to_array($queue)) . ']' . PHP_EOL;

/* 访问队首元素 */
$peek = $queue->bottom();
echo "队首元素 peek = {$peek}" . PHP_EOL;

/* 元素出队 */
$pop = $queue->dequeue();
echo "出队元素 pop = {$pop}，出队后 queue = [" . join(', ', iterator_to_array($queue)) . ']' . PHP_EOL;

/* 获取队列的长度 */
$size = $queue->count();
echo "队列长度 size = {$size}" . PHP_EOL;

/* 判断队列是否为空 */
$isEmpty = $queue->isEmpty();
$isEmptyStr = $isEmpty ? 'true' : 'false';
echo "队列是否为空 = {$isEmptyStr}" . PHP_EOL;
