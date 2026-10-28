/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 이중 연결 리스트 노드 */
struct DoublyListNode {
    int val;              // 노드 값
    DoublyListNode *next; // 다음 노드 포인터
    DoublyListNode *prev; // 이전 노드 포인터
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // 머리 노드 front, 꼬리 노드 rear
    int queSize = 0;              // 덱의 길이

  public:
    /* 생성자 */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* 소멸자 */
    ~LinkedListDeque() {
        // 연결 리스트를 순회하며 노드를 삭제하여 메모리를 해제한다
        DoublyListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* 덱의 길이 반환 */
    int size() {
        return queSize;
    }

    /* 덱이 비어 있는지 판단 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 큐 삽입 연산 */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if (isEmpty())
            front = rear = node;
        // 맨 앞에 삽입하는 연산
        else if (isFront) {
            // node를 연결 리스트의 맨 앞에 추가한다
            front->prev = node;
            node->next = front;
            front = node; // 머리 노드를 갱신한다
        // 맨 뒤에 삽입하는 연산
        } else {
            // node를 연결 리스트의 맨 뒤에 추가한다
            rear->next = node;
            node->prev = rear;
            rear = node; // 꼬리 노드를 갱신한다
        }
        queSize++; // 큐 길이를 갱신한다
    }

    /* 맨 앞에 삽입 */
    void pushFirst(int num) {
        push(num, true);
    }

    /* 맨 뒤에 삽입 */
    void pushLast(int num) {
        push(num, false);
    }

    /* 큐에서 꺼내는 연산 */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("큐가 비어 있다");
        int val;
        // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if (queSize == 1) {
            val = front->val;
            delete front; // 같은 노드를 가리키므로 하나만 해제하면 된다
            front = nullptr;
            rear = nullptr;
        }
        // 맨 앞에서 꺼내는 연산
        else if (isFront) {
            val = front->val; // 머리 노드의 값을 임시로 저장한다
            // 머리 노드를 삭제한다
            DoublyListNode *fNext = front->next;
            fNext->prev = nullptr;
            front->next = nullptr;
            delete front;
            front = fNext; // 머리 노드를 갱신한다
        // 맨 뒤에서 꺼내는 연산
        } else {
            val = rear->val; // 꼬리 노드의 값을 임시로 저장한다
            // 꼬리 노드를 삭제한다
            DoublyListNode *rPrev = rear->prev;
            rPrev->next = nullptr;
            rear->prev = nullptr;
            delete rear;
            rear = rPrev; // 꼬리 노드를 갱신한다
        }
        queSize--; // 큐 길이를 갱신한다
        return val;
    }

    /* 맨 앞에서 꺼내기 */
    int popFirst() {
        return pop(true);
    }

    /* 맨 뒤에서 꺼내기 */
    int popLast() {
        return pop(false);
    }

    /* 맨 앞 원소 접근 */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("덱이 비어 있다");
        return front->val;
    }

    /* 맨 뒤 원소 접근 */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("덱이 비어 있다");
        return rear->val;
    }

    /* 출력에 사용할 배열 반환 */
    vector<int> toVector() {
        DoublyListNode *node = front;
        vector<int> res(size());
        for (int i = 0; i < res.size(); i++) {
            res[i] = node->val;
            node = node->next;
        }
        return res;
    }
};

/* 실행 코드 */
int main() {
    /* 덱 초기화 */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "덱 deque = ";
    printVector(deque->toVector());

    /* 원소 접근 */
    int peekFirst = deque->peekFirst();
    cout << "맨 앞 원소 peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "맨 뒤 원소 peekLast = " << peekLast << endl;

    /* 큐에 원소 삽입 */
    deque->pushLast(4);
    cout << "원소 4를 맨 뒤에 삽입한 후 deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "원소 1을 맨 앞에 삽입한 후 deque = ";
    printVector(deque->toVector());

    /* 큐에서 원소 꺼내기 */
    int popLast = deque->popLast();
    cout << "맨 뒤에서 꺼낸 원소 = " << popLast << ", 맨 뒤에서 꺼낸 후 deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "맨 앞에서 꺼낸 원소 = " << popFirst << ", 맨 앞에서 꺼낸 후 deque = ";
    printVector(deque->toVector());

    /* 덱의 길이 반환 */
    int size = deque->size();
    cout << "덱 길이 size = " << size << endl;

    /* 덱이 비어 있는지 판단 */
    bool isEmpty = deque->isEmpty();
    cout << "덱이 비어 있는가 = " << boolalpha << isEmpty << endl;

    // 메모리 해제
    delete deque;

    return 0;
}
