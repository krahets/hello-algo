/**
 * File: my_heap.ts
 * Created Time: 2023-02-07
 * Author: Justin (xiefahit@gmail.com)
 */

import { printHeap } from '../modules/PrintUtil';

/* 最大堆積類別 */
class MaxHeap {
    private maxHeap: number[];
    /* 建構子，建立空堆積或根據輸入串列建堆積 */
    constructor(nums?: number[]) {
        // 將串列元素原封不動新增進堆積
        this.maxHeap = nums === undefined ? [] : [...nums];
        // 堆積化除葉節點以外的其他所有節點
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }

    /* 獲取左子節點的索引 */
    private left(i: number): number {
        return 2 * i + 1;
    }

    /* 獲取右子節點的索引 */
    private right(i: number): number {
        return 2 * i + 2;
    }

    /* 獲取父節點的索引 */
    private parent(i: number): number {
        return Math.floor((i - 1) / 2); // 向下整除
    }

    /* 交換元素 */
    private swap(i: number, j: number): void {
        const tmp = this.maxHeap[i];
        this.maxHeap[i] = this.maxHeap[j];
        this.maxHeap[j] = tmp;
    }

    /* 獲取堆積大小 */
    public size(): number {
        return this.maxHeap.length;
    }

    /* 判斷堆積是否為空 */
    public isEmpty(): boolean {
        return this.size() === 0;
    }

    /* 訪問堆積頂元素 */
    public peek(): number {
        return this.maxHeap[0];
    }

    /* 元素入堆積 */
    public push(val: number): void {
        // 新增節點
        this.maxHeap.push(val);
        // 從底至頂堆積化
        this.siftUp(this.size() - 1);
    }

    /* 從節點 i 開始，從底至頂堆積化 */
    private siftUp(i: number): void {
        while (true) {
            // 獲取節點 i 的父節點
            const p = this.parent(i);
            // 當“越過根節點”或“節點無須修復”時，結束堆積化
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // 交換兩節點
            this.swap(i, p);
            // 迴圈向上堆積化
            i = p;
        }
    }

    /* 元素出堆積 */
    public pop(): number {
        // 判空處理
        if (this.isEmpty()) throw new RangeError('Heap is empty.');
        // 交換根節點與最右葉節點（交換首元素與尾元素）
        this.swap(0, this.size() - 1);
        // 刪除節點
        const val = this.maxHeap.pop();
        // 從頂至底堆積化
        this.siftDown(0);
        // 返回堆積頂元素
        return val;
    }

    /* 從節點 i 開始，從頂至底堆積化 */
    private siftDown(i: number): void {
        while (true) {
            // 判斷節點 i, l, r 中值最大的節點，記為 ma
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
            if (ma === i) break;
            // 交換兩節點
            this.swap(i, ma);
            // 迴圈向下堆積化
            i = ma;
        }
    }

    /* 列印堆積（二元樹） */
    public print(): void {
        printHeap(this.maxHeap);
    }

    /* 取出堆積中元素 */
    public getMaxHeap(): number[] {
        return this.maxHeap;
    }
}

/* Driver Code */
if (import.meta.url.endsWith(process.argv[1])) {
    /* 初始化大頂堆積 */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\n輸入串列並建堆積後');
    maxHeap.print();

    /* 獲取堆積頂元素 */
    let peek = maxHeap.peek();
    console.log(`\n堆積頂元素為 ${peek}`);

    /* 元素入堆積 */
    const val = 7;
    maxHeap.push(val);
    console.log(`\n元素 ${val} 入堆積後`);
    maxHeap.print();

    /* 堆積頂元素出堆積 */
    peek = maxHeap.pop();
    console.log(`\n堆積頂元素 ${peek} 出堆積後`);
    maxHeap.print();

    /* 獲取堆積大小 */
    const size = maxHeap.size();
    console.log(`\n堆積元素數量為 ${size}`);

    /* 判斷堆積是否為空 */
    const isEmpty = maxHeap.isEmpty();
    console.log(`\n堆積是否為空 ${isEmpty}`);
}

export { MaxHeap };
