/**
 * File: list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 리스트 초기화 */
const nums = [1, 3, 2, 5, 4];
console.log(`리스트 nums = ${nums}`);

/* 원소 접근 */
const num = nums[1];
console.log(`인덱스 1의 원소에 접근하여 얻은 num = ${num}`);

/* 원소 갱신 */
nums[1] = 0;
console.log(`인덱스 1의 원소를 0으로 갱신한 후 nums = ${nums}`);

/* 리스트 비우기 */
nums.length = 0;
console.log(`리스트를 비운 후 nums = ${nums}`);

/* 맨 뒤에 원소 추가 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
console.log(`원소를 추가한 후 nums = ${nums}`);

/* 중간에 원소 삽입 */
nums.splice(3, 0, 6);
console.log(`인덱스 3에 숫자 6을 삽입한 후 nums = ${nums}`);

/* 원소 삭제 */
nums.splice(3, 1);
console.log(`인덱스 3의 원소를 삭제한 후 nums = ${nums}`);

/* 인덱스를 통해 리스트를 순회한다 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}
/* 리스트의 원소를 직접 순회한다 */
count = 0;
for (const x of nums) {
    count += x;
}

/* 두 리스트 연결 */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1);
console.log(`리스트 nums1을 nums 뒤에 연결한 후 nums = ${nums}`);

/* 리스트 정렬 */
nums.sort((a, b) => a - b);
console.log(`리스트를 정렬한 후 nums = ${nums}`);
