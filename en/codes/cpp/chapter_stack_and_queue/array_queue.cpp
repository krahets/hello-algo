/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Queue based on circular array implementation */
class ArrayQueue {
  private:
    int *nums;       // Array for storing queue elements
    int front;       // Front pointer, points to the front of the queue element
    int queSize;     // Queue length
    int queCapacity; // Queue capacity

  public:
    ArrayQueue(int capacity) {
        // Initialize array
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

    /* Check if the queue is empty */
    bool isEmpty() {
        return size() == 0;
    }

    /* Enqueue */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "Queue is full" << endl;
            return;
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        // Add num to the rear of the queue
        int rear = (front + queSize) % queCapacity;
        // Front pointer moves one position backward
        nums[rear] = num;
        queSize++;
    }

    /* Dequeue */
    int pop() {
        int num = peek();
        // Move front pointer backward by one position, if it passes the tail, return to array head
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* Return list for printing */
    int peek() {
        if (isEmpty())
            throw out_of_range("Queue is empty");
        return nums[front];
    }

    /* Convert array to Vector and return */
    vector<int> toVector() {
        // Elements enqueue
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* Driver Code */
int main() {
    /* Access front of the queue element */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

    /* Elements enqueue */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "Queue queue = ";
    printVector(queue->toVector());

    /* Return list for printing */
    int peek = queue->peek();
    cout << "Front element peek = " << peek << endl;

    /* Element dequeue */
    peek = queue->pop();
    cout << "Dequeue element pop = " << peek << ", after dequeue, queue = ";
    printVector(queue->toVector());

    /* Get the length of the queue */
    int size = queue->size();
    cout << "Queue length size = " << size << endl;

    /* Check if the queue is empty */
    bool empty = queue->isEmpty();
    cout << "Queue is empty = " << empty << endl;

    /* Test circular array */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "After round " << i << " enqueue + dequeue, queue = ";
        printVector(queue->toVector());
    }

    // Free memory
    delete queue;

    return 0;
}
