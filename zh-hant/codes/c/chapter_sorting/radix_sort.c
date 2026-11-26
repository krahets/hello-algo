/**
 * File: radix_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 取得元素 num 的第 k 位數字，其中 exp = 10^(k-1) */
int digit(int num, int exp) {
    // 傳入 exp 而非 k，可避免在此重複執行成本較高的次方運算
    return (num / exp) % 10;
}

/* 計數排序（依 nums 中各元素的第 k 位數字排序） */
void countingSortDigit(int nums[], int size, int exp) {
    // 十進位的每個數位介於 0~9 之間，因此需要長度為 10 的桶陣列
    int *counter = (int *)malloc((sizeof(int) * 10));
    memset(counter, 0, sizeof(int) * 10); // 初始值設為 0，以便後續釋放記憶體
    // 統計 0~9 各數字出現的次數
    for (int i = 0; i < size; i++) {
        // 取得 nums[i] 的第 k 位數字，記為 d
        int d = digit(nums[i], exp);
        // 統計數字 d 出現的次數
        counter[d]++;
    }
    // 計算前綴和，將「出現次數」轉為「陣列索引」
    for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // 反向走訪，依桶內的統計結果將各元素填入 res
    int *res = (int *)malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // 取得 d 在陣列中的索引 j
        res[j] = nums[i];       // 將目前的元素填入索引 j 的位置
        counter[d]--;           // 將 d 的數量減 1
    }
    // 用結果覆寫原陣列 nums
    for (int i = 0; i < size; i++) {
        nums[i] = res[i];
    }
    // 釋放記憶體
    free(res);
    free(counter);
}

/* 基數排序 */
void radixSort(int nums[], int size) {
    // 取得陣列中的最大元素，用來判斷最多有幾位數
    int max = INT32_MIN;
    for (int i = 0; i < size; i++) {
        if (nums[i] > max) {
            max = nums[i];
        }
    }
    // 依序從最低位走訪到最高位
    for (int exp = 1; max >= exp; exp *= 10)
        // 依陣列元素的第 k 位數字執行計數排序
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 即 exp = 10^(k-1)
        countingSortDigit(nums, size, exp);
}

/* 主程式 */
int main() {
    // 基數排序
    int nums[] = {10546151, 35663510, 42865989, 34862445, 81883077,
                  88906420, 72429244, 30524779, 82060337, 63832996};
    int size = sizeof(nums) / sizeof(int);
    radixSort(nums, size);
    printf("基數排序完成後 nums = ");
    printArray(nums, size);
}
