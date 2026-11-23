/**
 * File: array_hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* キーと値のペア Number -> String */
class Pair {
    public key: number;
    public val: string;

    constructor(key: number, val: string) {
        this.key = key;
        this.val = val;
    }
}

/* 配列で実装したハッシュテーブル */
class ArrayHashMap {
    private readonly buckets: (Pair | null)[];

    constructor() {
        // 100 個のバケットを含む配列を初期化する
        this.buckets = new Array(100).fill(null);
    }

    /* ハッシュ関数 */
    private hashFunc(key: number): number {
        return key % 100;
    }

    /* 取得操作 */
    public get(key: number): string | null {
        let index = this.hashFunc(key);
        let pair = this.buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* 追加操作 */
    public set(key: number, val: string) {
        let index = this.hashFunc(key);
        this.buckets[index] = new Pair(key, val);
    }

    /* 削除操作 */
    public delete(key: number) {
        let index = this.hashFunc(key);
        // null に設定して、削除を表す
        this.buckets[index] = null;
    }

    /* キーと値のペアをすべて取得する */
    public entries(): (Pair | null)[] {
        let arr: (Pair | null)[] = [];
        for (let i = 0; i < this.buckets.length; i++) {
            if (this.buckets[i]) {
                arr.push(this.buckets[i]);
            }
        }
        return arr;
    }

    /* すべてのキーを取得する */
    public keys(): (number | undefined)[] {
        let arr: (number | undefined)[] = [];
        for (let i = 0; i < this.buckets.length; i++) {
            if (this.buckets[i]) {
                arr.push(this.buckets[i].key);
            }
        }
        return arr;
    }

    /* すべての値を取得する */
    public values(): (string | undefined)[] {
        let arr: (string | undefined)[] = [];
        for (let i = 0; i < this.buckets.length; i++) {
            if (this.buckets[i]) {
                arr.push(this.buckets[i].val);
            }
        }
        return arr;
    }

    /* ハッシュテーブルを表示する */
    public print() {
        let pairSet = this.entries();
        for (const pair of pairSet) {
            console.info(`${pair.key} -> ${pair.val}`);
        }
    }
}

/* 実行用コード */
/* ハッシュテーブルを初期化する */
const map = new ArrayHashMap();
/* 追加操作 */
// ハッシュテーブルにキーと値のペア (key, value) を追加する
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');
console.info('\n追加後のハッシュテーブル\nKey -> Value');
map.print();

/* 取得操作 */
// ハッシュテーブルにキー key を渡し、値 value を取得する
let name = map.get(15937);
console.info('\n学生番号 15937 に対応する氏名は ' + name);

/* 削除操作 */
// ハッシュテーブルからキーと値のペア (key, value) を削除する
map.delete(10583);
console.info('\n10583 を削除した後のハッシュテーブル\nKey -> Value');
map.print();

/* ハッシュテーブルを走査する */
console.info('\nキーと値のペア Key->Value を走査する');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\nキー Key だけを走査する');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\n値 Value だけを走査する');
for (const val of map.values()) {
    console.info(val);
}

export {};
