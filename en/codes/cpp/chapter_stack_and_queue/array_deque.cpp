/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Deque implemented with a circular array */
class ArrayDeque {
  private:
    vector<int> nums; // Array for storing deque elements
    int front;        // Front index, identifying the first element
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

    /* Calculate an index in the circular array */
    int index(int i) {
        // Use modulo to connect the end of the array to its beginning
        // When i passes the end of the array, wrap around to the beginning
        // When i passes the beginning of the array, wrap around to the end
        return (i + capacity()) % capacity();
    }

    /* Enqueue at the front */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "Deque is full" << endl;
            return;
        }
        // Move the front index one position to the left
        // Use modulo to wrap front to the end when it passes the beginning of the array
        front = index(front - 1);
        // Add num to the front
        nums[front] = num;
        queSize++;
    }

    /* Enqueue at the rear */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "Deque is full" << endl;
            return;
        }
        // Calculate the rear index, one position past the last element
        int rear = index(front + queSize);
        // Add num to the rear
        nums[rear] = num;
        queSize++;
    }

    /* Dequeue from the front */
    int popFirst() {
        int num = peekFirst();
        // Advance the front index by one position
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Dequeue from the rear */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Access the front element */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        return nums[front];
    }

    /* Access the rear element */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        // Calculate the index of the last element
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Return a vector for printing */
    vector<int> toVector() {
        // Copy only the elements in the occupied range
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
    cout << "Deque deque = ";
    printVector(deque->toVector());

    /* Access an element */
    int peekFirst = deque->peekFirst();
    cout << "Front element peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "Rear element peekLast = " << peekLast << endl;

    /* Enqueue elements */
    deque->pushLast(4);
    cout << "After enqueuing element 4 at the rear, deque = ";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "After enqueuing element 1 at the front, deque = ";
    printVector(deque->toVector());

    /* Dequeue an element */
    int popLast = deque->popLast();
    cout << "Element dequeued from the rear = " << popLast << ", after dequeuing from the rear, deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Element dequeued from the front = " << popFirst << ", after dequeuing from the front, deque = ";
    printVector(deque->toVector());

    /* Get the deque size */
    int size = deque->size();
    cout << "Deque size = " << size << endl;

    /* Check whether the deque is empty */
    bool isEmpty = deque->isEmpty();
    cout << "Is the deque empty = " << boolalpha << isEmpty << endl;
    return 0;
}
