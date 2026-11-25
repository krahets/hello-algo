/**
 * File: list.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

/* Инициализация списка */
const nums: number[] = [1, 3, 2, 5, 4];
console.log(`Список nums = ${nums}`);

/* Доступ к элементу */
const num: number = nums[1];
console.log(`Элемент по индексу 1: num = ${num}`);

/* Изменение элемента */
nums[1] = 0;
console.log(`После записи 0 по индексу 1 nums = ${nums}`);

/* Очистка списка */
nums.length = 0;
console.log(`После очистки списка nums = ${nums}`);

/* Добавление элемента в конец */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
console.log(`После добавления элементов nums = ${nums}`);

/* Вставка элемента в середину */
nums.splice(3, 0, 6);
console.log(`После вставки числа 6 по индексу 3 nums = ${nums}`);

/* Удаление элемента */
nums.splice(3, 1);
console.log(`После удаления элемента по индексу 3 nums = ${nums}`);

/* Обойти список по индексам */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}
/* Перебрать элементы списка напрямую */
count = 0;
for (const x of nums) {
    count += x;
}

/* Объединение двух списков */
const nums1: number[] = [6, 8, 7, 10, 9];
nums.push(...nums1);
console.log(`После добавления nums1 в конец nums получаем nums = ${nums}`);

/* Сортировка списка */
nums.sort((a, b) => a - b);
console.log(`После сортировки nums = ${nums}`);

export {};
