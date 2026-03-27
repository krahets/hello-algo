/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Инициализировать список */
    vector<int> nums = {1, 3, 2, 5, 4};
    cout << "Список nums = ";
    printVector(nums);

    /* Получить доступ к элементу */
    int num = nums[1];
    cout << "обратиться киндекс 1 поэлемент, получаем num =" << num << endl;

    /* Обновить элемент */
    nums[1] = 0;
    cout << "После обновления элемента по индексу 1 на 0 получаем nums = ";
    printVector(nums);

    /* Очистить список */
    nums.clear();
    cout << "После очистки списка nums = ";
    printVector(nums);

    /* Добавить элемент в конец */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);
    cout << "Добавитьэлементпосле nums =";
    printVector(nums);

    /* Вставить элемент в середину */
    nums.insert(nums.begin() + 3, 6);
    cout << "После вставки числа 6 по индексу 3 получаем nums = ";
    printVector(nums);

    /* Удалить элемент */
    nums.erase(nums.begin() + 3);
    cout << "После удаления элемента по индексу 3 получаем nums = ";
    printVector(nums);

    /* Обходить список по индексам */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }
    /* Непосредственно обходить элементы списка */
    count = 0;
    for (int x : nums) {
        count += x;
    }

    /* Объединить два списка */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    cout << "После присоединения списка nums1 к nums получаем nums = ";
    printVector(nums);

    /* Отсортировать список */
    sort(nums.begin(), nums.end());
    cout << "После сортировки списка nums = ";
    printVector(nums);

    return 0;
}
