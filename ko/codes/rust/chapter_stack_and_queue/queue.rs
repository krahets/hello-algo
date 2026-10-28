/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* 실행 코드 */
pub fn main() {
    // 큐 초기화
    let mut queue: VecDeque<i32> = VecDeque::new();

    // 큐에 원소 삽입
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    print!("큐 queue = ");
    print_util::print_queue(&queue);

    // 맨 앞 원소 접근
    let peek = queue.front().unwrap();
    println!("\n맨 앞 원소 peek = {peek}");

    // 큐에서 원소 꺼내기
    let pop = queue.pop_front().unwrap();
    print!("꺼낸 원소 pop = {pop}, 꺼낸 뒤 queue = ");
    print_util::print_queue(&queue);

    // 큐의 길이 반환
    let size = queue.len();
    print!("\n큐 길이 size = {size}");

    // 큐가 비어 있는지 판단
    let is_empty = queue.is_empty();
    print!("\n큐가 비어 있는가 = {is_empty}");
}
