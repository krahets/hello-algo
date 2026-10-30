/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Queue implemented with a circular array */
class ArrayQueue {
  private:
    int *nums;       // Array that stores the queue elements
    int front;       // Front index, identifying the first element
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

    /* Enqueue */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "Queue is full" << endl;
            return;
        }
        // Calculate the rear index, one position past the last element
        // Use modulo to wrap rear to the beginning when it passes the end of the array
        int rear = (front + queSize) % queCapacity;
        // Add num to the rear
        nums[rear] = num;
        queSize++;
    }

    /* Dequeue */
    int pop() {
        int num = peek();
        // Advance the front index by one position, wrapping to the beginning if it passes the end
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* Access the front element */
    int peek() {
        if (isEmpty())
            throw out_of_range("Queue is empty");
        return nums[front];
    }

    /* Convert the array to a vector and return it */
    vector<int> toVector() {
        // Copy only the elements in the occupied range
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
    cout << "Queue queue = ";
    printVector(queue->toVector());

    /* Access the front element */
    int peek = queue->peek();
    cout << "Front element peek = " << peek << endl;

    /* Dequeue an element */
    peek = queue->pop();
    cout << "Dequeued element pop = " << peek << "; after dequeueing, queue = ";
    printVector(queue->toVector());

    /* Get the queue size */
    int size = queue->size();
    cout << "Queue size = " << size << endl;

    /* Check whether the queue is empty */
    bool empty = queue->isEmpty();
    cout << "Is the queue empty = " << empty << endl;

    /* Test the circular array */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "Round " << i << " : after enqueue + dequeue, queue = ";
        printVector(queue->toVector());
    }

    // Free memory
    delete queue;

    return 0;
}
