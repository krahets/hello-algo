/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::HashMap;

/* 실행 예제 */
pub fn main() {
    // 해시 테이블 초기화
    let mut map = HashMap::new();

    // 추가
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map.insert(12836, "샤오하");
    map.insert(15937, "샤오뤄");
    map.insert(16750, "샤오쑤안");
    map.insert(13276, "샤오파");
    map.insert(10583, "샤오야");
    println!("\n추가 후 해시 테이블\nKey -> Value");
    print_util::print_hash_map(&map);

    // 조회
    // 해시 테이블에 키 key를 입력하여 값 value 조회
    let name = map.get(&15937).copied().unwrap();
    println!("\n학번 15937로 조회한 이름: {name}");

    // 삭제
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    _ = map.remove(&10583);
    println!("\n키 10583 삭제 후 해시 테이블\nKey -> Value");
    print_util::print_hash_map(&map);

    // 해시 테이블 순회
    println!("\n키-값 쌍 순회 Key->Value");
    print_util::print_hash_map(&map);
    println!("\n키만 순회 Key");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\n값만 순회 value");
    for value in map.values() {
        println!("{value}");
    }
}
