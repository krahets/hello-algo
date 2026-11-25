/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Демонстрационный код */
int main() {
    /* Инициализация списка */
    vector<int> nums = {1, 3, 2, 5, 4};
    cout << "Список nums = ";
    printVector(nums);

    /* Доступ к элементу */
    int num = nums[1];
    cout << "Элемент по индексу 1: num = " << num << endl;

    /* Изменение элемента */
    nums[1] = 0;
    cout << "После записи 0 по индексу 1 nums = ";
    printVector(nums);

    /* Очистка списка */
    nums.clear();
    cout << "После очистки списка nums = ";
    printVector(nums);

    /* Добавление элемента в конец */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);
    cout << "После добавления элементов nums = ";
    printVector(nums);

    /* Вставка элемента в середину */
    nums.insert(nums.begin() + 3, 6);
    cout << "После вставки числа 6 по индексу 3 nums = ";
    printVector(nums);

    /* Удаление элемента */
    nums.erase(nums.begin() + 3);
    cout << "После удаления элемента по индексу 3 nums = ";
    printVector(nums);

    /* Обойти список по индексам */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }
    /* Перебрать элементы списка напрямую */
    count = 0;
    for (int x : nums) {
        count += x;
    }

    /* Объединение двух списков */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    cout << "После добавления nums1 в конец nums получаем nums = ";
    printVector(nums);

    /* Сортировка списка */
    sort(nums.begin(), nums.end());
    cout << "После сортировки nums = ";
    printVector(nums);

    return 0;
}
