/**
 * File: linear_search.ts
 * Created Time: 2023-01-07
 * Author: Daniel (better.sunjian@gmail.com)
 */

import { ListNode, arrToLinkedList } from '../modules/ListNode';

/* Линейный поиск (массив) */
function linearSearchArray(nums: number[], target: number): number {
    // Обход массива
    for (let i = 0; i < nums.length; i++) {
        // Целевой элемент найден, вернуть его индекс
        if (nums[i] === target) {
            return i;
        }
    }
    // Целевой элемент не найден, вернуть -1
    return -1;
}

/* Линейный поиск (связный список) */
function linearSearchLinkedList(
    head: ListNode | null,
    target: number
): ListNode | null {
    // Обойти связный список
    while (head) {
        // Найти целевой узел и вернуть его
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // Целевой узел не найден, вернуть null
    return null;
}

/* Driver Code */
const target = 3;

/* Выполнить линейный поиск в массиве */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('Индекс целевого элемента 3 =', index);

/* Выполнить линейный поиск в связном списке */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('Объект узла со значением 3 =', node);

export {};
