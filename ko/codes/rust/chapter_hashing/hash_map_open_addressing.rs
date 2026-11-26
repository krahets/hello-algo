/*
 * File: hash_map_open_addressing.rs
 * Created Time: 2023-07-16
 * Author: WSL0809 (wslzzy@outlook.com), night-cruise (2586447362@qq.com)
 */
#![allow(non_snake_case)]
#![allow(unused)]

mod array_hash_map;

use array_hash_map::Pair;

/* 개방 주소법 해시 테이블 */
struct HashMapOpenAddressing {
    size: usize,                // 키-값 쌍의 개수
    capacity: usize,            // 해시 테이블의 용량
    load_thres: f64,            // 용량을 늘리는 기준이 되는 적재율
    extend_ratio: usize,        // 용량 증가 배수
    buckets: Vec<Option<Pair>>, // 버킷 배열
    TOMBSTONE: Option<Pair>,    // 삭제 표시
}

impl HashMapOpenAddressing {
    /* 생성자 */
    fn new() -> Self {
        Self {
            size: 0,
            capacity: 4,
            load_thres: 2.0 / 3.0,
            extend_ratio: 2,
            buckets: vec![None; 4],
            TOMBSTONE: Some(Pair {
                key: -1,
                val: "-1".to_string(),
            }),
        }
    }

    /* 해시 함수 */
    fn hash_func(&self, key: i32) -> usize {
        (key % self.capacity as i32) as usize
    }

    /* 적재율 */
    fn load_factor(&self) -> f64 {
        self.size as f64 / self.capacity as f64
    }

    /* key에 해당하는 버킷 인덱스 찾기 */
    fn find_bucket(&mut self, key: i32) -> usize {
        let mut index = self.hash_func(key);
        let mut first_tombstone = -1;
        // 선형 탐사 중 빈 버킷을 만나면 반복 종료
        while self.buckets[index].is_some() {
            // key를 만나면 해당 버킷 인덱스 반환
            if self.buckets[index].as_ref().unwrap().key == key {
                // 앞서 삭제 표시를 만났으면 키-값 쌍을 그 위치로 이동
                if first_tombstone != -1 {
                    self.buckets[first_tombstone as usize] = self.buckets[index].take();
                    self.buckets[index] = self.TOMBSTONE.clone();
                    return first_tombstone as usize; // 옮긴 뒤의 버킷 인덱스 반환
                }
                return index; // 버킷 인덱스 반환
            }
            // 처음 만난 삭제 표시의 위치 기록
            if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                first_tombstone = index as i32;
            }
            // 다음 버킷 인덱스 계산. 끝을 지나면 처음으로 돌아감
            index = (index + 1) % self.capacity;
        }
        // key가 없으면 삽입할 위치의 인덱스 반환
        if first_tombstone == -1 {
            index
        } else {
            first_tombstone as usize
        }
    }

    /* 조회 */
    fn get(&mut self, key: i32) -> Option<&str> {
        // key에 해당하는 버킷 인덱스 찾기
        let index = self.find_bucket(key);
        // 키-값 쌍을 찾으면 해당 val 반환
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
        }
        // 키-값 쌍이 없으면 null 반환
        None
    }

    /* 추가 */
    fn put(&mut self, key: i32, val: String) {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if self.load_factor() > self.load_thres {
            self.extend();
        }
        // key에 해당하는 버킷 인덱스 찾기
        let index = self.find_bucket(key);
        // 키-값 쌍을 찾으면 val을 덮어쓰고 반환
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index].as_mut().unwrap().val = val;
            return;
        }
        // 키-값 쌍이 없으면 새로 추가
        self.buckets[index] = Some(Pair { key, val });
        self.size += 1;
    }

    /* 삭제 */
    fn remove(&mut self, key: i32) {
        // key에 해당하는 버킷 인덱스 찾기
        let index = self.find_bucket(key);
        // 키-값 쌍을 찾으면 삭제 표시로 덮어쓰기
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index] = self.TOMBSTONE.clone();
            self.size -= 1;
        }
    }

    /* 해시 테이블 용량 늘리기 */
    fn extend(&mut self) {
        // 기존 해시 테이블 임시 보관
        let buckets_tmp = self.buckets.clone();
        // 용량을 늘린 새 해시 테이블 초기화
        self.capacity *= self.extend_ratio;
        self.buckets = vec![None; self.capacity];
        self.size = 0;

        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
        for pair in buckets_tmp {
            if pair.is_none() || pair == self.TOMBSTONE {
                continue;
            }
            let pair = pair.unwrap();

            self.put(pair.key, pair.val);
        }
    }
    /* 해시 테이블 출력 */
    fn print(&self) {
        for pair in &self.buckets {
            if pair.is_none() {
                println!("null");
            } else if pair == &self.TOMBSTONE {
                println!("TOMBSTONE");
            } else {
                let pair = pair.as_ref().unwrap();
                println!("{} -> {}", pair.key, pair.val);
            }
        }
    }
}

/* 실행 예제 */
fn main() {
    /* 해시 테이블 초기화 */
    let mut hashmap = HashMapOpenAddressing::new();

    /* 추가 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    hashmap.put(12836, "샤오하".to_string());
    hashmap.put(15937, "샤오뤄".to_string());
    hashmap.put(16750, "샤오쑤안".to_string());
    hashmap.put(13276, "샤오파".to_string());
    hashmap.put(10583, "샤오야".to_string());

    println!("\n추가 후 해시 테이블\nKey -> Value");
    hashmap.print();

    /* 조회 */
    // 해시 테이블에 키 key를 입력하여 값 val 조회
    let name = hashmap.get(13276).unwrap();
    println!("\n학번 13276으로 조회한 이름: {}", name);

    /* 삭제 */
    // 해시 테이블에서 키-값 쌍 (key, val) 삭제
    hashmap.remove(16750);
    println!("\n키 16750 삭제 후 해시 테이블\nKey -> Value");
    hashmap.print();
}
