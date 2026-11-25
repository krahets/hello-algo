/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 隨機存取元素 */
int randomAccess(int *nums, int size) {
    // 從區間 [0, size) 隨機選取一個數
    int randomIndex = rand() % size;
    // 取得並回傳隨機選出的元素
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* 增加陣列長度 */
int *extend(int *nums, int size, int enlarge) {
    // 初始化加長後的陣列
    int *res = new int[size + enlarge]{};
    // 將原陣列的所有元素複製到新陣列
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // 釋放記憶體
    delete[] nums;
    // 回傳加長後的新陣列
    return res;
}

/* 在陣列的索引 index 處插入元素 num */
void insert(int *nums, int size, int num, int index) {
    // 將索引 index 起的所有元素往後移一格
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // 將 num 指派給索引 index 處的元素
    nums[index] = num;
}

/* 刪除索引 index 處的元素 */
void remove(int *nums, int size, int index) {
    // 將索引 index 之後的所有元素往前移一格
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 走訪陣列 */
void traverse(int *nums, int size) {
    int count = 0;
    // 依索引走訪陣列
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* 在陣列中尋找指定元素 */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* 範例主程式 */
int main() {
    /* 初始化陣列 */
    int size = 5;
    int *arr = new int[size]{};
    cout << "陣列 arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "陣列 nums = ";
    printArray(nums, size);

    /* 隨機存取 */
    int randomNum = randomAccess(nums, size);
    cout << "從 nums 隨機取得的元素為 " << randomNum << endl;

    /* 增加長度 */
    int enlarge = 3;
    nums = extend(nums, size, enlarge);
    size += enlarge;
    cout << "將陣列長度增加至 8，得到 nums = ";
    printArray(nums, size);

    /* 插入元素 */
    insert(nums, size, 6, 3);
    cout << "在索引 3 處插入數字 6，得到 nums = ";
    printArray(nums, size);

    /* 刪除元素 */
    remove(nums, size, 2);
    cout << "刪除索引 2 處的元素，得到 nums = ";
    printArray(nums, size);

    /* 走訪陣列 */
    traverse(nums, size);

    /* 尋找元素 */
    int index = find(nums, size, 3);
    cout << "在 nums 中尋找元素 3，得到索引 = " << index << endl;

    // 釋放記憶體
    delete[] arr;
    delete[] nums;

    return 0;
}
