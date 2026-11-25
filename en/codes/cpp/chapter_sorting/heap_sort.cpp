/**
 * File: heap_sort.cpp
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Sift down from node i in a heap of size n */
void siftDown(vector<int> &nums, int n, int i) {
    while (true) {
        // Let ma be the index of the largest of nodes i, l, and r
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // Stop if i is the largest or both child indices l and r are out of bounds
        if (ma == i) {
            break;
        }
        // Swap the two nodes
        swap(nums[i], nums[ma]);
        // Continue sifting down
        i = ma;
    }
}

/* Heap sort */
void heapSort(vector<int> &nums) {
    // Build the heap by sifting down from each non-leaf node
    for (int i = nums.size() / 2 - 1; i >= 0; --i) {
        siftDown(nums, nums.size(), i);
    }
    // Extract the maximum from the heap in each of n-1 rounds
    for (int i = nums.size() - 1; i > 0; --i) {
        // Swap the root and rightmost leaf (the first and last elements)
        swap(nums[0], nums[i]);
        // Sift down from the root
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    heapSort(nums);
    cout << "After heap sort, nums = ";
    printVector(nums);

    return 0;
}
