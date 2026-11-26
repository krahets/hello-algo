/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Generate a shuffled array containing { 1, 2, ..., n } */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // Generate the array nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Use the system time as the random seed
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // Shuffle the array elements at random
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* Find the index of 1 in the array nums */
int findOne(vector<int> &nums) {
    for (int i = 0; i < nums.size(); i++) {
        // Best case: 1 is the first element, so the search takes O(1) time
        // Worst case: 1 is the last element, so the search takes O(n) time
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
        cout << "\nShuffled array [ 1, 2, ..., n ] = ";
        printVector(nums);
        cout << "Index of 1 = " << index << endl;
    }
    return 0;
}
