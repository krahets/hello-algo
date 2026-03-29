/*
 * File: hash_map_open_addressing.rs
 * Created Time: 2023-07-16
 * Author: WSL0809 (wslzzy@outlook.com), night-cruise (2586447362@qq.com)
 */
#![allow(non_snake_case)]
#![allow(unused)]

mod array_hash_map;

use array_hash_map::Pair;

/* オープンアドレス法ハッシュテーブル */
struct HashMapOpenAddressing {
    size: usize,                // キーと値のペア数
    capacity: usize,            // ハッシュテーブル容量
    load_thres: f64,            // リサイズを発動する負荷率のしきい値
    extend_ratio: usize,        // 拡張倍率
    buckets: Vec<Option<Pair>>, // バケット配列
    TOMBSTONE: Option<Pair>,    // 削除済みマーク
}

impl HashMapOpenAddressing {
    /* コンストラクタ */
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

    /* ハッシュ関数 */
    fn hash_func(&self, key: i32) -> usize {
        (key % self.capacity as i32) as usize
    }

    /* 負荷率 */
    fn load_factor(&self) -> f64 {
        self.size as f64 / self.capacity as f64
    }

    /* key に対応するバケットインデックスを探す */
    fn find_bucket(&mut self, key: i32) -> usize {
        let mut index = self.hash_func(key);
        let mut first_tombstone = -1;
        // 線形プロービングを行い、空バケットに達したら終了
        while self.buckets[index].is_some() {
            // `key` に遭遇したら、対応するバケットのインデックスを返す
            if self.buckets[index].as_ref().unwrap().key == key {
                // 以前に削除マークに遭遇していた場合は、キーと値のペアをそのインデックスへ移動する
                if first_tombstone != -1 {
                    self.buckets[first_tombstone as usize] = self.buckets[index].take();
                    self.buckets[index] = self.TOMBSTONE.clone();
                    return first_tombstone as usize; // 移動後のバケットインデックスを返す
                }
                return index; // バケットのインデックスを返す
            }
            // 最初に見つかった削除マークを記録
            if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                first_tombstone = index as i32;
            }
            // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % self.capacity;
        }
        // key が存在しない場合は追加位置のインデックスを返す
        if first_tombstone == -1 {
            index
        } else {
            first_tombstone as usize
        }
    }

    /* 検索操作 */
    fn get(&mut self, key: i32) -> Option<&str> {
        // key に対応するバケットインデックスを探す
        let index = self.find_bucket(key);
        // キーと値の組が見つかったら、対応する val を返す
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
        }
        // キーと値の組が存在しなければ null を返す
        None
    }

    /* 追加操作 */
    fn put(&mut self, key: i32, val: String) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if self.load_factor() > self.load_thres {
            self.extend();
        }
        // key に対応するバケットインデックスを探す
        let index = self.find_bucket(key);
        // キーと値の組が見つかったら、val を上書きして返す
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index].as_mut().unwrap().val = val;
            return;
        }
        // キーと値の組が存在しない場合は、その組を追加する
        self.buckets[index] = Some(Pair { key, val });
        self.size += 1;
    }

    /* 削除操作 */
    fn remove(&mut self, key: i32) {
        // key に対応するバケットインデックスを探す
        let index = self.find_bucket(key);
        // キーと値の組が見つかったら、削除マーカーで上書きする
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index] = self.TOMBSTONE.clone();
            self.size -= 1;
        }
    }

    /* ハッシュテーブルを拡張 */
    fn extend(&mut self) {
        // 元のハッシュテーブルを一時保存
        let buckets_tmp = self.buckets.clone();
        // リサイズ後の新しいハッシュテーブルを初期化
        self.capacity *= self.extend_ratio;
        self.buckets = vec![None; self.capacity];
        self.size = 0;

        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        for pair in buckets_tmp {
            if pair.is_none() || pair == self.TOMBSTONE {
                continue;
            }
            let pair = pair.unwrap();

            self.put(pair.key, pair.val);
        }
    }
    /* ハッシュテーブルを出力 */
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

/* Driver Code */
fn main() {
    /* ハッシュテーブルを初期化 */
    let mut hashmap = HashMapOpenAddressing::new();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    hashmap.put(12836, "シャオハー".to_string());
    hashmap.put(15937, "シャオロー".to_string());
    hashmap.put(16750, "シャオスワン".to_string());
    hashmap.put(13276, "シャオファー".to_string());
    hashmap.put(10583, "シャオヤー".to_string());

    println!("\n追加後、ハッシュテーブルは\nKey -> Value");
    hashmap.print();

    /* 検索操作 */
    // ハッシュテーブルにキー key を入力し、値 val を得る
    let name = hashmap.get(13276).unwrap();
    println!("\n学籍番号 13276 を入力すると、名前 {} が見つかります", name);

    /* 削除操作 */
    // ハッシュテーブルからキーと値の組 (key, val) を削除
    hashmap.remove(16750);
    println!("\n16750 を削除すると、ハッシュテーブルは\nKey -> Value");
    hashmap.print();
}
