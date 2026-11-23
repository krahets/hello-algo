/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 최대 힙 */
class MaxHeap {
  private:
    // 동적 배열을 사용하므로 용량 확장을 고려할 필요가 없다
    vector<int> maxHeap;

    /* 왼쪽 자식 노드의 인덱스 반환 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 반환 */
    int parent(int i) {
        return (i - 1) / 2; // 나눗셈의 결과를 내림한다
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    void siftUp(int i) {
        while (true) {
            // 노드 i의 부모 노드를 구한다
            int p = parent(i);
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 두 노드를 교환한다
            swap(maxHeap[i], maxHeap[p]);
            // 위쪽으로 힙 재정렬을 반복한다
            i = p;
        }
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    void siftDown(int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }

  public:
    /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
    MaxHeap(vector<int> nums) {
        // 리스트 원소를 그대로 힙에 추가한다
        maxHeap = nums;
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 힙 크기 반환 */
    int size() {
        return maxHeap.size();
    }

    /* 힙이 비어 있는지 판단 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 힙의 루트 원소 접근 */
    int peek() {
        return maxHeap[0];
    }

    /* 힙에 원소 삽입 */
    void push(int val) {
        // 노드 추가
        maxHeap.push_back(val);
        // 아래에서 위로 힙을 재정렬한다
        siftUp(size() - 1);
    }

    /* 힙에서 원소 꺼내기 */
    void pop() {
        // 비어 있는 경우를 처리한다
        if (isEmpty()) {
            throw out_of_range("힙이 비어 있다");
        }
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        swap(maxHeap[0], maxHeap[size() - 1]);
        // 노드 삭제
        maxHeap.pop_back();
        // 위에서 아래로 힙을 재정렬한다
        siftDown(0);
    }

    /* 힙 출력(이진 트리)*/
    void print() {
        cout << "힙의 배열 표현:";
        printVector(maxHeap);
        cout << "힙의 트리 표현:" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* 실행 코드 */
int main() {
    /* 최대 힙 초기화 */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\n리스트를 입력하여 힙을 구성한 후" << endl;
    maxHeap.print();

    /* 힙의 루트 원소 반환 */
    int peek = maxHeap.peek();
    cout << "\n힙의 루트 원소: " << peek << endl;

    /* 힙에 원소 삽입 */
    int val = 7;
    maxHeap.push(val);
    cout << "\n원소 " << val << " 힙에 삽입 후" << endl;
    maxHeap.print();

    /* 힙의 루트 원소 꺼내기 */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\n힙의 루트 원소 " << peek << " 힙에서 꺼낸 후" << endl;
    maxHeap.print();

    /* 힙 크기 반환 */
    int size = maxHeap.size();
    cout << "\n힙의 원소 개수: " << size << endl;

    /* 힙이 비어 있는지 판단 */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\n힙이 비어 있는가: " << isEmpty << endl;

    return 0;
}
