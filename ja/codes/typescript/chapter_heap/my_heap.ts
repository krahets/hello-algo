/**
 * File: my_heap.ts
 * Created Time: 2023-02-07
 * Author: Justin (xiefahit@gmail.com)
 */

import { printHeap } from '../modules/PrintUtil';

/* 最大ヒープのクラス */
class MaxHeap {
    private maxHeap: number[];
    /* 空のヒープを作るか、入力リストからヒープを構築するコンストラクタ */
    constructor(nums?: number[]) {
        // リストの要素をそのままヒープに追加する
        this.maxHeap = nums === undefined ? [] : [...nums];
        // 葉以外のすべてのノードをヒープ化する
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }

    /* 左の子のインデックスを取得する */
    private left(i: number): number {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得する */
    private right(i: number): number {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得する */
    private parent(i: number): number {
        return Math.floor((i - 1) / 2); // 商を負の無限大方向に切り捨てる
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

    /* ヒープが空か判定する */
    public isEmpty(): boolean {
        return this.size() === 0;
    }

    /* ヒープの根の要素を参照する */
    public peek(): number {
        return this.maxHeap[0];
    }

    /* 要素をヒープに挿入する */
    public push(val: number): void {
        // ノードを追加する
        this.maxHeap.push(val);
        // 上に向かってヒープ化する
        this.siftUp(this.size() - 1);
    }

    /* ノード i から上に向かってヒープ化する */
    private siftUp(i: number): void {
        while (true) {
            // ノード i の親を取得する
            const p = this.parent(i);
            // 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // 2 つのノードを交換する
            this.swap(i, p);
            // 上へのヒープ化を繰り返す
            i = p;
        }
    }

    /* 根の要素をヒープから取り出す */
    public pop(): number {
        // 空の場合の処理
        if (this.isEmpty()) throw new RangeError('Heap is empty.');
        // 根と最も右の葉（先頭要素と末尾要素）を交換する
        this.swap(0, this.size() - 1);
        // ノードを削除する
        const val = this.maxHeap.pop();
        // 下に向かってヒープ化する
        this.siftDown(0);
        // 根の要素を返す
        return val;
    }

    /* ノード i から下に向かってヒープ化する */
    private siftDown(i: number): void {
        while (true) {
            // ノード i、l、r のうち値が最大のものを ma とする
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
            if (ma === i) break;
            // 2 つのノードを交換する
            this.swap(i, ma);
            // 下へのヒープ化を繰り返す
            i = ma;
        }
    }

    /* ヒープを二分木として表示する */
    public print(): void {
        printHeap(this.maxHeap);
    }

    /* ヒープから要素を取り出す */
    public getMaxHeap(): number[] {
        return this.maxHeap;
    }
}

/* 実行例 */
if (import.meta.url.endsWith(process.argv[1])) {
    /* 最大ヒープを初期化する */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\n入力リストから構築したヒープ：');
    maxHeap.print();

    /* ヒープの根の要素を取得する */
    let peek = maxHeap.peek();
    console.log(`\nヒープの根の要素：${peek}`);

    /* 要素をヒープに挿入する */
    const val = 7;
    maxHeap.push(val);
    console.log(`\n要素 ${val} の挿入後：`);
    maxHeap.print();

    /* 根の要素を取り出す */
    peek = maxHeap.pop();
    console.log(`\n根の要素 ${peek} を取り出した後：`);
    maxHeap.print();

    /* ヒープのサイズを取得する */
    const size = maxHeap.size();
    console.log(`\nヒープの要素数：${size}`);

    /* ヒープが空か判定する */
    const isEmpty = maxHeap.isEmpty();
    console.log(`\nヒープは空か：${isEmpty}`);
}

export { MaxHeap };
