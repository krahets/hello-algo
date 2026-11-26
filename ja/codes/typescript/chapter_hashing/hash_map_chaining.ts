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

/* チェイン法によるハッシュ表 */
class HashMapChaining {
    #size: number; // キーと値のペアの数
    #capacity: number; // ハッシュ表の容量
    #loadThres: number; // 表を拡張する負荷率のしきい値
    #extendRatio: number; // 容量の拡張倍率
    #buckets: Pair[][]; // バケットの配列

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

    /* 検索 */
    get(key: number): string | null {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // バケットを走査し、key が見つかったら対応する val を返す
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // key が見つからなければ null を返す
        return null;
    }

    /* 追加 */
    put(key: number, val: string): void {
        // 負荷率がしきい値を超えたら表を拡張する
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // key がなければ末尾にペアを追加する
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* 削除 */
    remove(key: number): void {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // バケットを走査し、該当するペアを削除する
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* ハッシュ表を拡張する */
    #extend(): void {
        // 元のハッシュ表を一時保存する
        const bucketsTmp = this.#buckets;
        // 拡張後の新しいハッシュ表を初期化する
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // 元のハッシュ表から新しい表にペアを移す
        for (const bucket of bucketsTmp) {
            for (const pair of bucket) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュ表を表示する */
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

/* 実行例 */
/* ハッシュ表を初期化する */
const map = new HashMapChaining();

/* 追加 */
// ハッシュ表にペア (key, value) を追加する
map.put(12836, '小哈');
map.put(15937, '小啰');
map.put(16750, '小算');
map.put(13276, '小法');
map.put(10583, '小鸭');
console.log('\n追加後のハッシュ表\nKey -> Value');
map.print();

/* 検索 */
// ハッシュ表でキー key に対応する値 value を取得する
const name = map.get(13276);
console.log('\n学籍番号 13276 に対応する名前は ' + name);

/* 削除 */
// ハッシュ表からペア (key, value) を削除する
map.remove(12836);
console.log('\n12836 を削除した後のハッシュ表\nKey -> Value');
map.print();

export {};
