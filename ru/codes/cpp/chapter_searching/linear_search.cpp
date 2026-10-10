/**
 * File: linear_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Линейный поиск (массив) */
int linearSearchArray(vector<int> &nums, int target) {
    // Обход массива
    for (int i = 0; i < nums.size(); i++) {
        // Целевой элемент найден, вернуть его индекс
        if (nums[i] == target)
            return i;
    }
    // Целевой элемент не найден, вернуть -1
    return -1;
}

/* Линейный поиск (связный список) */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // Обойти связный список
    while (head != nullptr) {
        // Найти целевой узел и вернуть его
        if (head->val == target)
            return head;
        head = head->next;
    }
    // Целевой узел не найден, вернуть nullptr
    return nullptr;
}

/* Driver Code */
int main() {
    int target = 3;

    /* Выполнить линейный поиск в массиве */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "Индекс целевого элемента 3 = " << index << endl;

    /* Выполнить линейный поиск в связном списке */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "Объект узла со значением 3 = " << node << endl;

    return 0;
}
