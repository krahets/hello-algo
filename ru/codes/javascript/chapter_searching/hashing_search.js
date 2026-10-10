/**
 * File: hashing_search.js
 * Created Time: 2022-12-29
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { arrToLinkedList } = require('../modules/ListNode');

/* Хеш-поиск (массив) */
function hashingSearchArray(map, target) {
    // key хеш-таблицы: целевой элемент, value: индекс
    // Если такого key нет в хеш-таблице, вернуть -1
    return map.has(target) ? map.get(target) : -1;
}

/* Хеш-поиск (связный список) */
function hashingSearchLinkedList(map, target) {
    // key хеш-таблицы: значение целевого узла, value: объект узла
    // Если такого key нет в хеш-таблице, вернуть null
    return map.has(target) ? map.get(target) : null;
}

/* Driver Code */
const target = 3;

/* Хеш-поиск (массив) */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
// Инициализация хеш-таблицы
const map = new Map();
for (let i = 0; i < nums.length; i++) {
    map.set(nums[i], i); // key: элемент, value: индекс
}
const index = hashingSearchArray(map, target);
console.log('Индекс целевого элемента 3 = ' + index);

/* Хеш-поиск (связный список) */
let head = arrToLinkedList(nums);
// Инициализация хеш-таблицы
const map1 = new Map();
while (head != null) {
    map1.set(head.val, head); // key: значение узла, value: узел
    head = head.next;
}
const node = hashingSearchLinkedList(map1, target);
console.log('Объект узла со значением 3 =', node);
