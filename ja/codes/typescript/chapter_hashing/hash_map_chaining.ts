/**
 * File: hash_map_chaining.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* キーと値のペア Number -> String */
class Pair {
    key: number;
    val: string;
    constructor(key: number, val: string) {
        this.key = key;
        this.val = val;
    }
}

/* チェイン法のハッシュテーブル */
class HashMapChaining {
    #size: number; // キーと値のペアの数
    #capacity: number; // ハッシュテーブルの容量
    #loadThres: number; // 容量の拡張を開始する負荷率のしきい値
    #extendRatio: number; // 容量の拡張倍率
    #buckets: Pair[][]; // バケット配列

    /* コンストラクタ */
    constructor() {
        this.#size = 0;
        this.#capacity = 4;
        this.#loadThres = 2.0 / 3.0;
        this.#extendRatio = 2;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
    }

    /* ハッシュ関数 */
    #hashFunc(key: number): number {
        return key % this.#capacity;
    }

    /* 負荷率 */
    #loadFactor(): number {
        return this.#size / this.#capacity;
    }

    /* 取得操作 */
    get(key: number): string | null {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // バケットを走査し、key が見つかったら対応する val を返す
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // key が見つからなかった場合、null を返す
        return null;
    }

    /* 追加操作 */
    put(key: number, val: string): void {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // バケットを走査し、指定された key が見つかったら、対応する val を更新して戻る
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // key が存在しない場合、キーと値のペアを末尾に追加する
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* 削除操作 */
    remove(key: number): void {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // バケットを走査し、キーと値のペアを削除する
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* ハッシュテーブルの容量を拡張する */
    #extend(): void {
        // 元のハッシュテーブルを一時保存する
        const bucketsTmp = this.#buckets;
        // 拡張後の新しいハッシュテーブルを初期化する
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        for (const bucket of bucketsTmp) {
            for (const pair of bucket) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを表示する */
    print(): void {
        for (const bucket of this.#buckets) {
            let res = [];
            for (const pair of bucket) {
                res.push(pair.key + ' -> ' + pair.val);
            }
            console.log(res);
        }
    }
}

/* 実行用コード */
/* ハッシュテーブルを初期化する */
const map = new HashMapChaining();

/* 追加操作 */
// ハッシュテーブルにキーと値のペア (key, value) を追加する
map.put(12836, '小哈');
map.put(15937, '小啰');
map.put(16750, '小算');
map.put(13276, '小法');
map.put(10583, '小鸭');
console.log('\n追加後のハッシュテーブル\nKey -> Value');
map.print();

/* 取得操作 */
// ハッシュテーブルにキー key を渡し、値 value を取得する
const name = map.get(13276);
console.log('\n学生番号 13276 に対応する氏名は ' + name);

/* 削除操作 */
// ハッシュテーブルからキーと値のペア (key, value) を削除する
map.remove(12836);
console.log('\n12836 を削除した後のハッシュテーブル\nKey -> Value');
map.print();

export {};
