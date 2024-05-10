/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Generate an array with elements {1, 2, ..., n} in a randomly shuffled order */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // Generate array nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Generate a random seed using system time
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // Randomly shuffle array elements
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* Find the index of number 1 in array nums */
int findOne(vector<int> &nums) {
    for (int i = 0; i < nums.size(); i++) {
        // When element 1 is at the start of the array, achieve best time complexity O(1)
        // When element 1 is at the end of the array, achieve worst time complexity O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    for (int i = 0; i < 1000; i++) {
        int n = 100;
        vector<int> nums = randomNumbers(n);
        int index = findOne(nums);
        cout << "\nThe array [ 1, 2, ..., n ] after being shuffled = ";
        printVector(nums);
        cout << "The index of number 1 is " << index << endl;
    }
    return 0;
}
