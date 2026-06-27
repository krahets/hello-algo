/**
 * File: heap_sort.cpp
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Heap length is n, start heapifying node i, from top to bottom */
void siftDown(vector<int> &nums, int n, int i) {
    while (true) {
        // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // Swap two nodes
        if (ma == i) {
            break;
        }
        // Swap two nodes
        swap(nums[i], nums[ma]);
        // Loop downwards heapification
        i = ma;
    }
}

/* Heap sort */
void heapSort(vector<int> &nums) {
    // Build heap operation: heapify all nodes except leaves
    for (int i = nums.size() / 2 - 1; i >= 0; --i) {
        siftDown(nums, nums.size(), i);
    }
    // Extract the largest element from the heap and repeat for n-1 rounds
    for (int i = nums.size() - 1; i > 0; --i) {
        // Delete node
        swap(nums[0], nums[i]);
        // Start heapifying the root node, from top to bottom
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    heapSort(nums);
    cout << "After heap sort completes, nums = ";
    printVector(nums);

    return 0;
}
