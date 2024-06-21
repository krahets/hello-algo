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
    int extendRatio = 2;   // Multiple for each list expansion

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

    /* Access element */
    int get(int index) {
        // If the index is out of bounds, throw an exception, as below
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        return arr[index];
    }

    /* Update element */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        arr[index] = num;
    }

    /* Add element at the end */
    void add(int num) {
        // When the number of elements exceeds capacity, trigger the expansion mechanism
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // Update the number of elements
        arrSize++;
    }

    /* Insert element in the middle */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        // When the number of elements exceeds capacity, trigger the expansion mechanism
        if (size() == capacity())
            extendCapacity();
        // Move all elements after `index` one position backward
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
        // Move all elements after `index` one position forward
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Update the number of elements
        arrSize--;
        // Return the removed element
        return num;
    }

    /* Extend list */
    void extendCapacity() {
        // Create a new array with a length multiple of the original array by extendRatio
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

    /* Convert the list to a Vector for printing */
    vector<int> toVector() {
        // Only convert elements within valid length range
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
    /* Add element at the end */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "List nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "Capacity = " << nums->capacity() << ", length = " << nums->size() << endl;

    /* Insert element in the middle */
    nums->insert(3, 6);
    cout << "Insert the number 6 at index 3, resulting in nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Remove element */
    nums->remove(3);
    cout << "Remove the element at index 3, resulting in nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Access element */
    int num = nums->get(1);
    cout << "Access the element at index 1, obtained num = " << num << endl;

    /* Update element */
    nums->set(1, 0);
    cout << "Update the element at index 1 to 0, resulting in nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Test expansion mechanism */
    for (int i = 0; i < 10; i++) {
        // At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism at this time
        nums->add(i);
    }
    cout << "After extending, list nums = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "Capacity = " << nums->capacity() << ", length = " << nums->size() << endl;

    // Free memory
    delete nums;

    return 0;
}
