/**
 * File: worst_best_time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Создать массив из чисел { 1, 2, ..., n } в случайном порядке */
vector<int> randomNumbers(int n) {
    vector<int> nums(n);
    // Создать массив nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Инициализировать генератор случайных чисел по системному времени
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    // Случайно перемешать элементы массива
    shuffle(nums.begin(), nums.end(), default_random_engine(seed));
    return nums;
}

/* Найти индекс числа 1 в массиве nums */
int findOne(vector<int> &nums) {
    for (int i = 0; i < nums.size(); i++) {
        // Если 1 стоит в начале массива, сложность минимальна: O(1)
        // Если 1 стоит в конце массива, сложность максимальна: O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Основная программа */
int main() {
    for (int i = 0; i < 1000; i++) {
        int n = 100;
        vector<int> nums = randomNumbers(n);
        int index = findOne(nums);
        cout << "\nМассив [ 1, 2, ..., n ] после перемешивания = ";
        printVector(nums);
        cout << "Индекс числа 1: " << index << endl;
    }
    return 0;
}
