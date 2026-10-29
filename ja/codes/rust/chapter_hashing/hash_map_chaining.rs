/*
 * File: hash_map_chaining.rs
 * Created Time: 2023-07-07
 * Author: WSL0809 (wslzzy@outlook.com)
 */

#[derive(Clone)]
/* キーと値のペア */
struct Pair {
    key: i32,
    val: String,
}

/* チェイン法のハッシュテーブル */
struct HashMapChaining {
    size: usize,
    capacity: usize,
    load_thres: f32,
    extend_ratio: usize,
    buckets: Vec<Vec<Pair>>,
}

impl HashMapChaining {
    /* コンストラクタ */
    fn new() -> Self {
        Self {
            size: 0,
            capacity: 4,
            load_thres: 2.0 / 3.0,
            extend_ratio: 2,
            buckets: vec![vec![]; 4],
        }
    }

    /* ハッシュ関数 */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % self.capacity
    }

    /* 負荷率 */
    fn load_factor(&self) -> f32 {
        self.size as f32 / self.capacity as f32
    }

    /* 削除操作 */
    fn remove(&mut self, key: i32) -> Option<String> {
        let index = self.hash_func(key);

        // バケットを走査し、キーと値のペアを削除する
        for (i, p) in self.buckets[index].iter_mut().enumerate() {
            if p.key == key {
                let pair = self.buckets[index].remove(i);
                self.size -= 1;
                return Some(pair.val);
            }
        }

        // key が見つからなかった場合、None を返す
        None
    }

    /* ハッシュテーブルの容量を拡張する */
    fn extend(&mut self) {
        // 元のハッシュテーブルを一時保存する
        let buckets_tmp = std::mem::take(&mut self.buckets);

        // 拡張後の新しいハッシュテーブルを初期化する
        self.capacity *= self.extend_ratio;
        self.buckets = vec![Vec::new(); self.capacity as usize];
        self.size = 0;

        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        for bucket in buckets_tmp {
            for pair in bucket {
                self.put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを表示する */
    fn print(&self) {
        for bucket in &self.buckets {
            let mut res = Vec::new();
            for pair in bucket {
                res.push(format!("{} -> {}", pair.key, pair.val));
            }
            println!("{:?}", res);
        }
    }

    /* 追加操作 */
    fn put(&mut self, key: i32, val: String) {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if self.load_factor() > self.load_thres {
            self.extend();
        }

        let index = self.hash_func(key);

        // バケットを走査し、指定された key が見つかったら、対応する val を更新して戻る
        for pair in self.buckets[index].iter_mut() {
            if pair.key == key {
                pair.val = val;
                return;
            }
        }

        // key が存在しない場合、キーと値のペアを末尾に追加する
        let pair = Pair { key, val };
        self.buckets[index].push(pair);
        self.size += 1;
    }

    /* 取得操作 */
    fn get(&self, key: i32) -> Option<&str> {
        let index = self.hash_func(key);

        // バケットを走査し、key が見つかったら対応する val を返す
        for pair in self.buckets[index].iter() {
            if pair.key == key {
                return Some(&pair.val);
            }
        }

        // key が見つからなかった場合、None を返す
        None
    }
}

/* 実行用コード */
pub fn main() {
    /* ハッシュテーブルを初期化する */
    let mut map = HashMapChaining::new();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加する
    map.put(12836, "小哈".to_string());
    map.put(15937, "小啰".to_string());
    map.put(16750, "小算".to_string());
    map.put(13276, "小法".to_string());
    map.put(10583, "小鸭".to_string());
    println!("\n追加後のハッシュテーブル\nKey -> Value");
    map.print();

    /* 取得操作 */
    // ハッシュテーブルにキー key を渡し、値 value を取得する
    println!(
        "\n学生番号 13276 に対応する氏名は {}",
        match map.get(13276) {
            Some(value) => value,
            None => "有効なキーではありません",
        }
    );

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    map.remove(12836);
    println!("\n12836 を削除した後のハッシュテーブル\nKey -> Value");
    map.print();
}
