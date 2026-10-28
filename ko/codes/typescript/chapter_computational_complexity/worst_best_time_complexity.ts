/**
 * File: worst_best_time_complexity.ts
 * Created Time: 2023-01-05
 * Author: RiverTwilight (contact@rene.wang)
 */

/* 원소가 { 1, 2, ..., n }이며 순서가 섞인 배열 생성 */
function randomNumbers(n: number): number[] {
    const nums = Array(n);
    // 배열 nums = { 1, 2, 3, ..., n }을 생성한다
    for (let i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 배열 원소를 무작위로 섞는다
    for (let i = 0; i < n; i++) {
        const r = Math.floor(Math.random() * (i + 1));
        const temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
    return nums;
}

/* 배열 nums에서 숫자 1이 있는 인덱스 탐색 */
function findOne(nums: number[]): number {
    for (let i = 0; i < nums.length; i++) {
        // 원소 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)에 도달한다
        // 원소 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)에 도달한다
        if (nums[i] === 1) {
            return i;
        }
    }
    return -1;
}

/* 실행 코드 */
for (let i = 0; i < 10; i++) {
    const n = 100;
    const nums = randomNumbers(n);
    const index = findOne(nums);
    console.log('\n배열 [ 1, 2, ..., n ]을 섞은 결과 = [' + nums.join(', ') + ']');
    console.log('숫자 1의 인덱스 ' + index);
}

export {};
