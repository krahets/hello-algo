/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Queue based on linked list implementation */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // Head node front, tail node rear
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // Traverse linked list to delete nodes and free memory
        freeMemoryLinkedList(front);
    }

    /* Get the length of the queue */
    int size() {
        return queSize;
    }

    /* Check if the queue is empty */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Enqueue */
    void push(int num) {
        // Add num after the tail node
        ListNode *node = new ListNode(num);
        // If the queue is empty, make both front and rear point to the node
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // If the queue is not empty, add the node after the tail node
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* Dequeue */
    int pop() {
        int num = peek();
        // Delete head node
        ListNode *tmp = front;
        front = front->next;
        // Free memory
        delete tmp;
        queSize--;
        return num;
    }

    /* Return list for printing */
    int peek() {
        if (size() == 0)
            throw out_of_range("Queue is empty");
        return front->val;
    }

    /* Convert linked list to Vector and return */
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
    /* Access front of the queue element */
    LinkedListQueue *queue = new LinkedListQueue();

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

    // Free memory
    delete queue;

    return 0;
}
