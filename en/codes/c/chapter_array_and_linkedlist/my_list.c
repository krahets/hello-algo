/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* List class */
typedef struct {
    int *arr;        // Array that stores the list elements
    int capacity;    // List capacity
    int size;        // List size
    int extendRatio; // Factor by which the list capacity grows
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

/* Get the list length */
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

/* Append an element */
void add(MyList *nums, int num) {
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // Increase capacity
    }
    nums->arr[size(nums)] = num;
    nums->size++;
}

/* Insert an element in the middle */
void insert(MyList *nums, int index, int num) {
    assert(index >= 0 && index < size(nums));
    // Increase capacity when the elements would no longer fit
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // Increase capacity
    }
    for (int i = size(nums); i > index; --i) {
        nums->arr[i] = nums->arr[i - 1];
    }
    nums->arr[index] = num;
    nums->size++;
}

/* Remove an element */
// Note: stdio.h already uses the name remove
int removeItem(MyList *nums, int index) {
    assert(index >= 0 && index < size(nums));
    int num = nums->arr[index];
    for (int i = index; i < size(nums) - 1; i++) {
        nums->arr[i] = nums->arr[i + 1];
    }
    nums->size--;
    return num;
}

/* Increase the list capacity */
void extendCapacity(MyList *nums) {
    // Allocate space first
    int newCapacity = capacity(nums) * nums->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = nums->arr;

    // Copy the old data into the new space
    for (int i = 0; i < size(nums); i++)
        extend[i] = nums->arr[i];

    // Free the old storage
    free(temp);

    // Use the new storage
    nums->arr = extend;
    nums->capacity = newCapacity;
}

/* Convert the list to an array for printing */
int *toArray(MyList *nums) {
    return nums->arr;
}

/* Driver Code */
int main() {
    /* Initialize the list */
    MyList *nums = newMyList();
    /* Append an element */
    add(nums, 1);
    add(nums, 3);
    add(nums, 2);
    add(nums, 5);
    add(nums, 4);
    printf("List nums = ");
    printArray(toArray(nums), size(nums));
    printf("Capacity = %d, length = %d\n", capacity(nums), size(nums));

    /* Insert an element in the middle */
    insert(nums, 3, 6);
    printf("After inserting 6 at index 3, nums = ");
    printArray(toArray(nums), size(nums));

    /* Remove an element */
    removeItem(nums, 3);
    printf("After removing the element at index 3, nums = ");
    printArray(toArray(nums), size(nums));

    /* Access an element */
    int num = get(nums, 1);
    printf("Reading index 1 gives num = %d\n", num);

    /* Update an element */
    set(nums, 1, 0);
    printf("After setting the element at index 1 to 0, nums = ");
    printArray(toArray(nums), size(nums));

    /* Test capacity growth */
    for (int i = 0; i < 10; i++) {
        // At i = 5, the list length would exceed its capacity, so the list grows
        add(nums, i);
    }

    printf("After increasing capacity, nums = ");
    printArray(toArray(nums), size(nums));
    printf("Capacity = %d, length = %d\n", capacity(nums), size(nums));

    /* Free the allocated memory */
    delMyList(nums);

    return 0;
}
