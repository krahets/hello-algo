/**
 * File: array.ts
 * Created Time: 2022-12-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* 원소에 임의 접근 */
function randomAccess(nums: number[]): number {
    // 구간 [0, nums.length)에서 숫자 하나를 무작위로 뽑는다
    const random_index = Math.floor(Math.random() * nums.length);
    // 무작위 원소를 가져와 반환한다
    const random_num = nums[random_index];
    return random_num;
}

/* 배열 길이 확장 */
// TypeScript의 Array는 동적 배열이므로 직접 확장할 수 있다
// 학습의 편의를 위해 이 함수에서는 Array를 길이가 고정된 배열로 취급한다
function extend(nums: number[], enlarge: number): number[] {
    // 길이를 확장한 배열을 초기화한다
    const res = new Array(nums.length + enlarge).fill(0);
    // 원래 배열의 모든 원소를 새 배열에 복사한다
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // 확장한 새 배열을 반환한다
    return res;
}

/* 배열의 인덱스 index에 원소 num 삽입 */
function insert(nums: number[], num: number, index: number): void {
    // 인덱스 index와 그 뒤에 있는 모든 원소를 한 칸씩 뒤로 이동한다
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // index 위치의 원소에 num을 대입한다
    nums[index] = num;
}

/* 인덱스 index에 있는 원소 삭제 */
function remove(nums: number[], index: number): void {
    // 인덱스 index 뒤에 있는 모든 원소를 한 칸씩 앞으로 이동한다
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 배열 순회 */
function traverse(nums: number[]): void {
    let count = 0;
    // 인덱스를 통해 배열을 순회한다
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    // 배열의 원소를 직접 순회한다
    for (const num of nums) {
        count += num;
    }
}

/* 배열에서 지정한 원소 탐색 */
function find(nums: number[], target: number): number {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) {
            return i;
        }
    }
    return -1;
}

/* 실행 코드 */
/* 배열 초기화 */
const arr: number[] = new Array(5).fill(0);
console.log('배열 arr =', arr);
let nums: number[] = [1, 3, 2, 5, 4];
console.log('배열 nums =', nums);

/* 임의 접근 */
let random_num = randomAccess(nums);
console.log('nums에서 무작위로 가져온 원소', random_num);

/* 길이 확장 */
nums = extend(nums, 3);
console.log('배열 길이를 8로 확장한 후 nums =', nums);

/* 원소 삽입 */
insert(nums, 6, 3);
console.log('인덱스 3에 숫자 6을 삽입한 후 nums =', nums);

/* 원소 삭제 */
remove(nums, 2);
console.log('인덱스 2의 원소를 삭제한 후 nums =', nums);

/* 배열 순회 */
traverse(nums);

/* 원소 탐색 */
let index = find(nums, 3);
console.log('nums에서 원소 3을 탐색하여 얻은 인덱스 =', index);

export {};
