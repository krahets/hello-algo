/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* List class */
class MyList {
  private:
    int *arr;             // Array (stores the list elements)
    int arrCapacity = 10; // List capacity
    int arrSize = 0;      // List length (current number of elements)
    int extendRatio = 2;   // Factor by which the list capacity grows each time

  public:
    /* Constructor */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* Destructor */
    ~MyList() {
        delete[] arr;
    }

    /* Get the list length (current number of elements)*/
    int size() {
        return arrSize;
    }

    /* Get the list capacity */
    int capacity() {
        return arrCapacity;
    }

    /* Access an element */
    int get(int index) {
        // Raise an exception if the index is out of bounds; the same applies below
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        return arr[index];
    }

    /* Update an element */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        arr[index] = num;
    }

    /* Append an element at the end */
    void add(int num) {
        // Grow the capacity when adding an element would exceed it
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // Update the number of elements
        arrSize++;
    }

    /* Insert an element in the middle */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        // Grow the capacity when adding an element would exceed it
        if (size() == capacity())
            extendCapacity();
        // Shift all elements at and after index `index` one position to the right
        for (int j = size() - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Update the number of elements
        arrSize++;
    }

    /* Remove an element */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        int num = arr[index];
        // Shift all elements after index `index` one position to the left
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Update the number of elements
        arrSize--;
        // Return the removed element
        return num;
    }

    /* Grow the list capacity */
    void extendCapacity() {
        // Create a new array with extendRatio times the original array's length
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

    /* Convert the list to a vector for printing */
    vector<int> toVector() {
        // Convert only the list elements within the occupied range
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* Driver code */
int main() {
    /* Initialize the list */
    MyList *nums = new MyList();
    /* Append an element at the end */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "List nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "Capacity = " << nums->capacity() << " , size = " << nums->size() << endl;

    /* Insert an element in the middle */
    nums->insert(3, 6);
    cout << "Insert the number 6 at index 3, giving nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Remove an element */
    nums->remove(3);
    cout << "Remove the element at index 3, giving nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Access an element */
    int num = nums->get(1);
    cout << "Access the element at index 1, giving num = " << num << endl;

    /* Update an element */
    nums->set(1, 0);
    cout << "Update the element at index 1 to 0, giving nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Test capacity growth */
    for (int i = 0; i < 10; i++) {
        // When i = 5, the list length would exceed its capacity, triggering capacity growth
        nums->add(i);
    }
    cout << "List after capacity growth, nums = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "Capacity = " << nums->capacity() << " , size = " << nums->size() << endl;

    // Free memory
    delete nums;

    return 0;
}
