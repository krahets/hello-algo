/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Queue backed by a circular array */
class ArrayQueue {
  private:
    int *nums;       // Array that stores the queue elements
    int front;       // Index of the front element
    int queSize;     // Queue size
    int queCapacity; // Queue capacity

  public:
    ArrayQueue(int capacity) {
        // Initialize the array
        nums = new int[capacity];
        queCapacity = capacity;
        front = queSize = 0;
    }

    ~ArrayQueue() {
        delete[] nums;
    }

    /* Get the queue capacity */
    int capacity() {
        return queCapacity;
    }

    /* Get the queue size */
    int size() {
        return queSize;
    }

    /* Check whether the queue is empty */
    bool isEmpty() {
        return size() == 0;
    }

    /* Enqueue an element */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "Queue is full" << endl;
            return;
        }
        // Compute the index one slot past the rear element
        // Use the remainder to wrap rear back to the start of the array
        int rear = (front + queSize) % queCapacity;
        // Add num at the rear
        nums[rear] = num;
        queSize++;
    }

    /* Remove and return the front element */
    int pop() {
        int num = peek();
        // Advance the front index by one, wrapping to the start if it passes the end
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* Peek at the front element */
    int peek() {
        if (isEmpty())
            throw out_of_range("Queue is empty");
        return nums[front];
    }

    /* Return the array elements as a vector */
    vector<int> toVector() {
        // Copy only the elements currently in the queue
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* Driver code */
int main() {
    /* Initialize the queue */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

    /* Enqueue elements */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "queue = ";
    printVector(queue->toVector());

    /* Peek at the front element */
    int peek = queue->peek();
    cout << "Front element (peek) = " << peek << endl;

    /* Dequeue an element */
    peek = queue->pop();
    cout << "Dequeued element (pop) = " << peek << ", queue after removal = ";
    printVector(queue->toVector());

    /* Get the queue size */
    int size = queue->size();
    cout << "Queue size = " << size << endl;

    /* Check whether the queue is empty */
    bool empty = queue->isEmpty();
    cout << "Queue is empty = " << empty << endl;

    /* Test the circular array */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "After round " << i << " of enqueueing and dequeueing, queue = ";
        printVector(queue->toVector());
    }

    // Free the allocated memory
    delete queue;

    return 0;
}
