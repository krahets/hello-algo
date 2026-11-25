/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* 실행 예제 */
pub fn main() {
    // 덱 초기화
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    print!("덱 deque = ");
    print_util::print_queue(&deque);

    // 원소 조회
    let peek_first = deque.front().unwrap();
    print!("\n맨 앞 원소 peekFirst = {peek_first}");
    let peek_last = deque.back().unwrap();
    print!("\n맨 뒤 원소 peekLast = {peek_last}");

    /* 덱에 원소 삽입 */
    deque.push_back(4);
    print!("\n맨 뒤에 원소 4를 삽입한 후 deque = ");
    print_util::print_queue(&deque);
    deque.push_front(1);
    print!("\n맨 앞에 원소 1을 삽입한 후 deque = ");
    print_util::print_queue(&deque);

    // 덱에서 원소 꺼내기
    let pop_last = deque.pop_back().unwrap();
    print!("\n맨 뒤에서 꺼낸 원소 = {pop_last}, 맨 뒤에서 꺼낸 후 deque = ");
    print_util::print_queue(&deque);
    let pop_first = deque.pop_front().unwrap();
    print!("\n맨 앞에서 꺼낸 원소 = {pop_first}, 맨 앞에서 꺼낸 후 deque = ");
    print_util::print_queue(&deque);

    // 덱의 길이 조회
    let size = deque.len();
    print!("\n덱의 길이 size = {size}");

    // 덱이 비어 있는지 확인
    let is_empty = deque.is_empty();
    print!("\n덱이 비어 있는가 = {is_empty}");
}
