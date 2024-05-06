/**
 * File: bucket_sort.cpp
 * Created Time: 2023-03-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Bucket sort */
void bucketSort(vector<float> &nums) {
    // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
    int k = nums.size() / 2;
    vector<vector<float>> buckets(k);
    // 1. Distribute array elements into various buckets
    for (float num : nums) {
        // Input data range is [0, 1), use num * k to map to index range [0, k-1]
        int i = num * k;
        // Add number to bucket_idx
        buckets[i].push_back(num);
    }
    // 2. Sort each bucket
    for (vector<float> &bucket : buckets) {
        // Use built-in sorting function, can also replace with other sorting algorithms
        sort(bucket.begin(), bucket.end());
    }
    // 3. Traverse buckets to merge results
    int i = 0;
    for (vector<float> &bucket : buckets) {
        for (float num : bucket) {
            nums[i++] = num;
        }
    }
}

/* Driver Code */
int main() {
    // Assume input data is floating point, range [0, 1)
    vector<float> nums = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums);
    cout << "After bucket sort, nums = ";
    printVector(nums);

    return 0;
}
