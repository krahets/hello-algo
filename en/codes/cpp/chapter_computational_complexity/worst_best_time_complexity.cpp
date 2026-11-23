/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Generate an array containing { 1, 2, ..., n } in shuffled order */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // Generate the array nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Use the system time to generate a random seed
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // Randomly shuffle the array elements
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* Find the index of the number 1 in array nums */
int findOne(vector<int> &nums) {
    for (int i = 0; i < nums.size(); i++) {
        // When 1 is at the start of the array, the best-case time complexity is O(1)
        // When 1 is at the end of the array, the worst-case time complexity is O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Driver code */
int main() {
    for (int i = 0; i < 1000; i++) {
        int n = 100;
        vector<int> nums = randomNumbers(n);
        int index = findOne(nums);
        cout << "\nArray [ 1, 2, ..., n ] after shuffling = ";
        printVector(nums);
        cout << "The index of the number 1 is " << index << endl;
    }
    return 0;
}
