/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 실행 코드 */
pub fn main() {
    // 스택 초기화
    // Rust에서는 Vec를 스택으로 사용하는 것을 권장한다
    let mut stack: Vec<i32> = Vec::new();

    // 스택에 원소 삽입
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("스택 stack = ");
    print_util::print_array(&stack);

    // 스택 맨 위 원소 접근
    let peek = stack.last().unwrap();
    print!("\n스택 맨 위 원소 peek = {peek}");

    // 스택에서 원소 꺼내기
    let pop = stack.pop().unwrap();
    print!("\n꺼낸 원소 pop = {pop}, 꺼낸 뒤 stack = ");
    print_util::print_array(&stack);

    // 스택의 길이 반환
    let size = stack.len();
    print!("\n스택 길이 size = {size}");

    // 스택이 비어 있는지 판단
    let is_empty = stack.is_empty();
    print!("\n스택이 비어 있는가 = {is_empty}");
}
