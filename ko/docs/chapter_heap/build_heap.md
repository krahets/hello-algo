---
comments: true
---

# 8.2 &nbsp; 힙 구성 연산

리스트의 모든 원소로 힙을 만들고 싶을 때가 있다. 이 과정을 힙 구성 연산이라고 한다.

## 8.2.1 &nbsp; 힙 삽입 연산을 이용한 구현

먼저 빈 힙을 만들고 리스트를 순회하며 원소를 하나씩 삽입한다. 각 원소를 힙의 맨 끝에 추가한 다음 그 원소부터 위로 올라가며 힙을 복구한다.

원소를 하나 삽입할 때마다 힙의 길이가 하나씩 늘어난다. 이진 트리에 위에서 아래로 차례로 노드가 추가되므로 힙은 위에서 아래로 만들어진다.

원소 수가 $n$이고 각 원소를 삽입하는 데 $O(\log{n})$ 시간이 걸리므로 이 방법으로 힙을 구성하는 시간 복잡도는 $O(n \log n)$이다.

## 8.2.2 &nbsp; 순회하며 힙 복구하기

힙을 더 효율적으로 만드는 방법도 있다. 다음 두 단계로 진행한다.

1. 리스트의 모든 원소를 그대로 힙에 넣는다. 이때는 아직 힙의 성질을 만족한다고 할 수 없다.
2. 힙을 역순(레벨 순회 순서의 역순)으로 순회하면서 리프가 아닌 각 노드에서 위에서 아래로 힙을 복구한다.

**한 노드에서 힙을 복구하고 나면 그 노드를 루트로 하는 서브트리가 힙의 조건을 만족한다**. 역순으로 순회하기 때문에 힙은 아래에서 위로 만들어진다.

역순으로 순회하면 현재 노드 아래의 서브트리들은 이미 힙의 조건을 만족한다. 그래야 현재 노드에서 힙을 복구하는 연산이 제대로 동작한다.

**리프 노드는 자식이 없으므로 그 자체로 힙의 조건을 만족해 복구할 필요가 없다**. 다음 코드에서처럼 리프가 아닌 마지막 노드는 맨 끝 노드의 부모다. 이 부모부터 역순으로 순회하며 힙을 복구한다.

=== "Python"

    ```python title="my_heap.py"
    def __init__(self, nums: list[int]):
        """입력 리스트로 힙을 만드는 생성자"""
        # 리스트의 원소를 그대로 힙에 추가
        self.max_heap = nums
        # 리프를 제외한 모든 노드에서 힙 복구
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 입력 리스트로 힙을 만드는 생성자 */
    MaxHeap(vector<int> nums) {
        // 리스트의 원소를 그대로 힙에 추가
        maxHeap = nums;
        // 리프를 제외한 모든 노드에서 힙 복구
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 입력 리스트로 힙을 만드는 생성자 */
    MaxHeap(List<Integer> nums) {
        // 리스트의 원소를 그대로 힙에 추가
        maxHeap = new ArrayList<>(nums);
        // 리프를 제외한 모든 노드에서 힙 복구
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 입력 리스트로 힙을 만드는 생성자 */
    MaxHeap(IEnumerable<int> nums) {
        // 리스트의 원소를 그대로 힙에 추가
        maxHeap = new List<int>(nums);
        // 리프를 제외한 모든 노드에서 힙 복구
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 슬라이스로 힙을 만드는 생성자 */
    func newMaxHeap(nums []any) *maxHeap {
        // 리스트의 원소를 그대로 힙에 추가
        h := &maxHeap{data: nums}
        for i := h.parent(len(h.data) - 1); i >= 0; i-- {
            // 리프를 제외한 모든 노드에서 힙 복구
            h.siftDown(i)
        }
        return h
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 입력 리스트로 힙을 만드는 생성자 */
    init(nums: [Int]) {
        // 리스트의 원소를 그대로 힙에 추가
        maxHeap = nums
        // 리프를 제외한 모든 노드에서 힙 복구
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 빈 힙을 만들거나 입력 리스트로 힙을 만드는 생성자 */
    constructor(nums) {
        // 리스트의 원소를 그대로 힙에 추가
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // 리프를 제외한 모든 노드에서 힙 복구
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 빈 힙을 만들거나 입력 리스트로 힙을 만드는 생성자 */
    constructor(nums?: number[]) {
        // 리스트의 원소를 그대로 힙에 추가
        this.maxHeap = nums === undefined ? [] : [...nums];
        // 리프를 제외한 모든 노드에서 힙 복구
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 입력 리스트로 힙을 만드는 생성자 */
    MaxHeap(List<int> nums) {
      // 리스트의 원소를 그대로 힙에 추가
      _maxHeap = nums;
      // 리프를 제외한 모든 노드에서 힙 복구
      for (int i = _parent(size() - 1); i >= 0; i--) {
        siftDown(i);
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 입력 리스트로 힙을 만드는 생성자 */
    fn new(nums: Vec<i32>) -> Self {
        // 리스트의 원소를 그대로 힙에 추가
        let mut heap = MaxHeap { max_heap: nums };
        // 리프를 제외한 모든 노드에서 힙 복구
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 슬라이스로 힙을 만드는 생성자 */
    MaxHeap *newMaxHeap(int nums[], int size) {
        // 모든 원소를 힙에 삽입
        MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
        maxHeap->size = size;
        memcpy(maxHeap->data, nums, size * sizeof(int));
        for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
            // 리프를 제외한 모든 노드에서 힙 복구
            siftDown(maxHeap, i);
        }
        return maxHeap;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 최대 힙 */
    class MaxHeap(nums: MutableList<Int>?) {
        // 용량 확장을 따로 고려할 필요가 없도록 배열 대신 리스트 사용
        private val maxHeap = mutableListOf<Int>()

        /* 입력 리스트로 힙을 만드는 생성자 */
        init {
            // 리스트의 원소를 그대로 힙에 추가
            maxHeap.addAll(nums!!)
            // 리프를 제외한 모든 노드에서 힙 복구
            for (i in parent(size() - 1) downTo 0) {
                siftDown(i)
            }
        }

        /* 왼쪽 자식 노드의 인덱스 구하기 */
        private fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* 오른쪽 자식 노드의 인덱스 구하기 */
        private fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* 부모 노드의 인덱스 구하기 */
        private fun parent(i: Int): Int {
            return (i - 1) / 2 // 나눗셈 결과를 내림
        }

        /* 원소 교환 */
        private fun swap(i: Int, j: Int) {
            val temp = maxHeap[i]
            maxHeap[i] = maxHeap[j]
            maxHeap[j] = temp
        }

        /* 힙 크기 구하기 */
        fun size(): Int {
            return maxHeap.size
        }

        /* 힙이 비었는지 확인 */
        fun isEmpty(): Boolean {
            /* 힙이 비었는지 확인 */
            return size() == 0
        }

        /* 힙의 루트 원소 조회 */
        fun peek(): Int {
            return maxHeap[0]
        }

        /* 힙에 원소 삽입 */
        fun push(_val: Int) {
            // 노드 추가
            maxHeap.add(_val)
            // 아래에서 위로 힙 복구
            siftUp(size() - 1)
        }

        /* 노드 i부터 아래에서 위로 힙 복구 */
        private fun siftUp(it: Int) {
            // Kotlin의 함수 매개변수에는 다시 대입할 수 없으므로 임시 변수 생성
            var i = it
            while (true) {
                // 노드 i의 부모 노드 구하기
                val p = parent(i)
                // 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
                if (p < 0 || maxHeap[i] <= maxHeap[p]) break
                // 두 노드 교환
                swap(i, p)
                // 위로 올라가며 힙 복구 반복
                i = p
            }
        }

        /* 힙에서 원소 꺼내기 */
        fun pop(): Int {
            // 빈 힙 처리
            if (isEmpty()) throw IndexOutOfBoundsException()
            // 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
            swap(0, size() - 1)
            // 노드 삭제
            val _val = maxHeap.removeAt(size() - 1)
            // 위에서 아래로 힙 복구
            siftDown(0)
            // 힙의 루트 원소 반환
            return _val
        }

        /* 노드 i부터 위에서 아래로 힙 복구 */
        private fun siftDown(it: Int) {
            // Kotlin의 함수 매개변수에는 다시 대입할 수 없으므로 임시 변수 생성
            var i = it
            while (true) {
                // 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 ma에 저장
                val l = left(i)
                val r = right(i)
                var ma = i
                if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
                if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
                // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
                if (ma == i) break
                // 두 노드 교환
                swap(i, ma)
                // 아래로 내려가며 힙 복구 반복
                i = ma
            }
        }

        /* 힙 출력(이진 트리) */
        fun print() {
            val queue = PriorityQueue { a: Int, b: Int -> b - a }
            queue.addAll(maxHeap)
            printHeap(queue)
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 입력 리스트로 힙을 만드는 생성자 ###
    def initialize(nums)
      # 리스트의 원소를 그대로 힙에 추가
      @max_heap = nums
      # 리프를 제외한 모든 노드에서 힙 복구
      parent(size - 1).downto(0) do |i|
        sift_down(i)
      end
    end
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EB%8C%80%20%ED%9E%99%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%9E%85%EB%A0%A5%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A1%9C%20%ED%9E%99%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EC%9D%98%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B7%B8%EB%8C%80%EB%A1%9C%20%ED%9E%99%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%20%20%20%20%20%20%20%20%23%20%EB%A6%AC%ED%94%84%EB%A5%BC%20%EC%A0%9C%EC%99%B8%ED%95%9C%20%EB%AA%A8%EB%93%A0%20%EB%85%B8%EB%93%9C%EC%97%90%EC%84%9C%20%ED%9E%99%20%EB%B3%B5%EA%B5%AC%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.parent%28self.size%28%29%20-%201%29,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.sift_down%28i%29%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EA%B5%AC%ED%95%98%EA%B8%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EA%B5%AC%ED%95%98%EA%B8%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EA%B5%AC%ED%95%98%EA%B8%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%EB%82%98%EB%88%97%EC%85%88%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EB%82%B4%EB%A6%BC%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%20%ED%81%AC%EA%B8%B0%20%EA%B5%AC%ED%95%98%EA%B8%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%85%B8%EB%93%9C%20i%EB%B6%80%ED%84%B0%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%95%84%EB%9E%98%EB%A1%9C%20%ED%9E%99%20%EB%B3%B5%EA%B5%AC%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i,%20l,%20r%20%EC%A4%91%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%B0%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A5%BC%20ma%EC%97%90%20%EC%A0%80%EC%9E%A5%0A%20%20%20%20%20%20%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i%EA%B0%80%20%EA%B0%80%EC%9E%A5%20%ED%81%AC%EA%B1%B0%EB%82%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20l,%20r%EC%9D%B4%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EB%A9%B4%20%EB%8D%94%20%EB%B3%B5%EA%B5%AC%ED%95%A0%20%ED%95%84%EC%9A%94%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EB%B0%98%EB%B3%B5%20%EC%A2%85%EB%A3%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%85%B8%EB%93%9C%20%EA%B5%90%ED%99%98%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EC%95%84%EB%9E%98%EB%A1%9C%20%EB%82%B4%EB%A0%A4%EA%B0%80%EB%A9%B0%20%ED%9E%99%20%EB%B3%B5%EA%B5%AC%20%EB%B0%98%EB%B3%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B1,%202,%203,%204,%205%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EB%8C%80%20%ED%9E%99%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%9E%85%EB%A0%A5%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A1%9C%20%ED%9E%99%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EC%9D%98%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B7%B8%EB%8C%80%EB%A1%9C%20%ED%9E%99%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%20%20%20%20%20%20%20%20%23%20%EB%A6%AC%ED%94%84%EB%A5%BC%20%EC%A0%9C%EC%99%B8%ED%95%9C%20%EB%AA%A8%EB%93%A0%20%EB%85%B8%EB%93%9C%EC%97%90%EC%84%9C%20%ED%9E%99%20%EB%B3%B5%EA%B5%AC%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.parent%28self.size%28%29%20-%201%29,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.sift_down%28i%29%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EA%B5%AC%ED%95%98%EA%B8%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EA%B5%AC%ED%95%98%EA%B8%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EA%B5%AC%ED%95%98%EA%B8%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%EB%82%98%EB%88%97%EC%85%88%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EB%82%B4%EB%A6%BC%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%20%ED%81%AC%EA%B8%B0%20%EA%B5%AC%ED%95%98%EA%B8%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%85%B8%EB%93%9C%20i%EB%B6%80%ED%84%B0%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%95%84%EB%9E%98%EB%A1%9C%20%ED%9E%99%20%EB%B3%B5%EA%B5%AC%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i,%20l,%20r%20%EC%A4%91%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%B0%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A5%BC%20ma%EC%97%90%20%EC%A0%80%EC%9E%A5%0A%20%20%20%20%20%20%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i%EA%B0%80%20%EA%B0%80%EC%9E%A5%20%ED%81%AC%EA%B1%B0%EB%82%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20l,%20r%EC%9D%B4%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EB%A9%B4%20%EB%8D%94%20%EB%B3%B5%EA%B5%AC%ED%95%A0%20%ED%95%84%EC%9A%94%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EB%B0%98%EB%B3%B5%20%EC%A2%85%EB%A3%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%85%B8%EB%93%9C%20%EA%B5%90%ED%99%98%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EC%95%84%EB%9E%98%EB%A1%9C%20%EB%82%B4%EB%A0%A4%EA%B0%80%EB%A9%B0%20%ED%9E%99%20%EB%B3%B5%EA%B5%AC%20%EB%B0%98%EB%B3%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B1,%202,%203,%204,%205%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>

## 8.2.3 &nbsp; 복잡도 분석

이제 두 번째 방법으로 힙을 구성하는 시간 복잡도를 구해 보자.

- 완전 이진 트리의 노드 수가 $n$이면 리프 노드 수는 $(n + 1) / 2$이다. 여기서 $/$는 나눈 뒤 소수점 이하를 버리는 연산이다. 따라서 힙을 복구해야 할 노드는 $n / 2$개다.
- 위에서 아래로 힙을 복구할 때 각 노드는 리프까지만 내려갈 수 있으므로 최대 반복 횟수는 이진 트리의 높이인 $\log n$이다.

두 값을 곱하면 힙 구성의 시간 복잡도는 $O(n \log n)$이다. **하지만 이 추정치는 정밀하지 않다. 이진 트리에서는 위쪽보다 아래쪽에 노드가 훨씬 많다는 점을 고려하지 않았기 때문이다**.

좀 더 정확하게 계산해 보자. 계산을 단순화하기 위해 노드 수가 $n$이고 높이가 $h$인 포화 이진 트리를 가정한다. 이 가정은 계산 결과의 타당성에 영향을 주지 않는다.

![포화 이진 트리의 레벨별 노드 수](build_heap.assets/heapify_operations_count.svg){ class="animation-figure" }

<p align="center"> 그림 8-5 &nbsp; 포화 이진 트리의 레벨별 노드 수 </p>

위 그림(8-5)처럼 한 노드에서 아래로 힙을 복구할 때 최대 반복 횟수는 그 노드에서 리프까지의 거리, 즉 노드의 높이와 같다. 따라서 레벨마다 ‘노드 수 $\times$ 노드 높이’를 구해 더하면 **모든 노드에서 힙을 복구하는 반복 횟수의 합**을 얻는다.

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

위 식은 학교에서 배운 수열의 성질로 정리할 수 있다. 먼저 $T(h)$에 $2$를 곱하면 다음과 같다.

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \newline
2 T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^{h}\times1 \newline
\end{aligned}
$$

두 식의 항을 한 칸 어긋나게 맞춘 뒤 아래 식 $2 T(h)$에서 위 식 $T(h)$를 빼면 다음과 같다.

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

위 식에서 $T(h)$에 포함된 등비수열의 합을 합 공식으로 구하면 시간 복잡도는 다음과 같다.

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h - 2 \newline
& = O(2^h)
\end{aligned}
$$

높이 $h$인 포화 이진 트리의 노드 수는 $n = 2^{h+1} - 1$이므로 복잡도는 $O(2^h) = O(n)$이다. 즉 **입력 리스트로 힙을 구성하는 시간 복잡도는 $O(n)$으로 매우 효율적이다**.
