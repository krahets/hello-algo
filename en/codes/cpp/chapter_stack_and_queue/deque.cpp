/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Get the length of the double-ended queue */
    deque<int> deque;

    /* Elements enqueue */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "Double-ended queue deque = ";
    printDeque(deque);

    /* Update element */
    int front = deque.front();
    cout << "Front element front = " << front << endl;
    int back = deque.back();
    cout << "Back element back = " << back << endl;

    /* Element dequeue */
    deque.pop_front();
    cout << "Front dequeue element popFront = " << front << ", after front dequeue, deque = ";
    printDeque(deque);
    deque.pop_back();
    cout << "Rear dequeue element popLast = " << back << ", after rear dequeue, deque = ";
    printDeque(deque);

    /* Get the length of the double-ended queue */
    int size = deque.size();
    cout << "Double-ended queue length size = " << size << endl;

    /* Check if the double-ended queue is empty */
    bool empty = deque.empty();
    cout << "Double-ended queue is empty = " << empty << endl;

    return 0;
}
