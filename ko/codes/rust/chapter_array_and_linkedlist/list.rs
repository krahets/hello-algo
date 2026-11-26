/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* 실행 예제 */
fn main() {
    // 리스트 초기화
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("리스트 nums = ");
    print_util::print_array(&nums);

    // 원소 접근
    let num = nums[1];
    println!("\n인덱스 1의 원소를 읽은 결과 num = {num}");

    // 원소 갱신
    nums[1] = 0;
    print!("인덱스 1의 원소를 0으로 바꾼 후 nums = ");
    print_util::print_array(&nums);

    // 리스트 비우기
    nums.clear();
    print!("\n리스트를 비운 후 nums = ");
    print_util::print_array(&nums);

    // 맨 뒤에 원소 추가
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    print!("\n원소 추가 후 nums = ");
    print_util::print_array(&nums);

    // 중간에 원소 삽입
    nums.insert(3, 6);
    print!("\n인덱스 3에 숫자 6을 삽입한 후 nums = ");
    print_util::print_array(&nums);

    // 원소 삭제
    nums.remove(3);
    print!("\n인덱스 3의 원소를 삭제한 후 nums = ");
    print_util::print_array(&nums);

    // 인덱스로 리스트 순회
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // 리스트 원소를 직접 순회
    _count = 0;
    for x in &nums {
        _count += x;
    }

    // 두 리스트 이어 붙이기
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append(이동) 후에는 nums1이 비게 된다!

    // nums.extend(&nums1);   // extend(대여)를 쓰면 nums1을 계속 사용할 수 있다.
    print!("\nnums 뒤에 리스트 nums1을 이어 붙인 후 nums = ");
    print_util::print_array(&nums);

    // 리스트 정렬
    nums.sort();
    print!("\n리스트 정렬 후 nums = ");
    print_util::print_array(&nums);
}
