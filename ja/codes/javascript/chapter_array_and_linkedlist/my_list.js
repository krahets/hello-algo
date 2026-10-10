/**
 * File: my_list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* リストクラス */
class MyList {
    #arr = new Array(); // 配列（リスト要素を格納）
    #capacity = 10; // リスト容量
    #size = 0; // リストの長さ（現在の要素数）
    #extendRatio = 2; // リスト拡張時の増加倍率

    /* コンストラクタ */
    constructor() {
        this.#arr = new Array(this.#capacity);
    }

    /* リストの長さを取得（現在の要素数） */
    size() {
        return this.#size;
    }

    /* リスト容量を取得する */
    capacity() {
        return this.#capacity;
    }

    /* 要素にアクセス */
    get(index) {
        // インデックスが範囲外なら例外を送出する。以下同様
        if (index < 0 || index >= this.#size) throw new Error('インデックスが範囲外です');
        return this.#arr[index];
    }

    /* 要素を更新 */
    set(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('インデックスが範囲外です');
        this.#arr[index] = num;
    }

    /* 末尾に要素を追加 */
    add(num) {
        // 長さが容量に等しい場合は拡張が必要
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // 新しい要素をリストの末尾に追加する
        this.#arr[this.#size] = num;
        this.#size++;
    }

    /* 中間に要素を挿入 */
    insert(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('インデックスが範囲外です');
        // 要素数が容量を超えると、拡張機構が発動する
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // index 以降の要素をすべて 1 つ後ろへずらす
        for (let j = this.#size - 1; j >= index; j--) {
            this.#arr[j + 1] = this.#arr[j];
        }
        // 要素数を更新
        this.#arr[index] = num;
        this.#size++;
    }

    /* 要素を削除 */
    remove(index) {
        if (index < 0 || index >= this.#size) throw new Error('インデックスが範囲外です');
        let num = this.#arr[index];
        // インデックス index より後の要素をすべて 1 つ前に移動する
        for (let j = index; j < this.#size - 1; j++) {
            this.#arr[j] = this.#arr[j + 1];
        }
        // 要素数を更新
        this.#size--;
        // 削除された要素を返す
        return num;
    }

    /* リストの拡張 */
    extendCapacity() {
        // 元の配列の extendRatio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
        this.#arr = this.#arr.concat(
            new Array(this.capacity() * (this.#extendRatio - 1))
        );
        // リストの容量を更新
        this.#capacity = this.#arr.length;
    }

    /* リストを配列に変換する */
    toArray() {
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
console.log(`インデックス 3 に数字 6 を挿入し，nums = ${nums.toArray()}`);

/* 要素を削除 */
nums.remove(3);
console.log(`インデックス 3 の要素を削除し，nums = ${nums.toArray()}`);

/* 要素にアクセス */
const num = nums.get(1);
console.log(`インデックス 1 の要素にアクセスし，num = ${num}`);

/* 要素を更新 */
nums.set(1, 0);
console.log(`インデックス 1 の要素を 0 に更新し，nums = ${nums.toArray()}`);

/* 拡張機構をテストする */
for (let i = 0; i < 10; i++) {
    // i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
    nums.add(i);
}
console.log(
    `拡張後のリスト nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，長さ = ${nums.size()}`
);
