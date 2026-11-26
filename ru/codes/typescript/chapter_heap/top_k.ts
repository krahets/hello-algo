/**
 * File: top_k.ts
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { MaxHeap } from './my_heap';

/* Вставить элемент в кучу */
function pushMinHeap(maxHeap: MaxHeap, val: number): void {
    // Сменить знак элемента
    maxHeap.push(-val);
}

/* Извлечь элемент из кучи */
function popMinHeap(maxHeap: MaxHeap): number {
    // Сменить знак элемента
    return -maxHeap.pop();
}

/* Посмотреть элемент в корне */
function peekMinHeap(maxHeap: MaxHeap): number {
    // Сменить знак элемента
    return -maxHeap.peek();
}

/* Извлечь элементы кучи */
function getMinHeap(maxHeap: MaxHeap): number[] {
    // Сменить знак элемента
    return maxHeap.getMaxHeap().map((num: number) => -num);
}

/* Найти k наибольших элементов массива с помощью кучи */
function topKHeap(nums: number[], k: number): number[] {
    // Инициализировать мин-кучу
    // Меняем знак всех элементов, чтобы использовать макс-кучу как мин-кучу
    const maxHeap = new MaxHeap([]);
    // Добавить в кучу первые k элементов массива
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // Начиная с (k+1)-го элемента, поддерживать размер кучи равным k
    for (let i = k; i < nums.length; i++) {
        // Если текущий элемент больше корня, извлечь корень и вставить текущий элемент
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // Вернуть элементы кучи
    return getMinHeap(maxHeap);
}

/* Пример использования */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`Наибольшие элементы (всего ${k}):`, res);
