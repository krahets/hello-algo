/**
 * File: array_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 以陣列實作堆疊 */
typedef struct {
    int *data;
    int size;
} ArrayStack;

/* 建立堆疊 */
ArrayStack *newArrayStack() {
    ArrayStack *stack = malloc(sizeof(ArrayStack));
    // 一開始就配置較大的容量，以免之後需要擴充
    stack->data = malloc(sizeof(int) * MAX_SIZE);
    stack->size = 0;
    return stack;
}

/* 釋放堆疊的記憶體 */
void delArrayStack(ArrayStack *stack) {
    free(stack->data);
    free(stack);
}

/* 取得堆疊長度 */
int size(ArrayStack *stack) {
    return stack->size;
}

/* 判斷堆疊是否為空 */
bool isEmpty(ArrayStack *stack) {
    return stack->size == 0;
}

/* 推入堆疊 */
void push(ArrayStack *stack, int num) {
    if (stack->size == MAX_SIZE) {
        printf("堆疊已滿\n");
        return;
    }
    stack->data[stack->size] = num;
    stack->size++;
}

/* 讀取堆疊頂端的元素 */
int peek(ArrayStack *stack) {
    if (stack->size == 0) {
        printf("堆疊為空\n");
        return INT_MAX;
    }
    return stack->data[stack->size - 1];
}

/* 彈出堆疊頂端的元素 */
int pop(ArrayStack *stack) {
    int val = peek(stack);
    stack->size--;
    return val;
}

/* 範例程式 */
int main() {
    /* 初始化堆疊 */
    ArrayStack *stack = newArrayStack();

    /* 將元素推入堆疊 */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);
    printf("堆疊 stack = ");
    printArray(stack->data, stack->size);

    /* 讀取堆疊頂端的元素 */
    int val = peek(stack);
    printf("堆疊頂端元素 top = %d\n", val);

    /* 從堆疊彈出元素 */
    val = pop(stack);
    printf("彈出的元素 pop = %d ，彈出後 stack = ", val);
    printArray(stack->data, stack->size);

    /* 取得堆疊長度 */
    int size = stack->size;
    printf("堆疊長度 size = %d\n", size);

    /* 判斷堆疊是否為空 */
    bool empty = isEmpty(stack);
    printf("堆疊是否為空 = %s\n", empty ? "true" : "false");

    // 釋放記憶體
    delArrayStack(stack);

    return 0;
}
