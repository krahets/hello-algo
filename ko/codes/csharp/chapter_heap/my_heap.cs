/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* 최대 힙 */
class MaxHeap {
    // 용량 확장을 따로 고려할 필요가 없도록 배열 대신 리스트 사용
    List<int> maxHeap;

    /* 빈 힙을 만드는 생성자 */
    public MaxHeap() {
        maxHeap = [];
    }

    /* 입력 리스트로 힙을 만드는 생성자 */
    public MaxHeap(IEnumerable<int> nums) {
        // 리스트의 원소를 그대로 힙에 추가
        maxHeap = new List<int>(nums);
        // 리프를 제외한 모든 노드에서 힙 복구
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }

    /* 왼쪽 자식 노드의 인덱스 구하기 */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 구하기 */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 구하기 */
    int Parent(int i) {
        return (i - 1) / 2; // 나눗셈 결과를 내림
    }

    /* 힙의 루트 원소 조회 */
    public int Peek() {
        return maxHeap[0];
    }

    /* 힙에 원소 삽입 */
    public void Push(int val) {
        // 노드 추가
        maxHeap.Add(val);
        // 아래에서 위로 힙 복구
        SiftUp(Size() - 1);
    }

    /* 힙 크기 구하기 */
    public int Size() {
        return maxHeap.Count;
    }

    /* 힙이 비었는지 확인 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 노드 i부터 아래에서 위로 힙 복구 */
    void SiftUp(int i) {
        while (true) {
            // 노드 i의 부모 노드 구하기
            int p = Parent(i);
            // 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 두 노드 교환
            Swap(i, p);
            // 위로 올라가며 힙 복구 반복
            i = p;
        }
    }

    /* 힙에서 원소 꺼내기 */
    public int Pop() {
        // 빈 힙 처리
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
        Swap(0, Size() - 1);
        // 노드 삭제
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // 위에서 아래로 힙 복구
        SiftDown(0);
        // 힙의 루트 원소 반환
        return val;
    }

    /* 노드 i부터 위에서 아래로 힙 복구 */
    void SiftDown(int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 ma에 저장
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 노드 i가 가장 크거나 리프를 지나면 힙 복구 종료
            if (ma == i) break;
            // 두 노드 교환
            Swap(i, ma);
            // 아래로 내려가며 힙 복구 반복
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
        Console.WriteLine("\n입력 리스트로 만든 힙:");
        maxHeap.Print();

        /* 힙의 루트 원소 구하기 */
        int peek = maxHeap.Peek();
        Console.WriteLine($"힙의 루트 원소: {peek}");

        /* 힙에 원소 삽입 */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"원소 {val} 삽입 후");
        maxHeap.Print();

        /* 힙의 루트 원소 꺼내기 */
        peek = maxHeap.Pop();
        Console.WriteLine($"루트 원소 {peek} 제거 후");
        maxHeap.Print();

        /* 힙 크기 구하기 */
        int size = maxHeap.Size();
        Console.WriteLine($"힙의 원소 수: {size}");

        /* 힙이 비었는지 확인 */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"빈 힙 여부: {isEmpty}");
    }
}
