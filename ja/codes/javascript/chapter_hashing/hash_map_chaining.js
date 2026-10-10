/**
 * File: hash_map_chaining.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* キーと値の組 Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* チェイン法ハッシュテーブル */
class HashMapChaining {
    #size; // キーと値のペア数
    #capacity; // ハッシュテーブル容量
    #loadThres; // リサイズを発動する負荷率のしきい値
    #extendRatio; // 拡張倍率
    #buckets; // バケット配列

    /* コンストラクタ */
    constructor() {
        this.#size = 0;
        this.#capacity = 4;
        this.#loadThres = 2.0 / 3.0;
        this.#extendRatio = 2;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
    }

    /* ハッシュ関数 */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* 負荷率 */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* 検索操作 */
    get(key) {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // バケットを走査し、key が見つかれば対応する val を返す
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // key が見つからない場合は null を返す
        return null;
    }

    /* 追加操作 */
    put(key, val) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // バケットを走査し、指定した key が見つかれば対応する val を更新して返す
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // その key が存在しなければ、キーと値のペアを末尾に追加
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* 削除操作 */
    remove(key) {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // バケットを走査してキーと値のペアを削除
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* ハッシュテーブルを拡張 */
    #extend() {
        // 元のハッシュテーブルを一時保存
        const bucketsTmp = this.#buckets;
        // リサイズ後の新しいハッシュテーブルを初期化
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        for (const bucket of bucketsTmp) {
            for (const pair of bucket) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを出力 */
    print() {
        for (const bucket of this.#buckets) {
            let res = [];
            for (const pair of bucket) {
                res.push(pair.key + ' -> ' + pair.val);
            }
            console.log(res);
        }
    }
}

/* Driver Code */
/* ハッシュテーブルを初期化 */
const map = new HashMapChaining();

/* 追加操作 */
// ハッシュテーブルにキーと値のペア (key, value) を追加
map.put(12836, 'シャオハー');
map.put(15937, 'シャオルオ');
map.put(16750, 'シャオスワン');
map.put(13276, 'シャオファー');
map.put(10583, 'シャオヤー');
console.log('\n追加完了後、ハッシュ表は\nKey -> Value');
map.print();

/* 検索操作 */
// キー key をハッシュテーブルに渡し、値 value を取得
const name = map.get(13276);
console.log('\n学籍番号 13276 を入力すると、名前 ' + name);

/* 削除操作 */
// ハッシュテーブルからキーと値のペア (key, value) を削除
map.remove(12836);
console.log('\n12836 を削除した後、ハッシュテーブルは\nKey -> Value');
map.print();
