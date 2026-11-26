/**
 * File: array_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 配列を使ったスタック */
typedef struct {
    int *data;
    int size;
} ArrayStack;

/* 生成関数 */
ArrayStack *newArrayStack() {
    ArrayStack *stack = malloc(sizeof(ArrayStack));
    // 容量を拡張せずに済むよう、初めから大きな容量を確保する
    stack->data = malloc(sizeof(int) * MAX_SIZE);
    stack->size = 0;
    return stack;
}

/* 解放関数 */
void delArrayStack(ArrayStack *stack) {
    free(stack->data);
    free(stack);
}

/* スタックの要素数を取得する */
int size(ArrayStack *stack) {
    return stack->size;
}

/* スタックが空かどうかを判定する */
bool isEmpty(ArrayStack *stack) {
    return stack->size == 0;
}

/* プッシュする */
void push(ArrayStack *stack, int num) {
    if (stack->size == MAX_SIZE) {
        printf("スタックが満杯です\n");
        return;
    }
    stack->data[stack->size] = num;
    stack->size++;
}

/* スタックのトップを参照する */
int peek(ArrayStack *stack) {
    if (stack->size == 0) {
        printf("スタックが空です\n");
        return INT_MAX;
    }
    return stack->data[stack->size - 1];
}

/* ポップする */
int pop(ArrayStack *stack) {
    int val = peek(stack);
    stack->size--;
    return val;
}

/* 実行例 */
int main() {
    /* スタックを初期化する */
    ArrayStack *stack = newArrayStack();

    /* 要素をプッシュする */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);
    printf("スタック stack = ");
    printArray(stack->data, stack->size);

    /* スタックのトップを参照する */
    int val = peek(stack);
    printf("スタックのトップの要素 top = %d\n", val);

    /* 要素をポップする */
    val = pop(stack);
    printf("ポップした要素 pop = %d 、ポップ後の stack = ", val);
    printArray(stack->data, stack->size);

    /* スタックの要素数を取得する */
    int size = stack->size;
    printf("スタックの要素数 size = %d\n", size);

    /* 空かどうかを判定する */
    bool empty = isEmpty(stack);
    printf("スタックは空か = %s\n", empty ? "true" : "false");

    // メモリを解放する
    delArrayStack(stack);

    return 0;
}
