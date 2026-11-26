/**
 * File: array.js
 * Created Time: 2022-11-27
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 임의의 원소에 접근 */
function randomAccess(nums) {
    // 구간 [0, nums.length)에서 수 하나를 무작위로 선택
    const random_index = Math.floor(Math.random() * nums.length);
    // 선택한 원소를 가져와 반환
    const random_num = nums[random_index];
    return random_num;
}

/* 배열 길이 늘리기 */
// JavaScript의 Array는 동적 배열이므로 바로 확장할 수 있다.
// 이 함수에서는 학습을 위해 Array를 길이가 고정된 배열로 취급한다.
function extend(nums, enlarge) {
    // 길이를 늘린 새 배열 초기화
    const res = new Array(nums.length + enlarge).fill(0);
    // 원래 배열의 모든 원소를 새 배열에 복사
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // 길이를 늘린 새 배열 반환
    return res;
}

/* 배열의 인덱스 index에 원소 num 삽입 */
function insert(nums, num, index) {
    // 인덱스 index부터 끝까지 모든 원소를 뒤로 한 칸씩 이동
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // 인덱스 index의 원소에 num 대입
    nums[index] = num;
}

/* 인덱스 index의 원소 삭제 */
function remove(nums, index) {
    // 인덱스 index 다음의 모든 원소를 앞으로 한 칸씩 이동
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 배열 순회 */
function traverse(nums) {
    let count = 0;
    // 인덱스로 배열 순회
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    // 배열 원소를 직접 순회
    for (const num of nums) {
        count += num;
    }
}

/* 배열에서 지정한 원소 찾기 */
function find(nums, target) {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) return i;
    }
    return -1;
}

/* 실행 예제 */
/* 배열 초기화 */
const arr = new Array(5).fill(0);
console.log('배열 arr =', arr);
let nums = [1, 3, 2, 5, 4];
console.log('배열 nums =', nums);

/* 임의 접근 */
let random_num = randomAccess(nums);
console.log('nums에서 무작위로 선택한 원소:', random_num);

/* 길이 늘리기 */
nums = extend(nums, 3);
console.log('길이를 8로 늘린 배열 nums =', nums);

/* 원소 삽입 */
insert(nums, 6, 3);
console.log('인덱스 3에 숫자 6을 삽입한 후 nums =', nums);

/* 원소 삭제 */
remove(nums, 2);
console.log('인덱스 2의 원소를 삭제한 후 nums =', nums);

/* 배열 순회 */
traverse(nums);

/* 원소 찾기 */
let index = find(nums, 3);
console.log('nums에서 원소 3을 찾은 인덱스 =', index);
