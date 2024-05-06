/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Queue class based on linked list */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // Front node front, back node rear
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // Traverse the linked list, remove nodes, free memory
        freeMemoryLinkedList(front);
    }

    /* Get the length of the queue */
    int size() {
        return queSize;
    }

    /* Determine if the queue is empty */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Enqueue */
    void push(int num) {
        // Add num behind the tail node
        ListNode *node = new ListNode(num);
        // If the queue is empty, make the head and tail nodes both point to that node
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // If the queue is not empty, add that node behind the tail node
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* Dequeue */
    int pop() {
        int num = peek();
        // Remove head node
        ListNode *tmp = front;
        front = front->next;
        // Free memory
        delete tmp;
        queSize--;
        return num;
    }

    /* Access front element */
    int peek() {
        if (size() == 0)
            throw out_of_range("Queue is empty");
        return front->val;
    }

    /* Convert the linked list to Vector and return */
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

/* Driver Code */
int main() {
    /* Initialize queue */
    LinkedListQueue *queue = new LinkedListQueue();

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

    // Free memory
    delete queue;

    return 0;
}
