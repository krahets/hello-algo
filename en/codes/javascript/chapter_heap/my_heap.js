/**
 * File: my_heap.js
 * Created Time: 2023-02-06
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { printHeap } = require('../modules/PrintUtil');

/* Max-heap class */
class MaxHeap {
    #maxHeap;

    /* Constructor: create an empty heap or build one from the input list */
    constructor(nums) {
        // Copy the list elements into the heap in their original order
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // Heapify all non-leaf nodes
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }

    /* Get the left child index */
    #left(i) {
        return 2 * i + 1;
    }

    /* Get the right child index */
    #right(i) {
        return 2 * i + 2;
    }

    /* Get the parent index */
    #parent(i) {
        return Math.floor((i - 1) / 2); // Floor division
    }

    /* Swap elements */
    #swap(i, j) {
        const tmp = this.#maxHeap[i];
        this.#maxHeap[i] = this.#maxHeap[j];
        this.#maxHeap[j] = tmp;
    }

    /* Get the heap size */
    size() {
        return this.#maxHeap.length;
    }

    /* Check whether the heap is empty */
    isEmpty() {
        return this.size() === 0;
    }

    /* Peek at the root */
    peek() {
        return this.#maxHeap[0];
    }

    /* Push an element onto the heap */
    push(val) {
        // Add a node
        this.#maxHeap.push(val);
        // Sift up
        this.#siftUp(this.size() - 1);
    }

    /* Sift up from node i */
    #siftUp(i) {
        while (true) {
            // Get the parent of node i
            const p = this.#parent(i);
            // Stop sifting at the root or when the node already satisfies the heap property
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // Swap the two nodes
            this.#swap(i, p);
            // Continue sifting up
            i = p;
        }
    }

    /* Pop an element from the heap */
    pop() {
        // Handle an empty heap
        if (this.isEmpty()) throw new Error('Heap is empty');
        // Swap the root and the rightmost leaf (the first and last elements)
        this.#swap(0, this.size() - 1);
        // Remove the node
        const val = this.#maxHeap.pop();
        // Sift down
        this.#siftDown(0);
        // Return the root element
        return val;
    }

    /* Sift down from node i */
    #siftDown(i) {
        while (true) {
            // Store the index of the largest of nodes i, l, and r in ma
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // Stop if i is already largest or both child indices l and r are out of bounds
            if (ma === i) break;
            // Swap the two nodes
            this.#swap(i, ma);
            // Continue sifting down
            i = ma;
        }
    }

    /* Print the heap as a binary tree */
    print() {
        printHeap(this.#maxHeap);
    }

    /* Retrieve the elements in the heap */
    getMaxHeap() {
        return this.#maxHeap;
    }
}

/* Driver code */
if (require.main === module) {
    /* Initialize a max-heap */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\nHeap built from the input list:');
    maxHeap.print();

    /* Get the root element */
    let peek = maxHeap.peek();
    console.log(`\nRoot element: ${peek}`);

    /* Push an element onto the heap */
    let val = 7;
    maxHeap.push(val);
    console.log(`\nHeap after pushing ${val}:`);
    maxHeap.print();

    /* Pop the root */
    peek = maxHeap.pop();
    console.log(`\nHeap after popping the root (${peek}):`);
    maxHeap.print();

    /* Get the heap size */
    let size = maxHeap.size();
    console.log(`\nNumber of elements in the heap: ${size}`);

    /* Check whether the heap is empty */
    let isEmpty = maxHeap.isEmpty();
    console.log(`\nIs the heap empty? ${isEmpty}`);
}

module.exports = {
    MaxHeap,
};
