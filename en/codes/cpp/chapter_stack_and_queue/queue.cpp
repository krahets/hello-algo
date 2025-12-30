/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Access front of the queue element */
    queue<int> queue;

    /* Element dequeue */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "Queue queue = ";
    printQueue(queue);

    /* Return list for printing */
    int front = queue.front();
    cout << "Front element front = " << front << endl;

    /* Get the length of the double-ended queue */
    queue.pop();
    cout << "Dequeue element front = " << front << ", after dequeue, queue = ";
    printQueue(queue);

    /* Get the length of the queue */
    int size = queue.size();
    cout << "Queue length size = " << size << endl;

    /* Check if the queue is empty */
    bool empty = queue.empty();
    cout << "Queue is empty = " << empty << endl;

    return 0;
}
