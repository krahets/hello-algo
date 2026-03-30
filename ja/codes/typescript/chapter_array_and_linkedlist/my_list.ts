/**
 * File: my_list.ts
 * Created Time: 2022-12-11
 * Author: Justin (xiefahit@gmail.com)
 */

/* リストクラス */
class MyList {
    private arr: Array<number>; // 配列（リスト要素を格納）
    private _capacity: number = 10; // リスト容量
    private _size: number = 0; // リストの長さ（現在の要素数）
    private extendRatio: number = 2; // リスト拡張時の増加倍率

    /* コンストラクタ */
    constructor() {
        this.arr = new Array(this._capacity);
    }

    /* リストの長さを取得（現在の要素数） */
    public size(): number {
        return this._size;
    }

    /* リスト容量を取得する */
    public capacity(): number {
        return this._capacity;
    }

    /* 要素にアクセス */
    public get(index: number): number {
        // インデックスが範囲外なら例外を送出する。以下同様
        if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
        return this.arr[index];
    }

    /* 要素を更新 */
    public set(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
        this.arr[index] = num;
    }

    /* 末尾に要素を追加 */
    public add(num: number): void {
        // 長さが容量に等しい場合は拡張が必要
        if (this._size === this._capacity) this.extendCapacity();
        // 新しい要素をリストの末尾に追加する
        this.arr[this._size] = num;
        this._size++;
    }

    /* 中間に要素を挿入 */
    public insert(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
        // 要素数が容量を超えると、拡張機構が発動する
        if (this._size === this._capacity) {
            this.extendCapacity();
        }
        // index 以降の要素をすべて 1 つ後ろへずらす
        for (let j = this._size - 1; j >= index; j--) {
            this.arr[j + 1] = this.arr[j];
        }
        // 要素数を更新
        this.arr[index] = num;
        this._size++;
    }

    /* 要素を削除 */
    public remove(index: number): number {
        if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
        let num = this.arr[index];
        // インデックス index より後の要素をすべて 1 つ前に移動する
        for (let j = index; j < this._size - 1; j++) {
            this.arr[j] = this.arr[j + 1];
        }
        // 要素数を更新
        this._size--;
        // 削除された要素を返す
        return num;
    }

    /* リストの拡張 */
    public extendCapacity(): void {
        // `size` の長さを持つ配列を新規作成し、元の配列を新しい配列にコピーする
        this.arr = this.arr.concat(
            new Array(this.capacity() * (this.extendRatio - 1))
        );
        // リストの容量を更新
        this._capacity = this.arr.length;
    }

    /* リストを配列に変換する */
    public toArray(): number[] {
        let size = this.size();
        // 有効長の範囲内のリスト要素のみを変換
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Driver Code */
/* リストを初期化 */
const nums = new MyList();
/* 末尾に要素を追加 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `リスト nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，長さ = ${nums.size()}`
);

/* 中間に要素を挿入 */
nums.insert(3, 6);
console.log(`インデックス 3 に数字 6 を挿入すると ，nums = ${nums.toArray()}`);

/* 要素を削除 */
nums.remove(3);
console.log(`インデックス 3 の要素を削除すると，nums = ${nums.toArray()}`);

/* 要素にアクセス */
const num = nums.get(1);
console.log(`インデックス 1 の要素にアクセスすると、num = ${num}`);

/* 要素を更新 */
nums.set(1, 0);
console.log(`インデックス 1 の要素を 0 に更新すると ，nums = ${nums.toArray()}`);

/* 拡張機構をテストする */
for (let i = 0; i < 10; i++) {
    // i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
    nums.add(i);
}
console.log(
    `拡張後のリスト nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，長さ = ${nums.size()}`
);

export {};
