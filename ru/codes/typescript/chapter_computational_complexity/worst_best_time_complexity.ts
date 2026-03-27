/**
 * File: worst_best_time_complexity.ts
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
function randomNumbers(n: number): number[] {
    const nums = Array(n);
    // Создать массив nums = { 1, 2, 3, ..., n }
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
function findOne(nums: number[]): number {
    for (let i = 0; i < nums.length; i++) {
        // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
        // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
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
    console.log('\nПосле перемешивания массива [ 1, 2, ..., n ] = [' + nums.join(', ') + ']');
    console.log('Индекс числа 1 = ' + index);
}

export {};
