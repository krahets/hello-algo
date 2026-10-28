/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::Rng;

/* 원소에 임의 접근 */
fn random_access(nums: &[i32]) -> i32 {
    // 구간 [0, nums.len())에서 숫자 하나를 무작위로 뽑는다
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // 무작위 원소를 가져와 반환한다
    let random_num = nums[random_index];
    random_num
}

/* 배열 길이 확장 */
fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
    // 길이를 확장한 배열을 초기화한다
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // 원래 배열의 모든 원소를 새 배열로 복사한다
    res[0..nums.len()].copy_from_slice(nums);

    // 확장한 새 배열을 반환한다
    res
}

/* 배열의 인덱스 index에 원소 num 삽입 */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // 인덱스 index와 그 뒤에 있는 모든 원소를 한 칸씩 뒤로 이동한다
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // index 위치의 원소에 num을 대입한다
    nums[index] = num;
}

/* 인덱스 index에 있는 원소 삭제 */
fn remove(nums: &mut [i32], index: usize) {
    // 인덱스 index 뒤에 있는 모든 원소를 한 칸씩 앞으로 이동한다
    for i in index..nums.len() - 1 {
        nums[i] = nums[i + 1];
    }
}

/* 배열 순회 */
fn traverse(nums: &[i32]) {
    let mut _count = 0;
    // 인덱스를 통해 배열을 순회한다
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // 배열의 원소를 직접 순회한다
    _count = 0;
    for &num in nums {
        _count += num;
    }
}

/* 배열에서 지정한 원소 탐색 */
fn find(nums: &[i32], target: i32) -> Option<usize> {
    for i in 0..nums.len() {
        if nums[i] == target {
            return Some(i);
        }
    }
    None
}

/* 실행 코드 */
fn main() {
    /* 배열 초기화 */
    let arr: [i32; 5] = [0; 5];
    print!("배열 arr = ");
    print_util::print_array(&arr);
    // Rust에서 길이를 지정한 [i32; 5]는 배열이고, 길이를 지정하지 않은 &[i32]는 슬라이스다
    // Rust의 배열은 컴파일 시점에 길이가 정해지도록 설계되어 있으므로 상수로만 길이를 지정할 수 있다
    // Vector는 Rust에서 일반적으로 동적 배열로 사용하는 자료형이다
    // 용량을 늘리는 extend() 메서드를 쉽게 구현하기 위해 아래에서는 vector를 배열(array)로 취급한다
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("\n배열 nums = ");
    print_util::print_array(&nums);

    // 임의 접근
    let random_num = random_access(&nums);
    println!("\nnums에서 무작위로 얻은 원소 {}", random_num);

    // 길이 확장
    let mut nums: Vec<i32> = extend(&nums, 3);
    print!("배열 길이를 8로 확장한 후 nums = ");
    print_util::print_array(&nums);

    // 원소 삽입
    insert(&mut nums, 6, 3);
    print!("\n인덱스 3에 숫자 6을 삽입한 후 nums = ");
    print_util::print_array(&nums);

    // 원소 삭제
    remove(&mut nums, 2);
    print!("\n인덱스 2의 원소를 삭제한 뒤 nums = ");
    print_util::print_array(&nums);

    // 배열 순회
    traverse(&nums);

    // 원소 탐색
    let index = find(&nums, 3).unwrap();
    println!("\nnums에서 원소 3을 찾은 인덱스 = {}", index);
}
