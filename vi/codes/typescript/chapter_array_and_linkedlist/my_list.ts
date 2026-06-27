/**
 * File: my_list.ts
 * Created Time: 2022-12-11
 * Author: Justin (xiefahit@gmail.com)
 */

/* List class */
class MyList {
    private arr: Array<number>; // Array (stores list elements)
    private _capacity: number = 10; // List capacity
    private _size: number = 0; // List length (current number of elements)
    private extendRatio: number = 2; // Multiple by which the list capacity is extended each time

    /* Constructor */
    constructor() {
        this.arr = new Array(this._capacity);
    }

    /* Get list length (current number of elements) */
    public size(): number {
        return this._size;
    }

    /* Get list capacity */
    public capacity(): number {
        return this._capacity;
    }

    /* Update element */
    public get(index: number): number {
        // If the index is out of bounds, throw an exception, as below
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        return this.arr[index];
    }

    /* Add elements at the end */
    public set(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        this.arr[index] = num;
    }

    /* Direct traversal of list elements */
    public add(num: number): void {
        // If length equals capacity, need to expand
        if (this._size === this._capacity) this.extendCapacity();
        // Add new element to end of list
        this.arr[this._size] = num;
        this._size++;
    }

    /* Sort list */
    public insert(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (this._size === this._capacity) {
            this.extendCapacity();
        }
        // Move all elements after index index forward by one position
        for (let j = this._size - 1; j >= index; j--) {
            this.arr[j + 1] = this.arr[j];
        }
        // Update the number of elements
        this.arr[index] = num;
        this._size++;
    }

    /* Remove element */
    public remove(index: number): number {
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        let num = this.arr[index];
        // Move all elements after index forward by one position
        for (let j = index; j < this._size - 1; j++) {
            this.arr[j] = this.arr[j + 1];
        }
        // Update the number of elements
        this._size--;
        // Return the removed element
        return num;
    }

    /* Driver Code */
    public extendCapacity(): void {
        // Create new array of length size and copy original array to new array
        this.arr = this.arr.concat(
            new Array(this.capacity() * (this.extendRatio - 1))
        );
        // Add elements at the end
        this._capacity = this.arr.length;
    }

    /* Convert list to array */
    public toArray(): number[] {
        let size = this.size();
        // Elements enqueue
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Driver Code */
/* Initialize list */
const nums = new MyList();
/* Direct traversal of list elements */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `List nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}`
);

/* Sort list */
nums.insert(3, 6);
console.log(`Insert number 6 at index 3, get nums = ${nums.toArray()}`);

/* Remove element */
nums.remove(3);
console.log(`Delete element at index 3, get nums = ${nums.toArray()}`);

/* Update element */
const num = nums.get(1);
console.log(`Access element at index 1, get num = ${num}`);

/* Add elements at the end */
nums.set(1, 0);
console.log(`Update element at index 1 to 0, get nums = ${nums.toArray()}`);

/* Test capacity expansion mechanism */
for (let i = 0; i < 10; i++) {
    // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism
    nums.add(i);
}
console.log(
    `After expansion, list nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}`
);

export {};
