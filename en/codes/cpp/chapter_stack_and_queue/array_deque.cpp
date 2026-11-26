/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Deque backed by a circular array */
class ArrayDeque {
  private:
    vector<int> nums; // Array that stores the deque elements
    int front;        // Index of the front element
    int queSize;      // Deque size

  public:
    /* Constructor */
    ArrayDeque(int capacity) {
        nums.resize(capacity);
        front = queSize = 0;
    }

    /* Get the deque capacity */
    int capacity() {
        return nums.size();
    }

    /* Get the deque size */
    int size() {
        return queSize;
    }

    /* Check whether the deque is empty */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Compute the circular array index */
    int index(int i) {
        // Use the remainder to wrap indices around the array
        // When i goes past the end, wrap it back to the start
        // When i goes before the start, wrap it around to the end
        return (i + capacity()) % capacity();
    }

    /* Add an element at the front */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "Deque is full" << endl;
            return;
        }
        // Move the front index one slot to the left
        // Use the remainder to wrap front to the end if it goes before the start
        front = index(front - 1);
        // Add num at the front
        nums[front] = num;
        queSize++;
    }

    /* Add an element at the rear */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "Deque is full" << endl;
            return;
        }
        // Compute the index one slot past the rear element
        int rear = index(front + queSize);
        // Add num at the rear
        nums[rear] = num;
        queSize++;
    }

    /* Remove and return the front element */
    int popFirst() {
        int num = peekFirst();
        // Advance the front index by one
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Remove and return the rear element */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Peek at the front element */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        return nums[front];
    }

    /* Peek at the rear element */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        // Compute the index of the rear element
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Return a vector for printing */
    vector<int> toVector() {
        // Copy only the elements currently in the deque
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* Driver code */
int main() {
    /* Initialize the deque */
    ArrayDeque *deque = new ArrayDeque(10);
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "deque = ";
    printVector(deque->toVector());

    /* Peek at the front and rear elements */
    int peekFirst = deque->peekFirst();
    cout << "Front element (peekFirst) = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "Rear element (peekLast) = " << peekLast << endl;

    /* Add elements to the deque */
    deque->pushLast(4);
    cout << "After adding 4 at the rear, deque = ";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "After adding 1 at the front, deque = ";
    printVector(deque->toVector());

    /* Remove elements from both ends */
    int popLast = deque->popLast();
    cout << "Removed from the rear = " << popLast << ", deque after removal = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Removed from the front = " << popFirst << ", deque after removal = ";
    printVector(deque->toVector());

    /* Get the deque size */
    int size = deque->size();
    cout << "Deque size = " << size << endl;

    /* Check whether the deque is empty */
    bool isEmpty = deque->isEmpty();
    cout << "Deque is empty = " << boolalpha << isEmpty << endl;
    return 0;
}
