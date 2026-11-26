/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::Rng;

/* 임의의 원소에 접근 */
fn random_access(nums: &[i32]) -> i32 {
    // 구간 [0, nums.len())에서 수 하나를 무작위로 선택
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // 선택한 원소를 가져와 반환
    let random_num = nums[random_index];
    random_num
}

/* 배열 길이 늘리기 */
fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
    // 길이를 늘린 새 배열 초기화
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // 원래 배열의 모든 원소를 새 배열에 복사
    res[0..nums.len()].copy_from_slice(nums);

    // 길이를 늘린 새 배열 반환
    res
}

/* 배열의 인덱스 index에 원소 num 삽입 */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // 인덱스 index부터 끝까지 모든 원소를 뒤로 한 칸씩 이동
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // 인덱스 index의 원소에 num 대입
    nums[index] = num;
}

/* 인덱스 index의 원소 삭제 */
fn remove(nums: &mut [i32], index: usize) {
    // 인덱스 index 다음의 모든 원소를 앞으로 한 칸씩 이동
    for i in index..nums.len() - 1 {
        nums[i] = nums[i + 1];
    }
}

/* 배열 순회 */
fn traverse(nums: &[i32]) {
    let mut _count = 0;
    // 인덱스로 배열 순회
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // 배열 원소를 직접 순회
    _count = 0;
    for &num in nums {
        _count += num;
    }
}

/* 배열에서 지정한 원소 찾기 */
fn find(nums: &[i32], target: i32) -> Option<usize> {
    for i in 0..nums.len() {
        if nums[i] == target {
            return Some(i);
        }
    }
    None
}

/* 실행 예제 */
fn main() {
    /* 배열 초기화 */
    let arr: [i32; 5] = [0; 5];
    print!("배열 arr = ");
    print_util::print_array(&arr);
    // Rust에서 길이를 지정하면([i32; 5]) 배열이고, 지정하지 않으면(&[i32]) 슬라이스이다.
    // Rust 배열의 길이는 컴파일 시점에 결정되므로 상수로만 길이를 지정할 수 있다.
    // Rust에서는 일반적으로 Vector 타입을 동적 배열로 사용한다.
    // 용량을 늘리는 extend() 메서드를 쉽게 구현하기 위해 아래에서는 벡터(vector)를 배열(array)로 취급한다.
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("\n배열 nums = ");
    print_util::print_array(&nums);

    // 임의 접근
    let random_num = random_access(&nums);
    println!("\nnums에서 무작위로 선택한 원소: {}", random_num);

    // 길이 늘리기
    let mut nums: Vec<i32> = extend(&nums, 3);
    print!("길이를 8로 늘린 배열 nums = ");
    print_util::print_array(&nums);

    // 원소 삽입
    insert(&mut nums, 6, 3);
    print!("\n인덱스 3에 숫자 6을 삽입한 후 nums = ");
    print_util::print_array(&nums);

    // 원소 삭제
    remove(&mut nums, 2);
    print!("\n인덱스 2의 원소를 삭제한 후 nums = ");
    print_util::print_array(&nums);

    // 배열 순회
    traverse(&nums);

    // 원소 찾기
    let index = find(&nums, 3).unwrap();
    println!("\nnums에서 원소 3을 찾은 인덱스 = {}", index);
}
