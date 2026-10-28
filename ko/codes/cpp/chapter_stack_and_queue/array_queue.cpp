/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 원형 배열로 구현한 큐 */
class ArrayQueue {
  private:
    int *nums;       // 큐의 원소를 저장하는 배열
    int front;       // 맨 앞 원소를 가리키는 맨 앞 포인터
    int queSize;     // 큐 길이
    int queCapacity; // 큐 용량

  public:
    ArrayQueue(int capacity) {
        // 배열 초기화
        nums = new int[capacity];
        queCapacity = capacity;
        front = queSize = 0;
    }

    ~ArrayQueue() {
        delete[] nums;
    }

    /* 큐의 용량 반환 */
    int capacity() {
        return queCapacity;
    }

    /* 큐의 길이 반환 */
    int size() {
        return queSize;
    }

    /* 큐가 비어 있는지 판단 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 큐에 삽입 */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "큐가 가득 찼다" << endl;
            return;
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        // 나머지 연산을 통해 rear가 배열의 끝을 넘어가면 처음으로 돌아오게 한다
        int rear = (front + queSize) % queCapacity;
        // num을 맨 뒤에 추가한다
        nums[rear] = num;
        queSize++;
    }

    /* 큐에서 꺼내기 */
    int pop() {
        int num = peek();
        // 맨 앞 포인터를 뒤로 한 칸 이동하고, 끝을 넘어가면 배열의 처음으로 돌아온다
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* 맨 앞 원소 접근 */
    int peek() {
        if (isEmpty())
            throw out_of_range("큐가 비어 있다");
        return nums[front];
    }

    /* 배열을 Vector로 변환하여 반환 */
    vector<int> toVector() {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* 실행 코드 */
int main() {
    /* 큐 초기화 */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

    /* 큐에 원소 삽입 */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "큐 queue = ";
    printVector(queue->toVector());

    /* 맨 앞 원소 접근 */
    int peek = queue->peek();
    cout << "맨 앞 원소 peek = " << peek << endl;

    /* 큐에서 원소 꺼내기 */
    peek = queue->pop();
    cout << "큐에서 꺼낸 원소 pop = " << peek << ", 큐에서 꺼낸 후 queue = ";
    printVector(queue->toVector());

    /* 큐의 길이 반환 */
    int size = queue->size();
    cout << "큐 길이 size = " << size << endl;

    /* 큐가 비어 있는지 판단 */
    bool empty = queue->isEmpty();
    cout << "큐가 비어 있는가 = " << empty << endl;

    /* 원형 배열 테스트 */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "반복 " << i << " 회에서 삽입 + 꺼내기를 수행한 후 queue = ";
        printVector(queue->toVector());
    }

    // 메모리 해제
    delete queue;

    return 0;
}
