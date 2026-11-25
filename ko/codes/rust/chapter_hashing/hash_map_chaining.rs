/*
 * File: hash_map_chaining.rs
 * Created Time: 2023-07-07
 * Author: WSL0809 (wslzzy@outlook.com)
 */

#[derive(Clone)]
/* 키-값 쌍 */
struct Pair {
    key: i32,
    val: String,
}

/* 체이닝 해시 테이블 */
struct HashMapChaining {
    size: usize,
    capacity: usize,
    load_thres: f32,
    extend_ratio: usize,
    buckets: Vec<Vec<Pair>>,
}

impl HashMapChaining {
    /* 생성자 */
    fn new() -> Self {
        Self {
            size: 0,
            capacity: 4,
            load_thres: 2.0 / 3.0,
            extend_ratio: 2,
            buckets: vec![vec![]; 4],
        }
    }

    /* 해시 함수 */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % self.capacity
    }

    /* 적재율 */
    fn load_factor(&self) -> f32 {
        self.size as f32 / self.capacity as f32
    }

    /* 삭제 */
    fn remove(&mut self, key: i32) -> Option<String> {
        let index = self.hash_func(key);

        // 버킷을 순회하며 해당 키-값 쌍 삭제
        for (i, p) in self.buckets[index].iter_mut().enumerate() {
            if p.key == key {
                let pair = self.buckets[index].remove(i);
                self.size -= 1;
                return Some(pair.val);
            }
        }

        // key를 찾지 못하면 None 반환
        None
    }

    /* 해시 테이블 용량 늘리기 */
    fn extend(&mut self) {
        // 기존 해시 테이블 임시 보관
        let buckets_tmp = std::mem::take(&mut self.buckets);

        // 용량을 늘린 새 해시 테이블 초기화
        self.capacity *= self.extend_ratio;
        self.buckets = vec![Vec::new(); self.capacity as usize];
        self.size = 0;

        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
        for bucket in buckets_tmp {
            for pair in bucket {
                self.put(pair.key, pair.val);
            }
        }
    }

    /* 해시 테이블 출력 */
    fn print(&self) {
        for bucket in &self.buckets {
            let mut res = Vec::new();
            for pair in bucket {
                res.push(format!("{} -> {}", pair.key, pair.val));
            }
            println!("{:?}", res);
        }
    }

    /* 추가 */
    fn put(&mut self, key: i32, val: String) {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if self.load_factor() > self.load_thres {
            self.extend();
        }

        let index = self.hash_func(key);

        // 버킷을 순회하다가 지정한 key를 만나면 해당 val을 갱신하고 반환
        for pair in self.buckets[index].iter_mut() {
            if pair.key == key {
                pair.val = val;
                return;
            }
        }

        // 해당 key가 없으면 맨 뒤에 키-값 쌍 추가
        let pair = Pair { key, val };
        self.buckets[index].push(pair);
        self.size += 1;
    }

    /* 조회 */
    fn get(&self, key: i32) -> Option<&str> {
        let index = self.hash_func(key);

        // 버킷을 순회하다가 key를 찾으면 해당 val 반환
        for pair in self.buckets[index].iter() {
            if pair.key == key {
                return Some(&pair.val);
            }
        }

        // key를 찾지 못하면 None 반환
        None
    }
}

/* 실행 예제 */
pub fn main() {
    /* 해시 테이블 초기화 */
    let mut map = HashMapChaining::new();

    /* 추가 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map.put(12836, "샤오하".to_string());
    map.put(15937, "샤오뤄".to_string());
    map.put(16750, "샤오쑤안".to_string());
    map.put(13276, "샤오파".to_string());
    map.put(10583, "샤오야".to_string());
    println!("\n추가 후 해시 테이블\nKey -> Value");
    map.print();

    /* 조회 */
    // 해시 테이블에 키 key를 입력하여 값 value 조회
    println!(
        "\n학번 13276으로 조회한 이름: {}",
        match map.get(13276) {
            Some(value) => value,
            None => "Not a valid Key",
        }
    );

    /* 삭제 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.remove(12836);
    println!("\n키 12836 삭제 후 해시 테이블\nKey -> Value");
    map.print();
}
