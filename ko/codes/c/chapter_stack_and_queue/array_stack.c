/**
 * File: array_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* 배열로 구현한 스택 */
typedef struct {
    int *data;
    int size;
} ArrayStack;

/* 생성자 */
ArrayStack *newArrayStack() {
    ArrayStack *stack = malloc(sizeof(ArrayStack));
    // 용량 확장을 피하도록 큰 용량으로 초기화한다
    stack->data = malloc(sizeof(int) * MAX_SIZE);
    stack->size = 0;
    return stack;
}

/* 소멸자 */
void delArrayStack(ArrayStack *stack) {
    free(stack->data);
    free(stack);
}

/* 스택의 길이 반환 */
int size(ArrayStack *stack) {
    return stack->size;
}

/* 스택이 비어 있는지 판단 */
bool isEmpty(ArrayStack *stack) {
    return stack->size == 0;
}

/* 스택에 삽입 */
void push(ArrayStack *stack, int num) {
    if (stack->size == MAX_SIZE) {
        printf("스택이 가득 찼다\n");
        return;
    }
    stack->data[stack->size] = num;
    stack->size++;
}

/* 스택 맨 위 원소 접근 */
int peek(ArrayStack *stack) {
    if (stack->size == 0) {
        printf("스택이 비어 있다\n");
        return INT_MAX;
    }
    return stack->data[stack->size - 1];
}

/* 스택에서 꺼내기 */
int pop(ArrayStack *stack) {
    int val = peek(stack);
    stack->size--;
    return val;
}

/* 실행 코드 */
int main() {
    /* 스택 초기화 */
    ArrayStack *stack = newArrayStack();

    /* 스택에 원소 삽입 */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);
    printf("스택 stack = ");
    printArray(stack->data, stack->size);

    /* 스택 맨 위 원소 접근 */
    int val = peek(stack);
    printf("스택의 맨 위 원소 top = %d\n", val);

    /* 스택에서 원소 꺼내기 */
    val = pop(stack);
    printf("스택에서 꺼낸 원소 pop = %d, 꺼낸 후 stack = ", val);
    printArray(stack->data, stack->size);

    /* 스택의 길이 반환 */
    int size = stack->size;
    printf("스택의 길이 size = %d\n", size);

    /* 비어 있는지 판단 */
    bool empty = isEmpty(stack);
    printf("스택이 비어 있는가 = %s\n", empty ? "true" : "false");

    // 메모리 해제
    delArrayStack(stack);

    return 0;
}
