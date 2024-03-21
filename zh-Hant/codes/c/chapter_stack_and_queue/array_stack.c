/**
 * File: array_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 基于数组实现的栈 */
typedef struct {
    int *data;
    int size;
} ArrayStack;

/* 构造函数 */
ArrayStack *newArrayStack() {
    ArrayStack *stack = malloc(sizeof(ArrayStack));
    // 初始化一个大容量，避免扩容
    stack->data = malloc(sizeof(int) * MAX_SIZE);
    stack->size = 0;
    return stack;
}

/* 析构函数 */
void delArrayStack(ArrayStack *stack) {
    free(stack->data);
    free(stack);
}

/* 获取栈的长度 */
int size(ArrayStack *stack) {
    return stack->size;
}

/* 判断栈是否为空 */
bool isEmpty(ArrayStack *stack) {
    return stack->size == 0;
}

/* 入栈 */
void push(ArrayStack *stack, int num) {
    if (stack->size == MAX_SIZE) {
        printf("栈已满\n");
        return;
    }
    stack->data[stack->size] = num;
    stack->size++;
}

/* 访问栈顶元素 */
int peek(ArrayStack *stack) {
    if (stack->size == 0) {
        printf("栈为空\n");
        return INT_MAX;
    }
    return stack->data[stack->size - 1];
}

/* 出栈 */
int pop(ArrayStack *stack) {
    int val = peek(stack);
    stack->size--;
    return val;
}

/* Driver Code */
int main() {
    /* 初始化栈 */
    ArrayStack *stack = newArrayStack();

    /* 元素入栈 */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);
    printf("栈 stack = ");
    printArray(stack->data, stack->size);

    /* 访问栈顶元素 */
    int val = peek(stack);
    printf("栈顶元素 top = %d\n", val);

    /* 元素出栈 */
    val = pop(stack);
    printf("出栈元素 pop = %d ，出栈后 stack = ", val);
    printArray(stack->data, stack->size);

    /* 获取栈的长度 */
    int size = stack->size;
    printf("栈的长度 size =  %d\n", size);

    /* 判断是否为空 */
    bool empty = isEmpty(stack);
    printf("栈是否为空 = %stack\n", empty ? "true" : "false");

    // 释放内存
    delArrayStack(stack);

    return 0;
}
