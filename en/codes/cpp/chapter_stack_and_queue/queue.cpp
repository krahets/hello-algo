/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver code */
int main() {
    // [region]{init_queue}
    /* Initialize the queue */
    queue<int> queue;
    // [endregion]{init_queue}

    // [region]{push}
    /* Enqueue elements */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    // [endregion]{push}
    cout << "Queue queue = ";
    printQueue(queue);

    // [region]{peek}
    /* Access the front element */
    int front = queue.front();
    // [endregion]{peek}
    cout << "Front element front = " << front << endl;

    // [region]{pop}
    /* Dequeue an element */
    queue.pop();
    // [endregion]{pop}
    cout << "Dequeued element front = " << front << "; after dequeueing, queue = ";
    printQueue(queue);

    // [region]{size}
    /* Get the queue size */
    int size = queue.size();
    // [endregion]{size}
    cout << "Queue size = " << size << endl;

    // [region]{is_empty}
    /* Check whether the queue is empty */
    bool empty = queue.empty();
    // [endregion]{is_empty}
    cout << "Is the queue empty = " << empty << endl;

    return 0;
}
