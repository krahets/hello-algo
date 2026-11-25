/**
 * File: worst_best_time_complexity.ts
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* Создать массив из чисел { 1, 2, ..., n } в случайном порядке */
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
        // Если 1 стоит в начале массива, сложность минимальна: O(1)
        // Если 1 стоит в конце массива, сложность максимальна: O(n)
        if (nums[i] === 1) {
            return i;
        }
    }
    return -1;
}

/* Основная программа */
for (let i = 0; i < 10; i++) {
    const n = 100;
    const nums = randomNumbers(n);
    const index = findOne(nums);
    console.log('\nМассив [ 1, 2, ..., n ] после перемешивания = [' + nums.join(', ') + ']');
    console.log('Индекс числа 1: ' + index);
}

export {};
