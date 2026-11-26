---
comments: true
---

# 11.5 &nbsp; 퀵 정렬

<u>퀵 정렬(quick sort)</u>은 분할 정복 전략을 이용하는 효율적인 정렬 알고리즘으로 널리 쓰인다.

퀵 정렬의 핵심 연산은 ‘양방향 분할’이다. 배열의 한 원소를 ‘피벗’으로 정하고 이보다 작은 원소는 모두 왼쪽으로, 큰 원소는 모두 오른쪽으로 옮기는 것이 목표다. 구체적인 과정은 아래 그림(11-8)과 같다.

1. 배열 맨 왼쪽 원소를 피벗으로 고르고 두 포인터 `i`와 `j`가 각각 배열의 양 끝을 가리키도록 초기화한다.
2. 루프를 돌며 매 회전마다 `i`로 피벗보다 큰 첫 원소를, `j`로 피벗보다 작은 첫 원소를 찾은 다음 두 원소를 교환한다.
3. `2.`단계를 반복하다가 `i`와 `j`가 만나면 멈추고 마지막으로 피벗을 두 부분 배열의 경계로 교환한다.

=== "<1>"
    ![양방향 분할 단계](quick_sort.assets/pivot_division_step1.svg){ class="animation-figure" }

=== "<2>"
    ![pivot_division_step2](quick_sort.assets/pivot_division_step2.svg){ class="animation-figure" }

=== "<3>"
    ![pivot_division_step3](quick_sort.assets/pivot_division_step3.svg){ class="animation-figure" }

=== "<4>"
    ![pivot_division_step4](quick_sort.assets/pivot_division_step4.svg){ class="animation-figure" }

=== "<5>"
    ![pivot_division_step5](quick_sort.assets/pivot_division_step5.svg){ class="animation-figure" }

=== "<6>"
    ![pivot_division_step6](quick_sort.assets/pivot_division_step6.svg){ class="animation-figure" }

=== "<7>"
    ![pivot_division_step7](quick_sort.assets/pivot_division_step7.svg){ class="animation-figure" }

=== "<8>"
    ![pivot_division_step8](quick_sort.assets/pivot_division_step8.svg){ class="animation-figure" }

=== "<9>"
    ![pivot_division_step9](quick_sort.assets/pivot_division_step9.svg){ class="animation-figure" }

<p align="center"> 그림 11-8 &nbsp; 양방향 분할 단계 </p>

분할이 끝나면 원래 배열은 왼쪽 부분 배열, 피벗, 오른쪽 부분 배열로 나뉜다. 이때 ‘왼쪽의 임의의 원소 $\leq$ 피벗 $\leq$ 오른쪽의 임의의 원소’가 성립한다. 이제 두 부분 배열만 정렬하면 된다.

!!! note "퀵 정렬의 분할 정복 전략"

    양방향 분할은 긴 배열 하나를 정렬하는 문제를 더 짧은 두 배열을 정렬하는 문제로 단순화한다.

=== "Python"

    ```python title="quick_sort.py"
    def partition(self, nums: list[int], left: int, right: int) -> int:
        """양방향 포인터로 분할"""
        # nums[left]를 피벗으로 선택
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while i < j and nums[i] <= nums[left]:
                i += 1  # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            # 원소 교환
            nums[i], nums[j] = nums[j], nums[i]
        # 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 피벗의 인덱스 반환
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* 양방향 포인터로 분할 */
    int partition(vector<int> &nums, int left, int right) {
        // nums[left]를 피벗으로 선택
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left])
                i++;                // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            swap(nums[i], nums[j]); // 두 원소 교환
        }
        swap(nums[i], nums[left]);  // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i;                   // 피벗의 인덱스 반환
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* 원소 교환 */
    void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 양방향 포인터로 분할 */
    int partition(int[] nums, int left, int right) {
        // nums[left]를 피벗으로 선택
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left])
                i++;          // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            swap(nums, i, j); // 두 원소 교환
        }
        swap(nums, i, left);  // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i;             // 피벗의 인덱스 반환
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* 원소 교환 */
    void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 양방향 포인터로 분할 */
    int Partition(int[] nums, int left, int right) {
        // nums[left]를 피벗으로 선택
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left])
                i++;          // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            Swap(nums, i, j); // 두 원소 교환
        }
        Swap(nums, i, left);  // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i;             // 피벗의 인덱스 반환
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* 양방향 포인터로 분할 */
    func (q *quickSort) partition(nums []int, left, right int) int {
        // nums[left]를 피벗으로 선택
        i, j := left, right
        for i < j {
            for i < j && nums[j] >= nums[left] {
                j-- // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            for i < j && nums[i] <= nums[left] {
                i++ // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            // 원소 교환
            nums[i], nums[j] = nums[j], nums[i]
        }
        // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        nums[i], nums[left] = nums[left], nums[i]
        return i // 피벗의 인덱스 반환
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* 양방향 포인터로 분할 */
    func partition(nums: inout [Int], left: Int, right: Int) -> Int {
        // nums[left]를 피벗으로 선택
        var i = left
        var j = right
        while i < j {
            while i < j, nums[j] >= nums[left] {
                j -= 1 // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            while i < j, nums[i] <= nums[left] {
                i += 1 // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            nums.swapAt(i, j) // 두 원소 교환
        }
        nums.swapAt(i, left) // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i // 피벗의 인덱스 반환
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* 원소 교환 */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 양방향 포인터로 분할 */
    partition(nums, left, right) {
        // nums[left]를 피벗으로 선택
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            // 원소 교환
            this.swap(nums, i, j); // 두 원소 교환
        }
        this.swap(nums, i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i; // 피벗의 인덱스 반환
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* 원소 교환 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 양방향 포인터로 분할 */
    partition(nums: number[], left: number, right: number): number {
        // nums[left]를 피벗으로 선택
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            // 원소 교환
            this.swap(nums, i, j); // 두 원소 교환
        }
        this.swap(nums, i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i; // 피벗의 인덱스 반환
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* 원소 교환 */
    void _swap(List<int> nums, int i, int j) {
      int tmp = nums[i];
      nums[i] = nums[j];
      nums[j] = tmp;
    }

    /* 양방향 포인터로 분할 */
    int _partition(List<int> nums, int left, int right) {
      // nums[left]를 피벗으로 선택
      int i = left, j = right;
      while (i < j) {
        while (i < j && nums[j] >= nums[left]) j--; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
        while (i < j && nums[i] <= nums[left]) i++; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
        _swap(nums, i, j); // 두 원소 교환
      }
      _swap(nums, i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
      return i; // 피벗의 인덱스 반환
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* 양방향 포인터로 분할 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // nums[left]를 피벗으로 선택
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            nums.swap(i, j); // 두 원소 교환
        }
        nums.swap(i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        i // 피벗의 인덱스 반환
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* 원소 교환 */
    void swap(int nums[], int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 양방향 포인터로 분할 */
    int partition(int nums[], int left, int right) {
        // nums[left]를 피벗으로 선택
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            // 두 원소 교환
            swap(nums, i, j);
        }
        // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        swap(nums, i, left);
        // 피벗의 인덱스 반환
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* 원소 교환 */
    fun swap(nums: IntArray, i: Int, j: Int) {
        val temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }

    /* 양방향 포인터로 분할 */
    fun partition(nums: IntArray, left: Int, right: Int): Int {
        // nums[left]를 피벗으로 선택
        var i = left
        var j = right
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--           // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left])
                i++           // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            swap(nums, i, j)  // 두 원소 교환
        }
        swap(nums, i, left)   // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i              // 피벗의 인덱스 반환
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    ### 양방향 포인터로 분할 ###
    def partition(nums, left, right)
      # nums[left]를 피벗으로 선택
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
        end
        # 원소 교환
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 교환을 통해 피벗을 두 부분 배열의 경계에 배치
      nums[i], nums[left] = nums[left], nums[i]
      i # 피벗의 인덱스 반환
    end
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%22%22%22%0A%20%20%20%20%23%20nums%5Bleft%5D%EB%A5%BC%20%ED%94%BC%EB%B2%97%EC%9C%BC%EB%A1%9C%20%EC%84%A0%ED%83%9D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%99%BC%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%EC%99%BC%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%ED%81%B0%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%EA%B5%90%ED%99%98%EC%9D%84%20%ED%86%B5%ED%95%B4%20%ED%94%BC%EB%B2%97%EC%9D%84%20%EB%91%90%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B2%BD%EA%B3%84%EC%97%90%20%EB%B0%B0%EC%B9%98%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%ED%94%BC%EB%B2%97%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20partition%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%ED%95%9C%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%22%22%22%0A%20%20%20%20%23%20nums%5Bleft%5D%EB%A5%BC%20%ED%94%BC%EB%B2%97%EC%9C%BC%EB%A1%9C%20%EC%84%A0%ED%83%9D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%99%BC%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%EC%99%BC%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%ED%81%B0%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%EA%B5%90%ED%99%98%EC%9D%84%20%ED%86%B5%ED%95%B4%20%ED%94%BC%EB%B2%97%EC%9D%84%20%EB%91%90%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B2%BD%EA%B3%84%EC%97%90%20%EB%B0%B0%EC%B9%98%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%ED%94%BC%EB%B2%97%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20partition%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%ED%95%9C%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>

## 11.5.1 &nbsp; 알고리즘의 동작 과정

퀵 정렬의 전체 과정은 아래 그림(11-9)과 같다.

1. 먼저 원래 배열을 한 번 양방향으로 분할하여 아직 정렬되지 않은 왼쪽과 오른쪽 부분 배열을 얻는다.
2. 그런 다음 두 부분 배열에 각각 양방향 분할을 재귀적으로 적용한다.
3. 재귀를 계속하다 부분 배열의 길이가 1이 되면 멈춘다. 이로써 전체 배열의 정렬이 끝난다.

![퀵 정렬 과정](quick_sort.assets/quick_sort_overview.svg){ class="animation-figure" }

<p align="center"> 그림 11-9 &nbsp; 퀵 정렬 과정 </p>

=== "Python"

    ```python title="quick_sort.py"
    def quick_sort(self, nums: list[int], left: int, right: int):
        """퀵 정렬"""
        # 부분 배열의 길이가 1이면 재귀 종료
        if left >= right:
            return
        # 양방향 포인터로 분할
        pivot = self.partition(nums, left, right)
        # 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* 퀵 정렬 */
    void quickSort(vector<int> &nums, int left, int right) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if (left >= right)
            return;
        // 양방향 포인터로 분할
        int pivot = partition(nums, left, right);
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* 퀵 정렬 */
    void quickSort(int[] nums, int left, int right) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if (left >= right)
            return;
        // 양방향 포인터로 분할
        int pivot = partition(nums, left, right);
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* 퀵 정렬 */
    void QuickSort(int[] nums, int left, int right) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if (left >= right)
            return;
        // 양방향 포인터로 분할
        int pivot = Partition(nums, left, right);
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* 퀵 정렬 */
    func (q *quickSort) quickSort(nums []int, left, right int) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if left >= right {
            return
        }
        // 양방향 포인터로 분할
        pivot := q.partition(nums, left, right)
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        q.quickSort(nums, left, pivot-1)
        q.quickSort(nums, pivot+1, right)
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* 퀵 정렬 */
    func quickSort(nums: inout [Int], left: Int, right: Int) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if left >= right {
            return
        }
        // 양방향 포인터로 분할
        let pivot = partition(nums: &nums, left: left, right: right)
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        quickSort(nums: &nums, left: left, right: pivot - 1)
        quickSort(nums: &nums, left: pivot + 1, right: right)
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* 퀵 정렬 */
    quickSort(nums, left, right) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if (left >= right) return;
        // 양방향 포인터로 분할
        const pivot = this.partition(nums, left, right);
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* 퀵 정렬 */
    quickSort(nums: number[], left: number, right: number): void {
        // 부분 배열의 길이가 1이면 재귀 종료
        if (left >= right) {
            return;
        }
        // 양방향 포인터로 분할
        const pivot = this.partition(nums, left, right);
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* 퀵 정렬 */
    void quickSort(List<int> nums, int left, int right) {
      // 부분 배열의 길이가 1이면 재귀 종료
      if (left >= right) return;
      // 양방향 포인터로 분할
      int pivot = _partition(nums, left, right);
      // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
      quickSort(nums, left, pivot - 1);
      quickSort(nums, pivot + 1, right);
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* 퀵 정렬 */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if left >= right {
            return;
        }
        // 양방향 포인터로 분할
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* 퀵 정렬 */
    void quickSort(int nums[], int left, int right) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if (left >= right) {
            return;
        }
        // 양방향 포인터로 분할
        int pivot = partition(nums, left, right);
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* 퀵 정렬 */
    fun quickSort(nums: IntArray, left: Int, right: Int) {
        // 부분 배열의 길이가 1이면 재귀 종료
        if (left >= right) return
        // 양방향 포인터로 분할
        val pivot = partition(nums, left, right)
        // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        quickSort(nums, left, pivot - 1)
        quickSort(nums, pivot + 1, right)
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    ### 퀵 정렬 클래스 ###
    def quick_sort(nums, left, right)
      # 부분 배열의 길이가 1이 아니면 재귀 호출
      if left < right
        # 양방향 포인터로 분할
        pivot = partition(nums, left, right)
        # 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%22%22%22%0A%20%20%20%20%23%20nums%5Bleft%5D%EB%A5%BC%20%ED%94%BC%EB%B2%97%EC%9C%BC%EB%A1%9C%20%EC%84%A0%ED%83%9D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%99%BC%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%EC%99%BC%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%ED%81%B0%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%EA%B5%90%ED%99%98%EC%9D%84%20%ED%86%B5%ED%95%B4%20%ED%94%BC%EB%B2%97%EC%9D%84%20%EB%91%90%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B2%BD%EA%B3%84%EC%97%90%20%EB%B0%B0%EC%B9%98%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%ED%94%BC%EB%B2%97%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%ED%80%B5%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B8%B8%EC%9D%B4%EA%B0%80%201%EC%9D%B4%EB%A9%B4%20%EC%9E%AC%EA%B7%80%20%EC%A2%85%EB%A3%8C%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%0A%20%20%20%20pivot%20%3D%20partition%28nums,%20left,%20right%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%84%20%EA%B0%81%EA%B0%81%20%EC%9E%AC%EA%B7%80%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20quick_sort%28nums,%20left,%20pivot%20-%201%29%0A%20%20%20%20quick_sort%28nums,%20pivot%20%2B%201,%20right%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%80%B5%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20quick_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%ED%80%B5%20%EC%A0%95%EB%A0%AC%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%22%22%22%0A%20%20%20%20%23%20nums%5Bleft%5D%EB%A5%BC%20%ED%94%BC%EB%B2%97%EC%9C%BC%EB%A1%9C%20%EC%84%A0%ED%83%9D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%99%BC%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%EC%99%BC%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%ED%81%B0%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%EA%B5%90%ED%99%98%EC%9D%84%20%ED%86%B5%ED%95%B4%20%ED%94%BC%EB%B2%97%EC%9D%84%20%EB%91%90%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B2%BD%EA%B3%84%EC%97%90%20%EB%B0%B0%EC%B9%98%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%ED%94%BC%EB%B2%97%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%ED%80%B5%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B8%B8%EC%9D%B4%EA%B0%80%201%EC%9D%B4%EB%A9%B4%20%EC%9E%AC%EA%B7%80%20%EC%A2%85%EB%A3%8C%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%0A%20%20%20%20pivot%20%3D%20partition%28nums,%20left,%20right%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%84%20%EA%B0%81%EA%B0%81%20%EC%9E%AC%EA%B7%80%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20quick_sort%28nums,%20left,%20pivot%20-%201%29%0A%20%20%20%20quick_sort%28nums,%20pivot%20%2B%201,%20right%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%80%B5%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20quick_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%ED%80%B5%20%EC%A0%95%EB%A0%AC%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>

## 11.5.2 &nbsp; 알고리즘의 특성

- **시간 복잡도 $O(n \log n)$, 비적응형 정렬**: 평균적으로 양방향 분할의 재귀 층수는 $\log n$이고 층별 총 반복 횟수는 $n$이므로 전체에 $O(n \log n)$의 시간이 걸린다. 최악의 경우 매번 길이 $n$인 배열을 길이 $0$과 $n - 1$인 두 부분 배열로 나눈다. 재귀 층수가 $n$에 이르고 층별 반복 횟수는 $n$이어서 총 $O(n^2)$의 시간이 걸린다.
- **공간 복잡도 $O(n)$, 제자리 정렬**: 입력 배열이 완전히 역순이면 최악의 재귀 깊이 $n$에 이르러 스택 프레임 공간을 $O(n)$만큼 사용한다. 정렬은 원래 배열에서 이루어지며 추가 배열은 사용하지 않는다.
- **불안정 정렬**: 양방향 분할의 마지막 단계에서 피벗이 값이 같은 원소의 오른쪽으로 옮겨질 수 있다.

## 11.5.3 &nbsp; 퀵 정렬이 빠른 이유

이름에서 짐작할 수 있듯이 퀵 정렬에는 효율 면에서 장점이 있다. 평균 시간 복잡도는 병합 정렬 및 힙 정렬과 같지만 일반적으로 퀵 정렬이 더 효율적이다. 주된 이유는 다음과 같다.

- **최악의 경우가 발생할 확률이 매우 낮다**. 퀵 정렬의 최악 시간 복잡도는 $O(n^2)$이므로 실행 시간이 병합 정렬만큼 일정하지는 않지만 대다수의 경우 $O(n \log n)$의 시간 복잡도로 실행된다.
- **캐시를 효율적으로 사용한다**. 양방향 분할을 실행할 때 시스템이 부분 배열 전체를 캐시에 불러올 수 있어 원소에 효율적으로 접근한다. 힙 정렬처럼 원소 사이를 건너뛰며 접근하는 알고리즘에는 이런 특성이 없다.
- **시간 복잡도의 상수 계수가 작다**. 위 세 알고리즘 중 퀵 정렬이 비교, 대입, 교환 등 전체 연산 수가 가장 적다. 삽입 정렬이 버블 정렬보다 빠른 이유와 비슷하다.

## 11.5.4 &nbsp; 피벗 선택 최적화

**일부 입력에서 퀵 정렬의 시간 효율이 떨어질 수 있다**. 극단적인 예로 입력 배열이 완전히 역순이라고 하자. 맨 왼쪽 원소를 피벗으로 고르면 분할 후 피벗이 오른쪽 끝으로 옮겨져 왼쪽 부분 배열의 길이는 $n - 1$, 오른쪽 길이는 $0$이 된다. 이대로 재귀 호출하면 매번 한쪽의 길이가 $0$이 되어 분할 정복의 효과가 사라지고 퀵 정렬은 버블 정렬과 비슷한 형태로 퇴화한다.

이런 상황을 최대한 피하려면 **양방향 분할의 피벗 선택 전략을 개선할 수 있다**. 예를 들어 원소 하나를 무작위로 골라 피벗으로 쓸 수 있다. 그래도 운이 나빠 매번 좋지 않은 피벗을 고르면 효율은 여전히 떨어진다.

프로그래밍 언어가 일반적으로 생성하는 것은 ‘의사 난수’라는 점에 주의하자. 의사 난수열에 맞추어 특정 테스트 사례를 만들면 퀵 정렬의 효율이 여전히 떨어질 수 있다.

한 걸음 더 나아가 배열에서 후보 원소 세 개(보통 처음, 끝, 중간 원소)를 고른 뒤 **세 값의 중앙값을 피벗으로 사용할 수 있다**. 그러면 피벗이 너무 작지도 크지도 않을 확률이 크게 높아진다. 후보를 더 많이 선택해 알고리즘이 다양한 입력에서도 잘 작동하도록 할 수도 있다. 이 방식을 쓰면 시간 복잡도가 $O(n^2)$까지 나빠질 확률이 크게 낮아진다.

예제 코드는 다음과 같다.

=== "Python"

    ```python title="quick_sort.py"
    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """세 후보 원소의 중앙값 선택"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m이 l과 r 사이에 있음
        if (m <= l <= r) or (r <= l <= m):
            return left  # l이 m과 r 사이에 있음
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """양방향 포인터로 분할(세 값의 중앙값 선택)"""
        # nums[left]를 피벗으로 선택
        med = self.median_three(nums, left, (left + right) // 2, right)
        # 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        nums[left], nums[med] = nums[med], nums[left]
        # nums[left]를 피벗으로 선택
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while i < j and nums[i] <= nums[left]:
                i += 1  # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            # 원소 교환
            nums[i], nums[j] = nums[j], nums[i]
        # 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 피벗의 인덱스 반환
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* 세 후보 원소의 중앙값 선택 */
    int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m이 l과 r 사이에 있음
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l이 m과 r 사이에 있음
        return right;
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    int partition(vector<int> &nums, int left, int right) {
        // 세 후보 원소의 중앙값 선택
        int med = medianThree(nums, left, (left + right) / 2, right);
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        swap(nums[left], nums[med]);
        // nums[left]를 피벗으로 선택
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left])
                i++;                // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            swap(nums[i], nums[j]); // 두 원소 교환
        }
        swap(nums[i], nums[left]);  // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i;                   // 피벗의 인덱스 반환
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* 세 후보 원소의 중앙값 선택 */
    int medianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m이 l과 r 사이에 있음
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l이 m과 r 사이에 있음
        return right;
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    int partition(int[] nums, int left, int right) {
        // 세 후보 원소의 중앙값 선택
        int med = medianThree(nums, left, (left + right) / 2, right);
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        swap(nums, left, med);
        // nums[left]를 피벗으로 선택
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left])
                i++;          // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            swap(nums, i, j); // 두 원소 교환
        }
        swap(nums, i, left);  // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i;             // 피벗의 인덱스 반환
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* 세 후보 원소의 중앙값 선택 */
    int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m이 l과 r 사이에 있음
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l이 m과 r 사이에 있음
        return right;
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    int Partition(int[] nums, int left, int right) {
        // 세 후보 원소의 중앙값 선택
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        Swap(nums, left, med);
        // nums[left]를 피벗으로 선택
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left])
                i++;          // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            Swap(nums, i, j); // 두 원소 교환
        }
        Swap(nums, i, left);  // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i;             // 피벗의 인덱스 반환
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* 세 후보 원소의 중앙값 선택 */
    func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
        l, m, r := nums[left], nums[mid], nums[right]
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid // m이 l과 r 사이에 있음
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left // l이 m과 r 사이에 있음
        }
        return right
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택)*/
    func (q *quickSortMedian) partition(nums []int, left, right int) int {
        // nums[left]를 피벗으로 선택
        med := q.medianThree(nums, left, (left+right)/2, right)
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        nums[left], nums[med] = nums[med], nums[left]
        // nums[left]를 피벗으로 선택
        i, j := left, right
        for i < j {
            for i < j && nums[j] >= nums[left] {
                j-- //오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            for i < j && nums[i] <= nums[left] {
                i++ //왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            //원소 교환
            nums[i], nums[j] = nums[j], nums[i]
        }
        //교환을 통해 피벗을 두 부분 배열의 경계에 배치
        nums[i], nums[left] = nums[left], nums[i]
        return i //피벗의 인덱스 반환
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* 세 후보 원소의 중앙값 선택 */
    func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
        let l = nums[left]
        let m = nums[mid]
        let r = nums[right]
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid // m이 l과 r 사이에 있음
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left // l이 m과 r 사이에 있음
        }
        return right
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
        // 세 후보 원소의 중앙값 선택
        let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        nums.swapAt(left, med)
        return partition(nums: &nums, left: left, right: right)
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* 세 후보 원소의 중앙값 선택 */
    medianThree(nums, left, mid, right) {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m이 l과 r 사이에 있음
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l이 m과 r 사이에 있음
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    partition(nums, left, right) {
        // 세 후보 원소의 중앙값 선택
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        this.swap(nums, left, med);
        // nums[left]를 피벗으로 선택
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left]) i++; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            this.swap(nums, i, j); // 두 원소 교환
        }
        this.swap(nums, i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i; // 피벗의 인덱스 반환
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* 세 후보 원소의 중앙값 선택 */
    medianThree(
        nums: number[],
        left: number,
        mid: number,
        right: number
    ): number {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m이 l과 r 사이에 있음
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l이 m과 r 사이에 있음
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    partition(nums: number[], left: number, right: number): number {
        // 세 후보 원소의 중앙값 선택
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        this.swap(nums, left, med);
        // nums[left]를 피벗으로 선택
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            this.swap(nums, i, j); // 두 원소 교환
        }
        this.swap(nums, i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i; // 피벗의 인덱스 반환
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* 세 후보 원소의 중앙값 선택 */
    int _medianThree(List<int> nums, int left, int mid, int right) {
      int l = nums[left], m = nums[mid], r = nums[right];
      if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m이 l과 r 사이에 있음
      if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l이 m과 r 사이에 있음
      return right;
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    int _partition(List<int> nums, int left, int right) {
      // 세 후보 원소의 중앙값 선택
      int med = _medianThree(nums, left, (left + right) ~/ 2, right);
      // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
      _swap(nums, left, med);
      // nums[left]를 피벗으로 선택
      int i = left, j = right;
      while (i < j) {
        while (i < j && nums[j] >= nums[left]) j--; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
        while (i < j && nums[i] <= nums[left]) i++; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
        _swap(nums, i, j); // 두 원소 교환
      }
      _swap(nums, i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
      return i; // 피벗의 인덱스 반환
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* 세 후보 원소의 중앙값 선택 */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m이 l과 r 사이에 있음
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l이 m과 r 사이에 있음
        }
        right
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 세 후보 원소의 중앙값 선택
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        nums.swap(left, med);
        // nums[left]를 피벗으로 선택
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            }
            nums.swap(i, j); // 두 원소 교환
        }
        nums.swap(i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        i // 피벗의 인덱스 반환
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* 세 후보 원소의 중앙값 선택 */
    int medianThree(int nums[], int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m이 l과 r 사이에 있음
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l이 m과 r 사이에 있음
        return right;
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    int partitionMedian(int nums[], int left, int right) {
        // 세 후보 원소의 중앙값 선택
        int med = medianThree(nums, left, (left + right) / 2, right);
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        swap(nums, left, med);
        // nums[left]를 피벗으로 선택
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left])
                i++;          // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            swap(nums, i, j); // 두 원소 교환
        }
        swap(nums, i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i;            // 피벗의 인덱스 반환
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* 세 후보 원소의 중앙값 선택 */
    fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
        val l = nums[left]
        val m = nums[mid]
        val r = nums[right]
        if ((m in l..r) || (m in r..l))
            return mid  // m이 l과 r 사이에 있음
        if ((l in m..r) || (l in r..m))
            return left // l이 m과 r 사이에 있음
        return right
    }

    /* 양방향 포인터로 분할(세 값의 중앙값 선택) */
    fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
        // 세 후보 원소의 중앙값 선택
        val med = medianThree(nums, left, (left + right) / 2, right)
        // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        swap(nums, left, med)
        // nums[left]를 피벗으로 선택
        var i = left
        var j = right
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--                      // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while (i < j && nums[i] <= nums[left])
                i++                      // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            swap(nums, i, j)             // 두 원소 교환
        }
        swap(nums, i, left)              // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        return i                         // 피벗의 인덱스 반환
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    ### 세 후보 원소의 중앙값 선택 ###
    def median_three(nums, left, mid, right)
      # 세 후보 원소의 중앙값 선택
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m이 l과 r 사이에 있음
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l이 m과 r 사이에 있음
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    ### 양방향 포인터로 분할(세 값의 중앙값 선택)###
    def partition(nums, left, right)
      ### nums[left]를 피벗으로 선택
      med = median_three(nums, left, (left + right) / 2, right)
      # 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
        end
        # 원소 교환
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 교환을 통해 피벗을 두 부분 배열의 경계에 배치
      nums[i], nums[left] = nums[left], nums[i]
      i # 피벗의 인덱스 반환
    end
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20median_three%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%84%B8%20%ED%9B%84%EB%B3%B4%20%EC%9B%90%EC%86%8C%EC%9D%98%20%EC%A4%91%EC%95%99%EA%B0%92%20%EC%84%A0%ED%83%9D%22%22%22%0A%20%20%20%20l,%20m,%20r%20%3D%20nums%5Bleft%5D,%20nums%5Bmid%5D,%20nums%5Bright%5D%0A%20%20%20%20if%20%28l%20%3C%3D%20m%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20m%20%3C%3D%20l%29%3A%0A%20%20%20%20%20%20%20%20return%20mid%20%20%23%20m%EC%9D%B4%20l%EA%B3%BC%20r%20%EC%82%AC%EC%9D%B4%EC%97%90%20%EC%9E%88%EC%9D%8C%0A%20%20%20%20if%20%28m%20%3C%3D%20l%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20l%20%3C%3D%20m%29%3A%0A%20%20%20%20%20%20%20%20return%20left%20%20%23%20l%EC%9D%B4%20m%EA%B3%BC%20r%20%EC%82%AC%EC%9D%B4%EC%97%90%20%EC%9E%88%EC%9D%8C%0A%20%20%20%20return%20right%0A%0Adef%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%28%EC%84%B8%20%EA%B0%92%EC%9D%98%20%EC%A4%91%EC%95%99%EA%B0%92%20%EC%84%A0%ED%83%9D%29%22%22%22%0A%20%20%20%20%23%20nums%5Bleft%5D%EB%A5%BC%20%ED%94%BC%EB%B2%97%EC%9C%BC%EB%A1%9C%20%EC%84%A0%ED%83%9D%0A%20%20%20%20med%20%3D%20median_three%28nums,%20left,%20%28left%20%2B%20right%29%20//%202,%20right%29%0A%20%20%20%20%23%20%EA%B5%90%ED%99%98%EC%9D%84%20%ED%86%B5%ED%95%B4%20%EC%A4%91%EC%95%99%EA%B0%92%EC%9D%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%99%BC%EC%AA%BD%20%EB%81%9D%EC%97%90%20%EB%B0%B0%EC%B9%98%0A%20%20%20%20nums%5Bleft%5D,%20nums%5Bmed%5D%20%3D%20nums%5Bmed%5D,%20nums%5Bleft%5D%0A%20%20%20%20%23%20nums%5Bleft%5D%EB%A5%BC%20%ED%94%BC%EB%B2%97%EC%9C%BC%EB%A1%9C%20%EC%84%A0%ED%83%9D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%99%BC%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%EC%99%BC%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%ED%81%B0%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%EA%B5%90%ED%99%98%EC%9D%84%20%ED%86%B5%ED%95%B4%20%ED%94%BC%EB%B2%97%EC%9D%84%20%EB%91%90%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B2%BD%EA%B3%84%EC%97%90%20%EB%B0%B0%EC%B9%98%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%ED%94%BC%EB%B2%97%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%A4%91%EC%95%99%EA%B0%92%20%ED%94%BC%EB%B2%97%20%EC%B5%9C%EC%A0%81%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20partition%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%ED%95%9C%20%ED%9B%84%28%EC%A4%91%EC%95%99%EA%B0%92%20%ED%94%BC%EB%B2%97%20%EC%B5%9C%EC%A0%81%ED%99%94%29%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20median_three%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%84%B8%20%ED%9B%84%EB%B3%B4%20%EC%9B%90%EC%86%8C%EC%9D%98%20%EC%A4%91%EC%95%99%EA%B0%92%20%EC%84%A0%ED%83%9D%22%22%22%0A%20%20%20%20l,%20m,%20r%20%3D%20nums%5Bleft%5D,%20nums%5Bmid%5D,%20nums%5Bright%5D%0A%20%20%20%20if%20%28l%20%3C%3D%20m%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20m%20%3C%3D%20l%29%3A%0A%20%20%20%20%20%20%20%20return%20mid%20%20%23%20m%EC%9D%B4%20l%EA%B3%BC%20r%20%EC%82%AC%EC%9D%B4%EC%97%90%20%EC%9E%88%EC%9D%8C%0A%20%20%20%20if%20%28m%20%3C%3D%20l%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20l%20%3C%3D%20m%29%3A%0A%20%20%20%20%20%20%20%20return%20left%20%20%23%20l%EC%9D%B4%20m%EA%B3%BC%20r%20%EC%82%AC%EC%9D%B4%EC%97%90%20%EC%9E%88%EC%9D%8C%0A%20%20%20%20return%20right%0A%0Adef%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%28%EC%84%B8%20%EA%B0%92%EC%9D%98%20%EC%A4%91%EC%95%99%EA%B0%92%20%EC%84%A0%ED%83%9D%29%22%22%22%0A%20%20%20%20%23%20nums%5Bleft%5D%EB%A5%BC%20%ED%94%BC%EB%B2%97%EC%9C%BC%EB%A1%9C%20%EC%84%A0%ED%83%9D%0A%20%20%20%20med%20%3D%20median_three%28nums,%20left,%20%28left%20%2B%20right%29%20//%202,%20right%29%0A%20%20%20%20%23%20%EA%B5%90%ED%99%98%EC%9D%84%20%ED%86%B5%ED%95%B4%20%EC%A4%91%EC%95%99%EA%B0%92%EC%9D%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%99%BC%EC%AA%BD%20%EB%81%9D%EC%97%90%20%EB%B0%B0%EC%B9%98%0A%20%20%20%20nums%5Bleft%5D,%20nums%5Bmed%5D%20%3D%20nums%5Bmed%5D,%20nums%5Bleft%5D%0A%20%20%20%20%23%20nums%5Bleft%5D%EB%A5%BC%20%ED%94%BC%EB%B2%97%EC%9C%BC%EB%A1%9C%20%EC%84%A0%ED%83%9D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%99%BC%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%EC%99%BC%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%ED%81%B0%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%EA%B5%90%ED%99%98%EC%9D%84%20%ED%86%B5%ED%95%B4%20%ED%94%BC%EB%B2%97%EC%9D%84%20%EB%91%90%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B2%BD%EA%B3%84%EC%97%90%20%EB%B0%B0%EC%B9%98%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%ED%94%BC%EB%B2%97%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%A4%91%EC%95%99%EA%B0%92%20%ED%94%BC%EB%B2%97%20%EC%B5%9C%EC%A0%81%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20partition%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%ED%95%9C%20%ED%9B%84%28%EC%A4%91%EC%95%99%EA%B0%92%20%ED%94%BC%EB%B2%97%20%EC%B5%9C%EC%A0%81%ED%99%94%29%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>

## 11.5.5 &nbsp; 재귀 깊이 최적화

**일부 입력에서 퀵 정렬은 공간을 많이 사용할 수 있다**. 완전히 정렬된 입력 배열을 예로 들자. 재귀 호출에서 부분 배열의 길이가 $m$이면 매번 분할할 때 길이 $0$인 왼쪽 부분 배열과 길이 $m - 1$인 오른쪽 부분 배열이 생긴다. 재귀 호출 한 층마다 문제의 크기가 원소 하나만큼만 줄어 재귀 트리 높이가 $n - 1$에 이른다. 이때 스택 프레임 공간이 $O(n)$만큼 필요하다.

스택 프레임이 계속 쌓이는 것을 막으려면 매번 양방향 분할 뒤 두 부분 배열의 길이를 비교해 **더 짧은 쪽만 재귀 호출한다**. 짧은 쪽의 길이는 $n / 2$를 넘지 않으므로 재귀 깊이는 $\log n$ 이하가 되고 최악의 공간 복잡도는 $O(\log n)$으로 개선된다. 코드는 다음과 같다.

=== "Python"

    ```python title="quick_sort.py"
    def quick_sort(self, nums: list[int], left: int, right: int):
        """퀵 정렬(재귀 깊이 최적화)"""
        # 부분 배열의 길이가 1이면 종료
        while left < right:
            # 양방향 포인터로 분할
            pivot = self.partition(nums, left, right)
            # 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1  # 남은 미정렬 구간은 [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1  # 남은 미정렬 구간은 [left, pivot - 1]
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* 퀵 정렬(재귀 깊이 최적화) */
    void quickSort(vector<int> &nums, int left, int right) {
        // 부분 배열의 길이가 1이면 종료
        while (left < right) {
            // 양방향 포인터로 분할
            int pivot = partition(nums, left, right);
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1;                 // 남은 미정렬 구간은 [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1;                 // 남은 미정렬 구간은 [left, pivot - 1]
            }
        }
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* 퀵 정렬(재귀 깊이 최적화) */
    void quickSort(int[] nums, int left, int right) {
        // 부분 배열의 길이가 1이면 종료
        while (left < right) {
            // 양방향 포인터로 분할
            int pivot = partition(nums, left, right);
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1; // 남은 미정렬 구간은 [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1; // 남은 미정렬 구간은 [left, pivot - 1]
            }
        }
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* 퀵 정렬(재귀 깊이 최적화) */
    void QuickSort(int[] nums, int left, int right) {
        // 부분 배열의 길이가 1이면 종료
        while (left < right) {
            // 양방향 포인터로 분할
            int pivot = Partition(nums, left, right);
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1;  // 남은 미정렬 구간은 [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1; // 남은 미정렬 구간은 [left, pivot - 1]
            }
        }
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* 퀵 정렬(재귀 깊이 최적화)*/
    func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
        // 부분 배열의 길이가 1이면 종료
        for left < right {
            // 양방향 포인터로 분할
            pivot := q.partition(nums, left, right)
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if pivot-left < right-pivot {
                q.quickSort(nums, left, pivot-1) // 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1                 // 남은 미정렬 구간은 [pivot + 1, right]
            } else {
                q.quickSort(nums, pivot+1, right) // 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1                 // 남은 미정렬 구간은 [left, pivot - 1]
            }
        }
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* 퀵 정렬(재귀 깊이 최적화) */
    func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
        var left = left
        var right = right
        // 부분 배열의 길이가 1이면 종료
        while left < right {
            // 양방향 포인터로 분할
            let pivot = partition(nums: &nums, left: left, right: right)
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if (pivot - left) < (right - pivot) {
                quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1 // 남은 미정렬 구간은 [pivot + 1, right]
            } else {
                quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1 // 남은 미정렬 구간은 [left, pivot - 1]
            }
        }
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* 퀵 정렬(재귀 깊이 최적화) */
    quickSort(nums, left, right) {
        // 부분 배열의 길이가 1이면 종료
        while (left < right) {
            // 양방향 포인터로 분할
            let pivot = this.partition(nums, left, right);
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1; // 남은 미정렬 구간은 [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1; // 남은 미정렬 구간은 [left, pivot - 1]
            }
        }
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* 퀵 정렬(재귀 깊이 최적화) */
    quickSort(nums: number[], left: number, right: number): void {
        // 부분 배열의 길이가 1이면 종료
        while (left < right) {
            // 양방향 포인터로 분할
            let pivot = this.partition(nums, left, right);
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1; // 남은 미정렬 구간은 [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1; // 남은 미정렬 구간은 [left, pivot - 1]
            }
        }
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* 퀵 정렬(재귀 깊이 최적화) */
    void quickSort(List<int> nums, int left, int right) {
      // 부분 배열의 길이가 1이면 종료
      while (left < right) {
        // 양방향 포인터로 분할
        int pivot = _partition(nums, left, right);
        // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
        if (pivot - left < right - pivot) {
          quickSort(nums, left, pivot - 1); // 왼쪽 부분 배열 재귀 정렬
          left = pivot + 1; // 남은 미정렬 구간은 [pivot + 1, right]
        } else {
          quickSort(nums, pivot + 1, right); // 오른쪽 부분 배열 재귀 정렬
          right = pivot - 1; // 남은 미정렬 구간은 [left, pivot - 1]
        }
      }
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* 퀵 정렬(재귀 깊이 최적화) */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // 부분 배열의 길이가 1이면 종료
        while left < right {
            // 양방향 포인터로 분할
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1; // 남은 미정렬 구간은 [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1; // 남은 미정렬 구간은 [left, pivot - 1]
            }
        }
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* 퀵 정렬(재귀 깊이 최적화) */
    void quickSortTailCall(int nums[], int left, int right) {
        // 부분 배열의 길이가 1이면 종료
        while (left < right) {
            // 양방향 포인터로 분할
            int pivot = partition(nums, left, right);
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if (pivot - left < right - pivot) {
                // 왼쪽 부분 배열 재귀 정렬
                quickSortTailCall(nums, left, pivot - 1);
                // 남은 미정렬 구간은 [pivot + 1, right]
                left = pivot + 1;
            } else {
                // 오른쪽 부분 배열 재귀 정렬
                quickSortTailCall(nums, pivot + 1, right);
                // 남은 미정렬 구간은 [left, pivot - 1]
                right = pivot - 1;
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* 퀵 정렬(재귀 깊이 최적화) */
    fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
        // 부분 배열의 길이가 1이면 종료
        var l = left
        var r = right
        while (l < r) {
            // 양방향 포인터로 분할
            val pivot = partition(nums, l, r)
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if (pivot - l < r - pivot) {
                quickSort(nums, l, pivot - 1) // 왼쪽 부분 배열 재귀 정렬
                l = pivot + 1 // 남은 미정렬 구간은 [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, r) // 오른쪽 부분 배열 재귀 정렬
                r = pivot - 1 // 남은 미정렬 구간은 [left, pivot - 1]
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    ### 퀵 정렬(재귀 깊이 최적화)###
    def quick_sort(nums, left, right)
      # 부분 배열의 길이가 1이 아니면 재귀 호출
      while left < right
        # 양방향 포인터로 분할
        pivot = partition(nums, left, right)
        # 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # 남은 미정렬 구간은 [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # 남은 미정렬 구간은 [left, pivot - 1]
        end
      end
    end
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%22%22%22%0A%20%20%20%20%23%20nums%5Bleft%5D%EB%A5%BC%20%ED%94%BC%EB%B2%97%EC%9C%BC%EB%A1%9C%20%EC%84%A0%ED%83%9D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%99%BC%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%EC%99%BC%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%ED%81%B0%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%EA%B5%90%ED%99%98%EC%9D%84%20%ED%86%B5%ED%95%B4%20%ED%94%BC%EB%B2%97%EC%9D%84%20%EB%91%90%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B2%BD%EA%B3%84%EC%97%90%20%EB%B0%B0%EC%B9%98%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%ED%94%BC%EB%B2%97%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%ED%80%B5%20%EC%A0%95%EB%A0%AC%28%EA%BC%AC%EB%A6%AC%20%EC%9E%AC%EA%B7%80%20%EC%B5%9C%EC%A0%81%ED%99%94%29%22%22%22%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B8%B8%EC%9D%B4%EA%B0%80%201%EC%9D%B4%EB%A9%B4%20%EC%A2%85%EB%A3%8C%0A%20%20%20%20while%20left%20%3C%20right%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%0A%20%20%20%20%20%20%20%20pivot%20%3D%20partition%28nums,%20left,%20right%29%0A%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%20%EC%A4%91%20%EB%8D%94%20%EC%A7%A7%EC%9D%80%20%EC%AA%BD%EC%97%90%20%ED%80%B5%20%EC%A0%95%EB%A0%AC%20%EC%88%98%ED%96%89%0A%20%20%20%20%20%20%20%20if%20pivot%20-%20left%20%3C%20right%20-%20pivot%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums,%20left,%20pivot%20-%201%29%20%20%23%20%EC%99%BC%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%20%EC%9E%AC%EA%B7%80%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20%20%20%20%20%20%20%20%20left%20%3D%20pivot%20%2B%201%20%20%23%20%EB%82%A8%EC%9D%80%20%EB%AF%B8%EC%A0%95%EB%A0%AC%20%EA%B5%AC%EA%B0%84%EC%9D%80%20%5Bpivot%20%2B%201,%20right%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums,%20pivot%20%2B%201,%20right%29%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%20%EC%9E%AC%EA%B7%80%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20%20%20%20%20%20%20%20%20right%20%3D%20pivot%20-%201%20%20%23%20%EB%82%A8%EC%9D%80%20%EB%AF%B8%EC%A0%95%EB%A0%AC%20%EA%B5%AC%EA%B0%84%EC%9D%80%20%5Bleft,%20pivot%20-%201%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%80%B5%20%EC%A0%95%EB%A0%AC%28%EA%BC%AC%EB%A6%AC%20%EC%9E%AC%EA%B7%80%20%EC%B5%9C%EC%A0%81%ED%99%94%29%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20quick_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%ED%80%B5%20%EC%A0%95%EB%A0%AC%28%EA%BC%AC%EB%A6%AC%20%EC%9E%AC%EA%B7%80%20%EC%B5%9C%EC%A0%81%ED%99%94%29%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%22%22%22%0A%20%20%20%20%23%20nums%5Bleft%5D%EB%A5%BC%20%ED%94%BC%EB%B2%97%EC%9C%BC%EB%A1%9C%20%EC%84%A0%ED%83%9D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%99%BC%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%EC%99%BC%EC%AA%BD%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%94%BC%EB%B2%97%EB%B3%B4%EB%8B%A4%20%ED%81%B0%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%20%EC%B0%BE%EA%B8%B0%0A%20%20%20%20%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%EA%B5%90%ED%99%98%EC%9D%84%20%ED%86%B5%ED%95%B4%20%ED%94%BC%EB%B2%97%EC%9D%84%20%EB%91%90%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B2%BD%EA%B3%84%EC%97%90%20%EB%B0%B0%EC%B9%98%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%ED%94%BC%EB%B2%97%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%ED%80%B5%20%EC%A0%95%EB%A0%AC%28%EA%BC%AC%EB%A6%AC%20%EC%9E%AC%EA%B7%80%20%EC%B5%9C%EC%A0%81%ED%99%94%29%22%22%22%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B8%B8%EC%9D%B4%EA%B0%80%201%EC%9D%B4%EB%A9%B4%20%EC%A2%85%EB%A3%8C%0A%20%20%20%20while%20left%20%3C%20right%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%96%91%EB%B0%A9%ED%96%A5%20%ED%8F%AC%EC%9D%B8%ED%84%B0%EB%A1%9C%20%EB%B6%84%ED%95%A0%0A%20%20%20%20%20%20%20%20pivot%20%3D%20partition%28nums,%20left,%20right%29%0A%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%20%EC%A4%91%20%EB%8D%94%20%EC%A7%A7%EC%9D%80%20%EC%AA%BD%EC%97%90%20%ED%80%B5%20%EC%A0%95%EB%A0%AC%20%EC%88%98%ED%96%89%0A%20%20%20%20%20%20%20%20if%20pivot%20-%20left%20%3C%20right%20-%20pivot%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums,%20left,%20pivot%20-%201%29%20%20%23%20%EC%99%BC%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%20%EC%9E%AC%EA%B7%80%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20%20%20%20%20%20%20%20%20left%20%3D%20pivot%20%2B%201%20%20%23%20%EB%82%A8%EC%9D%80%20%EB%AF%B8%EC%A0%95%EB%A0%AC%20%EA%B5%AC%EA%B0%84%EC%9D%80%20%5Bpivot%20%2B%201,%20right%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums,%20pivot%20%2B%201,%20right%29%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%20%EC%9E%AC%EA%B7%80%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20%20%20%20%20%20%20%20%20right%20%3D%20pivot%20-%201%20%20%23%20%EB%82%A8%EC%9D%80%20%EB%AF%B8%EC%A0%95%EB%A0%AC%20%EA%B5%AC%EA%B0%84%EC%9D%80%20%5Bleft,%20pivot%20-%201%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%80%B5%20%EC%A0%95%EB%A0%AC%28%EA%BC%AC%EB%A6%AC%20%EC%9E%AC%EA%B7%80%20%EC%B5%9C%EC%A0%81%ED%99%94%29%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20quick_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%ED%80%B5%20%EC%A0%95%EB%A0%AC%28%EA%BC%AC%EB%A6%AC%20%EC%9E%AC%EA%B7%80%20%EC%B5%9C%EC%A0%81%ED%99%94%29%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>
