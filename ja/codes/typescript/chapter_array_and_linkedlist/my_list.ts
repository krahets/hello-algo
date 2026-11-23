/**
 * File: my_list.ts
 * Created Time: 2022-12-11
 * Author: Justin (xiefahit@gmail.com)
 */

/* リストクラス */
class MyList {
    private arr: Array<number>; // 配列（リストの要素を格納する）
    private _capacity: number = 10; // リストの容量
    private _size: number = 0; // リストの長さ（現在の要素数）
    private extendRatio: number = 2; // リストの容量を拡張する際の倍率

    /* コンストラクタ */
    constructor() {
        this.arr = new Array(this._capacity);
    }

    /* リストの長さ（現在の要素数）を取得する*/
    public size(): number {
        return this._size;
    }

    /* リストの容量を取得する */
    public capacity(): number {
        return this._capacity;
    }

    /* 要素にアクセスする */
    public get(index: number): number {
        // インデックスが範囲外の場合、例外を送出する。以下も同様
        if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
        return this.arr[index];
    }

    /* 要素を更新する */
    public set(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
        this.arr[index] = num;
    }

    /* 末尾に要素を追加する */
    public add(num: number): void {
        // 長さが容量に等しい場合、容量を拡張する必要がある
        if (this._size === this._capacity) this.extendCapacity();
        // 新しい要素をリストの末尾に追加する
        this.arr[this._size] = num;
        this._size++;
    }

    /* 途中に要素を挿入する */
    public insert(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
        // 要素数が容量を超える場合、容量を拡張する
        if (this._size === this._capacity) {
            this.extendCapacity();
        }
        // インデックス index 以降の全要素を後ろに 1 つずらす
        for (let j = this._size - 1; j >= index; j--) {
            this.arr[j + 1] = this.arr[j];
        }
        // 要素数を更新する
        this.arr[index] = num;
        this._size++;
    }

    /* 要素を削除する */
    public remove(index: number): number {
        if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
        let num = this.arr[index];
        // インデックス index より後の全要素を前に 1 つずらす
        for (let j = index; j < this._size - 1; j++) {
            this.arr[j] = this.arr[j + 1];
        }
        // 要素数を更新する
        this._size--;
        // 削除した要素を返す
        return num;
    }

    /* リストの容量を拡張する */
    public extendCapacity(): void {
        // 長さ size の配列を新たに作成し、元の配列をコピーする
        this.arr = this.arr.concat(
            new Array(this.capacity() * (this.extendRatio - 1))
        );
        // リストの容量を更新する
        this._capacity = this.arr.length;
    }

    /* リストを配列に変換する */
    public toArray(): number[] {
        let size = this.size();
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* 実行用コード */
/* リストを初期化する */
const nums = new MyList();
/* 末尾に要素を追加する */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `リスト nums = ${nums.toArray()} 、容量 = ${nums.capacity()} 、長さ = ${nums.size()}`
);

/* 途中に要素を挿入する */
nums.insert(3, 6);
console.log(`インデックス 3 に数値 6 を挿入した結果 nums = ${nums.toArray()}`);

/* 要素を削除する */
nums.remove(3);
console.log(`インデックス 3 の要素を削除した結果 nums = ${nums.toArray()}`);

/* 要素にアクセスする */
const num = nums.get(1);
console.log(`インデックス 1 の要素にアクセスした結果 num = ${num}`);

/* 要素を更新する */
nums.set(1, 0);
console.log(`インデックス 1 の要素を 0 に更新した結果 nums = ${nums.toArray()}`);

/* 容量の拡張をテストする */
for (let i = 0; i < 10; i++) {
    // i = 5 のときにリストの長さが容量を超えるため、容量が拡張される
    nums.add(i);
}
console.log(
    `容量を拡張した後のリスト nums = ${nums.toArray()} 、容量 = ${nums.capacity()} 、長さ = ${nums.size()}`
);

export {};
