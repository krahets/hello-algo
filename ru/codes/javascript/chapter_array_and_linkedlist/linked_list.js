/**
 * File: linked_list.js
 * Created Time: 2022-12-12
 * Author: IsChristina (christinaxia77@foxmail.com), Justin (xiefahit@gmail.com)
 */

const { printLinkedList } = require('../modules/PrintUtil');
const { ListNode } = require('../modules/ListNode');

/* Вставить узел P после узла n0 */
function insert(n0, P) {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

/* Удалить первый узел, следующий за n0 */
function remove(n0) {
    if (!n0.next) return;
    // n0 -> P -> n1
    const P = n0.next;
    const n1 = P.next;
    n0.next = n1;
}

/* Получить узел списка по индексу index */
function access(head, index) {
    for (let i = 0; i < index; i++) {
        if (!head) {
            return null;
        }
        head = head.next;
    }
    return head;
}

/* Найти первый узел списка со значением target */
function find(head, target) {
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

/* Демонстрационный код */
/* Инициализация связного списка */
// Инициализировать узлы
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// Связать узлы ссылками
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
console.log('Исходный связный список:');
printLinkedList(n0);

/* Вставка узла */
insert(n0, new ListNode(0));
console.log('Связный список после вставки:');
printLinkedList(n0);

/* Удаление узла */
remove(n0);
console.log('Связный список после удаления:');
printLinkedList(n0);

/* Доступ к узлу */
const node = access(n0, 3);
console.log('Значение узла по индексу 3 = ' + node.val);

/* Поиск узла */
const index = find(n0, 2);
console.log('Индекс узла со значением 2 = ' + index);
