/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* List class */
typedef struct {
    int *arr;        // Array (stores list elements)
    int capacity;    // List capacity
    int size;        // List size
    int extendRatio; // List expansion multiplier
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

/* Get list length */
int size(MyList *nums) {
    return nums->size;
}

/* Get list capacity */
int capacity(MyList *nums) {
    return nums->capacity;
}

/* Update element */
int get(MyList *nums, int index) {
    assert(index >= 0 && index < nums->size);
    return nums->arr[index];
}

/* Add elements at the end */
void set(MyList *nums, int index, int num) {
    assert(index >= 0 && index < nums->size);
    nums->arr[index] = num;
}

/* Direct traversal of list elements */
void add(MyList *nums, int num) {
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // Expand capacity
    }
    nums->arr[size(nums)] = num;
    nums->size++;
}

/* Sort list */
void insert(MyList *nums, int index, int num) {
    assert(index >= 0 && index < size(nums));
    // When the number of elements exceeds capacity, trigger the extension mechanism
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // Expand capacity
    }
    for (int i = size(nums); i > index; --i) {
        nums->arr[i] = nums->arr[i - 1];
    }
    nums->arr[index] = num;
    nums->size++;
}

/* Remove element */
// Note: stdio.h occupies the remove keyword
int removeItem(MyList *nums, int index) {
    assert(index >= 0 && index < size(nums));
    int num = nums->arr[index];
    for (int i = index; i < size(nums) - 1; i++) {
        nums->arr[i] = nums->arr[i + 1];
    }
    nums->size--;
    return num;
}

/* Driver Code */
void extendCapacity(MyList *nums) {
    // Allocate space first
    int newCapacity = capacity(nums) * nums->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = nums->arr;

    // Copy old data to new data
    for (int i = 0; i < size(nums); i++)
        extend[i] = nums->arr[i];

    // Free old data
    free(temp);

    // Update new data
    nums->arr = extend;
    nums->capacity = newCapacity;
}

/* Convert list to Array for printing */
int *toArray(MyList *nums) {
    return nums->arr;
}

/* Driver Code */
int main() {
    /* Initialize list */
    MyList *nums = newMyList();
    /* Direct traversal of list elements */
    add(nums, 1);
    add(nums, 3);
    add(nums, 2);
    add(nums, 5);
    add(nums, 4);
    printf("List nums = ");
    printArray(toArray(nums), size(nums));
    printf("Capacity = %d, Length = %d\n", capacity(nums), size(nums));

    /* Sort list */
    insert(nums, 3, 6);
    printf("Insert number 6 at index 3, resulting in nums = ");
    printArray(toArray(nums), size(nums));

    /* Remove element */
    removeItem(nums, 3);
    printf("Remove element at index 3, resulting in nums = ");
    printArray(toArray(nums), size(nums));

    /* Update element */
    int num = get(nums, 1);
    printf("Access element at index 1, get num = %d\n", num);

    /* Add elements at the end */
    set(nums, 1, 0);
    printf("Update element at index 1 to 0, resulting in nums = ");
    printArray(toArray(nums), size(nums));

    /* Test capacity expansion mechanism */
    for (int i = 0; i < 10; i++) {
        // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism
        add(nums, i);
    }

    printf("List nums after expansion = ");
    printArray(toArray(nums), size(nums));
    printf("Capacity = %d, Length = %d\n", capacity(nums), size(nums));

    /* Free allocated memory */
    delMyList(nums);

    return 0;
}
