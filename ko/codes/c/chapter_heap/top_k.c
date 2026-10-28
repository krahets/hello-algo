/**
 * File: top_k.c
 * Created Time: 2023-10-26
 * Author: krahets (krahets163.com)
 */

#include "my_heap.c"

/* 힙에 원소 삽입 */
void pushMinHeap(MaxHeap *maxHeap, int val) {
    // 원소의 부호를 반전한다
    push(maxHeap, -val);
}

/* 힙에서 원소 꺼내기 */
int popMinHeap(MaxHeap *maxHeap) {
    // 원소의 부호를 반전한다
    return -pop(maxHeap);
}

/* 힙의 루트 원소 접근 */
int peekMinHeap(MaxHeap *maxHeap) {
    // 원소의 부호를 반전한다
    return -peek(maxHeap);
}

/* 힙의 원소를 반환한다 */
int *getMinHeap(MaxHeap *maxHeap) {
    // 힙의 모든 원소의 부호를 반전하여 res 배열에 저장한다
    int *res = (int *)malloc(maxHeap->size * sizeof(int));
    for (int i = 0; i < maxHeap->size; i++) {
        res[i] = -maxHeap->data[i];
    }
    return res;
}

// 힙으로 배열에서 가장 큰 k개 원소를 찾는 함수
int *topKHeap(int *nums, int sizeNums, int k) {
    // 최소 힙 초기화
    // 힙의 모든 원소의 부호를 반전하여 최대 힙으로 최소 힙을 구현한다는 점에 유의한다
    int *empty = (int *)malloc(0);
    MaxHeap *maxHeap = newMaxHeap(empty, 0);
    // 배열의 앞쪽 k개 원소를 힙에 삽입한다
    for (int i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // k+1번째 원소부터 힙의 길이를 k로 유지한다
    for (int i = k; i < sizeNums; i++) {
        // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    int *res = getMinHeap(maxHeap);
    // 메모리 해제
    delMaxHeap(maxHeap);
    return res;
}

/* 실행 코드 */
int main() {
    int nums[] = {1, 7, 6, 3, 2};
    int k = 3;
    int sizeNums = sizeof(nums) / sizeof(nums[0]);

    int *res = topKHeap(nums, sizeNums, k);
    printf("가장 큰 %d개 원소: ", k);
    printArray(res, k);

    free(res);
    return 0;
}
