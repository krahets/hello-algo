/**
 * File: top_k.ts
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { MaxHeap } from './my_heap';

/* Добавить элемент в кучу */
function pushMinHeap(maxHeap: MaxHeap, val: number): void {
    // Инвертировать знак элемента
    maxHeap.push(-val);
}

/* Извлечение элемента из кучи */
function popMinHeap(maxHeap: MaxHeap): number {
    // Инвертировать знак элемента
    return -maxHeap.pop();
}

/* Обратиться к элементу на вершине кучи */
function peekMinHeap(maxHeap: MaxHeap): number {
    // Инвертировать знак элемента
    return -maxHeap.peek();
}

/* Извлечь элемент из кучи */
function getMinHeap(maxHeap: MaxHeap): number[] {
    // Инвертировать знак элемента
    return maxHeap.getMaxHeap().map((num: number) => -num);
}

/* Найти k наибольших элементов массива с помощью кучи */
function topKHeap(nums: number[], k: number): number[] {
    // Инициализировать min-кучу
    // Обратите внимание: мы инвертируем знак всех элементов в куче, чтобы имитировать min-кучу с помощью max-кучи
    const maxHeap = new MaxHeap([]);
    // Поместить первые k элементов массива в кучу
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // Начиная с k+1-го элемента, поддерживать длину кучи равной k
    for (let i = k; i < nums.length; i++) {
        // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // Вернутьэлемент в куче
    return getMinHeap(maxHeap);
}

/* Driver Code */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`Наибольшие ${k} элементов:`, res);
