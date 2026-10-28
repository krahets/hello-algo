/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* 최대 힙 */
class MaxHeap {
    // 배열 대신 리스트를 사용하므로 용량 확장을 고려할 필요가 없다
    List<int> maxHeap;

    /* 생성자: 빈 힙 생성 */
    public MaxHeap() {
        maxHeap = [];
    }

    /* 생성자: 입력 리스트로 힙 구성 */
    public MaxHeap(IEnumerable<int> nums) {
        // 리스트 원소를 그대로 힙에 추가한다
        maxHeap = new List<int>(nums);
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }

    /* 왼쪽 자식 노드의 인덱스 반환 */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 반환 */
    int Parent(int i) {
        return (i - 1) / 2; // 나눗셈의 결과를 내림한다
    }

    /* 힙의 루트 원소 접근 */
    public int Peek() {
        return maxHeap[0];
    }

    /* 힙에 원소 삽입 */
    public void Push(int val) {
        // 노드 추가
        maxHeap.Add(val);
        // 아래에서 위로 힙을 재정렬한다
        SiftUp(Size() - 1);
    }

    /* 힙 크기 반환 */
    public int Size() {
        return maxHeap.Count;
    }

    /* 힙이 비어 있는지 판단 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    void SiftUp(int i) {
        while (true) {
            // 노드 i의 부모 노드를 구한다
            int p = Parent(i);
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 종료한다
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 두 노드를 교환한다
            Swap(i, p);
            // 위쪽으로 힙 재정렬을 반복한다
            i = p;
        }
    }

    /* 힙에서 원소 꺼내기 */
    public int Pop() {
        // 비어 있는 경우를 처리한다
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        Swap(0, Size() - 1);
        // 노드 삭제
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // 위에서 아래로 힙을 재정렬한다
        SiftDown(0);
        // 힙의 루트 원소를 반환한다
        return val;
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    void SiftDown(int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 노드 i의 값이 가장 크거나 리프 노드를 넘어가면 힙 재정렬을 종료한다
            if (ma == i) break;
            // 두 노드를 교환한다
            Swap(i, ma);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }

    /* 원소 교환 */
    void Swap(int i, int p) {
        (maxHeap[i], maxHeap[p]) = (maxHeap[p], maxHeap[i]);
    }

    /* 힙 출력(이진 트리) */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* 최대 힙 초기화 */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\n리스트를 입력하여 힙을 구성한 후");
        maxHeap.Print();

        /* 힙의 루트 원소 반환 */
        int peek = maxHeap.Peek();
        Console.WriteLine($"힙의 루트 원소: {peek}");

        /* 힙에 원소 삽입 */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"힙에 원소를 삽입한 후(원소: {val})");
        maxHeap.Print();

        /* 힙의 루트 원소 꺼내기 */
        peek = maxHeap.Pop();
        Console.WriteLine($"힙의 루트 원소를 꺼낸 후(원소: {peek})");
        maxHeap.Print();

        /* 힙 크기 반환 */
        int size = maxHeap.Size();
        Console.WriteLine($"힙의 원소 개수: {size}");

        /* 힙이 비어 있는지 판단 */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"힙이 비어 있는가: {isEmpty}");
    }
}
