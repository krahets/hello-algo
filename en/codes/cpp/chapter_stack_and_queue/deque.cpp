/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Initialize double-ended queue */
    deque<int> deque;

    /* Element enqueue */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "Double-ended queue deque = ";
    printDeque(deque);

    /* Access element */
    int front = deque.front();
    cout << "Front element of the queue front = " << front << endl;
    int back = deque.back();
    cout << "Back element of the queue back = " << back << endl;

    /* Element dequeue */
    deque.pop_front();
    cout << "Front element dequeued = " << front << ", after dequeuing from the front";
    printDeque(deque);
    deque.pop_back();
    cout << "Back element dequeued = " << back << ", after dequeuing from the back";
    printDeque(deque);

    /* Get the length of the double-ended queue */
    int size = deque.size();
    cout << "Length of the double-ended queue size = " << size << endl;

    /* Determine if the double-ended queue is empty */
    bool empty = deque.empty();
    cout << "Is the double-ended queue empty = " << empty << endl;

    return 0;
}
