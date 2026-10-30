/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* List structure */
typedef struct {
    int *arr;        // Array (stores the list elements)
    int capacity;    // List capacity
    int size;        // List size
    int extendRatio; // List capacity growth factor
} MyList;

void extendCapacity(MyList *nums);

/* Constructor */
MyList *newMyList() {
    MyList *nums = malloc(sizeof(MyList));
    nums->capacity = 10;
    nums->arr = malloc(sizeof(int) * nums->capacity);
    nums->size = 0;
    nums->extendRatio = 2;
    return nums;
}

/* Destructor */
void delMyList(MyList *nums) {
    free(nums->arr);
    free(nums);
}

/* Get the list size */
int size(MyList *nums) {
    return nums->size;
}

/* Get the list capacity */
int capacity(MyList *nums) {
    return nums->capacity;
}

/* Access an element */
int get(MyList *nums, int index) {
    assert(index >= 0 && index < nums->size);
    return nums->arr[index];
}

/* Update an element */
void set(MyList *nums, int index, int num) {
    assert(index >= 0 && index < nums->size);
    nums->arr[index] = num;
}

/* Append an element at the end */
void add(MyList *nums, int num) {
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // Grow the capacity
    }
    nums->arr[size(nums)] = num;
    nums->size++;
}

/* Insert an element in the middle */
void insert(MyList *nums, int index, int num) {
    assert(index >= 0 && index < size(nums));
    // Grow the capacity when adding an element would exceed it
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // Grow the capacity
    }
    for (int i = size(nums); i > index; --i) {
        nums->arr[i] = nums->arr[i - 1];
    }
    nums->arr[index] = num;
    nums->size++;
}

/* Remove an element */
// Note: stdio.h already declares a function named remove
int removeItem(MyList *nums, int index) {
    assert(index >= 0 && index < size(nums));
    int num = nums->arr[index];
    for (int i = index; i < size(nums) - 1; i++) {
        nums->arr[i] = nums->arr[i + 1];
    }
    nums->size--;
    return num;
}

/* Grow the list capacity */
void extendCapacity(MyList *nums) {
    // Allocate new space first
    int newCapacity = capacity(nums) * nums->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = nums->arr;

    // Copy the old data into the new array
    for (int i = 0; i < size(nums); i++)
        extend[i] = nums->arr[i];

    // Free the old array
    free(temp);

    // Update the array pointer and capacity
    nums->arr = extend;
    nums->capacity = newCapacity;
}

/* Convert the list to an array for printing */
int *toArray(MyList *nums) {
    return nums->arr;
}

/* Driver code */
int main() {
    /* Initialize the list */
    MyList *nums = newMyList();
    /* Append an element at the end */
    add(nums, 1);
    add(nums, 3);
    add(nums, 2);
    add(nums, 5);
    add(nums, 4);
    printf("List nums = ");
    printArray(toArray(nums), size(nums));
    printf("Capacity = %d, size = %d\n", capacity(nums), size(nums));

    /* Insert an element in the middle */
    insert(nums, 3, 6);
    printf("Insert the number 6 at index 3, giving nums = ");
    printArray(toArray(nums), size(nums));

    /* Remove an element */
    removeItem(nums, 3);
    printf("Remove the element at index 3, giving nums = ");
    printArray(toArray(nums), size(nums));

    /* Access an element */
    int num = get(nums, 1);
    printf("Access the element at index 1; num = %d\n", num);

    /* Update an element */
    set(nums, 1, 0);
    printf("Update the element at index 1 to 0, giving nums = ");
    printArray(toArray(nums), size(nums));

    /* Test capacity growth */
    for (int i = 0; i < 10; i++) {
        // When i = 5, the list length would exceed its capacity, triggering capacity growth
        add(nums, i);
    }

    printf("List after capacity growth, nums = ");
    printArray(toArray(nums), size(nums));
    printf("Capacity = %d, size = %d\n", capacity(nums), size(nums));

    /* Free the allocated memory */
    delMyList(nums);

    return 0;
}
