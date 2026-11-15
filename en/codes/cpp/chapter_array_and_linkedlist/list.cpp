/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver code */
int main() {
    /* Initialize the list */
    vector<int> nums = {1, 3, 2, 5, 4};
    cout << "List nums = ";
    printVector(nums);

    // [region]{access_element}
    /* Access an element */
    int num = nums[1]; // Access the element at index 1
    // [endregion]{access_element}
    cout << "Access the element at index 1, giving num = " << num << endl;

    // [region]{update_element}
    /* Update an element */
    nums[1] = 0; // Update the element at index 1 to 0
    // [endregion]{update_element}
    cout << "Update the element at index 1 to 0, giving nums = ";
    printVector(nums);

    // [region]{clear_list}
    /* Clear the list */
    nums.clear();
    // [endregion]{clear_list}
    cout << "After clearing the list, nums = ";
    printVector(nums);

    // [region]{append_element}
    /* Append an element at the end */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);
    // [endregion]{append_element}
    cout << "After adding elements, nums = ";
    printVector(nums);

    // [region]{insert_element}
    /* Insert an element in the middle */
    nums.insert(nums.begin() + 3, 6); // Insert the number 6 at index 3
    // [endregion]{insert_element}
    cout << "Insert the number 6 at index 3, giving nums = ";
    printVector(nums);

    // [region]{remove_element}
    /* Remove an element */
    nums.erase(nums.begin() + 3); // Remove the element at index 3
    // [endregion]{remove_element}
    cout << "Remove the element at index 3, giving nums = ";
    printVector(nums);

    // [region]{iterate_list}
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
    // [endregion]{iterate_list}

    // [region]{concat_list}
    /* Concatenate two lists */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    // Append list nums1 to nums
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    // [endregion]{concat_list}
    cout << "After appending list nums1 to nums, nums = ";
    printVector(nums);

    // [region]{sort_list}
    /* Sort the list */
    sort(nums.begin(), nums.end()); // After sorting, the list elements are in ascending order
    // [endregion]{sort_list}
    cout << "After sorting the list, nums = ";
    printVector(nums);

    return 0;
}
