/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Queue implemented with a linked list */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // Head node front and tail node rear
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // Traverse the linked list and delete each node to free its memory
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

    /* Enqueue */
    void push(int num) {
        // Add num after the tail node
        ListNode *node = new ListNode(num);
        // If the queue is empty, make both the head and tail point to this node
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // If the queue is not empty, add this node after the tail node
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* Dequeue */
    int pop() {
        int num = peek();
        // Remove the head node
        ListNode *tmp = front;
        front = front->next;
        // Free memory
        delete tmp;
        queSize--;
        return num;
    }

    /* Access the front element */
    int peek() {
        if (size() == 0)
            throw out_of_range("Queue is empty");
        return front->val;
    }

    /* Convert the linked list to a vector and return it */
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

    // Free memory
    delete queue;

    return 0;
}
