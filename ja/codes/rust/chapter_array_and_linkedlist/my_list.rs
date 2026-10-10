/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* リストクラス */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // 配列（リスト要素を格納）
    capacity: usize,     // リスト容量
    size: usize,         // リストの長さ（現在の要素数）
    extend_ratio: usize, // リスト拡張時の増加倍率
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

    /* リストの長さを取得（現在の要素数） */
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* リスト容量を取得する */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* 要素にアクセス */
    pub fn get(&self, index: usize) -> i32 {
        // インデックスが範囲外なら例外を送出する。以下同様
        if index >= self.size {
            panic!("インデックスが範囲外です")
        };
        return self.arr[index];
    }

    /* 要素を更新 */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("インデックスが範囲外です")
        };
        self.arr[index] = num;
    }

    /* 末尾に要素を追加 */
    pub fn add(&mut self, num: i32) {
        // 要素数が容量を超えると、拡張機構が発動する
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // 要素数を更新
        self.size += 1;
    }

    /* 中間に要素を挿入 */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("インデックスが範囲外です")
        };
        // 要素数が容量を超えると、拡張機構が発動する
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // index 以降の要素をすべて 1 つ後ろへずらす
        for j in (index..self.size).rev() {
            self.arr[j + 1] = self.arr[j];
        }
        self.arr[index] = num;
        // 要素数を更新
        self.size += 1;
    }

    /* 要素を削除 */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index >= self.size() {
            panic!("インデックスが範囲外です")
        };
        let num = self.arr[index];
        // インデックス index より後の要素をすべて 1 つ前に移動する
        for j in index..self.size - 1 {
            self.arr[j] = self.arr[j + 1];
        }
        // 要素数を更新
        self.size -= 1;
        // 削除された要素を返す
        return num;
    }

    /* リストの拡張 */
    pub fn extend_capacity(&mut self) {
        // 元の配列の extend_ratio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // リストの容量を更新
        self.capacity = new_capacity;
    }

    /* リストを配列に変換する */
    pub fn to_array(&self) -> Vec<i32> {
        // 有効長の範囲内のリスト要素のみを変換
        let mut arr = Vec::new();
        for i in 0..self.size {
            arr.push(self.get(i));
        }
        arr
    }
}

/* Driver Code */
fn main() {
    /* リストを初期化 */
    let mut nums = MyList::new(10);
    /* 末尾に要素を追加 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    print!("リスト nums = ");
    print_util::print_array(&nums.to_array());
    print!(" 、容量 = {} 、長さ = {}", nums.capacity(), nums.size());

    /* 中間に要素を挿入 */
    nums.insert(3, 6);
    print!("\nインデックス 3 に数値 6 を挿入すると、nums = ");
    print_util::print_array(&nums.to_array());

    /* 要素を削除 */
    nums.remove(3);
    print!("\nインデックス 3 の要素を削除すると、nums = ");
    print_util::print_array(&nums.to_array());

    /* 要素にアクセス */
    let num = nums.get(1);
    println!("\nインデックス 1 の要素にアクセスすると、num = {num}");

    /* 要素を更新 */
    nums.set(1, 0);
    print!("インデックス 1 の要素を 0 に更新すると、nums = ");
    print_util::print_array(&nums.to_array());

    /* 拡張機構をテストする */
    for i in 0..10 {
        // i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
        nums.add(i);
    }
    print!("\n拡張後のリスト nums = ");
    print_util::print_array(&nums.to_array());
    print!(" 、容量 = {} 、長さ = {}", nums.capacity(), nums.size());
}
