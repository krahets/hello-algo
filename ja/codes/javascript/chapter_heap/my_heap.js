/**
 * File: my_heap.js
 * Created Time: 2023-02-06
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { printHeap } = require('../modules/PrintUtil');

/* 最大ヒープのクラス */
class MaxHeap {
    #maxHeap;

    /* 空のヒープを作るか、入力リストからヒープを構築するコンストラクタ */
    constructor(nums) {
        // リストの要素をそのままヒープに追加する
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // 葉以外のすべてのノードをヒープ化する
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }

    /* 左の子のインデックスを取得する */
    #left(i) {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得する */
    #right(i) {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得する */
    #parent(i) {
        return Math.floor((i - 1) / 2); // 商を負の無限大方向に切り捨てる
    }

    /* 要素を交換する */
    #swap(i, j) {
        const tmp = this.#maxHeap[i];
        this.#maxHeap[i] = this.#maxHeap[j];
        this.#maxHeap[j] = tmp;
    }

    /* ヒープのサイズを取得する */
    size() {
        return this.#maxHeap.length;
    }

    /* ヒープが空か判定する */
    isEmpty() {
        return this.size() === 0;
    }

    /* ヒープの根の要素を参照する */
    peek() {
        return this.#maxHeap[0];
    }

    /* 要素をヒープに挿入する */
    push(val) {
        // ノードを追加する
        this.#maxHeap.push(val);
        // 上に向かってヒープ化する
        this.#siftUp(this.size() - 1);
    }

    /* ノード i から上に向かってヒープ化する */
    #siftUp(i) {
        while (true) {
            // ノード i の親を取得する
            const p = this.#parent(i);
            // 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // 2 つのノードを交換する
            this.#swap(i, p);
            // 上へのヒープ化を繰り返す
            i = p;
        }
    }

    /* 根の要素をヒープから取り出す */
    pop() {
        // 空の場合の処理
        if (this.isEmpty()) throw new Error('ヒープが空です');
        // 根と最も右の葉（先頭要素と末尾要素）を交換する
        this.#swap(0, this.size() - 1);
        // ノードを削除する
        const val = this.#maxHeap.pop();
        // 下に向かってヒープ化する
        this.#siftDown(0);
        // 根の要素を返す
        return val;
    }

    /* ノード i から下に向かってヒープ化する */
    #siftDown(i) {
        while (true) {
            // ノード i、l、r のうち値が最大のものを ma とする
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
            if (ma === i) break;
            // 2 つのノードを交換する
            this.#swap(i, ma);
            // 下へのヒープ化を繰り返す
            i = ma;
        }
    }

    /* ヒープを二分木として表示する */
    print() {
        printHeap(this.#maxHeap);
    }

    /* ヒープから要素を取り出す */
    getMaxHeap() {
        return this.#maxHeap;
    }
}

/* 実行例 */
if (require.main === module) {
    /* 最大ヒープを初期化する */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\n入力リストから構築したヒープ：');
    maxHeap.print();

    /* ヒープの根の要素を取得する */
    let peek = maxHeap.peek();
    console.log(`\nヒープの根の要素：${peek}`);

    /* 要素をヒープに挿入する */
    let val = 7;
    maxHeap.push(val);
    console.log(`\n要素 ${val} の挿入後：`);
    maxHeap.print();

    /* 根の要素を取り出す */
    peek = maxHeap.pop();
    console.log(`\n根の要素 ${peek} を取り出した後：`);
    maxHeap.print();

    /* ヒープのサイズを取得する */
    let size = maxHeap.size();
    console.log(`\nヒープの要素数：${size}`);

    /* ヒープが空か判定する */
    let isEmpty = maxHeap.isEmpty();
    console.log(`\nヒープは空か：${isEmpty}`);
}

module.exports = {
    MaxHeap,
};
