/**
 * File: list.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

// [region]{init_list}
/* Инициализация списка */
// Без начальных значений
const emptyNums: number[] = [];
// С начальными значениями
const nums: number[] = [1, 3, 2, 5, 4];
// [endregion]{init_list}
console.log(`Список nums = ${nums}`);
console.log(`Список emptyNums = ${emptyNums}`);

// [region]{access_element}
/* Доступ к элементу */
const num: number = nums[1]; // Доступ к элементу по индексу 1
// [endregion]{access_element}
console.log(`Элемент по индексу 1: num = ${num}`);

// [region]{update_element}
/* Изменение элемента */
nums[1] = 0; // Изменить значение элемента с индексом 1 на 0
// [endregion]{update_element}
console.log(`После изменения значения элемента с индексом 1 на 0 nums = ${nums}`);

// [region]{clear_list}
/* Очистить список */
nums.length = 0;
// [endregion]{clear_list}
console.log(`После очистки списка nums = ${nums}`);

// [region]{append_element}
/* Добавление элемента в конец */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
// [endregion]{append_element}
console.log(`После добавления элементов nums = ${nums}`);

// [region]{insert_element}
/* Вставка элемента в середину */
nums.splice(3, 0, 6); // Вставить число 6 по индексу 3
// [endregion]{insert_element}
console.log(`После вставки числа 6 по индексу 3 nums = ${nums}`);

// [region]{remove_element}
/* Удаление элемента */
nums.splice(3, 1); // Удалить элемент по индексу 3
// [endregion]{remove_element}
console.log(`После удаления элемента по индексу 3 nums = ${nums}`);

// [region]{iterate_list}
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
// [endregion]{iterate_list}

// [region]{concat_list}
/* Объединить два списка */
const nums1: number[] = [6, 8, 7, 10, 9];
nums.push(...nums1); // Присоединить список nums1 к концу nums
// [endregion]{concat_list}
console.log(`После конкатенации списка nums1 к nums nums = ${nums}`);

// [region]{sort_list}
/* Отсортировать список */
nums.sort((a, b) => a - b); // После сортировки элементы списка идут по возрастанию
// [endregion]{sort_list}
console.log(`После сортировки списка nums = ${nums}`);

export {};
