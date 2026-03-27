/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // Создать массив nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Использовать системное время для генерации случайного seed
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // Случайно перемешать элементы массива
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* Найти индекс числа 1 в массиве nums */
int findOne(vector<int> &nums) {
    for (int i = 0; i < nums.size(); i++) {
        // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
        // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
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
        cout << "\nПосле перемешивания массива [ 1, 2, ..., n ] nums = ";
        printVector(nums);
        cout << "Индекс числа 1 = " << index << endl;
    }
    return 0;
}
