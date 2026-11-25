/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* List class */
class MyList {
  private:
    int *arr;             // Array that stores the list elements
    int arrCapacity = 10; // List capacity
    int arrSize = 0;      // List length (current number of elements)
    int extendRatio = 2;   // Factor by which the list capacity grows

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
        // Throw an exception if the index is out of bounds, here and below
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

    /* Append an element */
    void add(int num) {
        // Increase capacity when the elements would no longer fit
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // Update the element count
        arrSize++;
    }

    /* Insert an element in the middle */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        // Increase capacity when the elements would no longer fit
        if (size() == capacity())
            extendCapacity();
        // Shift the elements from index onward one position to the right
        for (int j = size() - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Update the element count
        arrSize++;
    }

    /* Remove an element */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("Index out of bounds");
        int num = arr[index];
        // Shift the elements after index one position to the left
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Update the element count
        arrSize--;
        // Return the removed element
        return num;
    }

    /* Increase the list capacity */
    void extendCapacity() {
        // Create an array whose length is extendRatio times the original length
        int newCapacity = capacity() * extendRatio;
        int *tmp = arr;
        arr = new int[newCapacity];
        // Copy all elements from the original array into the new array
        for (int i = 0; i < size(); i++) {
            arr[i] = tmp[i];
        }
        // Free memory
        delete[] tmp;
        arrCapacity = newCapacity;
    }

    /* Convert the list to a vector for printing */
    vector<int> toVector() {
        // Convert only the elements within the current list length
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* Driver Code */
int main() {
    /* Initialize the list */
    MyList *nums = new MyList();
    /* Append an element */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "List nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "Capacity = " << nums->capacity() << " and length = " << nums->size() << endl;

    /* Insert an element in the middle */
    nums->insert(3, 6);
    cout << "After inserting 6 at index 3, nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Remove an element */
    nums->remove(3);
    cout << "After removing the element at index 3, nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Access an element */
    int num = nums->get(1);
    cout << "Reading index 1 gives num = " << num << endl;

    /* Update an element */
    nums->set(1, 0);
    cout << "After setting the element at index 1 to 0, nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Test capacity growth */
    for (int i = 0; i < 10; i++) {
        // At i = 5, the list length would exceed its capacity, so the list grows
        nums->add(i);
    }
    cout << "After increasing capacity, nums = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "Capacity = " << nums->capacity() << " and length = " << nums->size() << endl;

    // Free memory
    delete nums;

    return 0;
}
