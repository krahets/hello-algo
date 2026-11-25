/**
 * File: my_list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* List class */
class MyList {
    #arr = new Array(); // Array that stores the list elements
    #capacity = 10; // List capacity
    #size = 0; // List length (current number of elements)
    #extendRatio = 2; // Factor by which the list capacity grows

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
        // Throw an exception if the index is out of bounds, here and below
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        return this.#arr[index];
    }

    /* Update an element */
    set(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        this.#arr[index] = num;
    }

    /* Append an element */
    add(num) {
        // Increase capacity if the length equals the capacity
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Append the new element to the list
        this.#arr[this.#size] = num;
        this.#size++;
    }

    /* Insert an element in the middle */
    insert(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        // Increase capacity when the elements would no longer fit
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Shift the elements from index onward one position to the right
        for (let j = this.#size - 1; j >= index; j--) {
            this.#arr[j + 1] = this.#arr[j];
        }
        // Update the element count
        this.#arr[index] = num;
        this.#size++;
    }

    /* Remove an element */
    remove(index) {
        if (index < 0 || index >= this.#size) throw new Error('Index out of bounds');
        let num = this.#arr[index];
        // Shift the elements after index one position to the left
        for (let j = index; j < this.#size - 1; j++) {
            this.#arr[j] = this.#arr[j + 1];
        }
        // Update the element count
        this.#size--;
        // Return the removed element
        return num;
    }

    /* Increase the list capacity */
    extendCapacity() {
        // Create an array extendRatio times as long and copy the original array into it
        this.#arr = this.#arr.concat(
            new Array(this.capacity() * (this.#extendRatio - 1))
        );
        // Update the list capacity
        this.#capacity = this.#arr.length;
    }

    /* Convert the list to an array */
    toArray() {
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
