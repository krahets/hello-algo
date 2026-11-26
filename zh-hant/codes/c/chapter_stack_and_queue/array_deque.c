/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 以環狀陣列實作雙端佇列 */
typedef struct {
    int *nums;       // 存放雙端佇列元素的陣列
    int front;       // 隊首索引，記錄隊首元素在陣列中的位置
    int queSize;     // 雙向佇列中的元素個數
    int queCapacity; // 雙端佇列容量
} ArrayDeque;

/* 建立雙端佇列 */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // 初始化陣列
    deque->queCapacity = capacity;
    deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
    deque->front = deque->queSize = 0;
    return deque;
}

/* 釋放雙端佇列的記憶體 */
void delArrayDeque(ArrayDeque *deque) {
    free(deque->nums);
    free(deque);
}

/* 取得雙端佇列容量 */
int capacity(ArrayDeque *deque) {
    return deque->queCapacity;
}

/* 取得雙端佇列長度 */
int size(ArrayDeque *deque) {
    return deque->queSize;
}

/* 判斷雙端佇列是否為空 */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* 計算環狀陣列的索引 */
int dequeIndex(ArrayDeque *deque, int i) {
    // 取餘數，讓陣列的首尾相接
    // 當 i 超過陣列末端時，繞回開頭
    // 當 i 越過陣列開頭時，繞回末端
    return ((i + capacity(deque)) % capacity(deque));
}

/* 從隊首加入元素 */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("雙端佇列已滿\r\n");
        return;
    }
    // 將隊首索引往左移一格
    // 取餘數，讓 front 越過陣列開頭時繞回末端
    deque->front = dequeIndex(deque, deque->front - 1);
    // 將 num 加到隊首
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* 從隊尾加入元素 */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("雙端佇列已滿\r\n");
        return;
    }
    // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // 將 num 加到隊尾
    deque->nums[rear] = num;
    deque->queSize++;
}

/* 讀取隊首元素 */
int peekFirst(ArrayDeque *deque) {
    // 雙端佇列為空時，無法讀取元素
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* 讀取隊尾元素 */
int peekLast(ArrayDeque *deque) {
    // 雙端佇列為空時，無法讀取元素
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* 從隊首取出元素 */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // 將隊首索引往後移一格
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* 從隊尾取出元素 */
int popLast(ArrayDeque *deque) {
    int num = peekLast(deque);
    deque->queSize--;
    return num;
}

/* 回傳陣列以便輸出 */
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

/* 範例程式 */
int main() {
    /* 初始化雙端佇列 */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("雙端佇列 deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* 讀取隊首與隊尾元素 */
    int peekFirstNum = peekFirst(deque);
    printf("隊首元素 peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("隊尾元素 peekLast = %d\r\n", peekLastNum);

    /* 將元素加入雙端佇列 */
    pushLast(deque, 4);
    printf("將元素 4 加到隊尾後 deque = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("將元素 1 加到隊首後 deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* 從雙端佇列取出元素 */
    int popLastNum = popLast(deque);
    printf("從隊尾取出的元素 = %d ，取出後 deque= ", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("從隊首取出的元素 = %d ，取出後 deque= ", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* 取得雙端佇列長度 */
    int dequeSize = size(deque);
    printf("雙端佇列長度 size = %d\r\n", dequeSize);

    /* 判斷雙端佇列是否為空 */
    bool isEmpty = empty(deque);
    printf("雙端佇列是否為空 = %s\r\n", isEmpty ? "true" : "false");

    // 釋放記憶體
    delArrayDeque(deque);

    return 0;
}