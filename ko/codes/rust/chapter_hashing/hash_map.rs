/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

// [region]{import_hash_map}
use std::collections::HashMap;
// [endregion]{import_hash_map}

/* 실행 코드 */
pub fn main() {
    // [region]{init_hash_map}
    // 해시 테이블 초기화
    let mut map = HashMap::new();
    // [endregion]{init_hash_map}

    // [region]{add_pairs}
    // 추가 연산
    // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    map.insert(12836, "小哈");
    map.insert(15937, "小啰");
    map.insert(16750, "小算");
    map.insert(13276, "小法");
    map.insert(10583, "小鸭");
    // [endregion]{add_pairs}
    println!("\n추가를 마친 후의 해시 테이블\n키 -> 값");
    print_util::print_hash_map(&map);

    // [region]{get_value}
    // 조회 연산
    // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    let name = map.get(&15937).copied().unwrap();
    // [endregion]{get_value}
    println!("\n학번 15937로 조회한 이름 {name}");

    // [region]{remove_pair}
    // 삭제 연산
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    _ = map.remove(&10583);
    // [endregion]{remove_pair}
    println!("\n10583을 삭제한 후의 해시 테이블\n키 -> 값");
    print_util::print_hash_map(&map);

    println!("\n키-값 쌍(키->값) 순회");
    // [region]{iterate_pairs}
    // 해시 테이블 순회
    // 키-값 쌍 key->value를 순회한다
    for (key, value) in &map {
        println!("{key} -> {value}");
    }
    // [endregion]{iterate_pairs}

    println!("\n키 Key만 순회");
    // [region]{iterate_keys}
    // 키 key만 순회한다
    for key in map.keys() {
        println!("{key}");
    }
    // [endregion]{iterate_keys}

    println!("\n값 value만 순회");
    // [region]{iterate_values}
    // 값 value만 순회한다
    for value in map.values() {
        println!("{value}");
    }
    // [endregion]{iterate_values}
}
