/**
 * File: array_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../include/include.h"

/* 基于数组实现的栈 */
struct ArrayStack {
    int *stackTop;
    int size;
    int capacity;
};

typedef struct ArrayStack ArrayStack;

/* 内部调用 */
/* 获取栈容量 */
static int capacity(ArrayStack *stk) {
    return stk->capacity;
}

/* 栈自动扩容 */
static void extendCapacity(ArrayStack *stk) {
    // 先分配空间
    int newCapacity = capacity(stk) * 2;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = stk->stackTop;

    // 拷贝旧数据到新数据
    for(int i=0; i<stk->size; i++)
        extend[i] = temp[i];

    // 释放旧数据
    free(temp);

    // 更新新数据
    stk->stackTop = extend;
    stk->capacity = newCapacity;
}

/* 构造函数 */
void newArrayStack(ArrayStack *stk) {
    stk->capacity = 10;
    stk->size = 0;
    stk->stackTop = (int *)malloc(sizeof(int) * stk->capacity);
}

/* 析构函数 */
void delArrayStack(ArrayStack *stk) {
    stk->capacity = 0;
    stk->size = 0;
    free(stk->stackTop);
}

/* 获取栈的长度 */
int size(ArrayStack *stk) {
    return stk->size;
}

/* 判断栈是否为空 */
bool empty(ArrayStack *stk) {
    return size(stk) == 0;
}

/* 访问栈顶元素 */
int top(ArrayStack *stk) {
    return stk->stackTop[size(stk) - 1];
}

/* 入栈 */
void push(ArrayStack *stk, int num) {
    if (size(stk) == capacity(stk)) 
        extendCapacity(stk);        // 需要扩容

    stk->stackTop[size(stk)] = num;
    stk->size++;
}

/* 出栈 */
void pop(ArrayStack *stk) {
    int num = stk->stackTop[size(stk) - 1];
    stk->size--;
}

/* Driver Code */
int main() {
    /* 初始化栈 */
    ArrayStack stack;
    newArrayStack(&stack);

    /* 元素入栈 */
    push(&stack, 1);
    push(&stack, 3);
    push(&stack, 2);
    push(&stack, 5);
    push(&stack, 4);

    printf("栈 stack = ");
    printArray(stack.stackTop, size(&stack));

    /* 访问栈顶元素 */
    int stackTop = top(&stack);
    printf("栈顶元素 top = %d\r\n", stackTop);

    /* 元素出栈 */
    pop(&stack);
    printf("出栈元素 pop = %d, 出栈后 stack =  ", stackTop);
    printArray(stack.stackTop, size(&stack));

    /* 获取栈的长度 */
    int stackSize = size(&stack);
    printf("栈的长度 size = %d\r\n", stackSize);

    /* 判断是否为空 */
    bool isEmpty = empty(&stack);
    printf("栈是否为空 = %s\r\n", isEmpty ? "yes" : "no");

    /* 析构函数 */
    delArrayStack(&stack);
    return 0;
}