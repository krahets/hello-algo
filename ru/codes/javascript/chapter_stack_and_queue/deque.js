/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver Code */
// [region]{init_deque}
/* Инициализация двусторонней очереди */
// В JavaScript нет встроенной двусторонней очереди, поэтому Array можно использовать как двустороннюю очередь
const deque = [];
// [endregion]{init_deque}

// [region]{push}
/* Добавление элемента в очередь */
deque.push(2);
deque.push(5);
deque.push(4);
// Обратите внимание: поскольку используется массив, временная сложность метода unshift() равна O(n)
deque.unshift(3);
deque.unshift(1);
// [endregion]{push}
console.log('Двусторонняя очередь deque = ', deque);

// [region]{peek_first}
/* Доступ к элементу */
const peekFirst = deque[0];
// [endregion]{peek_first}
console.log('Первый элемент peekFirst = ' + peekFirst);
// [region]{peek_last}
const peekLast = deque[deque.length - 1];
// [endregion]{peek_last}
console.log('Последний элемент peekLast = ' + peekLast);

// [region]{pop_first}
/* Извлечение элемента из очереди */
// Обратите внимание: поскольку используется массив, временная сложность метода shift() равна O(n)
const popFront = deque.shift();
// [endregion]{pop_first}
console.log(
    'Извлеченный из головы элемент popFront = ' + popFront + ', deque после извлечения из головы = ' + deque
);
// [region]{pop_last}
const popBack = deque.pop();
// [endregion]{pop_last}
console.log(
    'Извлеченный из хвоста элемент popBack = ' + popBack + ', deque после извлечения из хвоста = ' + deque
);

// [region]{size}
/* Получение длины двусторонней очереди */
const size = deque.length;
// [endregion]{size}
console.log('Длина двусторонней очереди size = ' + size);

// [region]{is_empty}
/* Проверка, пуста ли двусторонняя очередь */
const isEmpty = size === 0;
// [endregion]{is_empty}
console.log('Пуста ли двусторонняя очередь = ' + isEmpty);
