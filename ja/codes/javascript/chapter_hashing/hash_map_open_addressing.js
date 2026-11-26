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

/* オープンアドレス法によるハッシュ表 */
class HashMapOpenAddressing {
    #size; // キーと値のペアの数
    #capacity; // ハッシュ表の容量
    #loadThres; // 表を拡張する負荷率のしきい値
    #extendRatio; // 容量の拡張倍率
    #buckets; // バケットの配列
    #TOMBSTONE; // 削除済みマーカー

    /* コンストラクタ */
    constructor() {
        this.#size = 0; // キーと値のペアの数
        this.#capacity = 4; // ハッシュ表の容量
        this.#loadThres = 2.0 / 3.0; // 表を拡張する負荷率のしきい値
        this.#extendRatio = 2; // 容量の拡張倍率
        this.#buckets = Array(this.#capacity).fill(null); // バケットの配列
        this.#TOMBSTONE = new Pair(-1, '-1'); // 削除済みマーカー
    }

    /* ハッシュ関数 */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* 負荷率 */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* key に対応するバケットのインデックスを探す */
    #findBucket(key) {
        let index = this.#hashFunc(key);
        let firstTombstone = -1;
        // 線形探索を行い、空のバケットに出会ったらループを抜ける
        while (this.#buckets[index] !== null) {
            // key が見つかったら、そのバケットのインデックスを返す
            if (this.#buckets[index].key === key) {
                // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                if (firstTombstone !== -1) {
                    this.#buckets[firstTombstone] = this.#buckets[index];
                    this.#buckets[index] = this.#TOMBSTONE;
                    return firstTombstone; // 移動先のバケットのインデックスを返す
                }
                return index; // バケットのインデックスを返す
            }
            // 最初に見つかった削除済みマーカーの位置を記録する
            if (
                firstTombstone === -1 &&
                this.#buckets[index] === this.#TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % this.#capacity;
        }
        // key がなければ挿入位置のインデックスを返す
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* 検索 */
    get(key) {
        // key に対応するバケットのインデックスを探す
        const index = this.#findBucket(key);
        // ペアが見つかったら対応する val を返す
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            return this.#buckets[index].val;
        }
        // ペアがなければ null を返す
        return null;
    }

    /* 追加 */
    put(key, val) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        // key に対応するバケットのインデックスを探す
        const index = this.#findBucket(key);
        // ペアが見つかったら val を上書きして処理を終える
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index].val = val;
            return;
        }
        // ペアがなければ新しく追加する
        this.#buckets[index] = new Pair(key, val);
        this.#size++;
    }

    /* 削除 */
    remove(key) {
        // key に対応するバケットのインデックスを探す
        const index = this.#findBucket(key);
        // ペアが見つかったら削除済みマーカーで置き換える
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index] = this.#TOMBSTONE;
            this.#size--;
        }
    }

    /* ハッシュ表を拡張する */
    #extend() {
        // 元のハッシュ表を一時保存する
        const bucketsTmp = this.#buckets;
        // 拡張後の新しいハッシュ表を初期化する
        this.#capacity *= this.#extendRatio;
        this.#buckets = Array(this.#capacity).fill(null);
        this.#size = 0;
        // 元のハッシュ表から新しい表にペアを移す
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.#TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュ表を表示する */
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

/* 実行例 */
// ハッシュ表を初期化する
const hashmap = new HashMapOpenAddressing();

// 追加
// ハッシュ表にペア (key, val) を追加する
hashmap.put(12836, '小哈');
hashmap.put(15937, '小啰');
hashmap.put(16750, '小算');
hashmap.put(13276, '小法');
hashmap.put(10583, '小鸭');
console.log('\n追加後のハッシュ表\nKey -> Value');
hashmap.print();

// 検索
// ハッシュ表でキー key に対応する値 val を取得する
const name = hashmap.get(13276);
console.log('\n学籍番号 13276 に対応する名前は ' + name);

// 削除
// ハッシュ表からペア (key, val) を削除する
hashmap.remove(16750);
console.log('\n16750 を削除した後のハッシュ表\nKey -> Value');
hashmap.print();
