/**
 * File: list.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

/* Инициализировать список */
const nums: number[] = [1, 3, 2, 5, 4];
console.log(`список nums = ${nums}`);

/* Получить доступ к элементу */
const num: number = nums[1];
console.log(`обратиться киндекс 1 поэлемент, получаем num = ${num}`);

/* Обновить элемент */
nums[1] = 0;
console.log(`После обновления элемента по индексу 1 на 0 получаем nums = ${nums}`);

/* Очистить список */
nums.length = 0;
console.log(`Очистить списокпосле nums = ${nums}`);

/* Добавить элемент в конец */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
console.log(`После добавления элемента nums = ${nums}`);

/* Вставить элемент в середину */
nums.splice(3, 0, 6);
console.log(`После вставки числа 6 по индексу 3 получаем nums = ${nums}`);

/* Удалить элемент */
nums.splice(3, 1);
console.log(`После удаления элемента по индексу 3 получаем nums = ${nums}`);

/* Обходить список по индексам */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}
/* Непосредственно обходить элементы списка */
count = 0;
for (const x of nums) {
    count += x;
}

/* Объединить два списка */
const nums1: number[] = [6, 8, 7, 10, 9];
nums.push(...nums1);
console.log(`После присоединения списка nums1 к nums получаем nums = ${nums}`);

/* Отсортировать список */
nums.sort((a, b) => a - b);
console.log(`Отсортировать списокпосле nums = ${nums}`);

export {};
