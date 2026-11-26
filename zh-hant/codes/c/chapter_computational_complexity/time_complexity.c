/**
 * File: time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* 常數階 */
int constant(int n) {
    int count = 0;
    int size = 100000;
    for (int i = 0; i < size; i++) {
        count++;
    }
    return count;
}

/* 線性階 */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 線性階（走訪陣列） */
int arrayTraversal(int *nums, int n) {
    int count = 0;
    // 迴圈次數與陣列長度成正比
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 平方階 */
int quadratic(int n) {
    int count = 0;
    // 迴圈次數正比於資料大小 n 的平方
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* 平方階（氣泡排序） */
int bubbleSort(int *nums, int n) {
    int count = 0; // 計數器
    // 外層迴圈：未排序區間為 [0, i]
    for (int i = n - 1; i > 0; i--) {
        // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 交換元素需 3 個基本操作
            }
        }
    }
    return count;
}

/* 指數階（迴圈實作） */
int exponential(int n) {
    int count = 0;
    int bas = 1;
    // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < bas; j++) {
            count++;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* 指數階（遞迴實作） */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 對數階（迴圈實作） */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* 對數階（遞迴實作） */
int logRecur(int n) {
    if (n <= 1)
        return 0;
    return logRecur(n / 2) + 1;
}

/* 線性對數階 */
int linearLogRecur(int n) {
    if (n <= 1)
        return 1;
    int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 階乘階（遞迴實作） */
int factorialRecur(int n) {
    if (n == 0)
        return 1;
    int count = 0;
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* 主程式 */
int main(int argc, char *argv[]) {
    // 試著修改 n 再執行，觀察各種複雜度的操作次數如何變化
    int n = 8;
    printf("輸入資料大小 n = %d\n", n);

    int count = constant(n);
    printf("常數階的操作次數 = %d\n", count);

    count = linear(n);
    printf("線性階的操作次數 = %d\n", count);
    // 在堆積區配置記憶體（建立一維變長陣列，內含 n 個 int 型別的元素）
    int *nums = (int *)malloc(n * sizeof(int));
    count = arrayTraversal(nums, n);
    printf("線性階（走訪陣列）的操作次數 = %d\n", count);

    count = quadratic(n);
    printf("平方階的操作次數 = %d\n", count);
    for (int i = 0; i < n; i++) {
        nums[i] = n - i; // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums, n);
    printf("平方階（氣泡排序）的操作次數 = %d\n", count);

    count = exponential(n);
    printf("指數階（迴圈實作）的操作次數 = %d\n", count);
    count = expRecur(n);
    printf("指數階（遞迴實作）的操作次數 = %d\n", count);

    count = logarithmic(n);
    printf("對數階（迴圈實作）的操作次數 = %d\n", count);
    count = logRecur(n);
    printf("對數階（遞迴實作）的操作次數 = %d\n", count);

    count = linearLogRecur(n);
    printf("線性對數階（遞迴實作）的操作次數 = %d\n", count);

    count = factorialRecur(n);
    printf("階乘階（遞迴實作）的操作次數 = %d\n", count);

    // 釋放堆積區的記憶體
    if (nums != NULL) {
        free(nums);
        nums = NULL;
    }
    getchar();

    return 0;
}
