/**
 * File: top_k.c
 * Created Time: 2023-10-26
 * Author: krahets (krahets163.com)
 */

#include "my_heap.c"

/* 힙에 원소 삽입 */
void pushMinHeap(MaxHeap *maxHeap, int val) {
    // 원소의 부호 반전
    push(maxHeap, -val);
}

/* 힙에서 원소 꺼내기 */
int popMinHeap(MaxHeap *maxHeap) {
    // 원소의 부호 반전
    return -pop(maxHeap);
}

/* 힙의 루트 원소 조회 */
int peekMinHeap(MaxHeap *maxHeap) {
    // 원소의 부호 반전
    return -peek(maxHeap);
}

/* 최소 힙의 모든 원소를 배열로 반환 */
int *getMinHeap(MaxHeap *maxHeap) {
    // 힙의 모든 원소의 부호를 바꿔 배열 res에 저장
    int *res = (int *)malloc(maxHeap->size * sizeof(int));
    for (int i = 0; i < maxHeap->size; i++) {
        res[i] = -maxHeap->data[i];
    }
    return res;
}

/* 힙을 이용해 배열에서 가장 큰 원소 k개를 찾는 함수 */
int *topKHeap(int *nums, int sizeNums, int k) {
    // 최소 힙 초기화
    // 모든 원소의 부호를 바꾸면 최대 힙을 최소 힙처럼 사용할 수 있음
    int *empty = (int *)malloc(0);
    MaxHeap *maxHeap = newMaxHeap(empty, 0);
    // 배열의 처음 k개 원소를 힙에 삽입
    for (int i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // k+1번째 원소부터 힙의 크기를 k로 유지
    for (int i = k; i < sizeNums; i++) {
        // 현재 원소가 루트보다 크면 루트를 꺼내고 현재 원소를 삽입
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

/* 실행 예제 */
int main() {
    int nums[] = {1, 7, 6, 3, 2};
    int k = 3;
    int sizeNums = sizeof(nums) / sizeof(nums[0]);

    int *res = topKHeap(nums, sizeNums, k);
    printf("가장 큰 원소 %d개: ", k);
    printArray(res, k);

    free(res);
    return 0;
}
