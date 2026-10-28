---
comments: true
---

# 8.2 &nbsp; 힙 구성 연산

어떤 상황에서는 리스트의 모든 원소를 사용해 힙을 구성하고 싶을 수 있다. 이 과정을 '힙 구성 연산'이라고 한다.

## 8.2.1 &nbsp; 힙 삽입 연산을 이용한 구현

먼저 빈 힙을 만든 다음, 리스트를 순회하면서 각 원소에 대해 차례로 '힙 삽입 연산'을 수행한다. 즉, 원소를 힙의 끝에 추가한 뒤 해당 원소부터 '아래에서 위로' 힙을 재정렬한다.

원소 하나를 힙에 삽입할 때마다 힙의 길이가 1씩 늘어난다. 이진 트리에 위에서 아래 순서로 노드를 추가하므로 힙은 '위에서 아래로' 구성된다.

원소의 개수를 $n$이라고 하자. 각 원소의 힙 삽입 연산에는 $O(\log{n})$ 시간이 걸리므로, 이 힙 구성 방법의 시간 복잡도는 $O(n \log n)$이다.

## 8.2.2 &nbsp; 순회하며 힙을 재정렬하는 구현

실제로는 다음 두 단계로 더 효율적인 힙 구성 방법을 구현할 수 있다.

1. 리스트의 모든 원소를 그대로 힙에 추가한다. 이 시점에서는 아직 힙의 성질을 만족하지 않는다.
2. 힙을 역순으로 순회하면서(레벨 순서 순회의 역순), 각 내부 노드에 대해 차례로 '위에서 아래로 힙 재정렬'을 수행한다.

**노드 하나를 재정렬할 때마다 그 노드를 루트로 하는 서브트리가 올바른 부분 힙이 된다**. 역순으로 순회하므로 힙은 '아래에서 위로' 구성된다.

역순으로 순회하는 이유는 현재 노드 아래의 서브트리들이 이미 올바른 부분 힙임을 보장하기 위해서다. 그래야 현재 노드를 재정렬하는 작업이 유효해진다.

**리프 노드는 자식 노드가 없으므로 그 자체로 올바른 부분 힙이며, 재정렬할 필요가 없다**. 아래 코드와 같이 마지막 내부 노드는 마지막 노드의 부모 노드다. 여기서부터 역순으로 순회하며 힙 재정렬을 수행한다.

=== "Python"

    ```python title="my_heap.py"
    def __init__(self, nums: list[int]):
        """생성자: 입력 리스트를 바탕으로 힙 구성"""
        # 리스트 원소를 그대로 힙에 추가한다
        self.max_heap = nums
        # 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
    MaxHeap(vector<int> nums) {
        // 리스트 원소를 그대로 힙에 추가한다
        maxHeap = nums;
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
    MaxHeap(List<Integer> nums) {
        // 리스트 원소를 그대로 힙에 추가한다
        maxHeap = new ArrayList<>(nums);
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 생성자: 입력 리스트로 힙 구성 */
    MaxHeap(IEnumerable<int> nums) {
        // 리스트 원소를 그대로 힙에 추가한다
        maxHeap = new List<int>(nums);
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 생성자: 슬라이스를 바탕으로 힙 구성 */
    func newMaxHeap(nums []any) *maxHeap {
        // 리스트 원소를 그대로 힙에 추가한다
        h := &maxHeap{data: nums}
        for i := h.parent(len(h.data) - 1); i >= 0; i-- {
            // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
            h.siftDown(i)
        }
        return h
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
    init(nums: [Int]) {
        // 리스트 원소를 그대로 힙에 추가한다
        maxHeap = nums
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 생성자: 빈 힙을 만들거나 입력 리스트로 힙을 구성한다 */
    constructor(nums) {
        // 리스트 원소를 그대로 힙에 추가한다
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 생성자: 빈 힙을 만들거나 입력 리스트로 힙을 구성한다 */
    constructor(nums?: number[]) {
        // 리스트 원소를 그대로 힙에 추가한다
        this.maxHeap = nums === undefined ? [] : [...nums];
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
    MaxHeap(List<int> nums) {
      // 리스트 원소를 그대로 힙에 추가한다
      _maxHeap = nums;
      // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
      for (int i = _parent(size() - 1); i >= 0; i--) {
        siftDown(i);
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
    fn new(nums: Vec<i32>) -> Self {
        // 리스트 원소를 그대로 힙에 추가한다
        let mut heap = MaxHeap { max_heap: nums };
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 생성자: 슬라이스를 바탕으로 힙 구성 */
    MaxHeap *newMaxHeap(int nums[], int size) {
        // 모든 원소를 힙에 삽입한다
        MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
        maxHeap->size = size;
        memcpy(maxHeap->data, nums, size * sizeof(int));
        for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
            // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
            siftDown(maxHeap, i);
        }
        return maxHeap;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 최대 힙 */
    class MaxHeap(nums: MutableList<Int>?) {
        // 배열 대신 리스트를 사용하므로 용량 확장을 고려할 필요가 없다
        private val maxHeap = mutableListOf<Int>()

        /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
        init {
            // 리스트 원소를 그대로 힙에 추가한다
            maxHeap.addAll(nums!!)
            // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
            for (i in parent(size() - 1) downTo 0) {
                siftDown(i)
            }
        }

        /* 왼쪽 자식 노드의 인덱스 반환 */
        private fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* 오른쪽 자식 노드의 인덱스 반환 */
        private fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* 부모 노드의 인덱스 반환 */
        private fun parent(i: Int): Int {
            return (i - 1) / 2 // 나눗셈의 결과를 내림한다
        }

        /* 원소 교환 */
        private fun swap(i: Int, j: Int) {
            val temp = maxHeap[i]
            maxHeap[i] = maxHeap[j]
            maxHeap[j] = temp
        }

        /* 힙 크기 반환 */
        fun size(): Int {
            return maxHeap.size
        }

        /* 힙이 비어 있는지 판단 */
        fun isEmpty(): Boolean {
            /* 힙이 비어 있는지 판단 */
            return size() == 0
        }

        /* 힙의 루트 원소 접근 */
        fun peek(): Int {
            return maxHeap[0]
        }

        /* 힙에 원소 삽입 */
        fun push(_val: Int) {
            // 노드 추가
            maxHeap.add(_val)
            // 아래에서 위로 힙을 재정렬한다
            siftUp(size() - 1)
        }

        /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
        private fun siftUp(it: Int) {
            // Kotlin의 함수 매개변수는 변경할 수 없으므로 임시 변수를 생성한다
            var i = it
            while (true) {
                // 노드 i의 부모 노드를 구한다
                val p = parent(i)
                // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
                if (p < 0 || maxHeap[i] <= maxHeap[p]) break
                // 두 노드를 교환한다
                swap(i, p)
                // 위쪽으로 힙 재정렬을 반복한다
                i = p
            }
        }

        /* 힙에서 원소 꺼내기 */
        fun pop(): Int {
            // 비어 있는 경우를 처리한다
            if (isEmpty()) throw IndexOutOfBoundsException()
            // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            swap(0, size() - 1)
            // 노드 삭제
            val _val = maxHeap.removeAt(size() - 1)
            // 위에서 아래로 힙을 재정렬한다
            siftDown(0)
            // 힙의 루트 원소를 반환한다
            return _val
        }

        /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
        private fun siftDown(it: Int) {
            // Kotlin의 함수 매개변수는 변경할 수 없으므로 임시 변수를 생성한다
            var i = it
            while (true) {
                // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
                val l = left(i)
                val r = right(i)
                var ma = i
                if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
                if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
                // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
                if (ma == i) break
                // 두 노드를 교환한다
                swap(i, ma)
                // 아래쪽으로 힙 재정렬을 반복한다
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
    ### 생성자: 입력 리스트를 바탕으로 힙 구성 ###
    def initialize(nums)
      # 리스트 원소를 그대로 힙에 추가한다
      @max_heap = nums
      # 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
      parent(size - 1).downto(0) do |i|
        sift_down(i)
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EB%8C%80%20%ED%9E%99%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%3A%20%EC%9E%85%EB%A0%A5%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EB%B0%94%ED%83%95%EC%9C%BC%EB%A1%9C%20%ED%9E%99%20%EA%B5%AC%EC%84%B1%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B7%B8%EB%8C%80%EB%A1%9C%20%ED%9E%99%EC%97%90%20%EC%B6%94%EA%B0%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%20%20%20%20%20%20%20%20%23%20%EB%A6%AC%ED%94%84%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%A0%9C%EC%99%B8%ED%95%9C%20%EB%AA%A8%EB%93%A0%20%EB%85%B8%EB%93%9C%EC%97%90%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EC%88%98%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.parent%28self.size%28%29%20-%201%29,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.sift_down%28i%29%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%EB%82%98%EB%88%97%EC%85%88%EC%9D%98%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EB%82%B4%EB%A6%BC%ED%95%9C%EB%8B%A4%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%20%ED%81%AC%EA%B8%B0%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%85%B8%EB%93%9C%20i%EC%97%90%EC%84%9C%20%EC%8B%9C%EC%9E%91%ED%95%98%EC%97%AC%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%95%84%EB%9E%98%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i,%20l,%20r%20%EC%A4%91%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%B0%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%B0%BE%EC%95%84%20ma%EB%A1%9C%20%ED%91%9C%EC%8B%9C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i%EC%9D%98%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%AC%EA%B1%B0%EB%82%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20l,%20r%EC%9D%B4%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EB%A9%B4%20%ED%9E%99%EC%9D%84%20%EB%8D%94%20%EC%9E%AC%EC%A0%95%EB%A0%AC%ED%95%A0%20%ED%95%84%EC%9A%94%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EC%95%84%EB%9E%98%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B1,%202,%203,%204,%205%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EB%8C%80%20%ED%9E%99%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%3A%20%EC%9E%85%EB%A0%A5%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EB%B0%94%ED%83%95%EC%9C%BC%EB%A1%9C%20%ED%9E%99%20%EA%B5%AC%EC%84%B1%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B7%B8%EB%8C%80%EB%A1%9C%20%ED%9E%99%EC%97%90%20%EC%B6%94%EA%B0%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%20%20%20%20%20%20%20%20%23%20%EB%A6%AC%ED%94%84%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%A0%9C%EC%99%B8%ED%95%9C%20%EB%AA%A8%EB%93%A0%20%EB%85%B8%EB%93%9C%EC%97%90%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EC%88%98%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.parent%28self.size%28%29%20-%201%29,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.sift_down%28i%29%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%EB%82%98%EB%88%97%EC%85%88%EC%9D%98%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EB%82%B4%EB%A6%BC%ED%95%9C%EB%8B%A4%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%20%ED%81%AC%EA%B8%B0%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%85%B8%EB%93%9C%20i%EC%97%90%EC%84%9C%20%EC%8B%9C%EC%9E%91%ED%95%98%EC%97%AC%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%95%84%EB%9E%98%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i,%20l,%20r%20%EC%A4%91%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%B0%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%B0%BE%EC%95%84%20ma%EB%A1%9C%20%ED%91%9C%EC%8B%9C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i%EC%9D%98%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%AC%EA%B1%B0%EB%82%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20l,%20r%EC%9D%B4%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EB%A9%B4%20%ED%9E%99%EC%9D%84%20%EB%8D%94%20%EC%9E%AC%EC%A0%95%EB%A0%AC%ED%95%A0%20%ED%95%84%EC%9A%94%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EC%95%84%EB%9E%98%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B1,%202,%203,%204,%205%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 8.2.3 &nbsp; 복잡도 분석

이제 두 번째 힙 구성 방법의 시간 복잡도를 계산해 보자.

- 완전 이진 트리의 노드 수가 $n$이라면, 리프 노드의 수는 $(n + 1) / 2$이다. 여기서 $/$는 내림 정수 나눗셈이다. 따라서 재정렬해야 하는 노드의 수는 $n / 2$이다.
- 위에서 아래로 힙을 재정렬할 때 각 노드는 최대 리프 노드까지 내려갈 수 있으므로, 최대 반복 횟수는 이진 트리의 높이인 $\log n$이다.

위의 두 값을 곱하면 힙 구성 과정의 시간 복잡도가 $O(n \log n)$이 된다. **하지만 이 추정은 정확하지 않다. 이진 트리에서는 아래쪽 노드의 수가 위쪽 노드보다 훨씬 많다는 성질을 고려하지 않았기 때문이다**.

이제 더 정확하게 계산해 보자. 계산을 간단히 하기 위해 노드 수가 $n$이고 높이가 $h$인 '포화 이진 트리'가 주어졌다고 가정한다. 이 가정은 계산 결과의 정확성에 영향을 주지 않는다.

![포화 이진 트리의 레벨별 노드 수](build_heap.assets/heapify_operations_count.png){ class="animation-figure" }

<p align="center"> 그림 8-5 &nbsp; 포화 이진 트리의 레벨별 노드 수 </p>

위 그림(8-5)에서 노드를 '위에서 아래로 재정렬'하는 최대 반복 횟수는 그 노드에서 리프 노드까지의 거리와 같으며, 이 거리는 바로 '노드의 높이'다. 따라서 각 레벨의 '노드 수 $\times$ 노드 높이'를 더하면 **모든 노드에 대한 힙 재정렬의 총반복 횟수**를 구할 수 있다.

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

위 식을 정리하려면 중등 수학의 수열 지식이 필요하다. 먼저 $T(h)$에 $2$를 곱하면 다음과 같다.

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \newline
2 T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^{h}\times1 \newline
\end{aligned}
$$

두 식의 항을 한 칸씩 어긋나게 놓고 아래 식 $2 T(h)$에서 위 식 $T(h)$를 빼면 다음을 얻는다.

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

위 식에서 $T(h)$를 이루는 항들이 등비수열을 이루므로 합 공식을 바로 적용하여 시간 복잡도를 구할 수 있다.

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h - 2 \newline
& = O(2^h)
\end{aligned}
$$

또한 높이가 $h$인 포화 이진 트리의 노드 수는 $n = 2^{h+1} - 1$이므로, 복잡도가 $O(2^h) = O(n)$임을 쉽게 알 수 있다. 위 계산은 **리스트를 입력받아 힙을 구성하는 시간 복잡도가 $O(n)$으로 매우 효율적**임을 보여 준다.
