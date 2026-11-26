/**
 * File: hashing_search.js
 * Created Time: 2022-12-29
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { arrToLinkedList } = require('../modules/ListNode');

/* Поиск по хеш-таблице в массиве */
function hashingSearchArray(map, target) {
    // Ключ хеш-таблицы — искомый элемент, значение — его индекс
    // Если ключа в хеш-таблице нет, возвращаем -1
    return map.has(target) ? map.get(target) : -1;
}

/* Поиск по хеш-таблице в связном списке */
function hashingSearchLinkedList(map, target) {
    // Ключ хеш-таблицы — искомое значение узла, значение таблицы — сам узел
    // Если ключа в хеш-таблице нет, возвращаем null
    return map.has(target) ? map.get(target) : null;
}

/* Пример использования */
const target = 3;

/* Поиск по хеш-таблице в массиве */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
// Создаём хеш-таблицу
const map = new Map();
for (let i = 0; i < nums.length; i++) {
    map.set(nums[i], i); // Ключ — элемент, значение — индекс
}
const index = hashingSearchArray(map, target);
console.log('Индекс элемента 3 = ' + index);

/* Поиск по хеш-таблице в связном списке */
let head = arrToLinkedList(nums);
// Создаём хеш-таблицу
const map1 = new Map();
while (head != null) {
    map1.set(head.val, head); // Ключ — значение узла, значение — сам узел
    head = head.next;
}
const node = hashingSearchLinkedList(map1, target);
console.log('Узел со значением 3:', node);
