/**
 * File: array_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 基于数组实现的栈 */
struct arrayStack {
    int *data;
    int size;
};

typedef struct arrayStack arrayStack;

/* 构造函数 */
arrayStack *newArrayStack() {
    arrayStack *s = malloc(sizeof(arrayStack));
    // 初始化一个大容量，避免扩容
    s->data = malloc(sizeof(int) * MAX_SIZE);
    s->size = 0;
    return s;
}

/* 获取栈的长度 */
int size(arrayStack *s) {
    return s->size;
}

/* 判断栈是否为空 */
bool isEmpty(arrayStack *s) {
    return s->size == 0;
}

/* 入栈 */
void push(arrayStack *s, int num) {
    if (s->size == MAX_SIZE) {
        printf("stack is full.\n");
        return;
    }
    s->data[s->size] = num;
    s->size++;
}

/* 访问栈顶元素 */
int peek(arrayStack *s) {
    if (s->size == 0) {
        printf("stack is empty.\n");
        return INT_MAX;
    }
    return s->data[s->size - 1];
}

/* 出栈 */
int pop(arrayStack *s) {
    if (s->size == 0) {
        printf("stack is empty.\n");
        return INT_MAX;
    }
    int val = peek(s);
    s->size--;
    return val;
}

/* Driver Code */
int main() {
    /* 初始化栈 */
    arrayStack *stack = newArrayStack();

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
    printf("出栈元素 pop = %d，出栈后 stack = ", val);
    printArray(stack->data, stack->size);

    /* 获取栈的长度 */
    int size = stack->size;
    printf("栈的长度 size =  %d\n", size);

    /* 判断是否为空 */
    bool empty = isEmpty(stack);
    printf("栈是否为空 = %s\n", empty ? "true" : "false");

    // 释放内存
    free(stack->data);
    free(stack);

    return 0;
}
