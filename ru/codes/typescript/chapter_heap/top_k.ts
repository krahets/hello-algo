/**
 * File: top_k.ts
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { MaxHeap } from './my_heap';

/* Добавление элемента в кучу */
function pushMinHeap(maxHeap: MaxHeap, val: number): void {
    // Инвертировать знак элемента
    maxHeap.push(-val);
}

/* Извлечение элемента из кучи */
function popMinHeap(maxHeap: MaxHeap): number {
    // Инвертировать знак элемента
    return -maxHeap.pop();
}

/* Доступ к элементу на вершине кучи */
function peekMinHeap(maxHeap: MaxHeap): number {
    // Инвертировать знак элемента
    return -maxHeap.peek();
}

/* Извлечь элементы из кучи */
function getMinHeap(maxHeap: MaxHeap): number[] {
    // Инвертировать знак элемента
    return maxHeap.getMaxHeap().map((num: number) => -num);
}

/* Найти k наибольших элементов массива с помощью кучи */
function topKHeap(nums: number[], k: number): number[] {
    // Инициализация минимальной кучи
    // Обратите внимание: мы инвертируем все элементы кучи, чтобы с помощью максимальной кучи имитировать минимальную
    const maxHeap = new MaxHeap([]);
    // Поместить первые k элементов массива в кучу
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // Начиная с элемента k+1, поддерживать длину кучи равной k
    for (let i = k; i < nums.length; i++) {
        // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // Вернуть элементы кучи
    return getMinHeap(maxHeap);
}

/* Driver Code */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`Наибольшие ${k} элементов`, res);
