/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Double-ended queue class based on circular array */
class ArrayDeque {
  private:
    vector<int> nums; // Array used to store elements of the double-ended queue
    int front;        // Front pointer, pointing to the front element
    int queSize;      // Length of the double-ended queue

  public:
    /* Constructor */
    ArrayDeque(int capacity) {
        nums.resize(capacity);
        front = queSize = 0;
    }

    /* Get the capacity of the double-ended queue */
    int capacity() {
        return nums.size();
    }

    /* Get the length of the double-ended queue */
    int size() {
        return queSize;
    }

    /* Determine if the double-ended queue is empty */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Calculate circular array index */
    int index(int i) {
        // Implement circular array by modulo operation
        // When i exceeds the tail of the array, return to the head
        // When i exceeds the head of the array, return to the tail
        return (i + capacity()) % capacity();
    }

    /* Front enqueue */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "Double-ended queue is full" << endl;
            return;
        }
        // Move the front pointer one position to the left
        // Implement front crossing the head of the array to return to the tail by modulo operation
        front = index(front - 1);
        // Add num to the front
        nums[front] = num;
        queSize++;
    }

    /* Rear enqueue */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "Double-ended queue is full" << endl;
            return;
        }
        // Calculate rear pointer, pointing to rear index + 1
        int rear = index(front + queSize);
        // Add num to the rear
        nums[rear] = num;
        queSize++;
    }

    /* Front dequeue */
    int popFirst() {
        int num = peekFirst();
        // Move front pointer one position backward
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Rear dequeue */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Access front element */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Double-ended queue is empty");
        return nums[front];
    }

    /* Access rear element */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Double-ended queue is empty");
        // Calculate rear element index
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Return array for printing */
    vector<int> toVector() {
        // Only convert elements within valid length range
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* Initialize double-ended queue */
    ArrayDeque *deque = new ArrayDeque(10);
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "Double-ended queue deque = ";
    printVector(deque->toVector());

    /* Access element */
    int peekFirst = deque->peekFirst();
    cout << "Front element peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "Back element peekLast = " << peekLast << endl;

    /* Element enqueue */
    deque->pushLast(4);
    cout << "Element 4 enqueued at the tail, deque = ";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "Element 1 enqueued at the head, deque = ";
    printVector(deque->toVector());

    /* Element dequeue */
    int popLast = deque->popLast();
    cout << "Deque tail element = " << popLast << ", after dequeuing from the tail";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Deque front element = " << popFirst << ", after dequeuing from the front";
    printVector(deque->toVector());

    /* Get the length of the double-ended queue */
    int size = deque->size();
    cout << "Length of the double-ended queue size = " << size << endl;

    /* Determine if the double-ended queue is empty */
    bool isEmpty = deque->isEmpty();
    cout << "Is the double-ended queue empty = " << boolalpha << isEmpty << endl;
    return 0;
}
