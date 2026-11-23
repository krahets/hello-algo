/**
 * File: array_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 配列で実装したスタック */
typedef struct {
    int *data;
    int size;
} ArrayStack;

/* コンストラクタ */
ArrayStack *newArrayStack() {
    ArrayStack *stack = malloc(sizeof(ArrayStack));
    // 容量の拡張を避けるため、初期容量を大きくする
    stack->data = malloc(sizeof(int) * MAX_SIZE);
    stack->size = 0;
    return stack;
}

/* デストラクタ */
void delArrayStack(ArrayStack *stack) {
    free(stack->data);
    free(stack);
}

/* スタックの長さを取得する */
int size(ArrayStack *stack) {
    return stack->size;
}

/* スタックが空かどうかを判定する */
bool isEmpty(ArrayStack *stack) {
    return stack->size == 0;
}

/* プッシュ */
void push(ArrayStack *stack, int num) {
    if (stack->size == MAX_SIZE) {
        printf("スタックが満杯です\n");
        return;
    }
    stack->data[stack->size] = num;
    stack->size++;
}

/* スタックの先頭要素にアクセスする */
int peek(ArrayStack *stack) {
    if (stack->size == 0) {
        printf("スタックが空です\n");
        return INT_MAX;
    }
    return stack->data[stack->size - 1];
}

/* ポップ */
int pop(ArrayStack *stack) {
    int val = peek(stack);
    stack->size--;
    return val;
}

/* 実行用コード */
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

    /* スタックの先頭要素にアクセスする */
    int val = peek(stack);
    printf("スタックの先頭要素 top = %d\n", val);

    /* 要素をポップする */
    val = pop(stack);
    printf("ポップした要素 pop = %d 、ポップ後 stack = ", val);
    printArray(stack->data, stack->size);

    /* スタックの長さを取得する */
    int size = stack->size;
    printf("スタックの長さ size = %d\n", size);

    /* 空かどうかを判定する */
    bool empty = isEmpty(stack);
    printf("スタックは空か = %s\n", empty ? "true" : "false");

    // メモリを解放する
    delArrayStack(stack);

    return 0;
}
