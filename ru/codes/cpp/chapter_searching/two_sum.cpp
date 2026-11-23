/**
 * File: two_sum.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Метод 1: полный перебор */
vector<int> twoSumBruteForce(vector<int> &nums, int target) {
    int size = nums.size();
    // Два вложенных цикла, временная сложность O(n^2)
    for (int i = 0; i < size - 1; i++) {
        for (int j = i + 1; j < size; j++) {
            if (nums[i] + nums[j] == target)
                return {i, j};
        }
    }
    return {};
}

/* Метод 2: вспомогательная хеш-таблица */
vector<int> twoSumHashTable(vector<int> &nums, int target) {
    int size = nums.size();
    // Вспомогательная хеш-таблица, пространственная сложность O(n)
    unordered_map<int, int> dic;
    // Один цикл, временная сложность O(n)
    for (int i = 0; i < size; i++) {
        if (dic.find(target - nums[i]) != dic.end()) {
            return {dic[target - nums[i]], i};
        }
        dic.emplace(nums[i], i);
    }
    return {};
}

/* Driver Code */
int main() {
    // ======= Test Case =======
    vector<int> nums = {2, 7, 11, 15};
    int target = 13;

    // ====== Основной код ======
    // Метод 1
    vector<int> res = twoSumBruteForce(nums, target);
    cout << "Результат метода 1 res = ";
    printVector(res);
    // Метод 2
    res = twoSumHashTable(nums, target);
    cout << "Результат метода 2 res = ";
    printVector(res);

    return 0;
}
