/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* リストクラス */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // 配列（リストの要素を格納する）
    capacity: usize,     // リストの容量
    size: usize,         // リストの長さ（現在の要素数）
    extend_ratio: usize, // リストの容量を拡張する際の倍率
}

#[allow(unused, unused_comparisons)]
impl MyList {
    /* コンストラクタ */
    pub fn new(capacity: usize) -> Self {
        let mut vec = vec![0; capacity];
        Self {
            arr: vec,
            capacity,
            size: 0,
            extend_ratio: 2,
        }
    }

    /* リストの長さ（現在の要素数）を取得する*/
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* リストの容量を取得する */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* 要素にアクセスする */
    pub fn get(&self, index: usize) -> i32 {
        // インデックスが範囲外の場合、例外を送出する。以下も同様
        if index >= self.size {
            panic!("インデックスが範囲外です")
        };
        return self.arr[index];
    }

    /* 要素を更新する */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("インデックスが範囲外です")
        };
        self.arr[index] = num;
    }

    /* 末尾に要素を追加する */
    pub fn add(&mut self, num: i32) {
        // 要素数が容量を超える場合、容量を拡張する
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // 要素数を更新する
        self.size += 1;
    }

    /* 途中に要素を挿入する */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("インデックスが範囲外です")
        };
        // 要素数が容量を超える場合、容量を拡張する
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // インデックス index 以降の全要素を後ろに 1 つずらす
        for j in (index..self.size).rev() {
            self.arr[j + 1] = self.arr[j];
        }
        self.arr[index] = num;
        // 要素数を更新する
        self.size += 1;
    }

    /* 要素を削除する */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index >= self.size() {
            panic!("インデックスが範囲外です")
        };
        let num = self.arr[index];
        // インデックス index より後の全要素を前に 1 つずらす
        for j in index..self.size - 1 {
            self.arr[j] = self.arr[j + 1];
        }
        // 要素数を更新する
        self.size -= 1;
        // 削除した要素を返す
        return num;
    }

    /* リストの容量を拡張する */
    pub fn extend_capacity(&mut self) {
        // 元の配列の extend_ratio 倍の長さの配列を新たに作成し、元の配列をコピーする
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // リストの容量を更新する
        self.capacity = new_capacity;
    }

    /* リストを配列に変換する */
    pub fn to_array(&self) -> Vec<i32> {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        let mut arr = Vec::new();
        for i in 0..self.size {
            arr.push(self.get(i));
        }
        arr
    }
}

/* 実行用コード */
fn main() {
    /* リストを初期化する */
    let mut nums = MyList::new(10);
    /* 末尾に要素を追加する */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    print!("リスト nums = ");
    print_util::print_array(&nums.to_array());
    print!(" 、容量 = {} 、長さ = {}", nums.capacity(), nums.size());

    /* 途中に要素を挿入する */
    nums.insert(3, 6);
    print!("\nインデックス 3 に数値 6 を挿入した結果 nums = ");
    print_util::print_array(&nums.to_array());

    /* 要素を削除する */
    nums.remove(3);
    print!("\nインデックス 3 の要素を削除した結果 nums = ");
    print_util::print_array(&nums.to_array());

    /* 要素にアクセスする */
    let num = nums.get(1);
    println!("\nインデックス 1 の要素にアクセスした結果 num = {num}");

    /* 要素を更新する */
    nums.set(1, 0);
    print!("インデックス 1 の要素を 0 に更新した結果 nums = ");
    print_util::print_array(&nums.to_array());

    /* 容量の拡張をテストする */
    for i in 0..10 {
        // i = 5 のときにリストの長さが容量を超えるため、容量が拡張される
        nums.add(i);
    }
    print!("\n容量を拡張した後のリスト nums = ");
    print_util::print_array(&nums.to_array());
    print!(" 、容量 = {} 、長さ = {}", nums.capacity(), nums.size());
}
