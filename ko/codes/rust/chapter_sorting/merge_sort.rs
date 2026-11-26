/**
 * File: merge_sort.rs
 * Created Time: 2023-02-14
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

/* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
    // 왼쪽 부분 배열의 구간은 [left, mid], 오른쪽 부분 배열의 구간은 [mid+1, right]
    // 병합 결과를 담을 임시 배열 tmp 생성
    let tmp_size = right - left + 1;
    let mut tmp = vec![0; tmp_size];
    // 왼쪽과 오른쪽 부분 배열의 시작 인덱스 초기화
    let (mut i, mut j, mut k) = (left, mid + 1, 0);
    // 양쪽 부분 배열에 모두 원소가 남아 있으면 서로 비교하여 더 작은 원소를 임시 배열에 복사
    while i <= mid && j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i];
            i += 1;
        } else {
            tmp[k] = nums[j];
            j += 1;
        }
        k += 1;
    }
    // 양쪽 부분 배열에서 남은 원소를 임시 배열에 복사
    while i <= mid {
        tmp[k] = nums[i];
        k += 1;
        i += 1;
    }
    while j <= right {
        tmp[k] = nums[j];
        k += 1;
        j += 1;
    }
    // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사
    for k in 0..tmp_size {
        nums[left + k] = tmp[k];
    }
}

/* 병합 정렬 */
fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
    // 종료 조건
    if left >= right {
        return; // 부분 배열의 길이가 1이면 재귀 종료
    }

    // 분할 단계
    let mid = left + (right - left) / 2; // 중간 지점 계산
    merge_sort(nums, left, mid); // 왼쪽 부분 배열을 재귀적으로 정렬
    merge_sort(nums, mid + 1, right); // 오른쪽 부분 배열을 재귀적으로 정렬

    // 병합 단계
    merge(nums, left, mid, right);
}

/* 실행 예제 */
fn main() {
    /* 병합 정렬 */
    let mut nums = [7, 3, 2, 6, 0, 1, 5, 4];
    let right = nums.len() - 1;
    merge_sort(&mut nums, 0, right);
    println!("병합 정렬 후 nums = {:?}", nums);
}
