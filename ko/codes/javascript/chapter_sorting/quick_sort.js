/**
 * File: quick_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 퀵 정렬 클래스 */
class QuickSort {
    /* 원소 교환 */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 양방향 포인터로 분할 */
    partition(nums, left, right) {
        // nums[left]를 피벗으로 선택
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            // 원소 교환
            this.swap(nums, i, j); // 두 원소 교환
        }
        this.swap(nums, i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i; // 피벗의 인덱스 반환
    }

    /* 퀵 정렬 */
    quickSort(nums, left, right) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if (left >= right) return;
        // 양방향 포인터로 분할
        const pivot = this.partition(nums, left, right);
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* 퀵 정렬 클래스(중앙값 피벗 최적화) */
class QuickSortMedian {
    /* 원소 교환 */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 세 후보 원소의 중앙값 선택 */
    medianThree(nums, left, mid, right) {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m이 l과 r 사이에 있음
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l이 m과 r 사이에 있음
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    partition(nums, left, right) {
        // 세 후보 원소의 중앙값 선택
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        this.swap(nums, left, med);
        // nums[left]를 피벗으로 선택
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left]) i++; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            this.swap(nums, i, j); // 두 원소 교환
        }
        this.swap(nums, i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i; // 피벗의 인덱스 반환
    }

    /* 퀵 정렬 */
    quickSort(nums, left, right) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if (left >= right) return;
        // 양방향 포인터로 분할
        const pivot = this.partition(nums, left, right);
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* 퀵 정렬 클래스(재귀 깊이 최적화) */
class QuickSortTailCall {
    /* 원소 교환 */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 양방향 포인터로 분할 */
    partition(nums, left, right) {
        // nums[left]를 피벗으로 선택
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left]) i++; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            this.swap(nums, i, j); // 두 원소 교환
        }
        this.swap(nums, i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i; // 피벗의 인덱스 반환
    }

    /* 퀵 정렬(재귀 깊이 최적화) */
    quickSort(nums, left, right) {
        // 부분 배열의 길이가 1이면 종료
        while (left < right) {
            // 양방향 포인터로 분할
            let pivot = this.partition(nums, left, right);
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1; // 남은 미정렬 구간은 [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1; // 남은 미정렬 구간은 [left, pivot - 1]
            }
        }
    }
}

/* 실행 예제 */
/* 퀵 정렬  */
const nums = [2, 4, 1, 0, 3, 5];
const quickSort = new QuickSort();
quickSort.quickSort(nums, 0, nums.length - 1);
console.log('퀵 정렬 후 nums =', nums);

/* 퀵 정렬(중앙값 피벗 최적화) */
const nums1 = [2, 4, 1, 0, 3, 5];
const quickSortMedian = new QuickSortMedian();
quickSortMedian.quickSort(nums1, 0, nums1.length - 1);
console.log('퀵 정렬(중앙값 피벗 최적화) 후 nums =', nums1);

/* 퀵 정렬(재귀 깊이 최적화) */
const nums2 = [2, 4, 1, 0, 3, 5];
const quickSortTailCall = new QuickSortTailCall();
quickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
console.log('퀵 정렬(재귀 깊이 최적화) 후 nums =', nums2);
