/**
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Хеш-поиск (массив) */
int hashingSearchArray(unordered_map<int, int> map, int target) {
    // key хеш-таблицы: целевой элемент, value: индекс
    // Если такого key нет в хеш-таблице, вернуть -1
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* Хеш-поиск (связный список) */
ListNode *hashingSearchLinkedList(unordered_map<int, ListNode *> map, int target) {
    // key хеш-таблицы: значение целевого узла, value: объект узла
    // Если такого key нет в хеш-таблице, вернуть nullptr
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}

/* Driver Code */
int main() {
    int target = 3;

    /* Хеш-поиск (массив) */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // Инициализация хеш-таблицы
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i; // key: элемент, value: индекс
    }
    int index = hashingSearchArray(map, target);
    cout << "Индекс целевого элемента 3 = " << index << endl;

    /* Хеш-поиск (связный список) */
    ListNode *head = vecToLinkedList(nums);
    // Инициализация хеш-таблицы
    unordered_map<int, ListNode *> map1;
    while (head != nullptr) {
        map1[head->val] = head; // key: значение узла, value: узел
        head = head->next;
    }
    ListNode *node = hashingSearchLinkedList(map1, target);
    cout << "Объект узла со значением 3 = " << node << endl;

    return 0;
}
