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

/* Deque backed by a doubly linked list */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // front points to the head node and rear to the tail node
    int queSize = 0;              // Deque size

  public:
    /* Constructor */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* Destructor */
    ~LinkedListDeque() {
        // Walk the list and delete each node to free its memory
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

    /* Add an element at either end */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // If the list is empty, point both front and rear at node
        if (isEmpty())
            front = rear = node;
        // Add at the front
        else if (isFront) {
            // Link node at the head of the list
            front->prev = node;
            node->next = front;
            front = node; // Update the head
        // Add at the rear
        } else {
            // Link node at the tail of the list
            rear->next = node;
            node->prev = rear;
            rear = node; // Update the tail
        }
        queSize++; // Update the deque size
    }

    /* Add an element at the front */
    void pushFirst(int num) {
        push(num, true);
    }

    /* Add an element at the rear */
    void pushLast(int num) {
        push(num, false);
    }

    /* Remove an element from either end */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("Queue is empty");
        int val;
        // When the deque contains one element, the head and tail point to the same node
        if (queSize == 1) {
            val = front->val;
            delete front; // Both point to the same node, so free it only once
            front = nullptr;
            rear = nullptr;
        }
        // Remove from the front
        else if (isFront) {
            val = front->val; // Save the head node's value
            // Remove the head node
            DoublyListNode *fNext = front->next;
            fNext->prev = nullptr;
            front->next = nullptr;
            delete front;
            front = fNext; // Update the head
        // Remove from the rear
        } else {
            val = rear->val; // Save the tail node's value
            // Remove the tail node
            DoublyListNode *rPrev = rear->prev;
            rPrev->next = nullptr;
            rear->prev = nullptr;
            delete rear;
            rear = rPrev; // Update the tail
        }
        queSize--; // Update the deque size
        return val;
    }

    /* Remove and return the front element */
    int popFirst() {
        return pop(true);
    }

    /* Remove and return the rear element */
    int popLast() {
        return pop(false);
    }

    /* Peek at the front element */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Deque is empty");
        return front->val;
    }

    /* Peek at the rear element */
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
    cout << "deque = ";
    printVector(deque->toVector());

    /* Peek at the front and rear elements */
    int peekFirst = deque->peekFirst();
    cout << "Front element (peekFirst) = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "Rear element (peekLast) = " << peekLast << endl;

    /* Add elements to the deque */
    deque->pushLast(4);
    cout << "After adding 4 at the rear, deque = ";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "After adding 1 at the front, deque = ";
    printVector(deque->toVector());

    /* Remove elements from both ends */
    int popLast = deque->popLast();
    cout << "Removed from the rear = " << popLast << ", deque after removal = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Removed from the front = " << popFirst << ", deque after removal = ";
    printVector(deque->toVector());

    /* Get the deque size */
    int size = deque->size();
    cout << "Deque size = " << size << endl;

    /* Check whether the deque is empty */
    bool isEmpty = deque->isEmpty();
    cout << "Deque is empty = " << boolalpha << isEmpty << endl;

    // Free the allocated memory
    delete deque;

    return 0;
}
