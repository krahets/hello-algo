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

    /* Add elements to the deque */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "deque = ";
    printDeque(deque);

    /* Peek at the front and rear elements */
    int front = deque.front();
    cout << "Front element (front) = " << front << endl;
    int back = deque.back();
    cout << "Rear element (back) = " << back << endl;

    /* Remove elements from both ends */
    deque.pop_front();
    cout << "Removed from the front (popFront) = " << front << ", deque after removal = ";
    printDeque(deque);
    deque.pop_back();
    cout << "Removed from the rear (popLast) = " << back << ", deque after removal = ";
    printDeque(deque);

    /* Get the deque size */
    int size = deque.size();
    cout << "Deque size = " << size << endl;

    /* Check whether the deque is empty */
    bool empty = deque.empty();
    cout << "Deque is empty = " << empty << endl;

    return 0;
}
