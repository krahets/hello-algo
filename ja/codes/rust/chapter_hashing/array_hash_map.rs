/**
 * File: array_hash_map.rs
 * Created Time: 2023-2-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com)
 */

/* キーと値のペア */
#[derive(Debug, Clone, PartialEq)]
pub struct Pair {
    pub key: i32,
    pub val: String,
}
/* 配列で実装したハッシュテーブル */
pub struct ArrayHashMap {
    buckets: Vec<Option<Pair>>,
}

impl ArrayHashMap {
    pub fn new() -> ArrayHashMap {
        // 100 個のバケットを含む配列を初期化する
        Self {
            buckets: vec![None; 100],
        }
    }

    /* ハッシュ関数 */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % 100
    }

    /* 取得操作 */
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
        // None に設定して、削除を表す
        self.buckets[index] = None;
    }

    /* キーと値のペアをすべて取得する */
    pub fn entry_set(&self) -> Vec<&Pair> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref())
            .collect()
    }

    /* すべてのキーを取得する */
    pub fn key_set(&self) -> Vec<&i32> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.key))
            .collect()
    }

    /* すべての値を取得する */
    pub fn value_set(&self) -> Vec<&String> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.val))
            .collect()
    }

    /* ハッシュテーブルを表示する */
    pub fn print(&self) {
        for pair in self.entry_set() {
            println!("{} -> {}", pair.key, pair.val);
        }
    }
}

fn main() {
    /* ハッシュテーブルを初期化する */
    let mut map = ArrayHashMap::new();
    /*追加操作 */
    // ハッシュテーブルにキーと値のペア（key, value）を追加する
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    println!("\n追加後のハッシュテーブル\nKey -> Value");
    map.print();

    /* 取得操作 */
    // ハッシュテーブルにキー key を渡し、値 value を取得する
    let name = map.get(15937).unwrap();
    println!("\n学生番号 15937 に対応する氏名は {}", name);

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    map.remove(10583);
    println!("\n10583 を削除した後のハッシュテーブル\nKey -> Value");
    map.print();

    /* ハッシュテーブルを走査する */
    println!("\nキーと値のペア Key->Value を走査する");
    for pair in map.entry_set() {
        println!("{} -> {}", pair.key, pair.val);
    }

    println!("\nキー Key だけを走査する");
    for key in map.key_set() {
        println!("{}", key);
    }

    println!("\n値 Value だけを走査する");
    for val in map.value_set() {
        println!("{}", val);
    }
}
