/**
 * File: worst_best_time_complexity.ts
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* { 1, 2, ..., n }을 원소로 갖는 배열을 만들고 순서를 섞는다 */
function randomNumbers(n: number): number[] {
    const nums = Array(n);
    // 배열 nums = { 1, 2, 3, ..., n }을 만든다
    for (let i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 배열의 원소를 무작위로 섞는다
    for (let i = 0; i < n; i++) {
        const r = Math.floor(Math.random() * (i + 1));
        const temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
    return nums;
}

/* 배열 nums에서 1의 인덱스를 찾는다 */
function findOne(nums: number[]): number {
    for (let i = 0; i < nums.length; i++) {
        // 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)이 된다
        // 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)이 된다
        if (nums[i] === 1) {
            return i;
        }
    }
    return -1;
}

/* 실행 예제 */
for (let i = 0; i < 10; i++) {
    const n = 100;
    const nums = randomNumbers(n);
    const index = findOne(nums);
    console.log('\n배열 [ 1, 2, ..., n ]을 섞은 결과 = [' + nums.join(', ') + ']');
    console.log('숫자 1의 인덱스 = ' + index);
}

export {};
