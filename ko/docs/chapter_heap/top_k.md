---
comments: true
---

# 8.3 &nbsp; Top-k 문제

!!! question "문제"

    길이가 $n$인 정렬되지 않은 배열 `nums`가 주어졌을 때, 배열에서 가장 큰 $k$ 개의 원소를 반환하라.

이 문제에 대해 먼저 발상이 비교적 직접적인 두 가지 풀이를 살펴보고, 이어서 더 효율적인 힙 기반 풀이를 소개한다.

## 8.3.1 &nbsp; 방법 1: 순회하며 선택

아래 그림(8-6)과 같이 $k$ 번 순회하면서 매 순회에서 각각 $1$, $2$, $\dots$, $k$ 번째로 큰 원소를 뽑을 수 있다. 시간 복잡도는 $O(nk)$이다.

이 방법은 $k \ll n$인 경우에만 적합하다. $k$가 $n$에 가까워지면 시간 복잡도가 $O(n^2)$에 가까워져 매우 오래 걸리기 때문이다.

![순회로 가장 큰 k개의 원소 찾기](top_k.assets/top_k_traversal.png){ class="animation-figure" }

<p align="center"> 그림 8-6 &nbsp; 순회로 가장 큰 k개의 원소 찾기 </p>

!!! tip "참고"

    $k = n$이면 전체가 정렬된 수열을 얻을 수 있으며, 이는 '선택 정렬' 알고리즘과 같다.

## 8.3.2 &nbsp; 방법 2: 정렬

아래 그림(8-7)과 같이 배열 `nums`를 먼저 정렬한 뒤 맨 오른쪽의 $k$ 개 원소를 반환할 수 있다. 시간 복잡도는 $O(n \log n)$이다.

이 방법은 필요한 것보다 더 많은 일을 한다. 가장 큰 $k$ 개 원소만 찾으면 되며, 나머지 원소를 정렬할 필요는 없기 때문이다.

![정렬로 가장 큰 k개의 원소 찾기](top_k.assets/top_k_sorting.png){ class="animation-figure" }

<p align="center"> 그림 8-7 &nbsp; 정렬로 가장 큰 k개의 원소 찾기 </p>

## 8.3.3 &nbsp; 방법 3: 힙

힙을 이용하면 Top-k 문제를 더 효율적으로 해결할 수 있다. 과정은 아래 그림(8-8)과 같다.

1. 루트 원소가 가장 작은 최소 힙을 초기화한다.
2. 먼저 배열의 앞 $k$ 개 원소를 차례로 힙에 삽입한다.
3. $k + 1$ 번째 원소부터 시작하여, 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 삽입한다.
4. 순회를 마치면 힙에 남은 원소가 가장 큰 $k$ 개 원소다.

=== "<1>"
    ![힙으로 가장 큰 k개의 원소 찾기](top_k.assets/top_k_heap_step1.png){ class="animation-figure" }

=== "<2>"
    ![힙으로 Top-k 찾기 2단계](top_k.assets/top_k_heap_step2.png){ class="animation-figure" }

=== "<3>"
    ![힙으로 Top-k 찾기 3단계](top_k.assets/top_k_heap_step3.png){ class="animation-figure" }

=== "<4>"
    ![힙으로 Top-k 찾기 4단계](top_k.assets/top_k_heap_step4.png){ class="animation-figure" }

=== "<5>"
    ![힙으로 Top-k 찾기 5단계](top_k.assets/top_k_heap_step5.png){ class="animation-figure" }

=== "<6>"
    ![힙으로 Top-k 찾기 6단계](top_k.assets/top_k_heap_step6.png){ class="animation-figure" }

=== "<7>"
    ![힙으로 Top-k 찾기 7단계](top_k.assets/top_k_heap_step7.png){ class="animation-figure" }

=== "<8>"
    ![힙으로 Top-k 찾기 8단계](top_k.assets/top_k_heap_step8.png){ class="animation-figure" }

=== "<9>"
    ![힙으로 Top-k 찾기 9단계](top_k.assets/top_k_heap_step9.png){ class="animation-figure" }

<p align="center"> 그림 8-8 &nbsp; 힙으로 가장 큰 k개의 원소 찾기 </p>

예시 코드는 다음과 같다.

=== "Python"

    ```python title="top_k.py"
    def top_k_heap(nums: list[int], k: int) -> list[int]:
        """힙을 이용하여 배열에서 가장 큰 k개 원소 탐색"""
        # 최소 힙 초기화
        heap = []
        # 배열의 앞쪽 k개 원소를 힙에 삽입한다
        for i in range(k):
            heapq.heappush(heap, nums[i])
        # k+1번째 원소부터 힙의 길이를 k로 유지한다
        for i in range(k, len(nums)):
            # 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
            if nums[i] > heap[0]:
                heapq.heappop(heap)
                heapq.heappush(heap, nums[i])
        return heap
    ```

=== "C++"

    ```cpp title="top_k.cpp"
    /* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
    priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
        // 최소 힙 초기화
        priority_queue<int, vector<int>, greater<int>> heap;
        // 배열의 앞쪽 k개 원소를 힙에 삽입한다
        for (int i = 0; i < k; i++) {
            heap.push(nums[i]);
        }
        // k+1번째 원소부터 힙의 길이를 k로 유지한다
        for (int i = k; i < nums.size(); i++) {
            // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
            if (nums[i] > heap.top()) {
                heap.pop();
                heap.push(nums[i]);
            }
        }
        return heap;
    }
    ```

=== "Java"

    ```java title="top_k.java"
    /* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
    Queue<Integer> topKHeap(int[] nums, int k) {
        // 최소 힙 초기화
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // 배열의 앞쪽 k개 원소를 힙에 삽입한다
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // k+1번째 원소부터 힙의 길이를 k로 유지한다
        for (int i = k; i < nums.length; i++) {
            // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
            if (nums[i] > heap.peek()) {
                heap.poll();
                heap.offer(nums[i]);
            }
        }
        return heap;
    }
    ```

=== "C#"

    ```csharp title="top_k.cs"
    /* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // 최소 힙 초기화
        PriorityQueue<int, int> heap = new();
        // 배열의 앞쪽 k개 원소를 힙에 삽입한다
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // k+1번째 원소부터 힙의 길이를 k로 유지한다
        for (int i = k; i < nums.Length; i++) {
            // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
            if (nums[i] > heap.Peek()) {
                heap.Dequeue();
                heap.Enqueue(nums[i], nums[i]);
            }
        }
        return heap;
    }
    ```

=== "Go"

    ```go title="top_k.go"
    /* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
    func topKHeap(nums []int, k int) *minHeap {
        // 최소 힙 초기화
        h := &minHeap{}
        heap.Init(h)
        // 배열의 앞쪽 k개 원소를 힙에 삽입한다
        for i := 0; i < k; i++ {
            heap.Push(h, nums[i])
        }
        // k+1번째 원소부터 힙의 길이를 k로 유지한다
        for i := k; i < len(nums); i++ {
            // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
            if nums[i] > h.Top().(int) {
                heap.Pop(h)
                heap.Push(h, nums[i])
            }
        }
        return h
    }
    ```

=== "Swift"

    ```swift title="top_k.swift"
    /* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
    func topKHeap(nums: [Int], k: Int) -> [Int] {
        // 최소 힙을 초기화하여 앞쪽 k개 원소로 힙을 구성한다
        var heap = Heap(nums.prefix(k))
        // k+1번째 원소부터 힙의 길이를 k로 유지한다
        for i in nums.indices.dropFirst(k) {
            // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
            if nums[i] > heap.min()! {
                _ = heap.removeMin()
                heap.insert(nums[i])
            }
        }
        return heap.unordered
    }
    ```

=== "JS"

    ```javascript title="top_k.js"
    /* 힙에 원소 삽입 */
    function pushMinHeap(maxHeap, val) {
        // 원소의 부호를 반전한다
        maxHeap.push(-val);
    }

    /* 힙에서 원소 꺼내기 */
    function popMinHeap(maxHeap) {
        // 원소의 부호를 반전한다
        return -maxHeap.pop();
    }

    /* 힙의 루트 원소 접근 */
    function peekMinHeap(maxHeap) {
        // 원소의 부호를 반전한다
        return -maxHeap.peek();
    }

    /* 힙의 원소를 반환한다 */
    function getMinHeap(maxHeap) {
        // 원소의 부호를 반전한다
        return maxHeap.getMaxHeap().map((num) => -num);
    }

    /* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
    function topKHeap(nums, k) {
        // 최소 힙 초기화
        // 힙의 모든 원소의 부호를 반전하여 최대 힙으로 최소 힙을 구현한다는 점에 유의한다
        const maxHeap = new MaxHeap([]);
        // 배열의 앞쪽 k개 원소를 힙에 삽입한다
        for (let i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // k+1번째 원소부터 힙의 길이를 k로 유지한다
        for (let i = k; i < nums.length; i++) {
            // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        // 힙의 원소를 반환한다
        return getMinHeap(maxHeap);
    }
    ```

=== "TS"

    ```typescript title="top_k.ts"
    /* 힙에 원소 삽입 */
    function pushMinHeap(maxHeap: MaxHeap, val: number): void {
        // 원소의 부호를 반전한다
        maxHeap.push(-val);
    }

    /* 힙에서 원소 꺼내기 */
    function popMinHeap(maxHeap: MaxHeap): number {
        // 원소의 부호를 반전한다
        return -maxHeap.pop();
    }

    /* 힙의 루트 원소 접근 */
    function peekMinHeap(maxHeap: MaxHeap): number {
        // 원소의 부호를 반전한다
        return -maxHeap.peek();
    }

    /* 힙의 원소를 반환한다 */
    function getMinHeap(maxHeap: MaxHeap): number[] {
        // 원소의 부호를 반전한다
        return maxHeap.getMaxHeap().map((num: number) => -num);
    }

    /* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
    function topKHeap(nums: number[], k: number): number[] {
        // 최소 힙 초기화
        // 힙의 모든 원소의 부호를 반전하여 최대 힙으로 최소 힙을 구현한다는 점에 유의한다
        const maxHeap = new MaxHeap([]);
        // 배열의 앞쪽 k개 원소를 힙에 삽입한다
        for (let i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // k+1번째 원소부터 힙의 길이를 k로 유지한다
        for (let i = k; i < nums.length; i++) {
            // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        // 힙의 원소를 반환한다
        return getMinHeap(maxHeap);
    }
    ```

=== "Dart"

    ```dart title="top_k.dart"
    /* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
    MinHeap topKHeap(List<int> nums, int k) {
      // 최소 힙을 초기화하고 배열의 앞쪽 k개 원소를 힙에 삽입한다
      MinHeap heap = MinHeap(nums.sublist(0, k));
      // k+1번째 원소부터 힙의 길이를 k로 유지한다
      for (int i = k; i < nums.length; i++) {
        // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
        if (nums[i] > heap.peek()) {
          heap.pop();
          heap.push(nums[i]);
        }
      }
      return heap;
    }
    ```

=== "Rust"

    ```rust title="top_k.rs"
    /* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
    fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
        // BinaryHeap은 최대 힙이므로 Reverse로 원소의 순서를 뒤집어 최소 힙을 구현한다
        let mut heap = BinaryHeap::<Reverse<i32>>::new();
        // 배열의 앞쪽 k개 원소를 힙에 삽입한다
        for &num in nums.iter().take(k) {
            heap.push(Reverse(num));
        }
        // k+1번째 원소부터 힙의 길이를 k로 유지한다
        for &num in nums.iter().skip(k) {
            // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
            if num > heap.peek().unwrap().0 {
                heap.pop();
                heap.push(Reverse(num));
            }
        }
        heap
    }
    ```

=== "C"

    ```c title="top_k.c"
    /* 힙에 원소 삽입 */
    void pushMinHeap(MaxHeap *maxHeap, int val) {
        // 원소의 부호를 반전한다
        push(maxHeap, -val);
    }

    /* 힙에서 원소 꺼내기 */
    int popMinHeap(MaxHeap *maxHeap) {
        // 원소의 부호를 반전한다
        return -pop(maxHeap);
    }

    /* 힙의 루트 원소 접근 */
    int peekMinHeap(MaxHeap *maxHeap) {
        // 원소의 부호를 반전한다
        return -peek(maxHeap);
    }

    /* 힙의 원소를 반환한다 */
    int *getMinHeap(MaxHeap *maxHeap) {
        // 힙의 모든 원소의 부호를 반전하여 res 배열에 저장한다
        int *res = (int *)malloc(maxHeap->size * sizeof(int));
        for (int i = 0; i < maxHeap->size; i++) {
            res[i] = -maxHeap->data[i];
        }
        return res;
    }

    /* 힙의 원소를 반환한다 */
    int *getMinHeap(MaxHeap *maxHeap) {
        // 힙의 모든 원소의 부호를 반전하여 res 배열에 저장한다
        int *res = (int *)malloc(maxHeap->size * sizeof(int));
        for (int i = 0; i < maxHeap->size; i++) {
            res[i] = -maxHeap->data[i];
        }
        return res;
    }

    // 힙으로 배열에서 가장 큰 k개 원소를 찾는 함수
    int *topKHeap(int *nums, int sizeNums, int k) {
        // 최소 힙 초기화
        // 힙의 모든 원소의 부호를 반전하여 최대 힙으로 최소 힙을 구현한다는 점에 유의한다
        int *empty = (int *)malloc(0);
        MaxHeap *maxHeap = newMaxHeap(empty, 0);
        // 배열의 앞쪽 k개 원소를 힙에 삽입한다
        for (int i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // k+1번째 원소부터 힙의 길이를 k로 유지한다
        for (int i = k; i < sizeNums; i++) {
            // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        int *res = getMinHeap(maxHeap);
        // 메모리 해제
        delMaxHeap(maxHeap);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="top_k.kt"
    /* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
    fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
        // 최소 힙 초기화
        val heap = PriorityQueue<Int>()
        // 배열의 앞쪽 k개 원소를 힙에 삽입한다
        for (i in 0..<k) {
            heap.offer(nums[i])
        }
        // k+1번째 원소부터 힙의 길이를 k로 유지한다
        for (i in k..<nums.size) {
            // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
            if (nums[i] > heap.peek()) {
                heap.poll()
                heap.offer(nums[i])
            }
        }
        return heap
    }
    ```

=== "Ruby"

    ```ruby title="top_k.rb"
    ### 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 ###
    def top_k_heap(nums, k)
      # 최소 힙 초기화
      # 힙의 모든 원소의 부호를 반전하여 최대 힙으로 최소 힙을 구현한다는 점에 유의한다
      max_heap = MaxHeap.new([])

      # 배열의 앞쪽 k개 원소를 힙에 삽입한다
      for i in 0...k
        push_min_heap(max_heap, nums[i])
      end

      # k+1번째 원소부터 힙의 길이를 k로 유지한다
      for i in k...nums.length
        # 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
        if nums[i] > peek_min_heap(max_heap)
          pop_min_heap(max_heap)
          push_min_heap(max_heap, nums[i])
        end
      end

      get_min_heap(max_heap)
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0Adef%20top_k_heap%28nums%3A%20list%5Bint%5D,%20k%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%ED%9E%99%EC%9D%84%20%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC%20%EB%B0%B0%EC%97%B4%EC%97%90%EC%84%9C%20%EA%B0%80%EC%9E%A5%20%ED%81%B0%20k%EA%B0%9C%20%EC%9B%90%EC%86%8C%20%ED%83%90%EC%83%89%22%22%22%0A%20%20%20%20%23%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20heap%20%3D%20%5B%5D%0A%20%20%20%20%23%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%95%9E%EC%AA%BD%20k%EA%B0%9C%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%ED%9E%99%EC%97%90%20%EC%82%BD%EC%9E%85%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28k%29%3A%0A%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20%23%20k%2B1%EB%B2%88%EC%A7%B8%20%EC%9B%90%EC%86%8C%EB%B6%80%ED%84%B0%20%ED%9E%99%EC%9D%98%20%EA%B8%B8%EC%9D%B4%EB%A5%BC%20k%EB%A1%9C%20%EC%9C%A0%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28k,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%ED%98%84%EC%9E%AC%20%EC%9B%90%EC%86%8C%EA%B0%80%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%B3%B4%EB%8B%A4%20%ED%81%AC%EB%A9%B4%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%BA%BC%EB%82%B4%EA%B3%A0%20%ED%98%84%EC%9E%AC%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%ED%9E%99%EC%97%90%20%EC%82%BD%EC%9E%85%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3E%20heap%5B0%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappop%28heap%29%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20return%20heap%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%207,%206,%203,%202%5D%0A%20%20%20%20k%20%3D%203%0A%0A%20%20%20%20res%20%3D%20top_k_heap%28nums,%20k%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0Adef%20top_k_heap%28nums%3A%20list%5Bint%5D,%20k%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%ED%9E%99%EC%9D%84%20%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC%20%EB%B0%B0%EC%97%B4%EC%97%90%EC%84%9C%20%EA%B0%80%EC%9E%A5%20%ED%81%B0%20k%EA%B0%9C%20%EC%9B%90%EC%86%8C%20%ED%83%90%EC%83%89%22%22%22%0A%20%20%20%20%23%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20heap%20%3D%20%5B%5D%0A%20%20%20%20%23%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%95%9E%EC%AA%BD%20k%EA%B0%9C%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%ED%9E%99%EC%97%90%20%EC%82%BD%EC%9E%85%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28k%29%3A%0A%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20%23%20k%2B1%EB%B2%88%EC%A7%B8%20%EC%9B%90%EC%86%8C%EB%B6%80%ED%84%B0%20%ED%9E%99%EC%9D%98%20%EA%B8%B8%EC%9D%B4%EB%A5%BC%20k%EB%A1%9C%20%EC%9C%A0%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28k,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%ED%98%84%EC%9E%AC%20%EC%9B%90%EC%86%8C%EA%B0%80%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%B3%B4%EB%8B%A4%20%ED%81%AC%EB%A9%B4%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%BA%BC%EB%82%B4%EA%B3%A0%20%ED%98%84%EC%9E%AC%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%ED%9E%99%EC%97%90%20%EC%82%BD%EC%9E%85%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3E%20heap%5B0%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappop%28heap%29%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20return%20heap%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%207,%206,%203,%202%5D%0A%20%20%20%20k%20%3D%203%0A%0A%20%20%20%20res%20%3D%20top_k_heap%28nums,%20k%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

삽입과 꺼내기를 총 $n$ 차례 수행하고 힙의 최대 길이는 $k$이므로, 시간 복잡도는 $O(n \log k)$이다. 이 방법은 매우 효율적이다. $k$가 작으면 시간 복잡도가 $O(n)$에 가까워지고, $k$가 커도 $O(n \log n)$을 넘지 않는다.

또한 이 방법은 동적으로 들어오는 데이터 스트림에도 적합하다. 데이터가 계속 추가될 때 힙 안의 원소를 지속적으로 관리하면 가장 큰 $k$ 개 원소를 동적으로 갱신할 수 있다.
