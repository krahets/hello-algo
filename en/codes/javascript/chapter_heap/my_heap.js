/**
 * File: my_heap.js
 * Created Time: 2023-02-06
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { printHeap } = require('../modules/PrintUtil');

/* Max Heap Class */
class MaxHeap {
    #maxHeap;

    /* Constructor, to create an empty heap or build from an input list */
    constructor(nums) {
        // Add all list elements into the heap
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // Heapify all nodes except leaves
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }

    /* Get index of left child node */
    #left(i) {
        return 2 * i + 1;
    }

    /* Get index of right child node */
    #right(i) {
        return 2 * i + 2;
    }

    /* Get index of parent node */
    #parent(i) {
        return Math.floor((i - 1) / 2); // Integer division down
    }

    /* Swap elements */
    #swap(i, j) {
        const tmp = this.#maxHeap[i];
        this.#maxHeap[i] = this.#maxHeap[j];
        this.#maxHeap[j] = tmp;
    }

    /* Get heap size */
    size() {
        return this.#maxHeap.length;
    }

    /* Determine if heap is empty */
    isEmpty() {
        return this.size() === 0;
    }

    /* Access heap top element */
    peek() {
        return this.#maxHeap[0];
    }

    /* Push the element into heap */
    push(val) {
        // Add node
        this.#maxHeap.push(val);
        // Heapify from bottom to top
        this.#siftUp(this.size() - 1);
    }

    /* Start heapifying node i, from bottom to top */
    #siftUp(i) {
        while (true) {
            // Get parent node of node i
            const p = this.#parent(i);
            // When "crossing the root node" or "node does not need repair", end heapification
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // Swap two nodes
            this.#swap(i, p);
            // Loop upwards heapification
            i = p;
        }
    }

    /* Element exits heap */
    pop() {
        // Empty handling
        if (this.isEmpty()) throw new Error('Heap is empty');
        // Swap the root node with the rightmost leaf node (swap the first element with the last element)
        this.#swap(0, this.size() - 1);
        // Remove node
        const val = this.#maxHeap.pop();
        // Heapify from top to bottom
        this.#siftDown(0);
        // Return heap top element
        return val;
    }

    /* Start heapifying node i, from top to bottom */
    #siftDown(i) {
        while (true) {
            // Determine the largest node among i, l, r, noted as ma
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
            if (ma === i) break;
            // Swap two nodes
            this.#swap(i, ma);
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Print heap (binary tree) */
    print() {
        printHeap(this.#maxHeap);
    }

    /* Remove elements from the heap */
    getMaxHeap() {
        return this.#maxHeap;
    }
}

/* Driver Code */
if (require.main === module) {
    /* Initialize max-heap */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\nEnter list and build heap');
    maxHeap.print();

    /* Access heap top element */
    let peek = maxHeap.peek();
    console.log(`\n堆顶元素为 ${peek}`);

    /* Push the element into heap */
    let val = 7;
    maxHeap.push(val);
    console.log(`\n元素 ${val} 入堆后`);
    maxHeap.print();

    /* Pop the element at the heap top */
    peek = maxHeap.pop();
    console.log(`\n堆顶元素 ${peek} 出堆后`);
    maxHeap.print();

    /* Get heap size */
    let size = maxHeap.size();
    console.log(`\n堆元素数量为 ${size}`);

    /* Determine if heap is empty */
    let isEmpty = maxHeap.isEmpty();
    console.log(`\n堆是否为空 ${isEmpty}`);
}

module.exports = {
    MaxHeap,
};
