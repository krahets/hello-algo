/**
 * File: my_heap.ts
 * Created Time: 2023-02-07
 * Author: Justin (xiefahit@gmail.com)
 */

import { printHeap } from '../modules/PrintUtil';

/* 最大ヒープクラス */
class MaxHeap {
    private maxHeap: number[];
    /* コンストラクタ：空のヒープを構築するか、入力リストからヒープを構築する */
    constructor(nums?: number[]) {
        // リストの要素をそのままヒープに追加する
        this.maxHeap = nums === undefined ? [] : [...nums];
        // 葉ノード以外の全ノードをヒープ化する
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }

    /* 左の子のインデックスを取得 */
    private left(i: number): number {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得 */
    private right(i: number): number {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得 */
    private parent(i: number): number {
        return Math.floor((i - 1) / 2); // 切り捨て除算
    }

    /* 要素を交換する */
    private swap(i: number, j: number): void {
        const tmp = this.maxHeap[i];
        this.maxHeap[i] = this.maxHeap[j];
        this.maxHeap[j] = tmp;
    }

    /* ヒープのサイズを取得する */
    public size(): number {
        return this.maxHeap.length;
    }

    /* ヒープが空か判定 */
    public isEmpty(): boolean {
        return this.size() === 0;
    }

    /* ヒープの先頭要素にアクセスする */
    public peek(): number {
        return this.maxHeap[0];
    }

    /* ヒープに要素を挿入する */
    public push(val: number): void {
        // ノードを追加する
        this.maxHeap.push(val);
        // 下から上へヒープ化する
        this.siftUp(this.size() - 1);
    }

    /* ノード i から上向きにヒープ化する */
    private siftUp(i: number): void {
        while (true) {
            // ノード i の親ノードを取得する
            const p = this.parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // 2 つのノードを交換する
            this.swap(i, p);
            // 上向きのヒープ化を繰り返す
            i = p;
        }
    }

    /* ヒープから要素を取り出す */
    public pop(): number {
        // 空かどうかを確認する
        if (this.isEmpty()) throw new RangeError('ヒープが空です。');
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        this.swap(0, this.size() - 1);
        // ノードを削除する
        const val = this.maxHeap.pop();
        // 上から下へヒープ化する
        this.siftDown(0);
        // ヒープの先頭要素を返す
        return val;
    }

    /* ノード i から下向きにヒープ化する */
    private siftDown(i: number): void {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if (ma === i) break;
            // 2 つのノードを交換する
            this.swap(i, ma);
            // 下向きのヒープ化を繰り返す
            i = ma;
        }
    }

    /* ヒープ（二分木）を表示する */
    public print(): void {
        printHeap(this.maxHeap);
    }

    /* ヒープ内の要素を取り出す */
    public getMaxHeap(): number[] {
        return this.maxHeap;
    }
}

/* 実行用コード */
if (import.meta.url.endsWith(process.argv[1])) {
    /* 最大ヒープを初期化する */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\nリストを入力してヒープを構築した後');
    maxHeap.print();

    /* ヒープの先頭要素を取得する */
    let peek = maxHeap.peek();
    console.log(`\nヒープの先頭要素は ${peek}`);

    /* ヒープに要素を挿入する */
    const val = 7;
    maxHeap.push(val);
    console.log(`\n要素 ${val} をヒープに挿入した後`);
    maxHeap.print();

    /* ヒープの先頭要素を取り出す */
    peek = maxHeap.pop();
    console.log(`\nヒープの先頭要素 ${peek} を取り出した後`);
    maxHeap.print();

    /* ヒープのサイズを取得する */
    const size = maxHeap.size();
    console.log(`\nヒープの要素数は ${size}`);

    /* ヒープが空か判定 */
    const isEmpty = maxHeap.isEmpty();
    console.log(`\nヒープは空か ${isEmpty}`);
}

export { MaxHeap };
