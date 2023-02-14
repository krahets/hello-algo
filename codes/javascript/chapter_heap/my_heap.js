/**
 * File: my_heap.js
 * Created Time: 2023-02-06
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { printHeap } = require("../include/PrintUtil");

/* 最大堆类 */
class MaxHeap {
    #maxHeap;

    /* 构造方法，建立空堆或根据输入列表建堆 */
    constructor(nums) {
        // 将列表元素原封不动添加进堆
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // 堆化除叶结点以外的其他所有结点
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }

    /* 获取左子结点索引 */
    #left(i) {
        return 2 * i + 1;
    }

    /* 获取右子结点索引 */
    #right(i) {
        return 2 * i + 2;
    }

    /* 获取父结点索引 */
    #parent(i) {
        return Math.floor((i - 1) / 2); // 向下整除
    }

    /* 交换元素 */
    #swap(i, j) {
        const a = this.#maxHeap[i],
            b = this.#maxHeap[j],
            tmp = a;
        this.#maxHeap[i] = b;
        this.#maxHeap[j] = tmp;
    }

    /* 获取堆大小 */
    size() {
        return this.#maxHeap.length;
    }

    /* 判断堆是否为空 */
    isEmpty() {
        return this.size() === 0;
    }

    /* 访问堆顶元素 */
    peek() {
        return this.#maxHeap[0];
    }

    /* 元素入堆 */
    push(val) {
        // 添加结点
        this.#maxHeap.push(val);
        // 从底至顶堆化
        this.#siftUp(this.size() - 1);
    }

    /* 从结点 i 开始，从底至顶堆化 */
    #siftUp(i) {
        while (true) {
            // 获取结点 i 的父结点
            const p = this.#parent(i);
            // 当“越过根结点”或“结点无需修复”时，结束堆化
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // 交换两结点
            this.#swap(i, p);
            // 循环向上堆化
            i = p;
        }
    }

    /* 元素出堆 */
    poll() {
        // 判空处理
        if (this.isEmpty()) throw new Error("堆为空");
        // 交换根结点与最右叶结点（即交换首元素与尾元素）
        this.#swap(0, this.size() - 1);
        // 删除结点
        const val = this.#maxHeap.pop();
        // 从顶至底堆化
        this.#siftDown(0);
        // 返回堆顶元素
        return val;
    }

    /* 从结点 i 开始，从顶至底堆化 */
    #siftDown(i) {
        while (true) {
            // 判断结点 i, l, r 中值最大的结点，记为 ma
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // 若结点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma == i) break;
            // 交换两结点
            this.#swap(i, ma);
            // 循环向下堆化
            i = ma;
        }
    }

    /* 打印堆（二叉树） */
    print() {
        printHeap(this.#maxHeap);
    }
}

function testPush(maxHeap, val) {
    maxHeap.push(val); // 元素入堆
    console.log(`\n添加元素 ${val} 后`);
    maxHeap.print();
}

function testPoll(maxHeap) {
    let val = maxHeap.poll(); // 堆顶元素出堆
    console.log(`\n出堆元素为 ${val}`);
    maxHeap.print();
}

/* Driver Code */
/* 初始化大顶堆 */
const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
console.log("\n输入列表并建堆后");
maxHeap.print();

/* 获取堆顶元素 */
let peek = maxHeap.peek();
console.log(`\n堆顶元素为 ${peek}`);

/* 元素入堆 */
let val = 7;
maxHeap.push(val);
console.log(`\n元素 ${val} 入堆后`);
maxHeap.print();

/* 堆顶元素出堆 */
peek = maxHeap.poll();
console.log(`\n堆顶元素 ${peek} 出堆后`);
maxHeap.print();

/* 获取堆大小 */
let size = maxHeap.size();
console.log(`\n堆元素数量为 ${size}`);

/* 判断堆是否为空 */
let isEmpty = maxHeap.isEmpty();
console.log(`\n堆是否为空 ${isEmpty}`);
