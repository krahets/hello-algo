/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Queue class based on circular array */
class ArrayQueue {
  private:
    int *nums;       // Array for storing queue elements
    int front;       // Front pointer, pointing to the front element
    int queSize;     // Queue length
    int queCapacity; // Queue capacity

  public:
    ArrayQueue(int capacity) {
        // Initialize an array
        nums = new int[capacity];
        queCapacity = capacity;
        front = queSize = 0;
    }

    ~ArrayQueue() {
        delete[] nums;
    }

    /* Get the capacity of the queue */
    int capacity() {
        return queCapacity;
    }

    /* Get the length of the queue */
    int size() {
        return queSize;
    }

    /* Determine if the queue is empty */
    bool isEmpty() {
        return size() == 0;
    }

    /* Enqueue */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "Queue is full" << endl;
            return;
        }
        // Calculate rear pointer, pointing to rear index + 1
        // Use modulo operation to wrap the rear pointer from the end of the array back to the start
        int rear = (front + queSize) % queCapacity;
        // Add num to the rear
        nums[rear] = num;
        queSize++;
    }

    /* Dequeue */
    int pop() {
        int num = peek();
        // Move front pointer one position backward, returning to the head of the array if it exceeds the tail
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* Access front element */
    int peek() {
        if (isEmpty())
            throw out_of_range("Queue is empty");
        return nums[front];
    }

    /* Convert array to Vector and return */
    vector<int> toVector() {
        // Only convert elements within valid length range
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* Driver Code */
int main() {
    /* Initialize queue */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

    /* Element enqueue */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "Queue queue = ";
    printVector(queue->toVector());

    /* Access front element */
    int peek = queue->peek();
    cout << "Front element peek = " << peek << endl;

    /* Element dequeue */
    peek = queue->pop();
    cout << "Element dequeued = " << peek << ", after dequeuing";
    printVector(queue->toVector());

    /* Get the length of the queue */
    int size = queue->size();
    cout << "Length of the queue size = " << size << endl;

    /* Determine if the queue is empty */
    bool empty = queue->isEmpty();
    cout << "Is the queue empty = " << empty << endl;

    /* Test circular array */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "After the " << i << "th round of enqueueing + dequeuing, queue = ";
        printVector(queue->toVector());
    }

    // Free memory
    delete queue;

    return 0;
}
