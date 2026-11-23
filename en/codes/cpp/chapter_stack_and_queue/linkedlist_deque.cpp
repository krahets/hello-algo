/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Doubly linked list node */
struct DoublyListNode {
    int val;              // Node value
    DoublyListNode *next; // Pointer to the next node
    DoublyListNode *prev; // Pointer to the previous node
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* Deque implemented with a doubly linked list */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // Head node front and tail node rear
    int queSize = 0;              // Deque size

  public:
    /* Constructor */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* Destructor */
    ~LinkedListDeque() {
        // Traverse the linked list and delete each node to free its memory
        DoublyListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* Get the deque size */
    int size() {
        return queSize;
    }

    /* Check whether the deque is empty */
    bool isEmpty() {
        return size() == 0;
    }

    /* Enqueue operation */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // If the linked list is empty, make both front and rear point to node
        if (isEmpty())
            front = rear = node;
        // Enqueue at the front
        else if (isFront) {
            // Add node to the head of the linked list
            front->prev = node;
            node->next = front;
            front = node; // Update the head node
        // Enqueue at the rear
        } else {
            // Add node to the tail of the linked list
            rear->next = node;
            node->prev = rear;
            rear = node; // Update the tail node
        }
        queSize++; // Update the deque size
    }

    /* Enqueue at the front */
    void pushFirst(int num) {
        push(num, true);
    }

    /* Enqueue at the rear */
    void pushLast(int num) {
        push(num, false);
    }

    /* Dequeue operation */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        int val;
        // When the deque size is 1, the head and tail point to the same node
        if (queSize == 1) {
            val = front->val;
            delete front; // Both point to the same node, so free it only once
            front = nullptr;
            rear = nullptr;
        }
        // Dequeue from the front
        else if (isFront) {
            val = front->val; // Save the head node value
            // Remove the head node
            DoublyListNode *fNext = front->next;
            fNext->prev = nullptr;
            front->next = nullptr;
            delete front;
            front = fNext; // Update the head node
        // Dequeue from the rear
        } else {
            val = rear->val; // Save the tail node value
            // Remove the tail node
            DoublyListNode *rPrev = rear->prev;
            rPrev->next = nullptr;
            rear->prev = nullptr;
            delete rear;
            rear = rPrev; // Update the tail node
        }
        queSize--; // Update the deque size
        return val;
    }

    /* Dequeue from the front */
    int popFirst() {
        return pop(true);
    }

    /* Dequeue from the rear */
    int popLast() {
        return pop(false);
    }

    /* Access the front element */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        return front->val;
    }

    /* Access the rear element */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        return rear->val;
    }

    /* Return a vector for printing */
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

/* Driver code */
int main() {
    /* Initialize the deque */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "Deque deque = ";
    printVector(deque->toVector());

    /* Access an element */
    int peekFirst = deque->peekFirst();
    cout << "Front element peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "Rear element peekLast = " << peekLast << endl;

    /* Enqueue elements */
    deque->pushLast(4);
    cout << "After enqueuing element 4 at the rear, deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "After enqueuing element 1 at the front, deque = ";
    printVector(deque->toVector());

    /* Dequeue an element */
    int popLast = deque->popLast();
    cout << "Element dequeued from the rear = " << popLast << ", after dequeuing from the rear, deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Element dequeued from the front = " << popFirst << ", after dequeuing from the front, deque = ";
    printVector(deque->toVector());

    /* Get the deque size */
    int size = deque->size();
    cout << "Deque size = " << size << endl;

    /* Check whether the deque is empty */
    bool isEmpty = deque->isEmpty();
    cout << "Is the deque empty = " << boolalpha << isEmpty << endl;

    // Free memory
    delete deque;

    return 0;
}
