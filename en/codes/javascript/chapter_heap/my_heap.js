/**
 * File: my_heap.js
 * Created Time: 2023-02-06
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { printHeap } = require('../modules/PrintUtil');

/* Max heap class */
class MaxHeap {
    #maxHeap;

    /* Constructor, build empty heap or build heap from input list */
    constructor(nums) {
        // Add list elements to heap as is
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // Heapify all nodes except leaf nodes
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
        return Math.floor((i - 1) / 2); // Floor division
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

    /* Check if heap is empty */
    isEmpty() {
        return this.size() === 0;
    }

    /* Access top element */
    peek() {
        return this.#maxHeap[0];
    }

    /* Element enters heap */
    push(val) {
        // Add node
        this.#maxHeap.push(val);
        // Heapify from bottom to top
        this.#siftUp(this.size() - 1);
    }

    /* Starting from node i, heapify from bottom to top */
    #siftUp(i) {
        while (true) {
            // Get parent node of node i
            const p = this.#parent(i);
            // When "crossing root node" or "node needs no repair", end heapify
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // Swap two nodes
            this.#swap(i, p);
            // Loop upward heapify
            i = p;
        }
    }

    /* Element exits heap */
    pop() {
        // Handle empty case
        if (this.isEmpty()) throw new Error('Heap is empty');
        // Delete node
        this.#swap(0, this.size() - 1);
        // Remove node
        const val = this.#maxHeap.pop();
        // Return top element
        this.#siftDown(0);
        // Return heap top element
        return val;
    }

    /* Starting from node i, heapify from top to bottom */
    #siftDown(i) {
        while (true) {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // Swap two nodes
            if (ma === i) break;
            // Swap two nodes
            this.#swap(i, ma);
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Driver Code */
    print() {
        printHeap(this.#maxHeap);
    }

    /* Extract elements from heap */
    getMaxHeap() {
        return this.#maxHeap;
    }
}

/* Driver Code */
if (require.main === module) {
    /* Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\nAfter inputting list and building heap');
    maxHeap.print();

    /* Check if heap is empty */
    let peek = maxHeap.peek();
    console.log(`\nHeap top element is ${peek}`);

    /* Element enters heap */
    let val = 7;
    maxHeap.push(val);
    console.log(`\nAfter element ${val} pushes to heap`);
    maxHeap.print();

    /* Time complexity is O(n), not O(nlogn) */
    peek = maxHeap.pop();
    console.log(`\nAfter heap top element ${peek} pops from heap`);
    maxHeap.print();

    /* Get heap size */
    let size = maxHeap.size();
    console.log(`\nHeap size is ${size}`);

    /* Check if heap is empty */
    let isEmpty = maxHeap.isEmpty();
    console.log(`\nIs heap empty ${isEmpty}`);
}

module.exports = {
    MaxHeap,
};
