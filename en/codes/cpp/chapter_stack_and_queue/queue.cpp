/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver code */
int main() {
    /* Initialize the queue */
    queue<int> queue;

    /* Enqueue elements */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "Queue queue = ";
    printQueue(queue);

    /* Access the front element */
    int front = queue.front();
    cout << "Front element front = " << front << endl;

    /* Dequeue an element */
    queue.pop();
    cout << "Dequeued element front = " << front << "; after dequeueing, queue = ";
    printQueue(queue);

    /* Get the queue size */
    int size = queue.size();
    cout << "Queue size = " << size << endl;

    /* Check whether the queue is empty */
    bool empty = queue.empty();
    cout << "Is the queue empty = " << empty << endl;

    return 0;
}
