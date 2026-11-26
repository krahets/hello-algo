/**
 * File: linear_search.ts
 * Created Time: 2023-01-07
 * Author: Daniel (better.sunjian@gmail.com)
 */

import { ListNode, arrToLinkedList } from '../modules/ListNode';

/* Линейный поиск в массиве*/
function linearSearchArray(nums: number[], target: number): number {
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
function linearSearchLinkedList(
    head: ListNode | null,
    target: number
): ListNode | null {
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
console.log('Индекс элемента 3 =', index);

/* Выполняем линейный поиск в связном списке */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('Узел со значением 3:', node);

export {};
