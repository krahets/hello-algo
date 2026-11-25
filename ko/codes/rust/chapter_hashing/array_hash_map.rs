/**
 * File: array_hash_map.rs
 * Created Time: 2023-2-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com)
 */

/* 키-값 쌍 */
#[derive(Debug, Clone, PartialEq)]
pub struct Pair {
    pub key: i32,
    pub val: String,
}
/* 배열로 구현한 해시 테이블 */
pub struct ArrayHashMap {
    buckets: Vec<Option<Pair>>,
}

impl ArrayHashMap {
    pub fn new() -> ArrayHashMap {
        // 버킷 100개로 배열 초기화
        Self {
            buckets: vec![None; 100],
        }
    }

    /* 해시 함수 */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % 100
    }

    /* 조회 */
    pub fn get(&self, key: i32) -> Option<&String> {
        let index = self.hash_func(key);
        self.buckets[index].as_ref().map(|pair| &pair.val)
    }

    /* 추가 */
    pub fn put(&mut self, key: i32, val: &str) {
        let index = self.hash_func(key);
        self.buckets[index] = Some(Pair {
            key,
            val: val.to_string(),
        });
    }

    /* 삭제 */
    pub fn remove(&mut self, key: i32) {
        let index = self.hash_func(key);
        // None으로 설정하여 삭제를 나타냄
        self.buckets[index] = None;
    }

    /* 모든 키-값 쌍 가져오기 */
    pub fn entry_set(&self) -> Vec<&Pair> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref())
            .collect()
    }

    /* 모든 키 가져오기 */
    pub fn key_set(&self) -> Vec<&i32> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.key))
            .collect()
    }

    /* 모든 값 가져오기 */
    pub fn value_set(&self) -> Vec<&String> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.val))
            .collect()
    }

    /* 해시 테이블 출력 */
    pub fn print(&self) {
        for pair in self.entry_set() {
            println!("{} -> {}", pair.key, pair.val);
        }
    }
}

fn main() {
    /* 해시 테이블 초기화 */
    let mut map = ArrayHashMap::new();
    /*추가 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map.put(12836, "샤오하");
    map.put(15937, "샤오뤄");
    map.put(16750, "샤오쑤안");
    map.put(13276, "샤오파");
    map.put(10583, "샤오야");
    println!("\n추가 후 해시 테이블\nKey -> Value");
    map.print();

    /* 조회 */
    // 해시 테이블에 키 key를 입력하여 값 value 조회
    let name = map.get(15937).unwrap();
    println!("\n학번 15937로 조회한 이름: {}", name);

    /* 삭제 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.remove(10583);
    println!("\n키 10583 삭제 후 해시 테이블\nKey -> Value");
    map.print();

    /* 해시 테이블 순회 */
    println!("\n키-값 쌍 순회 Key->Value");
    for pair in map.entry_set() {
        println!("{} -> {}", pair.key, pair.val);
    }

    println!("\n키만 순회 Key");
    for key in map.key_set() {
        println!("{}", key);
    }

    println!("\n값만 순회 Value");
    for val in map.value_set() {
        println!("{}", val);
    }
}
