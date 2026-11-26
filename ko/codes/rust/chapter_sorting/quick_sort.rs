/**
 * File: quick_sort.rs
 * Created Time: 2023-02-16
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

/* 퀵 정렬 */
struct QuickSort;

impl QuickSort {
    /* 양방향 포인터로 분할 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // nums[left]를 피벗으로 선택
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            nums.swap(i, j); // 두 원소 교환
        }
        nums.swap(i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        i // 피벗의 인덱스 반환
    }

    /* 퀵 정렬 */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if left >= right {
            return;
        }
        // 양방향 포인터로 분할
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* 퀵 정렬(중앙값 피벗 최적화) */
struct QuickSortMedian;

impl QuickSortMedian {
    /* 세 후보 원소의 중앙값 선택 */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m이 l과 r 사이에 있음
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l이 m과 r 사이에 있음
        }
        right
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 세 후보 원소의 중앙값 선택
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        nums.swap(left, med);
        // nums[left]를 피벗으로 선택
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            nums.swap(i, j); // 두 원소 교환
        }
        nums.swap(i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        i // 피벗의 인덱스 반환
    }

    /* 퀵 정렬 */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if left >= right {
            return;
        }
        // 양방향 포인터로 분할
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* 퀵 정렬(재귀 깊이 최적화) */
struct QuickSortTailCall;

impl QuickSortTailCall {
    /* 양방향 포인터로 분할 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // nums[left]를 피벗으로 선택
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            nums.swap(i, j); // 두 원소 교환
        }
        nums.swap(i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        i // 피벗의 인덱스 반환
    }

    /* 퀵 정렬(재귀 깊이 최적화) */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // 부분 배열의 길이가 1이면 종료
        while left < right {
            // 양방향 포인터로 분할
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1; // 남은 미정렬 구간은 [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1; // 남은 미정렬 구간은 [left, pivot - 1]
            }
        }
    }
}

/* 실행 예제 */
fn main() {
    /* 퀵 정렬 */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSort::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("퀵 정렬 후 nums = {:?}", nums);

    /* 퀵 정렬(중앙값 피벗 최적화) */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortMedian::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("퀵 정렬(중앙값 피벗 최적화) 후 nums = {:?}", nums);

    /* 퀵 정렬(재귀 깊이 최적화) */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortTailCall::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("퀵 정렬(재귀 깊이 최적화) 후 nums = {:?}", nums);
}
