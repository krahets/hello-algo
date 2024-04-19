/**
 * File: my_heap.ts
 * Created Time: 2023-02-07
 * Author: Justin (xiefahit@gmail.com)
 */

import { printHeap } from '../modules/PrintUtil';

/* 最大堆类 */
class MaxHeap {
    private maxHeap: number[];
    /* 构造方法，建立空堆或根据输入列表建堆 */
    constructor(nums?: number[]) {
        // 将列表元素原封不动添加进堆
        this.maxHeap = nums === undefined ? [] : [...nums];
        // 堆化除叶节点以外的其他所有节点
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }

    /* 获取左子节点的索引 */
    private left(i: number): number {
        return 2 * i + 1;
    }

    /* 获取右子节点的索引 */
    private right(i: number): number {
        return 2 * i + 2;
    }

    /* 获取父节点的索引 */
    private parent(i: number): number {
        return Math.floor((i - 1) / 2); // 向下整除
    }

    /* 交换元素 */
    private swap(i: number, j: number): void {
        const tmp = this.maxHeap[i];
        this.maxHeap[i] = this.maxHeap[j];
        this.maxHeap[j] = tmp;
    }

    /* 获取堆大小 */
    public size(): number {
        return this.maxHeap.length;
    }

    /* 判断堆是否为空 */
    public isEmpty(): boolean {
        return this.size() === 0;
    }

    /* 访问堆顶元素 */
    public peek(): number {
        return this.maxHeap[0];
    }

    /* 元素入堆 */
    public push(val: number): void {
        // 添加节点
        this.maxHeap.push(val);
        // 从底至顶堆化
        this.siftUp(this.size() - 1);
    }

    /* 从节点 i 开始，从底至顶堆化 */
    private siftUp(i: number): void {
        while (true) {
            // 获取节点 i 的父节点
            const p = this.parent(i);
            // 当“越过根节点”或“节点无须修复”时，结束堆化
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // 交换两节点
            this.swap(i, p);
            // 循环向上堆化
            i = p;
        }
    }

    /* 元素出堆 */
    public pop(): number {
        // 判空处理
        if (this.isEmpty()) throw new RangeError('Heap is empty.');
        // 交换根节点与最右叶节点（交换首元素与尾元素）
        this.swap(0, this.size() - 1);
        // 删除节点
        const val = this.maxHeap.pop();
        // 从顶至底堆化
        this.siftDown(0);
        // 返回堆顶元素
        return val;
    }

    /* 从节点 i 开始，从顶至底堆化 */
    private siftDown(i: number): void {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
            if (ma === i) break;
            // 交换两节点
            this.swap(i, ma);
            // 循环向下堆化
            i = ma;
        }
    }

    /* 打印堆（二叉树） */
    public print(): void {
        printHeap(this.maxHeap);
    }

    /* 取出堆中元素 */
    public getMaxHeap(): number[] {
        return this.maxHeap;
    }
}

/* Driver Code */
if (import.meta.url.endsWith(process.argv[1])) {
    /* 初始化大顶堆 */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\n输入列表并建堆后');
    maxHeap.print();

    /* 获取堆顶元素 */
    let peek = maxHeap.peek();
    console.log(`\n堆顶元素为 ${peek}`);

    /* 元素入堆 */
    const val = 7;
    maxHeap.push(val);
    console.log(`\n元素 ${val} 入堆后`);
    maxHeap.print();

    /* 堆顶元素出堆 */
    peek = maxHeap.pop();
    console.log(`\n堆顶元素 ${peek} 出堆后`);
    maxHeap.print();

    /* 获取堆大小 */
    const size = maxHeap.size();
    console.log(`\n堆元素数量为 ${size}`);

    /* 判断堆是否为空 */
    const isEmpty = maxHeap.isEmpty();
    console.log(`\n堆是否为空 ${isEmpty}`);
}

export { MaxHeap };
