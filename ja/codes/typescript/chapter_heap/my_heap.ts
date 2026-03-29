/**
 * File: my_heap.ts
 * Created Time: 2023-02-07
 * Author: Justin (xiefahit@gmail.com)
 */

import { printHeap } from '../modules/PrintUtil';

/* 最大ヒープクラス */
class MaxHeap {
    private maxHeap: number[];
    /* コンストラクタ。空のヒープを作成するか、入力リストからヒープを構築する */
    constructor(nums?: number[]) {
        // リスト要素をそのままヒープに追加
        this.maxHeap = nums === undefined ? [] : [...nums];
        // 葉ノード以外のすべてのノードをヒープ化
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }

    /* 左子ノードのインデックスを取得 */
    private left(i: number): number {
        return 2 * i + 1;
    }

    /* 右子ノードのインデックスを取得 */
    private right(i: number): number {
        return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    private parent(i: number): number {
        return Math.floor((i - 1) / 2); // 切り捨て除算
    }

    /* 要素を交換 */
    private swap(i: number, j: number): void {
        const tmp = this.maxHeap[i];
        this.maxHeap[i] = this.maxHeap[j];
        this.maxHeap[j] = tmp;
    }

    /* ヒープのサイズを取得 */
    public size(): number {
        return this.maxHeap.length;
    }

    /* ヒープが空かどうかを判定 */
    public isEmpty(): boolean {
        return this.size() === 0;
    }

    /* ヒープ先頭要素にアクセス */
    public peek(): number {
        return this.maxHeap[0];
    }

    /* 要素をヒープに追加 */
    public push(val: number): void {
        // ノードを追加
        this.maxHeap.push(val);
        // 下から上へヒープ化
        this.siftUp(this.size() - 1);
    }

    /* ノード i から始めて、下から上へヒープ化 */
    private siftUp(i: number): void {
        while (true) {
            // ノード i の親ノードを取得
            const p = this.parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // 2 つのノードを交換
            this.swap(i, p);
            // ループで下から上へヒープ化
            i = p;
        }
    }

    /* 要素をヒープから取り出す */
    public pop(): number {
        // 空判定の処理
        if (this.isEmpty()) throw new RangeError('Heap is empty.');
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        this.swap(0, this.size() - 1);
        // ノードを削除
        const val = this.maxHeap.pop();
        // 上から下へヒープ化
        this.siftDown(0);
        // ヒープ先頭要素を返す
        return val;
    }

    /* ノード i から始めて、上から下へヒープ化 */
    private siftDown(i: number): void {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを ma とする
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if (ma === i) break;
            // 2 つのノードを交換
            this.swap(i, ma);
            // ループで上から下へヒープ化
            i = ma;
        }
    }

    /* ヒープ（二分木）を出力 */
    public print(): void {
        printHeap(this.maxHeap);
    }

    /* ヒープから要素を取り出す */
    public getMaxHeap(): number[] {
        return this.maxHeap;
    }
}

/* Driver Code */
if (import.meta.url.endsWith(process.argv[1])) {
    /* 最大ヒープを初期化 */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\nリストを入力してヒープを構築した後');
    maxHeap.print();

    /* ヒープ頂点の要素を取得 */
    let peek = maxHeap.peek();
    console.log(`\nヒープの先頭要素は ${peek}`);

    /* 要素をヒープに追加 */
    const val = 7;
    maxHeap.push(val);
    console.log(`\n要素 ${val} をヒープに追加した後`);
    maxHeap.print();

    /* ヒープ頂点の要素を取り出す */
    peek = maxHeap.pop();
    console.log(`\nヒープの先頭要素 ${peek} を取り出した後`);
    maxHeap.print();

    /* ヒープのサイズを取得 */
    const size = maxHeap.size();
    console.log(`\nヒープの要素数は ${size}`);

    /* ヒープが空かどうかを判定 */
    const isEmpty = maxHeap.isEmpty();
    console.log(`\nヒープが空かどうか ${isEmpty}`);
}

export { MaxHeap };
