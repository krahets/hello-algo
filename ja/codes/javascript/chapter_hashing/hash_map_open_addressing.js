/**
 * File: hashMapOpenAddressing.js
 * Created Time: 2023-06-13
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
 */

/* キーと値のペア Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* オープンアドレス法のハッシュテーブル */
class HashMapOpenAddressing {
    #size; // キーと値のペアの数
    #capacity; // ハッシュテーブルの容量
    #loadThres; // 容量の拡張を開始する負荷率のしきい値
    #extendRatio; // 容量の拡張倍率
    #buckets; // バケット配列
    #TOMBSTONE; // 削除マーカー

    /* コンストラクタ */
    constructor() {
        this.#size = 0; // キーと値のペアの数
        this.#capacity = 4; // ハッシュテーブルの容量
        this.#loadThres = 2.0 / 3.0; // 容量の拡張を開始する負荷率のしきい値
        this.#extendRatio = 2; // 容量の拡張倍率
        this.#buckets = Array(this.#capacity).fill(null); // バケット配列
        this.#TOMBSTONE = new Pair(-1, '-1'); // 削除マーカー
    }

    /* ハッシュ関数 */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* 負荷率 */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* key に対応するバケットのインデックスを探索する */
    #findBucket(key) {
        let index = this.#hashFunc(key);
        let firstTombstone = -1;
        // 線形探索法で探索し、空のバケットに到達したら終了する
        while (this.#buckets[index] !== null) {
            // key が見つかった場合、対応するバケットのインデックスを返す
            if (this.#buckets[index].key === key) {
                // それ以前に削除マーカーが見つかっていれば、そのインデックスにキーと値のペアを移す
                if (firstTombstone !== -1) {
                    this.#buckets[firstTombstone] = this.#buckets[index];
                    this.#buckets[index] = this.#TOMBSTONE;
                    return firstTombstone; // 移動後のバケットのインデックスを返す
                }
                return index; // バケットのインデックスを返す
            }
            // 最初に見つかった削除マーカーを記録する
            if (
                firstTombstone === -1 &&
                this.#buckets[index] === this.#TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % this.#capacity;
        }
        // key が存在しない場合、追加位置のインデックスを返す
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* 取得操作 */
    get(key) {
        // key に対応するバケットのインデックスを探索する
        const index = this.#findBucket(key);
        // キーと値のペアが見つかった場合、対応する val を返す
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            return this.#buckets[index].val;
        }
        // キーと値のペアが存在しない場合、null を返す
        return null;
    }

    /* 追加操作 */
    put(key, val) {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        // key に対応するバケットのインデックスを探索する
        const index = this.#findBucket(key);
        // キーと値のペアが見つかった場合、val を上書きして戻る
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index].val = val;
            return;
        }
        // キーと値のペアが存在しない場合、そのペアを追加する
        this.#buckets[index] = new Pair(key, val);
        this.#size++;
    }

    /* 削除操作 */
    remove(key) {
        // key に対応するバケットのインデックスを探索する
        const index = this.#findBucket(key);
        // キーと値のペアが見つかった場合、削除マーカーで上書きする
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index] = this.#TOMBSTONE;
            this.#size--;
        }
    }

    /* ハッシュテーブルの容量を拡張する */
    #extend() {
        // 元のハッシュテーブルを一時保存する
        const bucketsTmp = this.#buckets;
        // 拡張後の新しいハッシュテーブルを初期化する
        this.#capacity *= this.#extendRatio;
        this.#buckets = Array(this.#capacity).fill(null);
        this.#size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.#TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを表示する */
    print() {
        for (const pair of this.#buckets) {
            if (pair === null) {
                console.log('null');
            } else if (pair === this.#TOMBSTONE) {
                console.log('TOMBSTONE');
            } else {
                console.log(pair.key + ' -> ' + pair.val);
            }
        }
    }
}

/* 実行用コード */
// ハッシュテーブルを初期化する
const hashmap = new HashMapOpenAddressing();

// 追加操作
// ハッシュテーブルにキーと値のペア (key, val) を追加する
hashmap.put(12836, '小哈');
hashmap.put(15937, '小啰');
hashmap.put(16750, '小算');
hashmap.put(13276, '小法');
hashmap.put(10583, '小鸭');
console.log('\n追加後のハッシュテーブル\nKey -> Value');
hashmap.print();

// 取得操作
// ハッシュテーブルにキー key を渡し、値 val を取得する
const name = hashmap.get(13276);
console.log('\n学生番号 13276 に対応する氏名は ' + name);

// 削除操作
// ハッシュテーブルからキーと値のペア (key, val) を削除する
hashmap.remove(16750);
console.log('\n16750 を削除した後のハッシュテーブル\nKey -> Value');
hashmap.print();
