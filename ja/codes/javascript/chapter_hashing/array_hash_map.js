/**
 * File: array_hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* キーと値のペア Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* 配列で実装したハッシュ表 */
class ArrayHashMap {
    #buckets;
    constructor() {
        // 100 個のバケットを持つ配列を初期化する
        this.#buckets = new Array(100).fill(null);
    }

    /* ハッシュ関数 */
    #hashFunc(key) {
        return key % 100;
    }

    /* 検索 */
    get(key) {
        let index = this.#hashFunc(key);
        let pair = this.#buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* 追加 */
    set(key, val) {
        let index = this.#hashFunc(key);
        this.#buckets[index] = new Pair(key, val);
    }

    /* 削除 */
    delete(key) {
        let index = this.#hashFunc(key);
        // null を代入して削除する
        this.#buckets[index] = null;
    }

    /* キーと値のペアをすべて取得する */
    entries() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i]);
            }
        }
        return arr;
    }

    /* すべてのキーを取得する */
    keys() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].key);
            }
        }
        return arr;
    }

    /* すべての値を取得する */
    values() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].val);
            }
        }
        return arr;
    }

    /* ハッシュ表を表示する */
    print() {
        let pairSet = this.entries();
        for (const pair of pairSet) {
            console.info(`${pair.key} -> ${pair.val}`);
        }
    }
}

/* 実行例 */
/* ハッシュ表を初期化する */
const map = new ArrayHashMap();
/* 追加 */
// ハッシュ表にペア (key, value) を追加する
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');
console.info('\n追加後のハッシュ表\nKey -> Value');
map.print();

/* 検索 */
// ハッシュ表でキー key に対応する値 value を取得する
let name = map.get(15937);
console.info('\n学籍番号 15937 に対応する名前は ' + name);

/* 削除 */
// ハッシュ表からペア (key, value) を削除する
map.delete(10583);
console.info('\n10583 を削除した後のハッシュ表\nKey -> Value');
map.print();

/* ハッシュ表を走査する */
console.info('\nキーと値のペアを順に表示 Key->Value');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\nキーだけを順に表示 Key');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\n値だけを順に表示 Value');
for (const val of map.values()) {
    console.info(val);
}
