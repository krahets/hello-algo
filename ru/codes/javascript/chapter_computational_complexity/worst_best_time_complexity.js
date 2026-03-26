/**
 * File: worst_best_time_complexity.js
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* Сгенерировать массив из элементов { 1, 2, ..., n } в перемешанном порядке */
function randomNumbers(n) {
    const nums = Array(n);
    // Сгенерировать массив nums = { 1, 2, 3, ..., n }
    for (let i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Случайно перемешать элементы массива
    for (let i = 0; i < n; i++) {
        const r = Math.floor(Math.random() * (i + 1));
        const temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
    return nums;
}

/* Найти индекс числа 1 в массиве nums */
function findOne(nums) {
    for (let i = 0; i < nums.length; i++) {
        // Когда элемент 1 находится в начале массива, достигается наилучшая временная сложность O(1)
        // Когда элемент 1 находится в конце массива, достигается наихудшая временная сложность O(n)
        if (nums[i] === 1) {
            return i;
        }
    }
    return -1;
}

/* Driver Code */
for (let i = 0; i < 10; i++) {
    const n = 100;
    const nums = randomNumbers(n);
    const index = findOne(nums);
    console.log('\nПосле перемешивания массива [ 1, 2,..., n ] = [' + nums.join(', ') + ']');
    console.log('Индекс числа 1 равен' + index);
}
