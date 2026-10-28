---
comments: true
---

# 11.7 &nbsp; 힙 정렬

!!! tip "참고"

    이 절을 읽기 전에 '힙' 장을 먼저 학습하자.

<u>힙 정렬(heap sort)</u>은 힙 자료 구조를 이용한 효율적인 정렬 알고리즘이다. 이미 배운 '힙 구성 연산'과 '힙에서 원소를 꺼내는 연산'으로 구현할 수 있다.

1. 배열을 입력받아 최소 힙을 구성한다. 이때 가장 작은 원소가 힙의 루트에 놓인다.
2. 힙에서 원소를 계속 꺼내며 순서대로 기록하면 오름차순으로 정렬된 수열을 얻는다.

위 방법도 가능하지만 꺼낸 원소를 저장할 추가 배열이 필요하여 공간을 낭비한다. 실제로는 보통 더 간결한 구현 방식을 사용한다.

## 11.7.1 &nbsp; 알고리즘 과정

배열의 길이가 $n$일 때 힙 정렬의 과정은 아래 그림(11-12)과 같다.

1. 배열을 입력받아 최대 힙을 구성한다. 완료하면 가장 큰 원소가 힙의 루트에 놓인다.
2. 힙의 루트 원소(첫 번째 원소)와 끝 원소(마지막 원소)를 교환한다. 교환 후 힙의 길이는 $1$ 줄고, 정렬된 원소 수는 $1$ 늘어난다.
3. 힙의 루트 원소부터 위에서 아래로 힙 재정렬(sift down)을 수행한다. 재정렬을 마치면 힙의 성질이 복구된다.
4. `2.` 단계와 `3.` 단계를 반복한다. $n - 1$ 회 반복하면 배열 정렬이 완료된다.

!!! tip "참고"

    힙에서 원소를 꺼내는 연산에도 `2.` 단계와 `3.` 단계가 포함되며, 실제로 원소를 꺼내는 단계가 하나 더 있을 뿐이다.

=== "<1>"
    ![힙 정렬 단계](heap_sort.assets/heap_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![힙 정렬 2단계](heap_sort.assets/heap_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![힙 정렬 3단계](heap_sort.assets/heap_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![힙 정렬 4단계](heap_sort.assets/heap_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![힙 정렬 5단계](heap_sort.assets/heap_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![힙 정렬 6단계](heap_sort.assets/heap_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![힙 정렬 7단계](heap_sort.assets/heap_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![힙 정렬 8단계](heap_sort.assets/heap_sort_step8.png){ class="animation-figure" }

=== "<9>"
    ![힙 정렬 9단계](heap_sort.assets/heap_sort_step9.png){ class="animation-figure" }

=== "<10>"
    ![힙 정렬 10단계](heap_sort.assets/heap_sort_step10.png){ class="animation-figure" }

=== "<11>"
    ![힙 정렬 11단계](heap_sort.assets/heap_sort_step11.png){ class="animation-figure" }

=== "<12>"
    ![힙 정렬 12단계](heap_sort.assets/heap_sort_step12.png){ class="animation-figure" }

<p align="center"> 그림 11-12 &nbsp; 힙 정렬 단계 </p>

구현에서는 '힙' 장과 동일한 하향 힙 재정렬 함수 `sift_down()`을 사용한다. 가장 큰 원소를 꺼낼 때마다 힙의 길이가 줄어들므로, 현재 유효한 힙 길이를 지정하는 매개변수 $n$을 `sift_down()`에 추가해야 한다. 코드는 다음과 같다.

=== "Python"

    ```python title="heap_sort.py"
    def sift_down(nums: list[int], n: int, i: int):
        """길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬"""
        while True:
            # 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            l = 2 * i + 1
            r = 2 * i + 2
            ma = i
            if l < n and nums[l] > nums[ma]:
                ma = l
            if r < n and nums[r] > nums[ma]:
                ma = r
            # 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if ma == i:
                break
            # 두 노드를 교환한다
            nums[i], nums[ma] = nums[ma], nums[i]
            # 아래쪽으로 힙 재정렬을 반복한다
            i = ma

    def heap_sort(nums: list[int]):
        """힙 정렬"""
        # 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for i in range(len(nums) // 2 - 1, -1, -1):
            sift_down(nums, len(nums), i)
        # 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
        for i in range(len(nums) - 1, 0, -1):
            # 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            nums[0], nums[i] = nums[i], nums[0]
            # 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
            sift_down(nums, i, 0)
    ```

=== "C++"

    ```cpp title="heap_sort.cpp"
    /* 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 */
    void siftDown(vector<int> &nums, int n, int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma == i) {
                break;
            }
            // 두 노드를 교환한다
            swap(nums[i], nums[ma]);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }

    /* 힙 정렬 */
    void heapSort(vector<int> &nums) {
        // 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (int i = nums.size() / 2 - 1; i >= 0; --i) {
            siftDown(nums, nums.size(), i);
        }
        // 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
        for (int i = nums.size() - 1; i > 0; --i) {
            // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            swap(nums[0], nums[i]);
            // 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
            siftDown(nums, i, 0);
        }
    }
    ```

=== "Java"

    ```java title="heap_sort.java"
    /* 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 */
    void siftDown(int[] nums, int n, int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma == i)
                break;
            // 두 노드를 교환한다
            int temp = nums[i];
            nums[i] = nums[ma];
            nums[ma] = temp;
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }

    /* 힙 정렬 */
    void heapSort(int[] nums) {
        // 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (int i = nums.length / 2 - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
        for (int i = nums.length - 1; i > 0; i--) {
            // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            int tmp = nums[0];
            nums[0] = nums[i];
            nums[i] = tmp;
            // 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
            siftDown(nums, i, 0);
        }
    }
    ```

=== "C#"

    ```csharp title="heap_sort.cs"
    /* 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 */
    void SiftDown(int[] nums, int n, int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma == i)
                break;
            // 두 노드를 교환한다
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }

    /* 힙 정렬 */
    void HeapSort(int[] nums) {
        // 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
        for (int i = nums.Length - 1; i > 0; i--) {
            // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
            SiftDown(nums, i, 0);
        }
    }
    ```

=== "Go"

    ```go title="heap_sort.go"
    /* 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 */
    func siftDown(nums *[]int, n, i int) {
        for true {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            l := 2*i + 1
            r := 2*i + 2
            ma := i
            if l < n && (*nums)[l] > (*nums)[ma] {
                ma = l
            }
            if r < n && (*nums)[r] > (*nums)[ma] {
                ma = r
            }
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if ma == i {
                break
            }
            // 두 노드를 교환한다
            (*nums)[i], (*nums)[ma] = (*nums)[ma], (*nums)[i]
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma
        }
    }

    /* 힙 정렬 */
    func heapSort(nums *[]int) {
        // 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for i := len(*nums)/2 - 1; i >= 0; i-- {
            siftDown(nums, len(*nums), i)
        }
        // 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
        for i := len(*nums) - 1; i > 0; i-- {
            // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            (*nums)[0], (*nums)[i] = (*nums)[i], (*nums)[0]
            // 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
            siftDown(nums, i, 0)
        }
    }
    ```

=== "Swift"

    ```swift title="heap_sort.swift"
    /* 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 */
    func siftDown(nums: inout [Int], n: Int, i: Int) {
        var i = i
        while true {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            let l = 2 * i + 1
            let r = 2 * i + 2
            var ma = i
            if l < n, nums[l] > nums[ma] {
                ma = l
            }
            if r < n, nums[r] > nums[ma] {
                ma = r
            }
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if ma == i {
                break
            }
            // 두 노드를 교환한다
            nums.swapAt(i, ma)
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma
        }
    }

    /* 힙 정렬 */
    func heapSort(nums: inout [Int]) {
        // 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
            siftDown(nums: &nums, n: nums.count, i: i)
        }
        // 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
        for i in nums.indices.dropFirst().reversed() {
            // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            nums.swapAt(0, i)
            // 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
            siftDown(nums: &nums, n: i, i: 0)
        }
    }
    ```

=== "JS"

    ```javascript title="heap_sort.js"
    /* 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 */
    function siftDown(nums, n, i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            let l = 2 * i + 1;
            let r = 2 * i + 2;
            let ma = i;
            if (l < n && nums[l] > nums[ma]) {
                ma = l;
            }
            if (r < n && nums[r] > nums[ma]) {
                ma = r;
            }
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma === i) {
                break;
            }
            // 두 노드를 교환한다
            [nums[i], nums[ma]] = [nums[ma], nums[i]];
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }

    /* 힙 정렬 */
    function heapSort(nums) {
        // 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
        for (let i = nums.length - 1; i > 0; i--) {
            // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            [nums[0], nums[i]] = [nums[i], nums[0]];
            // 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
            siftDown(nums, i, 0);
        }
    }
    ```

=== "TS"

    ```typescript title="heap_sort.ts"
    /* 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 */
    function siftDown(nums: number[], n: number, i: number): void {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            let l = 2 * i + 1;
            let r = 2 * i + 2;
            let ma = i;
            if (l < n && nums[l] > nums[ma]) {
                ma = l;
            }
            if (r < n && nums[r] > nums[ma]) {
                ma = r;
            }
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma === i) {
                break;
            }
            // 두 노드를 교환한다
            [nums[i], nums[ma]] = [nums[ma], nums[i]];
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }

    /* 힙 정렬 */
    function heapSort(nums: number[]): void {
        // 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
        for (let i = nums.length - 1; i > 0; i--) {
            // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            [nums[0], nums[i]] = [nums[i], nums[0]];
            // 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
            siftDown(nums, i, 0);
        }
    }
    ```

=== "Dart"

    ```dart title="heap_sort.dart"
    /* 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 */
    void siftDown(List<int> nums, int n, int i) {
      while (true) {
        // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma]) ma = l;
        if (r < n && nums[r] > nums[ma]) ma = r;
        // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
        if (ma == i) break;
        // 두 노드를 교환한다
        int temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // 아래쪽으로 힙 재정렬을 반복한다
        i = ma;
      }
    }

    /* 힙 정렬 */
    void heapSort(List<int> nums) {
      // 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
      for (int i = nums.length ~/ 2 - 1; i >= 0; i--) {
        siftDown(nums, nums.length, i);
      }
      // 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
      for (int i = nums.length - 1; i > 0; i--) {
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        int tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
        siftDown(nums, i, 0);
      }
    }
    ```

=== "Rust"

    ```rust title="heap_sort.rs"
    /* 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 */
    fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
        loop {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            let l = 2 * i + 1;
            let r = 2 * i + 2;
            let mut ma = i;
            if l < n && nums[l] > nums[ma] {
                ma = l;
            }
            if r < n && nums[r] > nums[ma] {
                ma = r;
            }
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if ma == i {
                break;
            }
            // 두 노드를 교환한다
            nums.swap(i, ma);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }

    /* 힙 정렬 */
    fn heap_sort(nums: &mut [i32]) {
        // 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for i in (0..nums.len() / 2).rev() {
            sift_down(nums, nums.len(), i);
        }
        // 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
        for i in (1..nums.len()).rev() {
            // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            nums.swap(0, i);
            // 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
            sift_down(nums, i, 0);
        }
    }
    ```

=== "C"

    ```c title="heap_sort.c"
    /* 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 */
    void siftDown(int nums[], int n, int i) {
        while (1) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma == i) {
                break;
            }
            // 두 노드를 교환한다
            int temp = nums[i];
            nums[i] = nums[ma];
            nums[ma] = temp;
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }

    /* 힙 정렬 */
    void heapSort(int nums[], int n) {
        // 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (int i = n / 2 - 1; i >= 0; --i) {
            siftDown(nums, n, i);
        }
        // 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
        for (int i = n - 1; i > 0; --i) {
            // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            int tmp = nums[0];
            nums[0] = nums[i];
            nums[i] = tmp;
            // 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
            siftDown(nums, i, 0);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="heap_sort.kt"
    /* 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 */
    fun siftDown(nums: IntArray, n: Int, li: Int) {
        var i = li
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            val l = 2 * i + 1
            val r = 2 * i + 2
            var ma = i
            if (l < n && nums[l] > nums[ma]) 
                ma = l
            if (r < n && nums[r] > nums[ma]) 
                ma = r
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma == i) 
                break
            // 두 노드를 교환한다
            val temp = nums[i]
            nums[i] = nums[ma]
            nums[ma] = temp
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma
        }
    }

    /* 힙 정렬 */
    fun heapSort(nums: IntArray) {
        // 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (i in nums.size / 2 - 1 downTo 0) {
            siftDown(nums, nums.size, i)
        }
        // 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
        for (i in nums.size - 1 downTo 1) {
            // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            val temp = nums[0]
            nums[0] = nums[i]
            nums[i] = temp
            // 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
            siftDown(nums, i, 0)
        }
    }
    ```

=== "Ruby"

    ```ruby title="heap_sort.rb"
    ### 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 ###
    def sift_down(nums, n, i)
      while true
        # 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        ma = l if l < n && nums[l] > nums[ma]
        ma = r if r < n && nums[r] > nums[ma]
        # 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
        break if ma == i
        # 두 노드를 교환한다
        nums[i], nums[ma] = nums[ma], nums[i]
        # 아래쪽으로 힙 재정렬을 반복한다
        i = ma
      end
    end

    ### 힙 정렬 ###
    def heap_sort(nums)
      # 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
      (nums.length / 2 - 1).downto(0) do |i|
        sift_down(nums, nums.length, i)
      end
      # 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
      (nums.length - 1).downto(1) do |i|
        # 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        nums[0], nums[i] = nums[i], nums[0]
        # 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
        sift_down(nums, i, 0)
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20sift_down%28nums%3A%20list%5Bint%5D,%20n%3A%20int,%20i%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EA%B8%B8%EC%9D%B4%EA%B0%80%20n%EC%9D%B8%20%ED%9E%99%EC%97%90%EC%84%9C%20%EB%85%B8%EB%93%9C%20i%EB%B6%80%ED%84%B0%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%95%84%EB%9E%98%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i,%20l,%20r%20%EC%A4%91%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%B0%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%B0%BE%EC%95%84%20ma%EB%A1%9C%20%ED%91%9C%EC%8B%9C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20l%20%3D%202%20%2A%20i%20%2B%201%0A%20%20%20%20%20%20%20%20r%20%3D%202%20%2A%20i%20%2B%202%0A%20%20%20%20%20%20%20%20ma%20%3D%20i%0A%20%20%20%20%20%20%20%20if%20l%20%3C%20n%20and%20nums%5Bl%5D%20%3E%20nums%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20if%20r%20%3C%20n%20and%20nums%5Br%5D%20%3E%20nums%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i%EC%9D%98%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%AC%EA%B1%B0%EB%82%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20l,%20r%EC%9D%B4%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EB%A9%B4%20%ED%9E%99%EC%9D%84%20%EB%8D%94%20%EC%9E%AC%EC%A0%95%EB%A0%AC%ED%95%A0%20%ED%95%84%EC%9A%94%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bma%5D%20%3D%20nums%5Bma%5D,%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20%23%20%EC%95%84%EB%9E%98%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0Adef%20heap_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%ED%9E%99%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%23%20%ED%9E%99%20%EA%B5%AC%EC%84%B1%20%EC%97%B0%EC%82%B0%3A%20%EB%A6%AC%ED%94%84%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%A0%9C%EC%99%B8%ED%95%9C%20%EB%AA%A8%EB%93%A0%20%EB%85%B8%EB%93%9C%EC%97%90%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EC%88%98%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20//%202%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20sift_down%28nums,%20len%28nums%29,%20i%29%0A%20%20%20%20%23%20%ED%9E%99%EC%97%90%EC%84%9C%20%EC%B5%9C%EB%8C%93%EA%B0%92%EC%9D%84%20%EA%BA%BC%EB%82%B4%EB%8A%94%20%EC%9E%91%EC%97%85%EC%9D%84%20n-1%ED%9A%8C%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EC%99%80%20%EA%B0%80%EC%9E%A5%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%A6%AC%ED%94%84%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%28%EC%B2%AB%20%EC%9B%90%EC%86%8C%EC%99%80%20%EB%A7%88%EC%A7%80%EB%A7%89%20%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%29%0A%20%20%20%20%20%20%20%20nums%5B0%5D,%20nums%5Bi%5D%20%3D%20nums%5Bi%5D,%20nums%5B0%5D%0A%20%20%20%20%20%20%20%20%23%20%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EC%97%90%EC%84%9C%20%EC%8B%9C%EC%9E%91%ED%95%98%EC%97%AC%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%95%84%EB%9E%98%EB%A1%9C%20%ED%9E%99%EC%9D%84%20%EC%9E%AC%EC%A0%95%EB%A0%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20sift_down%28nums,%20i,%200%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20heap_sort%28nums%29%0A%20%20%20%20print%28%22%ED%9E%99%20%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%A7%88%EC%B9%9C%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20sift_down%28nums%3A%20list%5Bint%5D,%20n%3A%20int,%20i%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EA%B8%B8%EC%9D%B4%EA%B0%80%20n%EC%9D%B8%20%ED%9E%99%EC%97%90%EC%84%9C%20%EB%85%B8%EB%93%9C%20i%EB%B6%80%ED%84%B0%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%95%84%EB%9E%98%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i,%20l,%20r%20%EC%A4%91%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%B0%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%B0%BE%EC%95%84%20ma%EB%A1%9C%20%ED%91%9C%EC%8B%9C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20l%20%3D%202%20%2A%20i%20%2B%201%0A%20%20%20%20%20%20%20%20r%20%3D%202%20%2A%20i%20%2B%202%0A%20%20%20%20%20%20%20%20ma%20%3D%20i%0A%20%20%20%20%20%20%20%20if%20l%20%3C%20n%20and%20nums%5Bl%5D%20%3E%20nums%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20if%20r%20%3C%20n%20and%20nums%5Br%5D%20%3E%20nums%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i%EC%9D%98%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%AC%EA%B1%B0%EB%82%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20l,%20r%EC%9D%B4%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EB%A9%B4%20%ED%9E%99%EC%9D%84%20%EB%8D%94%20%EC%9E%AC%EC%A0%95%EB%A0%AC%ED%95%A0%20%ED%95%84%EC%9A%94%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bma%5D%20%3D%20nums%5Bma%5D,%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20%23%20%EC%95%84%EB%9E%98%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0Adef%20heap_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%ED%9E%99%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%23%20%ED%9E%99%20%EA%B5%AC%EC%84%B1%20%EC%97%B0%EC%82%B0%3A%20%EB%A6%AC%ED%94%84%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%A0%9C%EC%99%B8%ED%95%9C%20%EB%AA%A8%EB%93%A0%20%EB%85%B8%EB%93%9C%EC%97%90%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EC%88%98%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20//%202%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20sift_down%28nums,%20len%28nums%29,%20i%29%0A%20%20%20%20%23%20%ED%9E%99%EC%97%90%EC%84%9C%20%EC%B5%9C%EB%8C%93%EA%B0%92%EC%9D%84%20%EA%BA%BC%EB%82%B4%EB%8A%94%20%EC%9E%91%EC%97%85%EC%9D%84%20n-1%ED%9A%8C%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EC%99%80%20%EA%B0%80%EC%9E%A5%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%A6%AC%ED%94%84%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%28%EC%B2%AB%20%EC%9B%90%EC%86%8C%EC%99%80%20%EB%A7%88%EC%A7%80%EB%A7%89%20%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%29%0A%20%20%20%20%20%20%20%20nums%5B0%5D,%20nums%5Bi%5D%20%3D%20nums%5Bi%5D,%20nums%5B0%5D%0A%20%20%20%20%20%20%20%20%23%20%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EC%97%90%EC%84%9C%20%EC%8B%9C%EC%9E%91%ED%95%98%EC%97%AC%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%95%84%EB%9E%98%EB%A1%9C%20%ED%9E%99%EC%9D%84%20%EC%9E%AC%EC%A0%95%EB%A0%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20sift_down%28nums,%20i,%200%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20heap_sort%28nums%29%0A%20%20%20%20print%28%22%ED%9E%99%20%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%A7%88%EC%B9%9C%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 11.7.2 &nbsp; 알고리즘 특성

- **시간 복잡도 $O(n \log n)$, 비적응형 정렬**: 힙 구성에는 $O(n)$ 시간이 걸린다. 힙에서 최댓값을 꺼내는 시간 복잡도는 $O(\log n)$이며, 총 $n - 1$ 회 반복한다.
- **공간 복잡도 $O(1)$, 제자리 정렬**: 몇 개의 포인터 변수가 $O(1)$ 공간을 사용한다. 원소 교환과 힙 재정렬은 모두 원래 배열에서 수행한다.
- **불안정 정렬**: 힙의 루트 원소와 끝 원소를 교환할 때 값이 같은 원소들의 상대적 위치가 바뀔 수 있다.
