/**
 * File: my_list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* List class */
class MyList {
    #arr = new Array(); // Array (stores the list elements)
    #capacity = 10; // List capacity
    #size = 0; // List length (current number of elements)
    #extendRatio = 2; // Factor by which the list capacity grows each time

    /* Constructor */
    constructor() {
        this.#arr = new Array(this.#capacity);
    }

    /* Get the list length (current number of elements)*/
    size() {
        return this.#size;
    }

    /* Get the list capacity */
    capacity() {
        return this.#capacity;
    }

    /* Access an element */
    get(index) {
        // Throw an exception if the index is out of bounds; the same applies below
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        return this.#arr[index];
    }

    /* Update an element */
    set(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        this.#arr[index] = num;
    }

    /* Append an element at the end */
    add(num) {
        // Grow the capacity if the length equals the capacity
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Append the new element to the end of the list
        this.#arr[this.#size] = num;
        this.#size++;
    }

    /* Insert an element in the middle */
    insert(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        // Grow the capacity when adding an element would exceed it
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Shift all elements at and after index `index` one position to the right
        for (let j = this.#size - 1; j >= index; j--) {
            this.#arr[j + 1] = this.#arr[j];
        }
        // Update the number of elements
        this.#arr[index] = num;
        this.#size++;
    }

    /* Remove an element */
    remove(index) {
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        let num = this.#arr[index];
        // Shift all elements after index `index` one position to the left
        for (let j = index; j < this.#size - 1; j++) {
            this.#arr[j] = this.#arr[j + 1];
        }
        // Update the number of elements
        this.#size--;
        // Return the removed element
        return num;
    }

    /* Grow the list capacity */
    extendCapacity() {
        // Create an array extendRatio times the original length and copy the original array into it
        this.#arr = this.#arr.concat(
            new Array(this.capacity() * (this.#extendRatio - 1))
        );
        // Update the list capacity
        this.#capacity = this.#arr.length;
    }

    /* Convert the list to an array */
    toArray() {
        let size = this.size();
        // Convert only the list elements within the occupied range
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Driver code */
/* Initialize the list */
const nums = new MyList();
/* Append an element at the end */
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
console.log(`Insert the number 6 at index 3, giving nums = ${nums.toArray()}`);

/* Remove an element */
nums.remove(3);
console.log(`Remove the element at index 3, giving nums = ${nums.toArray()}`);

/* Access an element */
const num = nums.get(1);
console.log(`Access the element at index 1, giving num = ${num}`);

/* Update an element */
nums.set(1, 0);
console.log(`Update the element at index 1 to 0, giving nums = ${nums.toArray()}`);

/* Test capacity growth */
for (let i = 0; i < 10; i++) {
    // When i = 5, the list length would exceed its capacity, triggering capacity growth
    nums.add(i);
}
console.log(
    `After capacity growth, list nums = ${nums.toArray()}, capacity = ${nums.capacity()}, length = ${nums.size()}`
);
