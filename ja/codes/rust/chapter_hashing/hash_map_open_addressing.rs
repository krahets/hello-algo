/*
 * File: hash_map_open_addressing.rs
 * Created Time: 2023-07-16
 * Author: WSL0809 (wslzzy@outlook.com), night-cruise (2586447362@qq.com)
 */
#![allow(non_snake_case)]
#![allow(unused)]

mod array_hash_map;

use array_hash_map::Pair;

/* オープンアドレス法によるハッシュ表 */
struct HashMapOpenAddressing {
    size: usize,                // キーと値のペアの数
    capacity: usize,            // ハッシュ表の容量
    load_thres: f64,            // 表を拡張する負荷率のしきい値
    extend_ratio: usize,        // 容量の拡張倍率
    buckets: Vec<Option<Pair>>, // バケットの配列
    TOMBSTONE: Option<Pair>,    // 削除済みマーカー
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

    /* key に対応するバケットのインデックスを探す */
    fn find_bucket(&mut self, key: i32) -> usize {
        let mut index = self.hash_func(key);
        let mut first_tombstone = -1;
        // 線形探索を行い、空のバケットに出会ったらループを抜ける
        while self.buckets[index].is_some() {
            // key が見つかったら、そのバケットのインデックスを返す
            if self.buckets[index].as_ref().unwrap().key == key {
                // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                if first_tombstone != -1 {
                    self.buckets[first_tombstone as usize] = self.buckets[index].take();
                    self.buckets[index] = self.TOMBSTONE.clone();
                    return first_tombstone as usize; // 移動先のバケットのインデックスを返す
                }
                return index; // バケットのインデックスを返す
            }
            // 最初に見つかった削除済みマーカーの位置を記録する
            if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                first_tombstone = index as i32;
            }
            // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % self.capacity;
        }
        // key がなければ挿入位置のインデックスを返す
        if first_tombstone == -1 {
            index
        } else {
            first_tombstone as usize
        }
    }

    /* 検索 */
    fn get(&mut self, key: i32) -> Option<&str> {
        // key に対応するバケットのインデックスを探す
        let index = self.find_bucket(key);
        // ペアが見つかったら対応する val を返す
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
        }
        // ペアがなければ null を返す
        None
    }

    /* 追加 */
    fn put(&mut self, key: i32, val: String) {
        // 負荷率がしきい値を超えたら表を拡張する
        if self.load_factor() > self.load_thres {
            self.extend();
        }
        // key に対応するバケットのインデックスを探す
        let index = self.find_bucket(key);
        // ペアが見つかったら val を上書きして処理を終える
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index].as_mut().unwrap().val = val;
            return;
        }
        // ペアがなければ新しく追加する
        self.buckets[index] = Some(Pair { key, val });
        self.size += 1;
    }

    /* 削除 */
    fn remove(&mut self, key: i32) {
        // key に対応するバケットのインデックスを探す
        let index = self.find_bucket(key);
        // ペアが見つかったら削除済みマーカーで置き換える
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index] = self.TOMBSTONE.clone();
            self.size -= 1;
        }
    }

    /* ハッシュ表を拡張する */
    fn extend(&mut self) {
        // 元のハッシュ表を一時保存する
        let buckets_tmp = self.buckets.clone();
        // 拡張後の新しいハッシュ表を初期化する
        self.capacity *= self.extend_ratio;
        self.buckets = vec![None; self.capacity];
        self.size = 0;

        // 元のハッシュ表から新しい表にペアを移す
        for pair in buckets_tmp {
            if pair.is_none() || pair == self.TOMBSTONE {
                continue;
            }
            let pair = pair.unwrap();

            self.put(pair.key, pair.val);
        }
    }
    /* ハッシュ表を表示する */
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

/* 実行例 */
fn main() {
    /* ハッシュ表を初期化する */
    let mut hashmap = HashMapOpenAddressing::new();

    /* 追加 */
    // ハッシュ表にペア (key, value) を追加する
    hashmap.put(12836, "小哈".to_string());
    hashmap.put(15937, "小啰".to_string());
    hashmap.put(16750, "小算".to_string());
    hashmap.put(13276, "小法".to_string());
    hashmap.put(10583, "小鸭".to_string());

    println!("\n追加後のハッシュ表\nKey -> Value");
    hashmap.print();

    /* 検索 */
    // ハッシュ表でキー key に対応する値 val を取得する
    let name = hashmap.get(13276).unwrap();
    println!("\n学籍番号 13276 に対応する名前は {}", name);

    /* 削除 */
    // ハッシュ表からペア (key, val) を削除する
    hashmap.remove(16750);
    println!("\n16750 を削除した後のハッシュ表\nKey -> Value");
    hashmap.print();
}
