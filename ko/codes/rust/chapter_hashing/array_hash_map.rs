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
        // 버킷 100개를 포함하는 배열을 초기화한다
        Self {
            buckets: vec![None; 100],
        }
    }

    /* 해시 함수 */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % 100
    }

    /* 조회 연산 */
    pub fn get(&self, key: i32) -> Option<&String> {
        let index = self.hash_func(key);
        self.buckets[index].as_ref().map(|pair| &pair.val)
    }

    /* 추가 연산 */
    pub fn put(&mut self, key: i32, val: &str) {
        let index = self.hash_func(key);
        self.buckets[index] = Some(Pair {
            key,
            val: val.to_string(),
        });
    }

    /* 삭제 연산 */
    pub fn remove(&mut self, key: i32) {
        let index = self.hash_func(key);
        // None으로 설정하여 삭제를 나타낸다
        self.buckets[index] = None;
    }

    /* 모든 키-값 쌍 반환 */
    pub fn entry_set(&self) -> Vec<&Pair> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref())
            .collect()
    }

    /* 모든 키 반환 */
    pub fn key_set(&self) -> Vec<&i32> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.key))
            .collect()
    }

    /* 모든 값 반환 */
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
    /*추가 연산 */
    // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    println!("\n추가를 마친 후의 해시 테이블\n키 -> 값");
    map.print();

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    let name = map.get(15937).unwrap();
    println!("\n학번 15937로 조회한 이름 {}", name);

    /* 삭제 연산 */
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    map.remove(10583);
    println!("\n10583을 삭제한 후의 해시 테이블\n키 -> 값");
    map.print();

    /* 해시 테이블 순회 */
    println!("\n키-값 쌍(키->값) 순회");
    for pair in map.entry_set() {
        println!("{} -> {}", pair.key, pair.val);
    }

    println!("\n키 Key만 순회");
    for key in map.key_set() {
        println!("{}", key);
    }

    println!("\n값 Value만 순회");
    for val in map.value_set() {
        println!("{}", val);
    }
}
