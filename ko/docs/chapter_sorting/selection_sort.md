---
comments: true
---

# 11.2 &nbsp; 선택 정렬

<u>선택 정렬(selection sort)</u>의 원리는 매우 간단하다. 반복문을 실행하여 매번 정렬되지 않은 구간에서 가장 작은 원소를 고른 뒤 정렬된 구간의 끝에 놓는다.

배열의 길이가 $n$일 때 선택 정렬의 과정은 아래 그림(11-2)과 같다.

1. 처음에는 모든 원소가 정렬되지 않았으므로 미정렬 구간(인덱스)은 $[0, n-1]$이다.
2. 구간 $[0, n-1]$에서 가장 작은 원소를 골라 인덱스 $0$의 원소와 교환한다. 그러면 배열의 앞 1개 원소가 정렬된다.
3. 구간 $[1, n-1]$에서 가장 작은 원소를 골라 인덱스 $1$의 원소와 교환한다. 그러면 배열의 앞 2개 원소가 정렬된다.
4. 같은 과정을 반복한다. $n - 1$ 번 선택하고 교환하면 배열의 앞 $n - 1$ 개 원소가 정렬된다.
5. 남은 원소 하나는 반드시 가장 큰 원소이므로 정렬할 필요가 없으며, 배열 정렬이 완료된다.

=== "<1>"
    ![선택 정렬 단계](selection_sort.assets/selection_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![선택 정렬 2단계](selection_sort.assets/selection_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![선택 정렬 3단계](selection_sort.assets/selection_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![선택 정렬 4단계](selection_sort.assets/selection_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![선택 정렬 5단계](selection_sort.assets/selection_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![선택 정렬 6단계](selection_sort.assets/selection_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![선택 정렬 7단계](selection_sort.assets/selection_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![선택 정렬 8단계](selection_sort.assets/selection_sort_step8.png){ class="animation-figure" }

=== "<9>"
    ![선택 정렬 9단계](selection_sort.assets/selection_sort_step9.png){ class="animation-figure" }

=== "<10>"
    ![선택 정렬 10단계](selection_sort.assets/selection_sort_step10.png){ class="animation-figure" }

=== "<11>"
    ![선택 정렬 11단계](selection_sort.assets/selection_sort_step11.png){ class="animation-figure" }

<p align="center"> 그림 11-2 &nbsp; 선택 정렬 단계 </p>

코드에서는 $k$로 미정렬 구간의 최소 원소를 기록한다.

=== "Python"

    ```python title="selection_sort.py"
    def selection_sort(nums: list[int]):
        """선택 정렬"""
        n = len(nums)
        # 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for i in range(n - 1):
            # 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            k = i
            for j in range(i + 1, n):
                if nums[j] < nums[k]:
                    k = j  # 최솟값의 인덱스를 기록한다
            # 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            nums[i], nums[k] = nums[k], nums[i]
    ```

=== "C++"

    ```cpp title="selection_sort.cpp"
    /* 선택 정렬 */
    void selectionSort(vector<int> &nums) {
        int n = nums.size();
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for (int i = 0; i < n - 1; i++) {
            // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 최솟값의 인덱스를 기록한다
            }
            // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            swap(nums[i], nums[k]);
        }
    }
    ```

=== "Java"

    ```java title="selection_sort.java"
    /* 선택 정렬 */
    void selectionSort(int[] nums) {
        int n = nums.length;
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for (int i = 0; i < n - 1; i++) {
            // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 최솟값의 인덱스를 기록한다
            }
            // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }
    ```

=== "C#"

    ```csharp title="selection_sort.cs"
    /* 선택 정렬 */
    void SelectionSort(int[] nums) {
        int n = nums.Length;
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for (int i = 0; i < n - 1; i++) {
            // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 최솟값의 인덱스를 기록한다
            }
            // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            (nums[k], nums[i]) = (nums[i], nums[k]);
        }
    }
    ```

=== "Go"

    ```go title="selection_sort.go"
    /* 선택 정렬 */
    func selectionSort(nums []int) {
        n := len(nums)
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for i := 0; i < n-1; i++ {
            // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            k := i
            for j := i + 1; j < n; j++ {
                if nums[j] < nums[k] {
                    // 최솟값의 인덱스를 기록한다
                    k = j
                }
            }
            // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            nums[i], nums[k] = nums[k], nums[i]

        }
    }
    ```

=== "Swift"

    ```swift title="selection_sort.swift"
    /* 선택 정렬 */
    func selectionSort(nums: inout [Int]) {
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for i in nums.indices.dropLast() {
            // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            var k = i
            for j in nums.indices.dropFirst(i + 1) {
                if nums[j] < nums[k] {
                    k = j // 최솟값의 인덱스를 기록한다
                }
            }
            // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            nums.swapAt(i, k)
        }
    }
    ```

=== "JS"

    ```javascript title="selection_sort.js"
    /* 선택 정렬 */
    function selectionSort(nums) {
        let n = nums.length;
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for (let i = 0; i < n - 1; i++) {
            // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            let k = i;
            for (let j = i + 1; j < n; j++) {
                if (nums[j] < nums[k]) {
                    k = j; // 최솟값의 인덱스를 기록한다
                }
            }
            // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            [nums[i], nums[k]] = [nums[k], nums[i]];
        }
    }
    ```

=== "TS"

    ```typescript title="selection_sort.ts"
    /* 선택 정렬 */
    function selectionSort(nums: number[]): void {
        let n = nums.length;
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for (let i = 0; i < n - 1; i++) {
            // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            let k = i;
            for (let j = i + 1; j < n; j++) {
                if (nums[j] < nums[k]) {
                    k = j; // 최솟값의 인덱스를 기록한다
                }
            }
            // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            [nums[i], nums[k]] = [nums[k], nums[i]];
        }
    }
    ```

=== "Dart"

    ```dart title="selection_sort.dart"
    /* 선택 정렬 */
    void selectionSort(List<int> nums) {
      int n = nums.length;
      // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
      for (int i = 0; i < n - 1; i++) {
        // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
        int k = i;
        for (int j = i + 1; j < n; j++) {
          if (nums[j] < nums[k]) k = j; // 최솟값의 인덱스를 기록한다
        }
        // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
        int temp = nums[i];
        nums[i] = nums[k];
        nums[k] = temp;
      }
    }
    ```

=== "Rust"

    ```rust title="selection_sort.rs"
    /* 선택 정렬 */
    fn selection_sort(nums: &mut [i32]) {
        if nums.is_empty() {
            return;
        }
        let n = nums.len();
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for i in 0..n - 1 {
            // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            let mut k = i;
            for j in i + 1..n {
                if nums[j] < nums[k] {
                    k = j; // 최솟값의 인덱스를 기록한다
                }
            }
            // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            nums.swap(i, k);
        }
    }
    ```

=== "C"

    ```c title="selection_sort.c"
    /* 선택 정렬 */
    void selectionSort(int nums[], int n) {
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for (int i = 0; i < n - 1; i++) {
            // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 최솟값의 인덱스를 기록한다
            }
            // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="selection_sort.kt"
    /* 선택 정렬 */
    fun selectionSort(nums: IntArray) {
        val n = nums.size
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for (i in 0..<n - 1) {
            var k = i
            // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            for (j in i + 1..<n) {
                if (nums[j] < nums[k])
                    k = j // 최솟값의 인덱스를 기록한다
            }
            // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            val temp = nums[i]
            nums[i] = nums[k]
            nums[k] = temp
        }
    }
    ```

=== "Ruby"

    ```ruby title="selection_sort.rb"
    ### 선택 정렬 ###
    def selection_sort(nums)
      n = nums.length
      # 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
      for i in 0...(n - 1)
        # 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
        k = i
        for j in (i + 1)...n
          if nums[j] < nums[k]
            k = j # 최솟값의 인덱스를 기록한다
          end
        end
        # 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
        nums[i], nums[k] = nums[k], nums[i]
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20selection_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%EC%84%A0%ED%83%9D%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%EB%B0%94%EA%B9%A5%EC%AA%BD%20%EB%B0%98%EB%B3%B5%EB%AC%B8%3A%20%EC%A0%95%EB%A0%AC%EB%90%98%EC%A7%80%20%EC%95%8A%EC%9D%80%20%EA%B5%AC%EA%B0%84%EC%9D%80%20%5Bi,%20n-1%5D%EC%9D%B4%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%95%88%EC%AA%BD%20%EB%B0%98%EB%B3%B5%EB%AC%B8%3A%20%EC%A0%95%EB%A0%AC%EB%90%98%EC%A7%80%20%EC%95%8A%EC%9D%80%20%EA%B5%AC%EA%B0%84%EC%9D%98%20%EC%B5%9C%EC%86%9F%EA%B0%92%EC%9D%84%20%EC%B0%BE%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20k%20%3D%20i%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3C%20nums%5Bk%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20k%20%3D%20j%20%20%23%20%EC%B5%9C%EC%86%9F%EA%B0%92%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%23%20%EC%9D%B4%20%EC%B5%9C%EC%86%9F%EA%B0%92%EA%B3%BC%20%EC%A0%95%EB%A0%AC%EB%90%98%EC%A7%80%20%EC%95%8A%EC%9D%80%20%EA%B5%AC%EA%B0%84%EC%9D%98%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bk%5D%20%3D%20nums%5Bk%5D,%20nums%5Bi%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20selection_sort%28nums%29%0A%20%20%20%20print%28%22%EC%84%A0%ED%83%9D%20%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%A7%88%EC%B9%9C%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20selection_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%EC%84%A0%ED%83%9D%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%EB%B0%94%EA%B9%A5%EC%AA%BD%20%EB%B0%98%EB%B3%B5%EB%AC%B8%3A%20%EC%A0%95%EB%A0%AC%EB%90%98%EC%A7%80%20%EC%95%8A%EC%9D%80%20%EA%B5%AC%EA%B0%84%EC%9D%80%20%5Bi,%20n-1%5D%EC%9D%B4%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%95%88%EC%AA%BD%20%EB%B0%98%EB%B3%B5%EB%AC%B8%3A%20%EC%A0%95%EB%A0%AC%EB%90%98%EC%A7%80%20%EC%95%8A%EC%9D%80%20%EA%B5%AC%EA%B0%84%EC%9D%98%20%EC%B5%9C%EC%86%9F%EA%B0%92%EC%9D%84%20%EC%B0%BE%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20k%20%3D%20i%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3C%20nums%5Bk%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20k%20%3D%20j%20%20%23%20%EC%B5%9C%EC%86%9F%EA%B0%92%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%23%20%EC%9D%B4%20%EC%B5%9C%EC%86%9F%EA%B0%92%EA%B3%BC%20%EC%A0%95%EB%A0%AC%EB%90%98%EC%A7%80%20%EC%95%8A%EC%9D%80%20%EA%B5%AC%EA%B0%84%EC%9D%98%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bk%5D%20%3D%20nums%5Bk%5D,%20nums%5Bi%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20selection_sort%28nums%29%0A%20%20%20%20print%28%22%EC%84%A0%ED%83%9D%20%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%A7%88%EC%B9%9C%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 11.2.1 &nbsp; 알고리즘 특성

- **시간 복잡도 $O(n^2)$, 비적응형 정렬**: 바깥 반복문은 $n - 1$ 번 실행된다. 안쪽 반복문은 첫 회에 $n - 1$ 번, 마지막 회에 $1$ 번 실행된다. 즉, 각 회의 실행 횟수는 $n - 1$, $n - 2$, $\dots$, $2$, $1$이고 합은 $\frac{n(n - 1)}{2}$이다.
- **공간 복잡도 $O(1)$, 제자리 정렬**: 포인터 $i$와 $j$는 상수 크기의 추가 공간을 사용한다.
- **불안정 정렬**: 아래 그림(11-3)과 같이 원소 `nums[i]`가 자신과 값이 같은 원소의 오른쪽으로 교환되어 두 원소의 상대적 순서가 바뀔 수 있다.

![선택 정렬의 불안정성 예시](selection_sort.assets/selection_sort_instability.png){ class="animation-figure" }

<p align="center"> 그림 11-3 &nbsp; 선택 정렬의 불안정성 예시 </p>
