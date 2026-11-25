/**
 * File: my_list.ts
 * Created Time: 2022-12-11
 * Author: Justin (xiefahit@gmail.com)
 */

/* List class */
class MyList {
    private arr: Array<number>; // Array that stores the list elements
    private _capacity: number = 10; // List capacity
    private _size: number = 0; // List length (current number of elements)
    private extendRatio: number = 2; // Factor by which the list capacity grows

    /* Constructor */
    constructor() {
        this.arr = new Array(this._capacity);
    }

    /* Get the list length (current number of elements)*/
    public size(): number {
        return this._size;
    }

    /* Get the list capacity */
    public capacity(): number {
        return this._capacity;
    }

    /* Access an element */
    public get(index: number): number {
        // Throw an exception if the index is out of bounds, here and below
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        return this.arr[index];
    }

    /* Update an element */
    public set(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        this.arr[index] = num;
    }

    /* Append an element */
    public add(num: number): void {
        // Increase capacity if the length equals the capacity
        if (this._size === this._capacity) this.extendCapacity();
        // Append the new element to the list
        this.arr[this._size] = num;
        this._size++;
    }

    /* Insert an element in the middle */
    public insert(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        // Increase capacity when the elements would no longer fit
        if (this._size === this._capacity) {
            this.extendCapacity();
        }
        // Shift the elements from index onward one position to the right
        for (let j = this._size - 1; j >= index; j--) {
            this.arr[j + 1] = this.arr[j];
        }
        // Update the element count
        this.arr[index] = num;
        this._size++;
    }

    /* Remove an element */
    public remove(index: number): number {
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        let num = this.arr[index];
        // Shift the elements after index one position to the left
        for (let j = index; j < this._size - 1; j++) {
            this.arr[j] = this.arr[j + 1];
        }
        // Update the element count
        this._size--;
        // Return the removed element
        return num;
    }

    /* Increase the list capacity */
    public extendCapacity(): void {
        // Create an array of length size and copy the original array into it
        this.arr = this.arr.concat(
            new Array(this.capacity() * (this.extendRatio - 1))
        );
        // Update the list capacity
        this._capacity = this.arr.length;
    }

    /* Convert the list to an array */
    public toArray(): number[] {
        let size = this.size();
        // Convert only the elements within the current list length
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Driver Code */
/* Initialize the list */
const nums = new MyList();
/* Append an element */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `List nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}`
);

/* Insert an element in the middle */
nums.insert(3, 6);
console.log(`After inserting 6 at index 3, nums = ${nums.toArray()}`);

/* Remove an element */
nums.remove(3);
console.log(`After removing the element at index 3, nums = ${nums.toArray()}`);

/* Access an element */
const num = nums.get(1);
console.log(`Reading index 1 gives num = ${num}`);

/* Update an element */
nums.set(1, 0);
console.log(`After setting the element at index 1 to 0, nums = ${nums.toArray()}`);

/* Test capacity growth */
for (let i = 0; i < 10; i++) {
    // At i = 5, the list length would exceed its capacity, so the list grows
    nums.add(i);
}
console.log(
    `After increasing capacity, nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}`
);

export {};
