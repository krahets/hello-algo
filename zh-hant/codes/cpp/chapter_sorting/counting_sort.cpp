/**
 * File: counting_sort.cpp
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 計數排序 */
// 簡易實作，無法用來將物件排序
void countingSortNaive(vector<int> &nums) {
    // 1. 找出陣列中的最大元素 m
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. 統計各數字出現的次數
    // counter[num] 代表 num 出現的次數
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. 走訪 counter，將各元素填入原陣列 nums
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* 計數排序 */
// 完整實作，可將物件排序，且屬於穩定排序
void countingSort(vector<int> &nums) {
    // 1. 找出陣列中的最大元素 m
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. 統計各數字出現的次數
    // counter[num] 代表 num 出現的次數
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. 計算 counter 的前綴和，將「出現次數」轉為「結尾索引」
    // 也就是說，counter[num]-1 是 num 在 res 中最後一次出現的索引
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. 反向走訪 nums，將各元素填入結果陣列 res
    // 初始化陣列 res，用來記錄結果
    int n = nums.size();
    vector<int> res(n);
    for (int i = n - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // 將 num 放到對應索引的位置
        counter[num]--;              // 將前綴和減 1，取得下次放置 num 時所需的索引
    }
    // 用結果陣列 res 覆寫原陣列 nums
    nums = res;
}

/* 主程式 */
int main() {
    vector<int> nums = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSortNaive(nums);
    cout << "計數排序（無法將物件排序）完成後 nums = ";
    printVector(nums);

    vector<int> nums1 = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSort(nums1);
    cout << "計數排序完成後 nums1 = ";
    printVector(nums1);

    return 0;
}
