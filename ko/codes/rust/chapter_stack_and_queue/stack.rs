/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 실행 예제 */
pub fn main() {
    // 스택 초기화
    // Rust에서는 Vec을 스택으로 사용하는 것이 좋다
    let mut stack: Vec<i32> = Vec::new();

    // 스택에 원소 삽입
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("스택 stack = ");
    print_util::print_array(&stack);

    // 스택 맨 위의 원소 조회
    let peek = stack.last().unwrap();
    print!("\n맨 위 원소 peek = {peek}");

    // 스택에서 원소 꺼내기
    let pop = stack.pop().unwrap();
    print!("\n꺼낸 원소 pop = {pop}, 꺼낸 후 stack = ");
    print_util::print_array(&stack);

    // 스택의 길이 조회
    let size = stack.len();
    print!("\n스택의 길이 size = {size}");

    // 스택이 비어 있는지 확인
    let is_empty = stack.is_empty();
    print!("\n스택이 비어 있는가 = {is_empty}");
}
