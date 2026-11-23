/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

/* 최대 힙 */
class MaxHeap {
    // 배열 대신 리스트를 사용하므로 용량 확장을 고려할 필요가 없다
    private List<Integer> maxHeap;

    /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
    public MaxHeap(List<Integer> nums) {
        // 리스트 원소를 그대로 힙에 추가한다
        maxHeap = new ArrayList<>(nums);
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 왼쪽 자식 노드의 인덱스 반환 */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 반환 */
    private int parent(int i) {
        return (i - 1) / 2; // 나눗셈의 결과를 내림한다
    }

    /* 원소 교환 */
    private void swap(int i, int j) {
        int tmp = maxHeap.get(i);
        maxHeap.set(i, maxHeap.get(j));
        maxHeap.set(j, tmp);
    }

    /* 힙 크기 반환 */
    public int size() {
        return maxHeap.size();
    }

    /* 힙이 비어 있는지 판단 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 힙의 루트 원소 접근 */
    public int peek() {
        return maxHeap.get(0);
    }

    /* 힙에 원소 삽입 */
    public void push(int val) {
        // 노드 추가
        maxHeap.add(val);
        // 아래에서 위로 힙을 재정렬한다
        siftUp(size() - 1);
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    private void siftUp(int i) {
        while (true) {
            // 노드 i의 부모 노드를 구한다
            int p = parent(i);
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 두 노드를 교환한다
            swap(i, p);
            // 위쪽으로 힙 재정렬을 반복한다
            i = p;
        }
    }

    /* 힙에서 원소 꺼내기 */
    public int pop() {
        // 비어 있는 경우를 처리한다
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        swap(0, size() - 1);
        // 노드 삭제
        int val = maxHeap.remove(size() - 1);
        // 위에서 아래로 힙을 재정렬한다
        siftDown(0);
        // 힙의 루트 원소를 반환한다
        return val;
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    private void siftDown(int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma == i)
                break;
            // 두 노드를 교환한다
            swap(i, ma);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }

    /* 힙 출력(이진 트리) */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* 최대 힙 초기화 */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\n리스트를 입력하여 힙을 구성한 후");
        maxHeap.print();

        /* 힙의 루트 원소 반환 */
        int peek = maxHeap.peek();
        System.out.format("\n힙의 루트 원소: %d\n", peek);

        /* 힙에 원소 삽입 */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\n원소를 힙에 삽입한 후(원소: %d)\n", val);
        maxHeap.print();

        /* 힙의 루트 원소 꺼내기 */
        peek = maxHeap.pop();
        System.out.format("\n힙의 루트 원소를 꺼낸 후(원소: %d)\n", peek);
        maxHeap.print();

        /* 힙 크기 반환 */
        int size = maxHeap.size();
        System.out.format("\n힙의 원소 개수: %d\n", size);

        /* 힙이 비어 있는지 판단 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n힙이 비어 있는가: %b\n", isEmpty);
    }
}
