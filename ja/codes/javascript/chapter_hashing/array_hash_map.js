/**
 * File: array_hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* キーと値の組 Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* 配列ベースのハッシュテーブル */
class ArrayHashMap {
    #buckets;
    constructor() {
        // 100 個のバケットを含む配列を初期化
        this.#buckets = new Array(100).fill(null);
    }

    /* ハッシュ関数 */
    #hashFunc(key) {
        return key % 100;
    }

    /* 検索操作 */
    get(key) {
        let index = this.#hashFunc(key);
        let pair = this.#buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* 追加操作 */
    set(key, val) {
        let index = this.#hashFunc(key);
        this.#buckets[index] = new Pair(key, val);
    }

    /* 削除操作 */
    delete(key) {
        let index = this.#hashFunc(key);
        // null に設定し、削除を表す
        this.#buckets[index] = null;
    }

    /* すべてのキーと値のペアを取得 */
    entries() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i]);
            }
        }
        return arr;
    }

    /* すべてのキーを取得 */
    keys() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].key);
            }
        }
        return arr;
    }

    /* すべての値を取得 */
    values() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].val);
            }
        }
        return arr;
    }

    /* ハッシュテーブルを出力 */
    print() {
        let pairSet = this.entries();
        for (const pair of pairSet) {
            console.info(`${pair.key} -> ${pair.val}`);
        }
    }
}

/* Driver Code */
/* ハッシュテーブルを初期化 */
const map = new ArrayHashMap();
/* 追加操作 */
// ハッシュテーブルにキーと値のペア (key, value) を追加
map.set(12836, 'シャオハー');
map.set(15937, 'シャオルオ');
map.set(16750, 'シャオスワン');
map.set(13276, 'シャオファー');
map.set(10583, 'シャオヤー');
console.info('\n追加完了後、ハッシュ表は\nKey -> Value');
map.print();

/* 検索操作 */
// キー key をハッシュテーブルに渡し、値 value を取得
let name = map.get(15937);
console.info('\n学籍番号 15937 を入力すると、氏名 ' + name);

/* 削除操作 */
// ハッシュテーブルからキーと値のペア (key, value) を削除
map.delete(10583);
console.info('\n10583 を削除した後、ハッシュ表は\nKey -> Value');
map.print();

/* ハッシュテーブルを走査 */
console.info('\nキーと値のペア Key->Value を走査');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\nキー Key を個別に走査');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\n値 Value を個別に走査');
for (const val of map.values()) {
    console.info(val);
}
