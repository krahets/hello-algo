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
    private extendRatio: number = 2; // Multiple for each list expansion

    /* Constructor */
    constructor() {
        this.arr = new Array(this._capacity);
    }

    /* Get list length (current number of elements)*/
    public size(): number {
        return this._size;
    }

    /* Get list capacity */
    public capacity(): number {
        return this._capacity;
    }

    /* Access element */
    public get(index: number): number {
        // If the index is out of bounds, throw an exception, as below
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        return this.arr[index];
    }

    /* Update element */
    public set(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        this.arr[index] = num;
    }

    /* Add element at the end */
    public add(num: number): void {
        // If the length equals the capacity, expansion is necessary
        if (this._size === this._capacity) this.extendCapacity();
        // Add the new element to the end of the list
        this.arr[this._size] = num;
        this._size++;
    }

    /* Insert element in the middle */
    public insert(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('Index out of bounds');
        // When the number of elements exceeds capacity, trigger the expansion mechanism
        if (this._size === this._capacity) {
            this.extendCapacity();
        }
        // Move all elements after `index` one position backward
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
        // Move all elements after `index` one position forward
        for (let j = index; j < this._size - 1; j++) {
            this.arr[j] = this.arr[j + 1];
        }
        // Update the number of elements
        this._size--;
        // Return the removed element
        return num;
    }

    /* Extend list */
    public extendCapacity(): void {
        // Create a new array of size 'size' and copy the original array to the new array
        this.arr = this.arr.concat(
            new Array(this.capacity() * (this.extendRatio - 1))
        );
        // Update list capacity
        this._capacity = this.arr.length;
    }

    /* Convert the list to an array */
    public toArray(): number[] {
        let size = this.size();
        // Only convert elements within valid length range
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
/* Add element at the end */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `列表 nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，长度 = ${nums.size()}`
);

/* Insert element in the middle */
nums.insert(3, 6);
console.log(`在索引 3 处插入数字 6 ，得到 nums = ${nums.toArray()}`);

/* Remove element */
nums.remove(3);
console.log(`删除索引 3 处的元素，得到 nums = ${nums.toArray()}`);

/* Access element */
const num = nums.get(1);
console.log(`访问索引 1 处的元素，得到 num = ${num}`);

/* Update element */
nums.set(1, 0);
console.log(`将索引 1 处的元素更新为 0 ，得到 nums = ${nums.toArray()}`);

/* Test expansion mechanism */
for (let i = 0; i < 10; i++) {
    // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism at this time
    nums.add(i);
}
console.log(
    `扩容后的列表 nums = ${nums.toArray()} ，容量 = ${nums.capacity()} ，长度 = ${nums.size()}`
);

export {};
