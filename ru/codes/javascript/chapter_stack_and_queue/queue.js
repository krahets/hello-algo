/**
 * File: queue.js
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
// [region]{init_queue}
/* Инициализация очереди */
// В JavaScript нет встроенной очереди, поэтому Array можно использовать как очередь
const queue = [];
// [endregion]{init_queue}

// [region]{push}
/* Добавление элемента в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
// [endregion]{push}
console.log('Очередь queue =', queue);

// [region]{peek}
/* Доступ к элементу в начале очереди */
const peek = queue[0];
// [endregion]{peek}
console.log('Первый элемент peek =', peek);

// [region]{pop}
/* Извлечение элемента из очереди */
// В основе лежит массив, поэтому временная сложность метода shift() равна O(n)
const pop = queue.shift();
// [endregion]{pop}
console.log('Извлеченный элемент pop =', pop, ', queue после извлечения = ', queue);

// [region]{size}
/* Получение длины очереди */
const size = queue.length;
// [endregion]{size}
console.log('Длина очереди size =', size);

// [region]{is_empty}
/* Проверка, пуста ли очередь */
const isEmpty = queue.length === 0;
// [endregion]{is_empty}
console.log('Пуста ли очередь = ', isEmpty);
