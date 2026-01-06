/**
 * File: my_list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* List class */
class MyList {
    #arr = new Array(); // Array (stores list elements)
    #capacity = 10; // List capacity
    #size = 0; // List length (current number of elements)
    #extendRatio = 2; // Multiple by which the list capacity is extended each time

    /* Constructor */
    constructor() {
        this.#arr = new Array(this.#capacity);
    }

    /* Get list length (current number of elements) */
    size() {
        return this.#size;
    }

    /* Get list capacity */
    capacity() {
        return this.#capacity;
    }

    /* Update element */
    get(index) {
        // If the index is out of bounds, throw an exception, as below
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        return this.#arr[index];
    }

    /* Add elements at the end */
    set(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        this.#arr[index] = num;
    }

    /* Direct traversal of list elements */
    add(num) {
        // If length equals capacity, need to expand
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Add new element to end of list
        this.#arr[this.#size] = num;
        this.#size++;
    }

    /* Sort list */
    insert(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Move all elements after index index forward by one position
        for (let j = this.#size - 1; j >= index; j--) {
            this.#arr[j + 1] = this.#arr[j];
        }
        // Update the number of elements
        this.#arr[index] = num;
        this.#size++;
    }

    /* Remove element */
    remove(index) {
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        let num = this.#arr[index];
        // Create a new array with length _extend_ratio times the original array, and copy the original array to the new array
        for (let j = index; j < this.#size - 1; j++) {
            this.#arr[j] = this.#arr[j + 1];
        }
        // Update the number of elements
        this.#size--;
        // Return the removed element
        return num;
    }

    /* Driver Code */
    extendCapacity() {
        // Create a new array with length extendRatio times the original array and copy the original array to the new array
        this.#arr = this.#arr.concat(
            new Array(this.capacity() * (this.#extendRatio - 1))
        );
        // Add elements at the end
        this.#capacity = this.#arr.length;
    }

    /* Convert list to array */
    toArray() {
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
