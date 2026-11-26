/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 최대 힙 */
class MaxHeap {
  private:
    // 용량 확장을 따로 고려할 필요가 없도록 동적 배열 사용
    vector<int> maxHeap;

    /* 왼쪽 자식 노드의 인덱스 구하기 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 구하기 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 구하기 */
    int parent(int i) {
        return (i - 1) / 2; // 나눗셈 결과를 내림
    }

    /* 노드 i부터 아래에서 위로 힙 복구 */
    void siftUp(int i) {
        while (true) {
            // 노드 i의 부모 노드 구하기
            int p = parent(i);
            // 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 두 노드 교환
            swap(maxHeap[i], maxHeap[p]);
            // 위로 올라가며 힙 복구 반복
            i = p;
        }
    }

    /* 노드 i부터 위에서 아래로 힙 복구 */
    void siftDown(int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 ma에 저장
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // 아래로 내려가며 힙 복구 반복
            i = ma;
        }
    }

  public:
    /* 입력 리스트로 힙을 만드는 생성자 */
    MaxHeap(vector<int> nums) {
        // 리스트의 원소를 그대로 힙에 추가
        maxHeap = nums;
        // 리프를 제외한 모든 노드에서 힙 복구
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 힙 크기 구하기 */
    int size() {
        return maxHeap.size();
    }

    /* 힙이 비었는지 확인 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 힙의 루트 원소 조회 */
    int peek() {
        return maxHeap[0];
    }

    /* 힙에 원소 삽입 */
    void push(int val) {
        // 노드 추가
        maxHeap.push_back(val);
        // 아래에서 위로 힙 복구
        siftUp(size() - 1);
    }

    /* 힙에서 원소 꺼내기 */
    void pop() {
        // 빈 힙 처리
        if (isEmpty()) {
            throw out_of_range("힙이 비어 있음");
        }
        // 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
        swap(maxHeap[0], maxHeap[size() - 1]);
        // 노드 삭제
        maxHeap.pop_back();
        // 위에서 아래로 힙 복구
        siftDown(0);
    }

    /* 힙 출력(이진 트리)*/
    void print() {
        cout << "배열로 나타낸 힙:";
        printVector(maxHeap);
        cout << "트리로 나타낸 힙:" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* 실행 예제 */
int main() {
    /* 최대 힙 초기화 */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\n입력 리스트로 만든 힙:" << endl;
    maxHeap.print();

    /* 힙의 루트 원소 구하기 */
    int peek = maxHeap.peek();
    cout << "\n힙의 루트 원소: " << peek << endl;

    /* 힙에 원소 삽입 */
    int val = 7;
    maxHeap.push(val);
    cout << "\n원소 " << val << " 삽입 후" << endl;
    maxHeap.print();

    /* 힙의 루트 원소 꺼내기 */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\n루트 원소 " << peek << " 제거 후" << endl;
    maxHeap.print();

    /* 힙 크기 구하기 */
    int size = maxHeap.size();
    cout << "\n힙의 원소 수: " << size << endl;

    /* 힙이 비었는지 확인 */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\n빈 힙 여부: " << isEmpty << endl;

    return 0;
}
