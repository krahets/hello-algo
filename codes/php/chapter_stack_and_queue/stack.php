<?php

/**
 * File: stack.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* Driver Code */
/* 初始化栈 */
$stack = new SplStack();

/* 元素入栈 */
$stack->push(1);
$stack->push(3);
$stack->push(2);
$stack->push(5);
$stack->push(4);
$stackStr = '[' . join(', ', array_reverse(iterator_to_array($stack))) . ']';
echo "栈 stack = {$stackStr}" . PHP_EOL;

/* 访问栈顶元素 */
$peek = $stack->top();
echo "栈顶元素 peek = {$peek}" . PHP_EOL;

/* 元素出栈 */
$pop = $stack->pop();
$stackStr = '[' . join(', ', array_reverse(iterator_to_array($stack))) . ']';
echo "出栈元素 pop = {$pop}，出栈后 stack = {$stackStr}" . PHP_EOL;

/* 获取栈的长度 */
$size = $stack->count();
echo "栈的长度 size = {$size}" . PHP_EOL;

/* 判断是否为空 */
$isEmpty = $stack->isEmpty();
$isEmptyStr = $isEmpty ? 'true' : 'false';
echo "栈是否为空 = {$isEmptyStr}" . PHP_EOL;
