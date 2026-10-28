/**
 * File: quick_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 퀵 정렬 클래스 */
class QuickSort {
    /* 원소 교환 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 센티널 분할 */
    partition(nums: number[], left: number, right: number): number {
        // nums[left]를 피벗으로 삼는다
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
            }
            // 원소 교환
            this.swap(nums, i, j); // 두 원소를 교환한다
        }
        this.swap(nums, i, left); // 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
        return i; // 피벗의 인덱스를 반환한다
    }

    /* 퀵 정렬 */
    quickSort(nums: number[], left: number, right: number): void {
        // 부분 배열의 길이가 1이면 재귀를 종료한다
        if (left >= right) {
            return;
        }
        // 센티널 분할
        const pivot = this.partition(nums, left, right);
        // 왼쪽 부분 배열과 오른쪽 부분 배열에 재귀 호출한다
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* 퀵 정렬 클래스(중앙값 피벗 최적화) */
class QuickSortMedian {
    /* 원소 교환 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 세 후보 원소의 중앙값 선택 */
    medianThree(
        nums: number[],
        left: number,
        mid: number,
        right: number
    ): number {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m은 l과 r 사이에 있다
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l은 m과 r 사이에 있다
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* 센티널 분할(세 수의 중앙값 선택) */
    partition(nums: number[], left: number, right: number): number {
        // 세 후보 원소의 중앙값 선택
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // 중앙값을 배열 맨 왼쪽으로 교환하여 옮긴다
        this.swap(nums, left, med);
        // nums[left]를 피벗으로 삼는다
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
            }
            this.swap(nums, i, j); // 두 원소를 교환한다
        }
        this.swap(nums, i, left); // 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
        return i; // 피벗의 인덱스를 반환한다
    }

    /* 퀵 정렬 */
    quickSort(nums: number[], left: number, right: number): void {
        // 부분 배열의 길이가 1이면 재귀를 종료한다
        if (left >= right) {
            return;
        }
        // 센티널 분할
        const pivot = this.partition(nums, left, right);
        // 왼쪽 부분 배열과 오른쪽 부분 배열에 재귀 호출한다
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* 퀵 정렬 클래스(재귀 깊이 최적화) */
class QuickSortTailCall {
    /* 원소 교환 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 센티널 분할 */
    partition(nums: number[], left: number, right: number): number {
        // nums[left]를 피벗으로 삼는다
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
            }
            this.swap(nums, i, j); // 두 원소를 교환한다
        }
        this.swap(nums, i, left); // 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
        return i; // 피벗의 인덱스를 반환한다
    }

    /* 퀵 정렬(재귀 깊이 최적화) */
    quickSort(nums: number[], left: number, right: number): void {
        // 부분 배열의 길이가 1이면 종료한다
        while (left < right) {
            // 센티널 분할 연산
            let pivot = this.partition(nums, left, right);
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬을 수행한다
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // 왼쪽 부분 배열을 재귀적으로 정렬한다
                left = pivot + 1; // 남은 미정렬 구간은 [pivot + 1, right]이다
            } else {
                this.quickSort(nums, pivot + 1, right); // 오른쪽 부분 배열을 재귀적으로 정렬한다
                right = pivot - 1; // 남은 미정렬 구간은 [left, pivot - 1]이다
            }
        }
    }
}

/* 실행 코드 */
/* 퀵 정렬  */
const nums = [2, 4, 1, 0, 3, 5];
const quickSort = new QuickSort();
quickSort.quickSort(nums, 0, nums.length - 1);
console.log('퀵 정렬을 마친 후 nums =', nums);

/* 퀵 정렬(중앙값 피벗 최적화) */
const nums1 = [2, 4, 1, 0, 3, 5];
const quickSortMedian = new QuickSortMedian();
quickSortMedian.quickSort(nums1, 0, nums1.length - 1);
console.log('퀵 정렬(중앙값 피벗 최적화)을 마친 후 nums =', nums1);

/* 퀵 정렬(재귀 깊이 최적화) */
const nums2 = [2, 4, 1, 0, 3, 5];
const quickSortTailCall = new QuickSortTailCall();
quickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
console.log('퀵 정렬(재귀 깊이 최적화)을 마친 후 nums =', nums2);

export {};
