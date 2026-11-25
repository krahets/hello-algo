/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
int *randomNumbers(int n) {
    // 在堆積區配置記憶體（建立一維變長陣列，內含 n 個 int 型別的元素）
    int *nums = (int *)malloc(n * sizeof(int));
    // 建立陣列 nums = { 1, 2, 3, ..., n }
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

/* 在陣列 nums 中尋找數字 1 的索引 */
int findOne(int *nums, int n) {
    for (int i = 0; i < n; i++) {
        // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
        // 若 1 在陣列末端，最差時間複雜度為 O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* 主程式 */
int main(int argc, char *argv[]) {
    // 設定亂數種子
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\n陣列 [ 1, 2, ..., n ] 打亂順序後 = ");
        printArray(nums, n);
        printf("數字 1 的索引為 %d\n", index);
        // 釋放堆積區的記憶體
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }

    return 0;
}
