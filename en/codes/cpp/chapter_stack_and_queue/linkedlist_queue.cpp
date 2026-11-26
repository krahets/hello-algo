/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Queue backed by a linked list */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // front points to the head node and rear to the tail node
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // Walk the list and delete each node to free its memory
        freeMemoryLinkedList(front);
    }

    /* Get the queue size */
    int size() {
        return queSize;
    }

    /* Check whether the queue is empty */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Enqueue an element */
    void push(int num) {
        // Add a node containing num after the tail
        ListNode *node = new ListNode(num);
        // If the queue is empty, point both the head and tail at the new node
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // If the queue has elements, link the new node after the tail
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* Remove and return the front element */
    int pop() {
        int num = peek();
        // Remove the head node
        ListNode *tmp = front;
        front = front->next;
        // Free the allocated memory
        delete tmp;
        queSize--;
        return num;
    }

    /* Peek at the front element */
    int peek() {
        if (size() == 0)
            throw out_of_range("Queue is empty");
        return front->val;
    }

    /* Return the linked list elements as a vector */
    vector<int> toVector() {
        ListNode *node = front;
        vector<int> res(size());
        for (int i = 0; i < res.size(); i++) {
            res[i] = node->val;
            node = node->next;
        }
        return res;
    }
};

/* Driver code */
int main() {
    /* Initialize the queue */
    LinkedListQueue *queue = new LinkedListQueue();

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

    // Free the allocated memory
    delete queue;

    return 0;
}
