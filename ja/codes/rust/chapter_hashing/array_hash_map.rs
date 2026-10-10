/**
 * File: array_hash_map.rs
 * Created Time: 2023-2-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com)
 */

/* キーと値の組 */
#[derive(Debug, Clone, PartialEq)]
pub struct Pair {
    pub key: i32,
    pub val: String,
}
/* 配列ベースのハッシュテーブル */
pub struct ArrayHashMap {
    buckets: Vec<Option<Pair>>,
}

impl ArrayHashMap {
    pub fn new() -> ArrayHashMap {
        // 100 個のバケットを含む配列を初期化
        Self {
            buckets: vec![None; 100],
        }
    }

    /* ハッシュ関数 */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % 100
    }

    /* 検索操作 */
    pub fn get(&self, key: i32) -> Option<&String> {
        let index = self.hash_func(key);
        self.buckets[index].as_ref().map(|pair| &pair.val)
    }

    /* 追加操作 */
    pub fn put(&mut self, key: i32, val: &str) {
        let index = self.hash_func(key);
        self.buckets[index] = Some(Pair {
            key,
            val: val.to_string(),
        });
    }

    /* 削除操作 */
    pub fn remove(&mut self, key: i32) {
        let index = self.hash_func(key);
        // None に設定し、削除を表す
        self.buckets[index] = None;
    }

    /* すべてのキーと値のペアを取得 */
    pub fn entry_set(&self) -> Vec<&Pair> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref())
            .collect()
    }

    /* すべてのキーを取得 */
    pub fn key_set(&self) -> Vec<&i32> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.key))
            .collect()
    }

    /* すべての値を取得 */
    pub fn value_set(&self) -> Vec<&String> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.val))
            .collect()
    }

    /* ハッシュテーブルを出力 */
    pub fn print(&self) {
        for pair in self.entry_set() {
            println!("{} -> {}", pair.key, pair.val);
        }
    }
}

fn main() {
    /* ハッシュテーブルを初期化 */
    let mut map = ArrayHashMap::new();
    /* 追加操作 */
    // ハッシュテーブルにキーと値の組（key, value）を追加
    map.put(12836, "シャオハー");
    map.put(15937, "シャオルオ");
    map.put(16750, "シャオスワン");
    map.put(13276, "シャオファー");
    map.put(10583, "シャオヤー");
    println!("\n追加後、ハッシュテーブルは\nKey -> Value");
    map.print();

    /* 検索操作 */
    // キー key をハッシュテーブルに渡し、値 value を取得
    let name = map.get(15937).unwrap();
    println!("\n学籍番号 15937 を入力すると、名前 {} が見つかりました", name);

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.remove(10583);
    println!("\n10583 を削除した後、ハッシュテーブルは\nKey -> Value");
    map.print();

    /* ハッシュテーブルを走査 */
    println!("\nキーと値のペア Key->Value を走査");
    for pair in map.entry_set() {
        println!("{} -> {}", pair.key, pair.val);
    }

    println!("\nキー Key のみを走査");
    for key in map.key_set() {
        println!("{}", key);
    }

    println!("\n値 Value のみを走査");
    for val in map.value_set() {
        println!("{}", val);
    }
}
