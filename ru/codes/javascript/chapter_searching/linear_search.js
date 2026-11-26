/**
 * File: linear_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

const { ListNode, arrToLinkedList } = require('../modules/ListNode');

/* Линейный поиск в массиве */
function linearSearchArray(nums, target) {
    // Обходим массив
    for (let i = 0; i < nums.length; i++) {
        // Элемент найден, возвращаем его индекс
        if (nums[i] === target) {
            return i;
        }
    }
    // Элемент не найден, возвращаем -1
    return -1;
}

/* Линейный поиск в связном списке*/
function linearSearchLinkedList(head, target) {
    // Обходим связный список
    while (head) {
        // Нужный узел найден, возвращаем его
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // Нужный узел не найден, возвращаем null
    return null;
}

/* Пример использования */
const target = 3;

/* Выполняем линейный поиск в массиве */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('Индекс элемента 3 = ' + index);

/* Выполняем линейный поиск в связном списке */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('Узел со значением 3: ', node);
