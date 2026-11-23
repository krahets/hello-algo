/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver code */
int main() {
    /* Initialize the deque */
    deque<int> deque;

    /* Enqueue elements */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "Deque deque = ";
    printDeque(deque);

    /* Access an element */
    int front = deque.front();
    cout << "Front element front = " << front << endl;
    int back = deque.back();
    cout << "Rear element back = " << back << endl;

    /* Dequeue an element */
    deque.pop_front();
    cout << "Element removed from the front, popFront = " << front << ", after dequeuing from the front, deque = ";
    printDeque(deque);
    deque.pop_back();
    cout << "Element removed from the rear, popLast = " << back << ", after dequeuing from the rear, deque = ";
    printDeque(deque);

    /* Get the deque size */
    int size = deque.size();
    cout << "Deque size = " << size << endl;

    /* Check whether the deque is empty */
    bool empty = deque.empty();
    cout << "Is the deque empty = " << empty << endl;

    return 0;
}
