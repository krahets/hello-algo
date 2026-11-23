/**
 * File: bucket_sort.cpp
 * Created Time: 2023-03-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Bucket sort */
void bucketSort(vector<float> &nums) {
    // Initialize k = n/2 buckets, expecting 2 elements per bucket
    int k = nums.size() / 2;
    vector<vector<float>> buckets(k);
    // 1. Distribute the array elements among the buckets
    for (float num : nums) {
        // The input range is [0, 1); use num * k to map each value to an index in [0, k-1]
        int i = num * k;
        // Add num to bucket i
        buckets[i].push_back(num);
    }
    // 2. Sort each bucket
    for (vector<float> &bucket : buckets) {
        // Use the built-in sorting function, or replace it with another sorting algorithm
        sort(bucket.begin(), bucket.end());
    }
    // 3. Traverse the buckets to combine the results
    int i = 0;
    for (vector<float> &bucket : buckets) {
        for (float num : bucket) {
            nums[i++] = num;
        }
    }
}

/* Driver code */
int main() {
    // Assume the input consists of floating-point numbers in [0, 1)
    vector<float> nums = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums);
    cout << "After bucket sort, nums = ";
    printVector(nums);

    return 0;
}
