/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 원형 배열로 구현한 덱 */
class ArrayDeque {
  private:
    vector<int> nums; // 덱의 원소를 저장하는 배열
    int front;        // 맨 앞 원소를 가리키는 맨 앞 포인터
    int queSize;      // 덱 길이

  public:
    /* 생성자 */
    ArrayDeque(int capacity) {
        nums.resize(capacity);
        front = queSize = 0;
    }

    /* 덱의 용량 반환 */
    int capacity() {
        return nums.size();
    }

    /* 덱의 길이 반환 */
    int size() {
        return queSize;
    }

    /* 덱이 비어 있는지 판단 */
    bool isEmpty() {
        return queSize == 0;
    }

    /* 원형 배열 인덱스 계산 */
    int index(int i) {
        // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
        // i가 배열의 끝을 넘어가면 처음으로 돌아온다
        // i가 배열의 처음을 넘어가면 끝으로 돌아온다
        return (i + capacity()) % capacity();
    }

    /* 맨 앞에 삽입 */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "덱이 가득 찼다" << endl;
            return;
        }
        // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
        // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
        front = index(front - 1);
        // num을 맨 앞에 추가한다
        nums[front] = num;
        queSize++;
    }

    /* 맨 뒤에 삽입 */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "덱이 가득 찼다" << endl;
            return;
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        int rear = index(front + queSize);
        // num을 맨 뒤에 추가한다
        nums[rear] = num;
        queSize++;
    }

    /* 맨 앞에서 꺼내기 */
    int popFirst() {
        int num = peekFirst();
        // 맨 앞 포인터를 뒤로 한 칸 이동한다
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* 맨 뒤에서 꺼내기 */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* 맨 앞 원소 접근 */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("덱이 비어 있다");
        return nums[front];
    }

    /* 맨 뒤 원소 접근 */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("덱이 비어 있다");
        // 마지막 원소의 인덱스를 계산한다
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* 출력에 사용할 배열 반환 */
    vector<int> toVector() {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* 실행 코드 */
int main() {
    /* 덱 초기화 */
    ArrayDeque *deque = new ArrayDeque(10);
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
    cout << "원소 4를 맨 뒤에 삽입한 후 deque = ";
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
    return 0;
}
