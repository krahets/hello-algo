/**
 * File: my_heap.ts
 * Created Time: 2023-02-07
 * Author: Justin (xiefahit@gmail.com)
 */

import { printHeap } from '../modules/PrintUtil';

/* Max heap class */
class MaxHeap {
    private maxHeap: number[];
    /* Constructor: create an empty heap or build a heap from the input list */
    constructor(nums?: number[]) {
        // Place the list elements in the heap without changing their order
        this.maxHeap = nums === undefined ? [] : [...nums];
        // Sift down from every non-leaf node
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }

    /* Get the left child index */
    private left(i: number): number {
        return 2 * i + 1;
    }

    /* Get the right child index */
    private right(i: number): number {
        return 2 * i + 2;
    }

    /* Get the parent index */
    private parent(i: number): number {
        return Math.floor((i - 1) / 2); // Floor division
    }

    /* Swap elements */
    private swap(i: number, j: number): void {
        const tmp = this.maxHeap[i];
        this.maxHeap[i] = this.maxHeap[j];
        this.maxHeap[j] = tmp;
    }

    /* Get the heap size */
    public size(): number {
        return this.maxHeap.length;
    }

    /* Check whether the heap is empty */
    public isEmpty(): boolean {
        return this.size() === 0;
    }

    /* Access the top element of the heap */
    public peek(): number {
        return this.maxHeap[0];
    }

    /* Push an element onto the heap */
    public push(val: number): void {
        // Add a node
        this.maxHeap.push(val);
        // Sift up
        this.siftUp(this.size() - 1);
    }

    /* Sift up starting from node i */
    private siftUp(i: number): void {
        while (true) {
            // Get the parent of node i
            const p = this.parent(i);
            // Stop sifting when the root has been passed or the node needs no repair
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // Swap the two nodes
            this.swap(i, p);
            // Continue sifting up
            i = p;
        }
    }

    /* Pop an element from the heap */
    public pop(): number {
        // Handle an empty heap
        if (this.isEmpty()) throw new RangeError('Heap is empty');
        // Swap the root with the rightmost leaf on the last level (swap the first and last elements)
        this.swap(0, this.size() - 1);
        // Remove a node
        const val = this.maxHeap.pop();
        // Sift down
        this.siftDown(0);
        // Return the top element of the heap
        return val;
    }

    /* Sift down starting from node i */
    private siftDown(i: number): void {
        while (true) {
            // Find the node with the largest value among i, l, and r, and store its index in ma
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // Stop if node i is largest or both child indices l and r are out of bounds
            if (ma === i) break;
            // Swap the two nodes
            this.swap(i, ma);
            // Continue sifting down
            i = ma;
        }
    }

    /* Print the heap (binary tree) */
    public print(): void {
        printHeap(this.maxHeap);
    }

    /* Get the elements in the heap */
    public getMaxHeap(): number[] {
        return this.maxHeap;
    }
}

/* Driver code */
if (import.meta.url.endsWith(process.argv[1])) {
    /* Initialize a max heap */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\nAfter building a heap from the input list:');
    maxHeap.print();

    /* Get the top element of the heap */
    let peek = maxHeap.peek();
    console.log(`\nHeap top: ${peek}`);

    /* Push an element onto the heap */
    const val = 7;
    maxHeap.push(val);
    console.log(`\nAfter pushing ${val} into the heap:`);
    maxHeap.print();

    /* Pop the top element from the heap */
    peek = maxHeap.pop();
    console.log(`\nAfter popping the heap top ${peek}:`);
    maxHeap.print();

    /* Get the heap size */
    const size = maxHeap.size();
    console.log(`\nNumber of elements in the heap: ${size}`);

    /* Check whether the heap is empty */
    const isEmpty = maxHeap.isEmpty();
    console.log(`\nIs the heap empty? ${isEmpty}`);
}

export { MaxHeap };
