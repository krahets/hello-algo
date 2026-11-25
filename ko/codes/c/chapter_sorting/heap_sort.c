/**
 * File: heap_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 길이 n인 힙에서 노드 i부터 아래로 내려가며 힙 속성 복원 */
void siftDown(int nums[], int n, int i) {
    while (1) {
        // 노드 i, l, r 중 값이 가장 큰 노드를 ma에 기록
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나 더 진행할 필요가 없으면 종료
        if (ma == i) {
            break;
        }
        // 두 노드 교환
        int temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // 아래로 내려가며 힙 속성 복원 반복
        i = ma;
    }
}

/* 힙 정렬 */
void heapSort(int nums[], int n) {
    // 힙 구성: 리프 노드를 제외한 모든 노드에서 힙 속성 복원
    for (int i = n / 2 - 1; i >= 0; --i) {
        siftDown(nums, n, i);
    }
    // 힙에서 최댓값 추출을 n-1회 반복
    for (int i = n - 1; i > 0; --i) {
        // 루트 노드와 맨 오른쪽 리프 노드 교환(첫 원소와 마지막 원소 교환)
        int tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // 루트 노드부터 아래로 내려가며 힙 속성 복원
        siftDown(nums, i, 0);
    }
}

/* 실행 예제 */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    heapSort(nums, n);
    printf("힙 정렬 후 nums = ");
    printArray(nums, n);

    return 0;
}