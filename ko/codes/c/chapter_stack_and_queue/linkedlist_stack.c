/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 연결 리스트로 구현한 스택 */
typedef struct {
    ListNode *top; // 머리 노드를 스택의 맨 위로 사용한다
    int size;      // 스택의 길이
} LinkedListStack;

/* 생성자 */
LinkedListStack *newLinkedListStack() {
    LinkedListStack *s = malloc(sizeof(LinkedListStack));
    s->top = NULL;
    s->size = 0;
    return s;
}

/* 소멸자 */
void delLinkedListStack(LinkedListStack *s) {
    while (s->top) {
        ListNode *n = s->top->next;
        free(s->top);
        s->top = n;
    }
    free(s);
}

/* 스택의 길이 반환 */
int size(LinkedListStack *s) {
    return s->size;
}

/* 스택이 비어 있는지 판단 */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* 스택에 삽입 */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // 새로 추가한 노드의 포인터 필드를 갱신한다
    node->val = num;     // 새로 추가한 노드의 데이터 필드를 갱신한다
    s->top = node;       // 스택의 맨 위를 갱신한다
    s->size++;           // 스택 크기를 갱신한다
}

/* 스택 맨 위 원소 접근 */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("스택이 비어 있다\n");
        return INT_MAX;
    }
    return s->top->val;
}

/* 스택에서 꺼내기 */
int pop(LinkedListStack *s) {
    int val = peek(s);
    ListNode *tmp = s->top;
    s->top = s->top->next;
    // 메모리 해제
    free(tmp);
    s->size--;
    return val;
}

/* 실행 코드 */
int main() {
    /* 스택 초기화 */
    LinkedListStack *stack = newLinkedListStack();

    /* 스택에 원소 삽입 */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("스택 stack = ");
    printLinkedList(stack->top);

    /* 스택 맨 위 원소 접근 */
    int val = peek(stack);
    printf("스택의 맨 위 원소 top = %d\r\n", val);

    /* 스택에서 원소 꺼내기 */
    val = pop(stack);
    printf("스택에서 꺼낸 원소 pop = %d, 꺼낸 후 stack =  ", val);
    printLinkedList(stack->top);

    /* 스택의 길이 반환 */
    printf("스택의 길이 size = %d\n", size(stack));

    /* 비어 있는지 판단 */
    bool empty = isEmpty(stack);
    printf("스택이 비어 있는가 = %s\n", empty ? "true" : "false");

    // 메모리 해제
    delLinkedListStack(stack);

    return 0;
}
