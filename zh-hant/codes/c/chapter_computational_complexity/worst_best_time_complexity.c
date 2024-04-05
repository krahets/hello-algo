/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* 生成一個陣列，元素為 { 1, 2, ..., n }，順序被打亂 */
int *randomNumbers(int n) {
    // 分配堆積區記憶體（建立一維可變長陣列：陣列中元素數量為 n ，元素型別為 int ）
    int *nums = (int *)malloc(n * sizeof(int));
    // 生成陣列 nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 隨機打亂陣列元素
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    return nums;
}

/* 查詢陣列 nums 中數字 1 所在索引 */
int findOne(int *nums, int n) {
    for (int i = 0; i < n; i++) {
        // 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
        // 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Driver Code */
int main(int argc, char *argv[]) {
    // 初始化隨機數種子
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\n陣列 [ 1, 2, ..., n ] 被打亂後 = ");
        printArray(nums, n);
        printf("數字 1 的索引為 %d\n", index);
        // 釋放堆積區記憶體
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }

    return 0;
}
