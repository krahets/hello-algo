/**
 * File: my_heap.js
 * Created Time: 2023-02-06
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { printHeap } = require('../modules/PrintUtil');

/* 最大堆積類別 */
class MaxHeap {
    #maxHeap;

    /* 建構式，可建立空堆積，或根據輸入串列建立堆積 */
    constructor(nums) {
        // 將串列元素依原順序全部加入堆積
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // 從每個非葉節點向下調整堆積
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }

    /* 取得左子節點的索引 */
    #left(i) {
        return 2 * i + 1;
    }

    /* 取得右子節點的索引 */
    #right(i) {
        return 2 * i + 2;
    }

    /* 取得父節點的索引 */
    #parent(i) {
        return Math.floor((i - 1) / 2); // 向下取整的整數除法
    }

    /* 交換元素 */
    #swap(i, j) {
        const tmp = this.#maxHeap[i];
        this.#maxHeap[i] = this.#maxHeap[j];
        this.#maxHeap[j] = tmp;
    }

    /* 取得堆積大小 */
    size() {
        return this.#maxHeap.length;
    }

    /* 判斷堆積是否為空 */
    isEmpty() {
        return this.size() === 0;
    }

    /* 讀取堆積頂端元素 */
    peek() {
        return this.#maxHeap[0];
    }

    /* 將元素加入堆積 */
    push(val) {
        // 新增節點
        this.#maxHeap.push(val);
        // 由下往上調整堆積
        this.#siftUp(this.size() - 1);
    }

    /* 從節點 i 開始向上調整堆積 */
    #siftUp(i) {
        while (true) {
            // 取得節點 i 的父節點
            const p = this.#parent(i);
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // 交換兩個節點
            this.#swap(i, p);
            // 繼續向上調整堆積
            i = p;
        }
    }

    /* 從堆積取出元素 */
    pop() {
        // 檢查堆積是否為空
        if (this.isEmpty()) throw new Error('堆積為空');
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        this.#swap(0, this.size() - 1);
        // 刪除節點
        const val = this.#maxHeap.pop();
        // 由上往下調整堆積
        this.#siftDown(0);
        // 回傳堆積頂端元素
        return val;
    }

    /* 從節點 i 開始向下調整堆積 */
    #siftDown(i) {
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if (ma === i) break;
            // 交換兩個節點
            this.#swap(i, ma);
            // 繼續向下調整堆積
            i = ma;
        }
    }

    /* 印出堆積（二元樹） */
    print() {
        printHeap(this.#maxHeap);
    }

    /* 取出堆積中的元素 */
    getMaxHeap() {
        return this.#maxHeap;
    }
}

/* Driver Code */
if (require.main === module) {
    /* 初始化最大堆積 */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\n用輸入串列建立堆積後');
    maxHeap.print();

    /* 取得堆積頂端元素 */
    let peek = maxHeap.peek();
    console.log(`\n堆積頂端元素為 ${peek}`);

    /* 將元素加入堆積 */
    let val = 7;
    maxHeap.push(val);
    console.log(`\n將元素 ${val} 加入堆積後`);
    maxHeap.print();

    /* 取出堆積頂端元素 */
    peek = maxHeap.pop();
    console.log(`\n取出堆積頂端元素 ${peek} 後`);
    maxHeap.print();

    /* 取得堆積大小 */
    let size = maxHeap.size();
    console.log(`\n堆積中的元素個數為 ${size}`);

    /* 判斷堆積是否為空 */
    let isEmpty = maxHeap.isEmpty();
    console.log(`\n堆積是否為空 ${isEmpty}`);
}

module.exports = {
    MaxHeap,
};
