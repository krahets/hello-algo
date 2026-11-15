/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Инициализация списка */
    vector<int> nums = {1, 3, 2, 5, 4};
    cout << "Список nums = ";
    printVector(nums);

    // [region]{access_element}
    /* Доступ к элементу */
    int num = nums[1]; // Доступ к элементу по индексу 1
    // [endregion]{access_element}
    cout << "Элемент по индексу 1: num = " << num << endl;

    // [region]{update_element}
    /* Изменение элемента */
    nums[1] = 0; // Изменить значение элемента с индексом 1 на 0
    // [endregion]{update_element}
    cout << "После изменения элемента по индексу 1 на 0 nums = ";
    printVector(nums);

    // [region]{clear_list}
    /* Очистить список */
    nums.clear();
    // [endregion]{clear_list}
    cout << "После очистки списка nums = ";
    printVector(nums);

    // [region]{append_element}
    /* Добавление элемента в конец */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);
    // [endregion]{append_element}
    cout << "После добавления элемента nums = ";
    printVector(nums);

    // [region]{insert_element}
    /* Вставка элемента в середину */
    nums.insert(nums.begin() + 3, 6); // Вставить число 6 по индексу 3
    // [endregion]{insert_element}
    cout << "После вставки числа 6 по индексу 3 nums = ";
    printVector(nums);

    // [region]{remove_element}
    /* Удаление элемента */
    nums.erase(nums.begin() + 3); // Удалить элемент по индексу 3
    // [endregion]{remove_element}
    cout << "После удаления элемента по индексу 3 nums = ";
    printVector(nums);

    // [region]{iterate_list}
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
    // [endregion]{iterate_list}

    // [region]{concat_list}
    /* Объединить два списка */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    // Присоединить список nums1 к концу nums
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    // [endregion]{concat_list}
    cout << "После присоединения списка nums1 к nums nums = ";
    printVector(nums);

    // [region]{sort_list}
    /* Отсортировать список */
    sort(nums.begin(), nums.end()); // После сортировки элементы списка идут по возрастанию
    // [endregion]{sort_list}
    cout << "После сортировки списка nums = ";
    printVector(nums);

    return 0;
}
