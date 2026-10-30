/**
 * File: heap_sort.cpp
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Sift down from node i in a heap of size n */
void siftDown(vector<int> &nums, int n, int i) {
    while (true) {
        // Find the node with the largest value among i, l, and r, and store its index in ma
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // Stop if node i is largest or both child indices l and r are out of bounds
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
    // Build the heap by sifting down from every non-leaf node
    for (int i = nums.size() / 2 - 1; i >= 0; --i) {
        siftDown(nums, nums.size(), i);
    }
    // Extract the largest element from the heap, repeating for n-1 rounds
    for (int i = nums.size() - 1; i > 0; --i) {
        // Swap the root with the rightmost leaf on the last level (the first and last elements of the current heap)
        swap(nums[0], nums[i]);
        // Sift down starting at the root
        siftDown(nums, i, 0);
    }
}

/* Driver code */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    heapSort(nums);
    cout << "After heap sort, nums = ";
    printVector(nums);

    return 0;
}
