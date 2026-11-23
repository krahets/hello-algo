/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::HashMap;

/* 실행 코드 */
pub fn main() {
    // 해시 테이블 초기화
    let mut map = HashMap::new();

    // 추가 연산
    // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    map.insert(12836, "小哈");
    map.insert(15937, "小啰");
    map.insert(16750, "小算");
    map.insert(13276, "小法");
    map.insert(10583, "小鸭");
    println!("\n추가를 마친 후의 해시 테이블\n키 -> 값");
    print_util::print_hash_map(&map);

    // 조회 연산
    // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    let name = map.get(&15937).copied().unwrap();
    println!("\n학번 15937로 조회한 이름 {name}");

    // 삭제 연산
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    _ = map.remove(&10583);
    println!("\n10583을 삭제한 후의 해시 테이블\n키 -> 값");
    print_util::print_hash_map(&map);

    // 해시 테이블 순회
    println!("\n키-값 쌍(키->값) 순회");
    print_util::print_hash_map(&map);
    println!("\n키 Key만 순회");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\n값 value만 순회");
    for value in map.values() {
        println!("{value}");
    }
}
