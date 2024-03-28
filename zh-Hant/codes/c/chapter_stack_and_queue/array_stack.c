/**
 * File: array_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 基於陣列實現的堆疊 */
typedef struct {
    int *data;
    int size;
} ArrayStack;

/* 建構子 */
ArrayStack *newArrayStack() {
    ArrayStack *stack = malloc(sizeof(ArrayStack));
    // 初始化一個大容量，避免擴容
    stack->data = malloc(sizeof(int) * MAX_SIZE);
    stack->size = 0;
    return stack;
}

/* 析構函式 */
void delArrayStack(ArrayStack *stack) {
    free(stack->data);
    free(stack);
}

/* 獲取堆疊的長度 */
int size(ArrayStack *stack) {
    return stack->size;
}

/* 判斷堆疊是否為空 */
bool isEmpty(ArrayStack *stack) {
    return stack->size == 0;
}

/* 入堆疊 */
void push(ArrayStack *stack, int num) {
    if (stack->size == MAX_SIZE) {
        printf("堆疊已滿\n");
        return;
    }
    stack->data[stack->size] = num;
    stack->size++;
}

/* 訪問堆疊頂元素 */
int peek(ArrayStack *stack) {
    if (stack->size == 0) {
        printf("堆疊為空\n");
        return INT_MAX;
    }
    return stack->data[stack->size - 1];
}

/* 出堆疊 */
int pop(ArrayStack *stack) {
    int val = peek(stack);
    stack->size--;
    return val;
}

/* Driver Code */
int main() {
    /* 初始化堆疊 */
    ArrayStack *stack = newArrayStack();

    /* 元素入堆疊 */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);
    printf("堆疊 stack = ");
    printArray(stack->data, stack->size);

    /* 訪問堆疊頂元素 */
    int val = peek(stack);
    printf("堆疊頂元素 top = %d\n", val);

    /* 元素出堆疊 */
    val = pop(stack);
    printf("出堆疊元素 pop = %d ，出堆疊後 stack = ", val);
    printArray(stack->data, stack->size);

    /* 獲取堆疊的長度 */
    int size = stack->size;
    printf("堆疊的長度 size =  %d\n", size);

    /* 判斷是否為空 */
    bool empty = isEmpty(stack);
    printf("堆疊是否為空 = %stack\n", empty ? "true" : "false");

    // 釋放記憶體
    delArrayStack(stack);

    return 0;
}
