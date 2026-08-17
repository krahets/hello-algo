/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Doubly linked list node */
struct DoublyListNode {
    int val;              // Node value
    DoublyListNode *next; // Successor node pointer
    DoublyListNode *prev; // Predecessor node pointer
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* Double-ended queue based on doubly linked list implementation */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // Head node front, tail node rear
    int queSize = 0;              // Length of the double-ended queue

  public:
    /* Constructor */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* Destructor */
    ~LinkedListDeque() {
        // Traverse linked list to delete nodes and free memory
        DoublyListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* Get the length of the double-ended queue */
    int size() {
        return queSize;
    }

    /* Check if the double-ended queue is empty */
    bool isEmpty() {
        return size() == 0;
    }

    /* Enqueue operation */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // If the linked list is empty, make both front and rear point to node
        if (isEmpty())
            front = rear = node;
        // Front of the queue enqueue operation
        else if (isFront) {
            // Add node to the head of the linked list
            front->prev = node;
            node->next = front;
            front = node; // Update head node
        // Rear of the queue enqueue operation
        } else {
            // Add node to the tail of the linked list
            rear->next = node;
            node->prev = rear;
            rear = node; // Update tail node
        }
        queSize++; // Update queue length
    }

    /* Front of the queue enqueue */
    void pushFirst(int num) {
        push(num, true);
    }

    /* Rear of the queue enqueue */
    void pushLast(int num) {
        push(num, false);
    }

    /* Dequeue operation */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("Queue is empty");
        int val;
        // Temporarily store head node value
        if (isFront) {
            val = front->val; // Delete head node
            // Delete head node
            DoublyListNode *fNext = front->next;
            if (fNext != nullptr) {
                fNext->prev = nullptr;
                front->next = nullptr;
            }
            delete front;
            front = fNext; // Update head node
        // Temporarily store tail node value
        } else {
            val = rear->val; // Delete tail node
            // Update tail node
            DoublyListNode *rPrev = rear->prev;
            if (rPrev != nullptr) {
                rPrev->next = nullptr;
                rear->prev = nullptr;
            }
            delete rear;
            rear = rPrev; // Update tail node
        }
        queSize--; // Update queue length
        return val;
    }

    /* Rear of the queue dequeue */
    int popFirst() {
        return pop(true);
    }

    /* Access rear of the queue element */
    int popLast() {
        return pop(false);
    }

    /* Return list for printing */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        return front->val;
    }

    /* Driver Code */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        return rear->val;
    }

    /* Return array for printing */
    vector<int> toVector() {
        DoublyListNode *node = front;
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
    /* Get the length of the double-ended queue */
    LinkedListDeque *deque = new LinkedListDeque();
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
    cout << "After element 4 enqueues at back, deque =";
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

    // Free memory
    delete deque;

    return 0;
}
