/**
 * File: linked_list.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

import { ListNode } from '../modules/ListNode';
import { printLinkedList } from '../modules/PrintUtil';

/* Вставить узел P после узла n0 в связном списке */
function insert(n0: ListNode, P: ListNode): void {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

/* Удалить первый узел после узла n0 в связном списке */
function remove(n0: ListNode): void {
    if (!n0.next) {
        return;
    }
    // n0 -> P -> n1
    const P = n0.next;
    const n1 = P.next;
    n0.next = n1;
}

/* Доступ к узлу связного списка по индексу index */
function access(head: ListNode | null, index: number): ListNode | null {
    for (let i = 0; i < index; i++) {
        if (!head) {
            return null;
        }
        head = head.next;
    }
    return head;
}

/* Найти в связном списке первый узел со значением target */
function find(head: ListNode | null, target: number): number {
    let index = 0;
    while (head !== null) {
        if (head.val === target) {
            return index;
        }
        head = head.next;
        index += 1;
    }
    return -1;
}

/* Driver Code */
/* Инициализация связного списка */
// Инициализация всех узлов
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// Построить ссылки между узлами
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
console.log('Инициализированный связный список');
printLinkedList(n0);

/* Вставка узла */
insert(n0, new ListNode(0));
console.log('Связный список после вставки узла');
printLinkedList(n0);

/* Удаление узла */
remove(n0);
console.log('Связный список после удаления узла');
printLinkedList(n0);

/* Доступ к узлу */
const node = access(n0, 3);
console.log(`Значение узла по индексу 3 в связном списке = ${node?.val}`);

/* Поиск узла */
const index = find(n0, 2);
console.log(`Индекс узла со значением 2 в связном списке = ${index}`);

export {};
