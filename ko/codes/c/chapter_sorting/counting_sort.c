/**
 * File: counting_sort.c
 * Created Time: 2023-03-20
 * Author: Reanon (793584285@qq.com), Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* 계수 정렬 */
// 객체를 정렬할 수 없는 간단한 구현
void countingSortNaive(int nums[], int size) {
    // 1. 배열의 최댓값 m 구하기
    int m = 0;
    for (int i = 0; i < size; i++) {
        if (nums[i] > m) {
            m = nums[i];
        }
    }
    // 2. 각 숫자의 출현 횟수 세기
    // counter[num]은 num의 출현 횟수
    int *counter = calloc(m + 1, sizeof(int));
    for (int i = 0; i < size; i++) {
        counter[nums[i]]++;
    }
    // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채우기
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
    // 4. 메모리 해제
    free(counter);
}

/* 계수 정렬 */
// 객체도 정렬할 수 있는 안정 정렬의 전체 구현
void countingSort(int nums[], int size) {
    // 1. 배열의 최댓값 m 구하기
    int m = 0;
    for (int i = 0; i < size; i++) {
        if (nums[i] > m) {
            m = nums[i];
        }
    }
    // 2. 각 숫자의 출현 횟수 세기
    // counter[num]은 num의 출현 횟수
    int *counter = calloc(m + 1, sizeof(int));
    for (int i = 0; i < size; i++) {
        counter[nums[i]]++;
    }
    // 3. counter의 누적합을 구해 ‘출현 횟수’를 ‘끝 위치’로 변환
    // 즉, counter[num]-1은 res에서 num이 마지막으로 나타나는 인덱스
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채우기
    // 결과를 기록할 배열 res 초기화
    int *res = malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // num을 해당 인덱스에 배치
        counter[num]--;              // 누적합을 1 줄여 다음 num을 배치할 인덱스 구하기
    }
    // 결과 배열 res로 원래 배열 nums를 덮어쓰기
    memcpy(nums, res, size * sizeof(int));
    // 5. 메모리 해제
    free(res);
    free(counter);
}

/* 실행 예제 */
int main() {
    int nums[] = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    int size = sizeof(nums) / sizeof(int);
    countingSortNaive(nums, size);
    printf("계수 정렬(객체 정렬 불가) 후 nums = ");
    printArray(nums, size);

    int nums1[] = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    int size1 = sizeof(nums1) / sizeof(int);
    countingSort(nums1, size1);
    printf("계수 정렬 후 nums1 = ");
    printArray(nums1, size1);

    return 0;
}
