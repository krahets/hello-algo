/**
 * File: list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Инициализация списка */
const nums = [1, 3, 2, 5, 4];
console.log(`Список nums = ${nums}`);

/* Доступ к элементу */
const num = nums[1];
console.log(`Элемент по индексу 1: num = ${num}`);

/* Обновление элемента */
nums[1] = 0;
console.log(`После обновления элемента по индексу 1 до 0 nums = ${nums}`);

/* Очистить список */
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
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1);
console.log(`После конкатенации списка nums1 к nums nums = ${nums}`);

/* Отсортировать список */
nums.sort((a, b) => a - b);
console.log(`После сортировки списка nums = ${nums}`);
