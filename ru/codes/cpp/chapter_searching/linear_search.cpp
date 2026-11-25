/**
 * File: linear_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Линейный поиск в массиве */
int linearSearchArray(vector<int> &nums, int target) {
    // Обходим массив
    for (int i = 0; i < nums.size(); i++) {
        // Элемент найден, возвращаем его индекс
        if (nums[i] == target)
            return i;
    }
    // Элемент не найден, возвращаем -1
    return -1;
}

/* Линейный поиск в связном списке */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // Обходим связный список
    while (head != nullptr) {
        // Нужный узел найден, возвращаем его
        if (head->val == target)
            return head;
        head = head->next;
    }
    // Нужный узел не найден, возвращаем nullptr
    return nullptr;
}

/* Пример использования */
int main() {
    int target = 3;

    /* Выполняем линейный поиск в массиве */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "Индекс элемента 3 = " << index << endl;

    /* Выполняем линейный поиск в связном списке */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "Узел со значением 3: " << node << endl;

    return 0;
}
