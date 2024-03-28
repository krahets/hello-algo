/**
 * File: bucket_sort.cpp
 * Created Time: 2023-03-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 桶排序 */
void bucketSort(vector<float> &nums) {
    // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
    int k = nums.size() / 2;
    vector<vector<float>> buckets(k);
    // 1. 將陣列元素分配到各個桶中
    for (float num : nums) {
        // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
        int i = num * k;
        // 將 num 新增進桶 bucket_idx
        buckets[i].push_back(num);
    }
    // 2. 對各個桶執行排序
    for (vector<float> &bucket : buckets) {
        // 使用內建排序函式，也可以替換成其他排序演算法
        sort(bucket.begin(), bucket.end());
    }
    // 3. 走訪桶合併結果
    int i = 0;
    for (vector<float> &bucket : buckets) {
        for (float num : bucket) {
            nums[i++] = num;
        }
    }
}

/* Driver Code */
int main() {
    // 設輸入資料為浮點數，範圍為 [0, 1)
    vector<float> nums = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums);
    cout << "桶排序完成後 nums = ";
    printVector(nums);

    return 0;
}
