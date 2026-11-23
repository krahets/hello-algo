/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* 원소가 { 1, 2, ..., n }이며 순서가 섞인 배열 생성 */
int *randomNumbers(int n) {
    // 힙 메모리를 할당한다(원소 개수가 n이고 원소 타입이 int인 1차원 가변 길이 배열을 생성한다)
    int *nums = (int *)malloc(n * sizeof(int));
    // 배열 nums = { 1, 2, 3, ..., n }을 생성한다
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 배열 원소를 무작위로 섞는다
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    return nums;
}

/* 배열 nums에서 숫자 1이 있는 인덱스 탐색 */
int findOne(int *nums, int n) {
    for (int i = 0; i < n; i++) {
        // 원소 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)에 도달한다
        // 원소 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)에 도달한다
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* 실행 코드 */
int main(int argc, char *argv[]) {
    // 난수 시드를 초기화한다
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\n배열 [ 1, 2, ..., n ]을 섞은 결과 = ");
        printArray(nums, n);
        printf("숫자 1의 인덱스는 %d이다\n", index);
        // 힙 메모리를 해제한다
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }

    return 0;
}
