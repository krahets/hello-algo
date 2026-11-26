/**
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Поиск по хеш-таблице в массиве */
int hashingSearchArray(unordered_map<int, int> map, int target) {
    // Ключ хеш-таблицы — искомый элемент, значение — его индекс
    // Если ключа в хеш-таблице нет, возвращаем -1
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* Поиск по хеш-таблице в связном списке */
ListNode *hashingSearchLinkedList(unordered_map<int, ListNode *> map, int target) {
    // Ключ хеш-таблицы — искомое значение узла, значение таблицы — сам узел
    // Если ключа в хеш-таблице нет, возвращаем nullptr
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}

/* Пример использования */
int main() {
    int target = 3;

    /* Поиск по хеш-таблице в массиве */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // Создаём хеш-таблицу
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i; // Ключ — элемент, значение — индекс
    }
    int index = hashingSearchArray(map, target);
    cout << "Индекс элемента 3 = " << index << endl;

    /* Поиск по хеш-таблице в связном списке */
    ListNode *head = vecToLinkedList(nums);
    // Создаём хеш-таблицу
    unordered_map<int, ListNode *> map1;
    while (head != nullptr) {
        map1[head->val] = head; // Ключ — значение узла, значение — сам узел
        head = head->next;
    }
    ListNode *node = hashingSearchLinkedList(map1, target);
    cout << "Узел со значением 3: " << node << endl;

    return 0;
}
