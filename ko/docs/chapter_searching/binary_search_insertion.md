---
comments: true
---

# 10.2 &nbsp; 이진 탐색으로 삽입 위치 찾기

이진 탐색은 목표 원소를 찾는 데만 쓰이는 것이 아니다. 목표 원소를 삽입할 위치를 찾는 등 여러 변형 문제에도 사용할 수 있다.

## 10.2.1 &nbsp; 중복 원소가 없는 경우

!!! question "문제"

    중복 원소가 없는 길이 $n$의 정렬된 배열 `nums`와 원소 `target`이 주어진다. 정렬 상태를 유지하면서 `target`을 배열 `nums`에 삽입하려고 한다. 이미 `target`이 있으면 그 왼쪽에 삽입한다. 삽입 후 `target`의 배열 인덱스를 반환하라. 예시는 아래 그림(10-4)과 같다.

![이진 탐색으로 삽입 위치를 찾는 예시 데이터](binary_search_insertion.assets/binary_search_insertion_example.png){ class="animation-figure" }

<p align="center"> 그림 10-4 &nbsp; 이진 탐색으로 삽입 위치를 찾는 예시 데이터 </p>

앞 절의 이진 탐색 코드를 재사용하려면 다음 두 질문에 답해야 한다.

**질문 1**: 배열에 `target`이 있을 때 삽입 위치의 인덱스는 해당 원소의 인덱스인가?

문제에서는 값이 같은 원소의 왼쪽에 `target`을 삽입하라고 한다. 따라서 새로 삽입하는 `target`이 기존 `target`의 자리를 차지한다. 즉, **배열에 `target`이 있으면 삽입 위치의 인덱스는 그 `target`의 인덱스다**.

**질문 2**: 배열에 `target`이 없을 때 삽입 위치는 어느 원소의 인덱스인가?

이진 탐색 과정을 더 살펴보자. `nums[m] < target`이면 $i$가 이동하므로 포인터 $i$는 `target` 이상인 원소에 가까워진다. 마찬가지로 포인터 $j$는 항상 `target` 이하인 원소에 가까워진다.

따라서 이진 탐색이 끝나면 $i$는 `target`보다 큰 첫 번째 원소를, $j$는 `target`보다 작은 가장 오른쪽 원소를 가리킨다. **배열에 `target`이 없을 때 삽입 인덱스가 $i$임을 쉽게 알 수 있다**. 코드는 다음과 같다.

=== "Python"

    ```python title="binary_search_insertion.py"
    def binary_search_insertion_simple(nums: list[int], target: int) -> int:
        """삽입 위치의 이진 탐색(중복 원소 없음)"""
        i, j = 0, len(nums) - 1  # 닫힌 구간 [0, n-1]을 초기화한다
        while i <= j:
            m = (i + j) // 2  # 중간 인덱스 m을 계산한다
            if nums[m] < target:
                i = m + 1  # target은 구간 [m+1, j]에 있다
            elif nums[m] > target:
                j = m - 1  # target은 구간 [i, m-1]에 있다
            else:
                return m  # target을 찾았으므로 삽입 위치 m을 반환한다
        # target을 찾지 못했으므로 삽입 위치 i를 반환한다
        return i
    ```

=== "C++"

    ```cpp title="binary_search_insertion.cpp"
    /* 삽입 위치의 이진 탐색(중복 원소 없음) */
    int binarySearchInsertionSimple(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                return m; // target을 찾았으므로 삽입 위치 m을 반환한다
            }
        }
        // target을 찾지 못했으므로 삽입 위치 i를 반환한다
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_insertion.java"
    /* 삽입 위치의 이진 탐색(중복 원소 없음) */
    int binarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                return m; // target을 찾았으므로 삽입 위치 m을 반환한다
            }
        }
        // target을 찾지 못했으므로 삽입 위치 i를 반환한다
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_insertion.cs"
    /* 삽입 위치의 이진 탐색(중복 원소 없음) */
    int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                return m; // target을 찾았으므로 삽입 위치 m을 반환한다
            }
        }
        // target을 찾지 못했으므로 삽입 위치 i를 반환한다
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_insertion.go"
    /* 삽입 위치의 이진 탐색(중복 원소 없음) */
    func binarySearchInsertionSimple(nums []int, target int) int {
        // 닫힌 구간 [0, n-1]을 초기화한다
        i, j := 0, len(nums)-1
        for i <= j {
            // 중간 인덱스 m을 계산한다
            m := i + (j-i)/2
            if nums[m] < target {
                // target은 구간 [m+1, j]에 있다
                i = m + 1
            } else if nums[m] > target {
                // target은 구간 [i, m-1]에 있다
                j = m - 1
            } else {
                // target을 찾았으므로 삽입 위치 m을 반환한다
                return m
            }
        }
        // target을 찾지 못했으므로 삽입 위치 i를 반환한다
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_insertion.swift"
    /* 삽입 위치의 이진 탐색(중복 원소 없음) */
    func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
        // 닫힌 구간 [0, n-1]을 초기화한다
        var i = nums.startIndex
        var j = nums.endIndex - 1
        while i <= j {
            let m = i + (j - i) / 2 // 중간 인덱스 m을 계산한다
            if nums[m] < target {
                i = m + 1 // target은 구간 [m+1, j]에 있다
            } else if nums[m] > target {
                j = m - 1 // target은 구간 [i, m-1]에 있다
            } else {
                return m // target을 찾았으므로 삽입 위치 m을 반환한다
            }
        }
        // target을 찾지 못했으므로 삽입 위치 i를 반환한다
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_insertion.js"
    /* 삽입 위치의 이진 탐색(중복 원소 없음) */
    function binarySearchInsertionSimple(nums, target) {
        let i = 0,
            j = nums.length - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 중간 인덱스 m을 계산하며, Math.floor()로 내림한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                return m; // target을 찾았으므로 삽입 위치 m을 반환한다
            }
        }
        // target을 찾지 못했으므로 삽입 위치 i를 반환한다
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_insertion.ts"
    /* 삽입 위치의 이진 탐색(중복 원소 없음) */
    function binarySearchInsertionSimple(
        nums: Array<number>,
        target: number
    ): number {
        let i = 0,
            j = nums.length - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 중간 인덱스 m을 계산하며, Math.floor()로 내림한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                return m; // target을 찾았으므로 삽입 위치 m을 반환한다
            }
        }
        // target을 찾지 못했으므로 삽입 위치 i를 반환한다
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_insertion.dart"
    /* 삽입 위치의 이진 탐색(중복 원소 없음) */
    int binarySearchInsertionSimple(List<int> nums, int target) {
      int i = 0, j = nums.length - 1; // 닫힌 구간 [0, n-1]을 초기화한다
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // 중간 인덱스 m을 계산한다
        if (nums[m] < target) {
          i = m + 1; // target은 구간 [m+1, j]에 있다
        } else if (nums[m] > target) {
          j = m - 1; // target은 구간 [i, m-1]에 있다
        } else {
          return m; // target을 찾았으므로 삽입 위치 m을 반환한다
        }
      }
      // target을 찾지 못했으므로 삽입 위치 i를 반환한다
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_insertion.rs"
    /* 삽입 위치의 이진 탐색(중복 원소 없음) */
    fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
        let (mut i, mut j) = (0, nums.len() as i32 - 1); // 닫힌 구간 [0, n-1]을 초기화한다
        while i <= j {
            let m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if nums[m as usize] < target {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if nums[m as usize] > target {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                return m;
            }
        }
        // target을 찾지 못했으므로 삽입 위치 i를 반환한다
        i
    }
    ```

=== "C"

    ```c title="binary_search_insertion.c"
    /* 삽입 위치의 이진 탐색(중복 원소 없음) */
    int binarySearchInsertionSimple(int *nums, int numSize, int target) {
        int i = 0, j = numSize - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                return m; // target을 찾았으므로 삽입 위치 m을 반환한다
            }
        }
        // target을 찾지 못했으므로 삽입 위치 i를 반환한다
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_insertion.kt"
    /* 삽입 위치의 이진 탐색(중복 원소 없음) */
    fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
        var i = 0
        var j = nums.size - 1 // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            val m = i + (j - i) / 2 // 중간 인덱스 m을 계산한다
            if (nums[m] < target) {
                i = m + 1 // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1 // target은 구간 [i, m-1]에 있다
            } else {
                return m // target을 찾았으므로 삽입 위치 m을 반환한다
            }
        }
        // target을 찾지 못했으므로 삽입 위치 i를 반환한다
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_insertion.rb"
    ### 삽입 위치의 이진 탐색(중복 원소 없음) ###
    def binary_search_insertion_simple(nums, target)
      # 닫힌 구간 [0, n-1]을 초기화한다
      i, j = 0, nums.length - 1

      while i <= j
        # 중간 인덱스 m을 계산한다
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # target은 구간 [m+1, j]에 있다
        elsif nums[m] > target
          j = m - 1 # target은 구간 [i, m-1]에 있다
        else
          return m  # target을 찾았으므로 삽입 위치 m을 반환한다
        end
      end

      i # target을 찾지 못했으므로 삽입 위치 i를 반환한다
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion_simple%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%20%EC%97%86%EC%9D%8C%29%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%20%5B0,%20n-1%5D%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20m%EC%9D%84%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bm%2B1,%20j%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20target%EC%9D%84%20%EC%B0%BE%EC%95%98%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20m%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20target%EC%9D%84%20%EC%B0%BE%EC%A7%80%20%EB%AA%BB%ED%96%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20i%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EC%97%86%EB%8A%94%20%EB%B0%B0%EC%97%B4%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%20%20%20%20%23%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion_simple%28nums,%20target%29%0A%20%20%20%20print%28f%22%EC%9B%90%EC%86%8C%20%7Btarget%7D%EC%9D%98%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%8A%94%20%7Bindex%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion_simple%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%20%EC%97%86%EC%9D%8C%29%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%20%5B0,%20n-1%5D%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20m%EC%9D%84%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bm%2B1,%20j%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20target%EC%9D%84%20%EC%B0%BE%EC%95%98%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20m%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20target%EC%9D%84%20%EC%B0%BE%EC%A7%80%20%EB%AA%BB%ED%96%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20i%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EC%97%86%EB%8A%94%20%EB%B0%B0%EC%97%B4%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%20%20%20%20%23%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion_simple%28nums,%20target%29%0A%20%20%20%20print%28f%22%EC%9B%90%EC%86%8C%20%7Btarget%7D%EC%9D%98%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%8A%94%20%7Bindex%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 10.2.2 &nbsp; 중복 원소가 있는 경우

!!! question "문제"

    앞 문제에서 배열에 중복 원소가 있을 수 있다는 조건만 추가하고, 나머지 조건은 그대로 둔다.

배열에 `target`이 여러 개 있다면 일반적인 이진 탐색으로는 그중 하나의 인덱스만 구할 수 있다. **그 원소의 왼쪽과 오른쪽에 `target`이 몇 개 더 있는지는 알 수 없다**.

문제에서는 목표 원소를 가장 왼쪽에 삽입하라고 한다. **따라서 배열에서 가장 왼쪽 `target`의 인덱스를 찾아야 한다**. 먼저 아래 그림(10-5)과 같은 방법을 생각해 볼 수 있다.

1. 이진 탐색으로 임의의 `target`의 인덱스를 구하고 이를 $k$라고 한다.
2. 인덱스 $k$부터 왼쪽으로 선형 순회하여 가장 왼쪽 `target`을 찾으면 반환한다.

![선형 탐색으로 중복 원소의 삽입 위치 찾기](binary_search_insertion.assets/binary_search_insertion_naive.png){ class="animation-figure" }

<p align="center"> 그림 10-5 &nbsp; 선형 탐색으로 중복 원소의 삽입 위치 찾기 </p>

이 방법도 가능하지만 선형 탐색이 포함되어 시간 복잡도가 $O(n)$이다. 배열에 중복된 `target`이 많으면 매우 비효율적이다.

이제 이진 탐색 코드를 확장해 보자. 아래 그림(10-6)과 같이 전체 흐름은 그대로 유지한다. 매 반복에서 중간 인덱스 $m$을 계산하고, `target`과 `nums[m]`의 대소 관계에 따라 다음과 같이 처리한다.

- `nums[m] < target` 또는 `nums[m] > target`이면 아직 `target`을 찾지 못했으므로, 일반적인 이진 탐색처럼 구간을 줄여 **포인터 $i$와 $j$가 `target`에 가까워지게 한다**.
- `nums[m] == target`이면 `target`보다 작은 원소는 구간 $[i, m - 1]$에 있으므로, $j = m - 1$로 구간을 줄여 **포인터 $j$가 `target`보다 작은 원소에 가까워지게 한다**.

반복이 끝나면 $i$는 가장 왼쪽 `target`을, $j$는 `target`보다 작은 가장 오른쪽 원소를 가리킨다. **따라서 인덱스 $i$가 삽입 위치다**.

=== "<1>"
    ![이진 탐색으로 중복 원소의 삽입 위치를 찾는 단계](binary_search_insertion.assets/binary_search_insertion_step1.png){ class="animation-figure" }

=== "<2>"
    ![삽입 위치 이진 탐색 2단계](binary_search_insertion.assets/binary_search_insertion_step2.png){ class="animation-figure" }

=== "<3>"
    ![삽입 위치 이진 탐색 3단계](binary_search_insertion.assets/binary_search_insertion_step3.png){ class="animation-figure" }

=== "<4>"
    ![삽입 위치 이진 탐색 4단계](binary_search_insertion.assets/binary_search_insertion_step4.png){ class="animation-figure" }

=== "<5>"
    ![삽입 위치 이진 탐색 5단계](binary_search_insertion.assets/binary_search_insertion_step5.png){ class="animation-figure" }

=== "<6>"
    ![삽입 위치 이진 탐색 6단계](binary_search_insertion.assets/binary_search_insertion_step6.png){ class="animation-figure" }

=== "<7>"
    ![삽입 위치 이진 탐색 7단계](binary_search_insertion.assets/binary_search_insertion_step7.png){ class="animation-figure" }

=== "<8>"
    ![삽입 위치 이진 탐색 8단계](binary_search_insertion.assets/binary_search_insertion_step8.png){ class="animation-figure" }

<p align="center"> 그림 10-6 &nbsp; 이진 탐색으로 중복 원소의 삽입 위치를 찾는 단계 </p>

아래 코드를 보면 `nums[m] > target`과 `nums[m] == target` 분기에서 수행하는 연산이 같으므로 두 분기를 합칠 수 있다.

그렇더라도 조건을 나누어 두면 논리가 더 명확하고 가독성이 좋으므로 그대로 둘 수 있다.

=== "Python"

    ```python title="binary_search_insertion.py"
    def binary_search_insertion(nums: list[int], target: int) -> int:
        """삽입 위치의 이진 탐색(중복 원소 있음)"""
        i, j = 0, len(nums) - 1  # 닫힌 구간 [0, n-1]을 초기화한다
        while i <= j:
            m = (i + j) // 2  # 중간 인덱스 m을 계산한다
            if nums[m] < target:
                i = m + 1  # target은 구간 [m+1, j]에 있다
            elif nums[m] > target:
                j = m - 1  # target은 구간 [i, m-1]에 있다
            else:
                j = m - 1  # target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
        # 삽입 위치 i를 반환한다
        return i
    ```

=== "C++"

    ```cpp title="binary_search_insertion.cpp"
    /* 삽입 위치의 이진 탐색(중복 원소 있음) */
    int binarySearchInsertion(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                j = m - 1; // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
            }
        }
        // 삽입 위치 i를 반환한다
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_insertion.java"
    /* 삽입 위치의 이진 탐색(중복 원소 있음) */
    int binarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                j = m - 1; // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
            }
        }
        // 삽입 위치 i를 반환한다
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_insertion.cs"
    /* 삽입 위치의 이진 탐색(중복 원소 있음) */
    int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                j = m - 1; // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
            }
        }
        // 삽입 위치 i를 반환한다
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_insertion.go"
    /* 삽입 위치의 이진 탐색(중복 원소 있음) */
    func binarySearchInsertion(nums []int, target int) int {
        // 닫힌 구간 [0, n-1]을 초기화한다
        i, j := 0, len(nums)-1
        for i <= j {
            // 중간 인덱스 m을 계산한다
            m := i + (j-i)/2
            if nums[m] < target {
                // target은 구간 [m+1, j]에 있다
                i = m + 1
            } else if nums[m] > target {
                // target은 구간 [i, m-1]에 있다
                j = m - 1
            } else {
                // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
                j = m - 1
            }
        }
        // 삽입 위치 i를 반환한다
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_insertion.swift"
    /* 삽입 위치의 이진 탐색(중복 원소 있음) */
    func binarySearchInsertion(nums: [Int], target: Int) -> Int {
        // 닫힌 구간 [0, n-1]을 초기화한다
        var i = nums.startIndex
        var j = nums.endIndex - 1
        while i <= j {
            let m = i + (j - i) / 2 // 중간 인덱스 m을 계산한다
            if nums[m] < target {
                i = m + 1 // target은 구간 [m+1, j]에 있다
            } else if nums[m] > target {
                j = m - 1 // target은 구간 [i, m-1]에 있다
            } else {
                j = m - 1 // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
            }
        }
        // 삽입 위치 i를 반환한다
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_insertion.js"
    /* 삽입 위치의 이진 탐색(중복 원소 있음) */
    function binarySearchInsertion(nums, target) {
        let i = 0,
            j = nums.length - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 중간 인덱스 m을 계산하며, Math.floor()로 내림한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                j = m - 1; // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
            }
        }
        // 삽입 위치 i를 반환한다
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_insertion.ts"
    /* 삽입 위치의 이진 탐색(중복 원소 있음) */
    function binarySearchInsertion(nums: Array<number>, target: number): number {
        let i = 0,
            j = nums.length - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 중간 인덱스 m을 계산하며, Math.floor()로 내림한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                j = m - 1; // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
            }
        }
        // 삽입 위치 i를 반환한다
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_insertion.dart"
    /* 삽입 위치의 이진 탐색(중복 원소 있음) */
    int binarySearchInsertion(List<int> nums, int target) {
      int i = 0, j = nums.length - 1; // 닫힌 구간 [0, n-1]을 초기화한다
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // 중간 인덱스 m을 계산한다
        if (nums[m] < target) {
          i = m + 1; // target은 구간 [m+1, j]에 있다
        } else if (nums[m] > target) {
          j = m - 1; // target은 구간 [i, m-1]에 있다
        } else {
          j = m - 1; // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
        }
      }
      // 삽입 위치 i를 반환한다
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_insertion.rs"
    /* 삽입 위치의 이진 탐색(중복 원소 있음) */
    pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
        let (mut i, mut j) = (0, nums.len() as i32 - 1); // 닫힌 구간 [0, n-1]을 초기화한다
        while i <= j {
            let m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if nums[m as usize] < target {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if nums[m as usize] > target {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                j = m - 1; // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
            }
        }
        // 삽입 위치 i를 반환한다
        i
    }
    ```

=== "C"

    ```c title="binary_search_insertion.c"
    /* 삽입 위치의 이진 탐색(중복 원소 있음) */
    int binarySearchInsertion(int *nums, int numSize, int target) {
        int i = 0, j = numSize - 1; // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target) {
                i = m + 1; // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1; // target은 구간 [i, m-1]에 있다
            } else {
                j = m - 1; // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
            }
        }
        // 삽입 위치 i를 반환한다
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_insertion.kt"
    /* 삽입 위치의 이진 탐색(중복 원소 있음) */
    fun binarySearchInsertion(nums: IntArray, target: Int): Int {
        var i = 0
        var j = nums.size - 1 // 닫힌 구간 [0, n-1]을 초기화한다
        while (i <= j) {
            val m = i + (j - i) / 2 // 중간 인덱스 m을 계산한다
            if (nums[m] < target) {
                i = m + 1 // target은 구간 [m+1, j]에 있다
            } else if (nums[m] > target) {
                j = m - 1 // target은 구간 [i, m-1]에 있다
            } else {
                j = m - 1 // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
            }
        }
        // 삽입 위치 i를 반환한다
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_insertion.rb"
    ### 삽입 위치의 이진 탐색(중복 원소 있음) ###
    def binary_search_insertion(nums, target)
      # 닫힌 구간 [0, n-1]을 초기화한다
      i, j = 0, nums.length - 1

      while i <= j
        # 중간 인덱스 m을 계산한다
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # target은 구간 [m+1, j]에 있다
        elsif nums[m] > target
          j = m - 1 # target은 구간 [i, m-1]에 있다
        else
          j = m - 1 # target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
        end
      end

      i # 삽입 위치 i를 반환한다
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%20%EC%9E%88%EC%9D%8C%29%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%20%5B0,%20n-1%5D%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20m%EC%9D%84%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bm%2B1,%20j%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%9B%90%EC%86%8C%EB%8A%94%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%23%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20i%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%ED%8F%AC%ED%95%A8%ED%95%98%EB%8A%94%20%EB%B0%B0%EC%97%B4%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20print%28f%22%EC%9B%90%EC%86%8C%20%7Btarget%7D%EC%9D%98%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%8A%94%20%7Bindex%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%20%EC%9E%88%EC%9D%8C%29%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%20%5B0,%20n-1%5D%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20m%EC%9D%84%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bm%2B1,%20j%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%9B%90%EC%86%8C%EB%8A%94%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%23%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20i%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%ED%8F%AC%ED%95%A8%ED%95%98%EB%8A%94%20%EB%B0%B0%EC%97%B4%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20print%28f%22%EC%9B%90%EC%86%8C%20%7Btarget%7D%EC%9D%98%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%8A%94%20%7Bindex%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

!!! tip "참고"

    이 절의 코드는 모두 '양끝이 닫힌 구간'을 사용한다. 관심 있는 독자는 '왼쪽은 닫히고 오른쪽은 열린 구간'으로 직접 구현해 보자.

종합하면 이진 탐색은 포인터 $i$와 $j$에 각각 탐색 목표를 정해 주는 과정이다. 목표는 특정 원소(예: `target`)일 수도 있고, 원소의 범위(예: `target`보다 작은 원소)일 수도 있다.

구간을 계속 반으로 나누는 동안 포인터 $i$와 $j$는 미리 정한 목표에 점차 가까워진다. 결국 답을 찾거나 경계를 넘어선 뒤 멈춘다.
