/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Initialize queue */
    queue<int> queue;

    /* Element enqueue */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "Queue queue = ";
    printQueue(queue);

    /* Access front element */
    int front = queue.front();
    cout << "Front element of the queue front = " << front << endl;

    /* Element dequeue */
    queue.pop();
    cout << "Element dequeued = " << front << ", after dequeuing";
    printQueue(queue);

    /* Get the length of the queue */
    int size = queue.size();
    cout << "Length of the queue size = " << size << endl;

    /* Determine if the queue is empty */
    bool empty = queue.empty();
    cout << "Is the queue empty = " << empty << endl;

    return 0;
}
