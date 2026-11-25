/**
 * File: bucket_sort.cpp
 * Created Time: 2023-03-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 桶排序 */
void bucketSort(vector<float> &nums) {
    // 初始化 k = n/2 個桶，預期每個桶會分到 2 個元素
    int k = nums.size() / 2;
    vector<vector<float>> buckets(k);
    // 1. 將陣列元素分配到各個桶中
    for (float num : nums) {
        // 輸入資料的範圍為 [0, 1)，以 num * k 對應到索引範圍 [0, k-1]
        int i = num * k;
        // 將 num 加入編號為 bucket_idx 的桶
        buckets[i].push_back(num);
    }
    // 2. 分別將每個桶內的元素排序
    for (vector<float> &bucket : buckets) {
        // 使用內建排序函式，也可以改用其他排序演算法
        sort(bucket.begin(), bucket.end());
    }
    // 3. 依序走訪各桶並合併結果
    int i = 0;
    for (vector<float> &bucket : buckets) {
        for (float num : bucket) {
            nums[i++] = num;
        }
    }
}

/* 主程式 */
int main() {
    // 假設輸入資料為浮點數，範圍為 [0, 1)
    vector<float> nums = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums);
    cout << "桶排序完成後 nums = ";
    printVector(nums);

    return 0;
}
