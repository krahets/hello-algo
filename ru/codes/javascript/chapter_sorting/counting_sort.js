/**
 * File: counting_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Подсчетная сортировка */
// Простая реализация, не может использоваться дляСортировкаобъект
function countingSortNaive(nums) {
    // 1. Найти максимальный элемент массива m
    let m = Math.max(...nums);
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    const counter = new Array(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. Обойти counter и записать элементы обратно в исходный массив nums
    let i = 0;
    for (let num = 0; num < m + 1; num++) {
        for (let j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* Подсчетная сортировка */
// Полная реализация, поддерживает сортируемые объекты и является стабильной сортировкой
function countingSort(nums) {
    // 1. Найти максимальный элемент массива m
    let m = Math.max(...nums);
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    const counter = new Array(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. Вычислить префиксные суммы counter, преобразовав «число появлений» в «конечный индекс»
    // То есть counter[num]-1 — это индекс последнего появления num в res
    for (let i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
    // Инициализировать массив res для хранения результата
    const n = nums.length;
    const res = new Array(n);
    for (let i = n - 1; i >= 0; i--) {
        const num = nums[i];
        res[counter[num] - 1] = num; // Разместить num в соответствующем индексе
        counter[num]--; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
    }
    // Перезаписать исходный массив nums результатом из массива res
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* Driver Code */
const nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSortNaive(nums);
console.log('После завершения подсчетной сортировки (не подходит для сортируемых объектов) nums =', nums);

const nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSort(nums1);
console.log('Подсчетная сортировкапосле завершения nums1 =', nums1);
