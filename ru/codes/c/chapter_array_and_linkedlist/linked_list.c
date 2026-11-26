/**
 * File: linked_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Вставить узел P после узла n0 */
void insert(ListNode *n0, ListNode *P) {
    ListNode *n1 = n0->next;
    P->next = n1;
    n0->next = P;
}

/* Удалить первый узел, следующий за n0 */
// Имя remove уже используется в stdio.h
void removeItem(ListNode *n0) {
    if (!n0->next)
        return;
    // n0 -> P -> n1
    ListNode *P = n0->next;
    ListNode *n1 = P->next;
    n0->next = n1;
    // Освободить память
    free(P);
}

/* Получить узел списка по индексу index */
ListNode *access(ListNode *head, int index) {
    for (int i = 0; i < index; i++) {
        if (head == NULL)
            return NULL;
        head = head->next;
    }
    return head;
}

/* Найти первый узел списка со значением target */
int find(ListNode *head, int target) {
    int index = 0;
    while (head) {
        if (head->val == target)
            return index;
        head = head->next;
        index++;
    }
    return -1;
}

/* Демонстрационный код */
int main() {
    /* Инициализация связного списка */
    // Инициализировать узлы
    ListNode *n0 = newListNode(1);
    ListNode *n1 = newListNode(3);
    ListNode *n2 = newListNode(2);
    ListNode *n3 = newListNode(5);
    ListNode *n4 = newListNode(4);
    // Связать узлы ссылками
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    printf("Исходный связный список:\r\n");
    printLinkedList(n0);

    /* Вставка узла */
    insert(n0, newListNode(0));
    printf("Связный список после вставки:\r\n");
    printLinkedList(n0);

    /* Удаление узла */
    removeItem(n0);
    printf("Связный список после удаления:\r\n");
    printLinkedList(n0);

    /* Доступ к узлу */
    ListNode *node = access(n0, 3);
    printf("Значение узла по индексу 3 = %d\r\n", node->val);

    /* Поиск узла */
    int index = find(n0, 2);
    printf("Индекс узла со значением 2 = %d\r\n", index);

    // Освободить память
    freeMemoryLinkedList(n0);
    return 0;
}
