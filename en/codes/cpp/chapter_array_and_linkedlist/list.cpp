/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Initialize the list */
    vector<int> nums = {1, 3, 2, 5, 4};
    cout << "List nums = ";
    printVector(nums);

    /* Access an element */
    int num = nums[1];
    cout << "Reading index 1 gives num = " << num << endl;

    /* Update an element */
    nums[1] = 0;
    cout << "After setting the element at index 1 to 0, nums = ";
    printVector(nums);

    /* Clear the list */
    nums.clear();
    cout << "After clearing the list, nums = ";
    printVector(nums);

    /* Append an element */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);
    cout << "After appending elements, nums = ";
    printVector(nums);

    /* Insert an element in the middle */
    nums.insert(nums.begin() + 3, 6);
    cout << "After inserting 6 at index 3, nums = ";
    printVector(nums);

    /* Remove an element */
    nums.erase(nums.begin() + 3);
    cout << "After removing the element at index 3, nums = ";
    printVector(nums);

    /* Traverse the list by index */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }
    /* Iterate directly over the list elements */
    count = 0;
    for (int x : nums) {
        count += x;
    }

    /* Concatenate two lists */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    cout << "After appending nums1 to nums, nums = ";
    printVector(nums);

    /* Sort the list */
    sort(nums.begin(), nums.end());
    cout << "After sorting, nums = ";
    printVector(nums);

    return 0;
}
