/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* 실행 코드 */
pub fn main() {
    // [region]{init_deque}
    // 덱 초기화
    let mut deque: VecDeque<i32> = VecDeque::new();
    // [endregion]{init_deque}

    // [region]{push}
    /* 원소 삽입 */
    deque.push_back(2); // 맨 뒤에 추가한다
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // 맨 앞에 추가한다
    deque.push_front(1);
    // [endregion]{push}
    print!("덱 deque = ");
    print_util::print_queue(&deque);

    // [region]{peek_first}
    // 원소 접근
    let peek_first = deque.front().unwrap(); // 맨 앞 원소
    // [endregion]{peek_first}
    print!("\n맨 앞 원소 peekFirst = {peek_first}");
    // [region]{peek_last}
    let peek_last = deque.back().unwrap(); // 맨 뒤 원소
    // [endregion]{peek_last}
    print!("\n맨 뒤 원소 peekLast = {peek_last}");

    // [region]{pop_first}
    // 원소 꺼내기
    let pop_first = deque.pop_front().unwrap(); // 맨 앞 원소를 꺼낸다
    // [endregion]{pop_first}
    print!("\n앞에서 꺼낸 원소 = {pop_first}, 꺼낸 뒤 deque = ");
    print_util::print_queue(&deque);
    // [region]{pop_last}
    let pop_last = deque.pop_back().unwrap(); // 맨 뒤 원소를 꺼낸다
    // [endregion]{pop_last}
    print!("\n뒤에서 꺼낸 원소 = {pop_last}, 꺼낸 뒤 deque = ");
    print_util::print_queue(&deque);

    // [region]{size}
    // 덱의 길이 반환
    let size = deque.len();
    // [endregion]{size}
    print!("\n덱 길이 size = {size}");

    // [region]{is_empty}
    // 덱이 비어 있는지 판단
    let is_empty = deque.is_empty();
    // [endregion]{is_empty}
    print!("\n덱이 비어 있는가 = {is_empty}");
}
