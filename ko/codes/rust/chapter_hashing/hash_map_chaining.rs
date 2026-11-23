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

    /* 삭제 연산 */
    fn remove(&mut self, key: i32) -> Option<String> {
        let index = self.hash_func(key);

        // 버킷을 순회하며 키-값 쌍을 삭제한다
        for (i, p) in self.buckets[index].iter_mut().enumerate() {
            if p.key == key {
                let pair = self.buckets[index].remove(i);
                self.size -= 1;
                return Some(pair.val);
            }
        }

        // key를 찾지 못하면 None을 반환한다
        None
    }

    /* 해시 테이블 용량 확장 */
    fn extend(&mut self) {
        // 원래 해시 테이블을 임시로 저장한다
        let buckets_tmp = std::mem::take(&mut self.buckets);

        // 용량을 확장한 새 해시 테이블을 초기화한다
        self.capacity *= self.extend_ratio;
        self.buckets = vec![Vec::new(); self.capacity as usize];
        self.size = 0;

        // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
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

    /* 추가 연산 */
    fn put(&mut self, key: i32, val: String) {
        // 적재율이 임계값을 초과하면 용량을 확장한다
        if self.load_factor() > self.load_thres {
            self.extend();
        }

        let index = self.hash_func(key);

        // 버킷을 순회하다 지정한 key를 만나면 해당 val을 갱신하고 반환한다
        for pair in self.buckets[index].iter_mut() {
            if pair.key == key {
                pair.val = val;
                return;
            }
        }

        // 해당 key가 없으면 키-값 쌍을 맨 뒤에 추가한다
        let pair = Pair { key, val };
        self.buckets[index].push(pair);
        self.size += 1;
    }

    /* 조회 연산 */
    fn get(&self, key: i32) -> Option<&str> {
        let index = self.hash_func(key);

        // 버킷을 순회하다 key를 찾으면 해당 val을 반환한다
        for pair in self.buckets[index].iter() {
            if pair.key == key {
                return Some(&pair.val);
            }
        }

        // key를 찾지 못하면 None을 반환한다
        None
    }
}

/* 실행 코드 */
pub fn main() {
    /* 해시 테이블 초기화 */
    let mut map = HashMapChaining::new();

    /* 추가 연산 */
    // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    map.put(12836, "小哈".to_string());
    map.put(15937, "小啰".to_string());
    map.put(16750, "小算".to_string());
    map.put(13276, "小法".to_string());
    map.put(10583, "小鸭".to_string());
    println!("\n추가를 마친 후의 해시 테이블\n키 -> 값");
    map.print();

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    println!(
        "\n학번 13276으로 조회한 이름 {}",
        match map.get(13276) {
            Some(value) => value,
            None => "유효하지 않은 키",
        }
    );

    /* 삭제 연산 */
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    map.remove(12836);
    println!("\n12836을 삭제한 뒤의 해시 테이블\n키 -> 값");
    map.print();
}
