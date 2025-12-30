/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Double-ended queue based on circular array implementation */
class ArrayDeque {
  private:
    vector<int> nums; // Array for storing double-ended queue elements
    int front;        // Front pointer, points to the front of the queue element
    int queSize;      // Double-ended queue length

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

    /* Check if the double-ended queue is empty */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Calculate circular array index */
    int index(int i) {
        // Use modulo operation to wrap the array head and tail together
        // When i passes the tail of the array, return to the head
        // When i passes the head of the array, return to the tail
        return (i + capacity()) % capacity();
    }

    /* Front of the queue enqueue */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "Double-ended queue is full" << endl;
            return;
        }
        // Use modulo operation to wrap front around to the tail after passing the head of the array
        // Add num to the front of the queue
        front = index(front - 1);
        // Add num to front of queue
        nums[front] = num;
        queSize++;
    }

    /* Rear of the queue enqueue */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "Double-ended queue is full" << endl;
            return;
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        int rear = index(front + queSize);
        // Front pointer moves one position backward
        nums[rear] = num;
        queSize++;
    }

    /* Rear of the queue dequeue */
    int popFirst() {
        int num = peekFirst();
        // Move front pointer backward by one position
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Access rear of the queue element */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Return list for printing */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        return nums[front];
    }

    /* Driver Code */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        // Initialize double-ended queue
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Return array for printing */
    vector<int> toVector() {
        // Elements enqueue
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* Get the length of the double-ended queue */
    ArrayDeque *deque = new ArrayDeque(10);
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "Double-ended queue deque = ";
    printVector(deque->toVector());

    /* Update element */
    int peekFirst = deque->peekFirst();
    cout << "Front element peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "Rear element peekLast = " << peekLast << endl;

    /* Elements enqueue */
    deque->pushLast(4);
    cout << "After element 4 enqueues at rear, deque = ";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "After element 1 enqueues at front, deque = ";
    printVector(deque->toVector());

    /* Element dequeue */
    int popLast = deque->popLast();
    cout << "Rear dequeue element = " << popLast << ", after rear dequeue, deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Front dequeue element = " << popFirst << ", after front dequeue, deque = ";
    printVector(deque->toVector());

    /* Get the length of the double-ended queue */
    int size = deque->size();
    cout << "Double-ended queue length size = " << size << endl;

    /* Check if the double-ended queue is empty */
    bool isEmpty = deque->isEmpty();
    cout << "Double-ended queue is empty = " << boolalpha << isEmpty << endl;
    return 0;
}
