/**
 * File: insertion_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 삽입 정렬 */
function insertionSort(nums) {
    // 바깥 루프: 정렬된 구간은 [0, i-1]
    for (let i = 1; i < nums.length; i++) {
        let base = nums[i],
            j = i - 1;
        // 안쪽 루프: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // nums[j]를 오른쪽으로 한 칸 이동
            j--;
        }
        nums[j + 1] = base; // 올바른 위치에 base 대입
    }
}

/* 실행 예제 */
const nums = [4, 1, 3, 1, 5, 2];
insertionSort(nums);
console.log('삽입 정렬 후 nums =', nums);
