/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 연결 리스트로 구현한 큐 */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // 첫 노드 front와 마지막 노드 rear
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // 연결 리스트를 순회하면서 노드를 삭제하고 메모리를 해제한다
        freeMemoryLinkedList(front);
    }

    /* 큐의 길이 조회 */
    int size() {
        return queSize;
    }

    /* 큐가 비어 있는지 확인 */
    bool isEmpty() {
        return queSize == 0;
    }

    /* 큐에 삽입 */
    void push(int num) {
        // 마지막 노드 뒤에 num을 추가한다
        ListNode *node = new ListNode(num);
        // 큐가 비어 있으면 앞쪽과 뒤쪽 포인터가 모두 이 노드를 가리키게 한다
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // 큐가 비어 있지 않으면 마지막 노드 뒤에 이 노드를 추가한다
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* 큐에서 꺼내기 */
    int pop() {
        int num = peek();
        // 첫 노드 삭제
        ListNode *tmp = front;
        front = front->next;
        // 메모리 해제
        delete tmp;
        queSize--;
        return num;
    }

    /* 맨 앞 원소 조회 */
    int peek() {
        if (size() == 0)
            throw out_of_range("큐가 비어 있다");
        return front->val;
    }

    /* 연결 리스트를 vector로 변환해 반환한다 */
    vector<int> toVector() {
        ListNode *node = front;
        vector<int> res(size());
        for (int i = 0; i < res.size(); i++) {
            res[i] = node->val;
            node = node->next;
        }
        return res;
    }
};

/* 실행 예제 */
int main() {
    /* 큐 초기화 */
    LinkedListQueue *queue = new LinkedListQueue();

    /* 큐에 원소 삽입 */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "큐 queue = ";
    printVector(queue->toVector());

    /* 맨 앞 원소 조회 */
    int peek = queue->peek();
    cout << "맨 앞 원소 peek = " << peek << endl;

    /* 큐에서 원소 꺼내기 */
    peek = queue->pop();
    cout << "꺼낸 원소 pop = " << peek << ", 꺼낸 후 queue = ";
    printVector(queue->toVector());

    /* 큐의 길이 조회 */
    int size = queue->size();
    cout << "큐의 길이 size = " << size << endl;

    /* 큐가 비어 있는지 확인 */
    bool empty = queue->isEmpty();
    cout << "큐가 비어 있는가 = " << empty << endl;

    // 메모리 해제
    delete queue;

    return 0;
}
