/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* List class */
class MyList {
  private:
    int *arr;             // Array (stores list elements)
    int arrCapacity = 10; // List capacity
    int arrSize = 0;      // List length (current number of elements)
    int extendRatio = 2;   // Multiple by which the list capacity is extended each time

  public:
    /* Constructor */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* Destructor */
    ~MyList() {
        delete[] arr;
    }

    /* Get list length (current number of elements)*/
    int size() {
        return arrSize;
    }

    /* Get list capacity */
    int capacity() {
        return arrCapacity;
    }

    /* Update element */
    int get(int index) {
        // If the index is out of bounds, throw an exception, as below
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        return arr[index];
    }

    /* Add elements at the end */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        arr[index] = num;
    }

    /* Direct traversal of list elements */
    void add(int num) {
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // Update the number of elements
        arrSize++;
    }

    /* Sort list */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        // When the number of elements exceeds capacity, trigger the extension mechanism
        if (size() == capacity())
            extendCapacity();
        // Move all elements after index index forward by one position
        for (int j = size() - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Update the number of elements
        arrSize++;
    }

    /* Remove element */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        int num = arr[index];
        // Create a new array with length _extend_ratio times the original array, and copy the original array to the new array
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Update the number of elements
        arrSize--;
        // Return the removed element
        return num;
    }

    /* Driver Code */
    void extendCapacity() {
        // Create a new array with length extendRatio times the original array
        int newCapacity = capacity() * extendRatio;
        int *tmp = arr;
        arr = new int[newCapacity];
        // Copy all elements from the original array to the new array
        for (int i = 0; i < size(); i++) {
            arr[i] = tmp[i];
        }
        // Free memory
        delete[] tmp;
        arrCapacity = newCapacity;
    }

    /* Convert list to Vector for printing */
    vector<int> toVector() {
        // Elements enqueue
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* Driver Code */
int main() {
    /* Initialize list */
    MyList *nums = new MyList();
    /* Direct traversal of list elements */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "List nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "Capacity = " << nums->capacity() << ", length = " << nums->size() << endl;

    /* Sort list */
    nums->insert(3, 6);
    cout << "Insert number 6 at index 3, resulting in nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Remove element */
    nums->remove(3);
    cout << "Remove element at index 3, resulting in nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Update element */
    int num = nums->get(1);
    cout << "Access element at index 1, get num = " << num << endl;

    /* Add elements at the end */
    nums->set(1, 0);
    cout << "Update element at index 1 to 0, resulting in nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Test capacity expansion mechanism */
    for (int i = 0; i < 10; i++) {
        // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism
        nums->add(i);
    }
    cout << "List nums after expansion = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "Capacity = " << nums->capacity() << ", length = " << nums->size() << endl;

    // Free memory
    delete nums;

    return 0;
}
