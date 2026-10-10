/*
 * File: hash_map_chaining.rs
 * Created Time: 2023-07-07
 * Author: WSL0809 (wslzzy@outlook.com)
 */

#[derive(Clone)]
/* キーと値の組 */
struct Pair {
    key: i32,
    val: String,
}

/* チェイン法ハッシュテーブル */
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

        // バケットを走査してキーと値のペアを削除
        for (i, p) in self.buckets[index].iter_mut().enumerate() {
            if p.key == key {
                let pair = self.buckets[index].remove(i);
                self.size -= 1;
                return Some(pair.val);
            }
        }

        // key が見つからない場合は None を返す
        None
    }

    /* ハッシュテーブルを拡張 */
    fn extend(&mut self) {
        // 元のハッシュテーブルを一時保存
        let buckets_tmp = std::mem::take(&mut self.buckets);

        // リサイズ後の新しいハッシュテーブルを初期化
        self.capacity *= self.extend_ratio;
        self.buckets = vec![Vec::new(); self.capacity as usize];
        self.size = 0;

        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        for bucket in buckets_tmp {
            for pair in bucket {
                self.put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを出力 */
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
        // 負荷率がしきい値を超えたら、リサイズを実行
        if self.load_factor() > self.load_thres {
            self.extend();
        }

        let index = self.hash_func(key);

        // バケットを走査し、指定した key が見つかれば対応する val を更新して返す
        for pair in self.buckets[index].iter_mut() {
            if pair.key == key {
                pair.val = val;
                return;
            }
        }

        // その key が存在しなければ、キーと値のペアを末尾に追加
        let pair = Pair { key, val };
        self.buckets[index].push(pair);
        self.size += 1;
    }

    /* 検索操作 */
    fn get(&self, key: i32) -> Option<&str> {
        let index = self.hash_func(key);

        // バケットを走査し、key が見つかれば対応する val を返す
        for pair in self.buckets[index].iter() {
            if pair.key == key {
                return Some(&pair.val);
            }
        }

        // key が見つからない場合は None を返す
        None
    }
}

/* Driver Code */
pub fn main() {
    /* ハッシュテーブルを初期化 */
    let mut map = HashMapChaining::new();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map.put(12836, "シャオハー".to_string());
    map.put(15937, "シャオロー".to_string());
    map.put(16750, "シャオスワン".to_string());
    map.put(13276, "シャオファー".to_string());
    map.put(10583, "シャオヤー".to_string());
    println!("\n追加後、ハッシュテーブルは\nKey -> Value");
    map.print();

    /* 検索操作 */
    // キー key をハッシュテーブルに渡し、値 value を取得
    println!(
        "\n学籍番号 13276 を入力すると、名前 {} が見つかります",
        match map.get(13276) {
            Some(value) => value,
            None => "Not a valid Key",
        }
    );

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.remove(12836);
    println!("\n12836 を削除すると、ハッシュテーブルは\nKey -> Value");
    map.print();
}
