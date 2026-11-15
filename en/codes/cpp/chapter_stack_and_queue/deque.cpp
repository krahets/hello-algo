/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver code */
int main() {
    // [region]{init_deque}
    /* Initialize the deque */
    deque<int> deque;
    // [endregion]{init_deque}

    // [region]{push}
    /* Enqueue elements */
    deque.push_back(2); // Add to the rear
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // Add to the front
    deque.push_front(1);
    // [endregion]{push}
    cout << "Deque deque = ";
    printDeque(deque);

    // [region]{peek_first}
    /* Access an element */
    int front = deque.front(); // Front element
    // [endregion]{peek_first}
    cout << "Front element front = " << front << endl;
    // [region]{peek_last}
    int back = deque.back(); // Rear element
    // [endregion]{peek_last}
    cout << "Rear element back = " << back << endl;

    // [region]{pop_first}
    /* Dequeue an element */
    deque.pop_front(); // Dequeue the front element
    // [endregion]{pop_first}
    cout << "Element removed from the front, popFront = " << front << ", after dequeuing from the front, deque = ";
    printDeque(deque);
    // [region]{pop_last}
    deque.pop_back(); // Dequeue the rear element
    // [endregion]{pop_last}
    cout << "Element removed from the rear, popLast = " << back << ", after dequeuing from the rear, deque = ";
    printDeque(deque);

    // [region]{size}
    /* Get the deque size */
    int size = deque.size();
    // [endregion]{size}
    cout << "Deque size = " << size << endl;

    // [region]{is_empty}
    /* Check whether the deque is empty */
    bool empty = deque.empty();
    // [endregion]{is_empty}
    cout << "Is the deque empty = " << empty << endl;

    return 0;
}
