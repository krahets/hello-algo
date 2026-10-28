/**
 * File: insertion_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 삽입 정렬 */
function insertionSort(nums: number[]): void {
    // 바깥쪽 반복문: 정렬된 구간은 [0, i-1]이다
    for (let i = 1; i < nums.length; i++) {
        const base = nums[i];
        let j = i - 1;
        // 안쪽 반복문: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입한다
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // nums[j]를 오른쪽으로 한 칸 이동한다
            j--;
        }
        nums[j + 1] = base; // 올바른 위치에 base를 대입한다
    }
}

/* 실행 코드 */
const nums = [4, 1, 3, 1, 5, 2];
insertionSort(nums);
console.log('삽입 정렬을 마친 후 nums =', nums);

export {};
