/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 基於環形陣列實現的雙向佇列 */
typedef struct {
    int *nums;       // 用於儲存佇列元素的陣列
    int front;       // 佇列首指標，指向佇列首元素
    int queSize;     // 尾指標，指向佇列尾 + 1
    int queCapacity; // 佇列容量
} ArrayDeque;

/* 建構子 */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // 初始化陣列
    deque->queCapacity = capacity;
    deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
    deque->front = deque->queSize = 0;
    return deque;
}

/* 析構函式 */
void delArrayDeque(ArrayDeque *deque) {
    free(deque->nums);
    free(deque);
}

/* 獲取雙向佇列的容量 */
int capacity(ArrayDeque *deque) {
    return deque->queCapacity;
}

/* 獲取雙向佇列的長度 */
int size(ArrayDeque *deque) {
    return deque->queSize;
}

/* 判斷雙向佇列是否為空 */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* 計算環形陣列索引 */
int dequeIndex(ArrayDeque *deque, int i) {
    // 透過取餘操作實現陣列首尾相連
    // 當 i 越過陣列尾部時，回到頭部
    // 當 i 越過陣列頭部後，回到尾部
    return ((i + capacity(deque)) % capacity(deque));
}

/* 佇列首入列 */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("雙向佇列已滿\r\n");
        return;
    }
    // 佇列首指標向左移動一位
    // 透過取餘操作實現 front 越過陣列頭部回到尾部
    deque->front = dequeIndex(deque, deque->front - 1);
    // 將 num 新增到佇列首
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* 佇列尾入列 */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("雙向佇列已滿\r\n");
        return;
    }
    // 計算佇列尾指標，指向佇列尾索引 + 1
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // 將 num 新增至佇列尾
    deque->nums[rear] = num;
    deque->queSize++;
}

/* 訪問佇列首元素 */
int peekFirst(ArrayDeque *deque) {
    // 訪問異常：雙向佇列為空
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* 訪問佇列尾元素 */
int peekLast(ArrayDeque *deque) {
    // 訪問異常：雙向佇列為空
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* 佇列首出列 */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // 佇列首指標向後移動一位
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* 佇列尾出列 */
int popLast(ArrayDeque *deque) {
    int num = peekLast(deque);
    deque->queSize--;
    return num;
}

/* 返回陣列用於列印 */
int *toArray(ArrayDeque *deque, int *queSize) {
    *queSize = deque->queSize;
    int *res = (int *)calloc(deque->queSize, sizeof(int));
    int j = deque->front;
    for (int i = 0; i < deque->queSize; i++) {
        res[i] = deque->nums[j % deque->queCapacity];
        j++;
    }
    return res;
}

/* Driver Code */
int main() {
    /* 初始化佇列 */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("雙向佇列 deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* 訪問元素 */
    int peekFirstNum = peekFirst(deque);
    printf("佇列首元素 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("佇列尾元素 peekLast = %d\r\n", peekLastNum);

    /* 元素入列 */
    pushLast(deque, 4);
    printf("元素 4 佇列尾入列後 deque = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("元素 1 佇列首入列後 deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* 元素出列 */
    int popLastNum = popLast(deque);
    printf("佇列尾出列元素 = %d ，佇列尾出列後 deque= ", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("佇列首出列元素 = %d ，佇列首出列後 deque= ", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* 獲取佇列的長度 */
    int dequeSize = size(deque);
    printf("雙向佇列長度 size = %d\r\n", dequeSize);

    /* 判斷佇列是否為空 */
    bool isEmpty = empty(deque);
    printf("佇列是否為空 = %s\r\n", isEmpty ? "true" : "false");

    // 釋放記憶體
    delArrayDeque(deque);

    return 0;
}