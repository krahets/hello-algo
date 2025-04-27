/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Double-linked list node */
struct DoublyListNode {
    int val;              // Node value
    DoublyListNode *next; // Pointer to successor node
    DoublyListNode *prev; // Pointer to predecessor node
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* Double-ended queue class based on double-linked list */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // Front node front, back node rear
    int queSize = 0;              // Length of the double-ended queue

  public:
    /* Constructor */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* Destructor */
    ~LinkedListDeque() {
        // Traverse the linked list, remove nodes, free memory
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

    /* Determine if the double-ended queue is empty */
    bool isEmpty() {
        return size() == 0;
    }

    /* Enqueue operation */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // If the list is empty, make front and rear both point to node
        if (isEmpty())
            front = rear = node;
        // Front enqueue operation
        else if (isFront) {
            // Add node to the head of the list
            front->prev = node;
            node->next = front;
            front = node; // Update head node
        // Rear enqueue operation
        } else {
            // Add node to the tail of the list
            rear->next = node;
            node->prev = rear;
            rear = node; // Update tail node
        }
        queSize++; // Update queue length
    }

    /* Front enqueue */
    void pushFirst(int num) {
        push(num, true);
    }

    /* Rear enqueue */
    void pushLast(int num) {
        push(num, false);
    }

    /* Dequeue operation */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("Queue is empty");
        int val;
        // Front dequeue operation
        if (isFront) {
            val = front->val; // Temporarily store the head node value
            // Remove head node
            DoublyListNode *fNext = front->next;
            if (fNext != nullptr) {
                fNext->prev = nullptr;
                front->next = nullptr;
            }
            delete front;
            front = fNext; // Update head node
        // Rear dequeue operation
        } else {
            val = rear->val; // Temporarily store the tail node value
            // Remove tail node
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

    /* Front dequeue */
    int popFirst() {
        return pop(true);
    }

    /* Rear dequeue */
    int popLast() {
        return pop(false);
    }

    /* Access front element */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Double-ended queue is empty");
        return front->val;
    }

    /* Access rear element */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Double-ended queue is empty");
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
    /* Initialize double-ended queue */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "Double-ended queue deque = ";
    printVector(deque->toVector());

    /* Access element */
    int peekFirst = deque->peekFirst();
    cout << "Front element peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "Back element peekLast = " << peekLast << endl;

    /* Element enqueue */
    deque->pushLast(4);
    cout << "Element 4 rear enqueued, deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "Element 1 enqueued at the head, deque = ";
    printVector(deque->toVector());

    /* Element dequeue */
    int popLast = deque->popLast();
    cout << "Deque tail element = " << popLast << ", after dequeuing from the tail";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Deque front element = " << popFirst << ", after dequeuing from the front";
    printVector(deque->toVector());

    /* Get the length of the double-ended queue */
    int size = deque->size();
    cout << "Length of the double-ended queue size = " << size << endl;

    /* Determine if the double-ended queue is empty */
    bool isEmpty = deque->isEmpty();
    cout << "Is the double-ended queue empty = " << boolalpha << isEmpty << endl;

    // Free memory
    delete deque;

    return 0;
}
