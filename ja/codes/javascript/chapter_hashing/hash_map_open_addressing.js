/**
 * File: hashMapOpenAddressing.js
 * Created Time: 2023-06-13
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
 */

/* キーと値の組 Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* オープンアドレス法ハッシュテーブル */
class HashMapOpenAddressing {
    #size; // キーと値のペア数
    #capacity; // ハッシュテーブル容量
    #loadThres; // リサイズを発動する負荷率のしきい値
    #extendRatio; // 拡張倍率
    #buckets; // バケット配列
    #TOMBSTONE; // 削除済みマーク

    /* コンストラクタ */
    constructor() {
        this.#size = 0; // キーと値のペア数
        this.#capacity = 4; // ハッシュテーブル容量
        this.#loadThres = 2.0 / 3.0; // リサイズを発動する負荷率のしきい値
        this.#extendRatio = 2; // 拡張倍率
        this.#buckets = Array(this.#capacity).fill(null); // バケット配列
        this.#TOMBSTONE = new Pair(-1, '-1'); // 削除済みマーク
    }

    /* ハッシュ関数 */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* 負荷率 */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* key に対応するバケットインデックスを探す */
    #findBucket(key) {
        let index = this.#hashFunc(key);
        let firstTombstone = -1;
        // 線形プロービングを行い、空バケットに達したら終了
        while (this.#buckets[index] !== null) {
            // key が見つかったら、対応するバケットのインデックスを返す
            if (this.#buckets[index].key === key) {
                // 以前に削除マークが見つかっていれば、そのインデックスへキーと値のペアを移動
                if (firstTombstone !== -1) {
                    this.#buckets[firstTombstone] = this.#buckets[index];
                    this.#buckets[index] = this.#TOMBSTONE;
                    return firstTombstone; // 移動後のバケットインデックスを返す
                }
                return index; // バケットのインデックスを返す
            }
            // 最初に見つかった削除マークを記録
            if (
                firstTombstone === -1 &&
                this.#buckets[index] === this.#TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % this.#capacity;
        }
        // key が存在しない場合は追加位置のインデックスを返す
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* 検索操作 */
    get(key) {
        // key に対応するバケットインデックスを探す
        const index = this.#findBucket(key);
        // キーと値の組が見つかったら、対応する val を返す
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            return this.#buckets[index].val;
        }
        // キーと値の組が存在しなければ null を返す
        return null;
    }

    /* 追加操作 */
    put(key, val) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        // key に対応するバケットインデックスを探す
        const index = this.#findBucket(key);
        // キーと値の組が見つかったら、val を上書きして返す
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index].val = val;
            return;
        }
        // キーと値の組が存在しない場合は、その組を追加する
        this.#buckets[index] = new Pair(key, val);
        this.#size++;
    }

    /* 削除操作 */
    remove(key) {
        // key に対応するバケットインデックスを探す
        const index = this.#findBucket(key);
        // キーと値の組が見つかったら、削除マーカーで上書きする
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index] = this.#TOMBSTONE;
            this.#size--;
        }
    }

    /* ハッシュテーブルを拡張 */
    #extend() {
        // 元のハッシュテーブルを一時保存
        const bucketsTmp = this.#buckets;
        // リサイズ後の新しいハッシュテーブルを初期化
        this.#capacity *= this.#extendRatio;
        this.#buckets = Array(this.#capacity).fill(null);
        this.#size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.#TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを出力 */
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

/* Driver Code */
// ハッシュテーブルを初期化
const hashmap = new HashMapOpenAddressing();

// 追加操作
// ハッシュテーブルにキーと値の組 (key, val) を追加する
hashmap.put(12836, 'シャオハー');
hashmap.put(15937, 'シャオルオ');
hashmap.put(16750, 'シャオスワン');
hashmap.put(13276, 'シャオファー');
hashmap.put(10583, 'シャオヤー');
console.log('\n追加完了後、ハッシュ表は\nKey -> Value');
hashmap.print();

// 検索操作
// ハッシュテーブルにキー key を入力し、値 val を得る
const name = hashmap.get(13276);
console.log('\n学籍番号 13276 を入力すると、名前 ' + name);

// 削除操作
// ハッシュテーブルからキーと値の組 (key, val) を削除する
hashmap.remove(16750);
console.log('\n16750 を削除した後、ハッシュテーブルは\nKey -> Value');
hashmap.print();
