/**
 * File: my_heap.ts
 * Created Time: 2023-02-07
 * Author: Justin (xiefahit@gmail.com)
 */

import { printHeap } from '../modules/PrintUtil';

/* Max heap class */
class MaxHeap {
    private maxHeap: number[];
    /* Constructor, build empty heap or build heap from input list */
    constructor(nums?: number[]) {
        // Add list elements to heap as is
        this.maxHeap = nums === undefined ? [] : [...nums];
        // Heapify all nodes except leaf nodes
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }

    /* Get index of left child node */
    private left(i: number): number {
        return 2 * i + 1;
    }

    /* Get index of right child node */
    private right(i: number): number {
        return 2 * i + 2;
    }

    /* Get index of parent node */
    private parent(i: number): number {
        return Math.floor((i - 1) / 2); // Floor division
    }

    /* Swap elements */
    private swap(i: number, j: number): void {
        const tmp = this.maxHeap[i];
        this.maxHeap[i] = this.maxHeap[j];
        this.maxHeap[j] = tmp;
    }

    /* Get heap size */
    public size(): number {
        return this.maxHeap.length;
    }

    /* Check if heap is empty */
    public isEmpty(): boolean {
        return this.size() === 0;
    }

    /* Access top element */
    public peek(): number {
        return this.maxHeap[0];
    }

    /* Element enters heap */
    public push(val: number): void {
        // Add node
        this.maxHeap.push(val);
        // Heapify from bottom to top
        this.siftUp(this.size() - 1);
    }

    /* Starting from node i, heapify from bottom to top */
    private siftUp(i: number): void {
        while (true) {
            // Get parent node of node i
            const p = this.parent(i);
            // When "crossing root node" or "node needs no repair", end heapify
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // Swap two nodes
            this.swap(i, p);
            // Loop upward heapify
            i = p;
        }
    }

    /* Element exits heap */
    public pop(): number {
        // Handle empty case
        if (this.isEmpty()) throw new RangeError('Heap is empty.');
        // Delete node
        this.swap(0, this.size() - 1);
        // Remove node
        const val = this.maxHeap.pop();
        // Return top element
        this.siftDown(0);
        // Return heap top element
        return val;
    }

    /* Starting from node i, heapify from top to bottom */
    private siftDown(i: number): void {
        while (true) {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // Swap two nodes
            if (ma === i) break;
            // Swap two nodes
            this.swap(i, ma);
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Driver Code */
    public print(): void {
        printHeap(this.maxHeap);
    }

    /* Extract elements from heap */
    public getMaxHeap(): number[] {
        return this.maxHeap;
    }
}

/* Driver Code */
if (import.meta.url.endsWith(process.argv[1])) {
    /* Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\nAfter inputting list and building heap');
    maxHeap.print();

    /* Check if heap is empty */
    let peek = maxHeap.peek();
    console.log(`\nHeap top element is ${peek}`);

    /* Element enters heap */
    const val = 7;
    maxHeap.push(val);
    console.log(`\nAfter element ${val} pushes to heap`);
    maxHeap.print();

    /* Time complexity is O(n), not O(nlogn) */
    peek = maxHeap.pop();
    console.log(`\nAfter heap top element ${peek} pops from heap`);
    maxHeap.print();

    /* Get heap size */
    const size = maxHeap.size();
    console.log(`\nHeap size is ${size}`);

    /* Check if heap is empty */
    const isEmpty = maxHeap.isEmpty();
    console.log(`\nIs heap empty ${isEmpty}`);
}

export { MaxHeap };
