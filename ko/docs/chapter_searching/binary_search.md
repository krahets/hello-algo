---
comments: true
---

# 10.1 &nbsp; 이진 탐색

<u>이진 탐색(binary search)</u>은 분할 정복 전략에 기반한 효율적인 탐색 알고리즘이다. 데이터가 정렬되어 있다는 성질을 이용하여 매번 탐색 범위를 절반으로 줄이며, 목표 원소를 찾거나 탐색 구간이 빌 때까지 반복한다.

!!! question "문제"

    길이가 $n$인 배열 `nums`가 주어진다. 원소는 오름차순으로 정렬되어 있고 중복되지 않는다. 이 배열에서 원소 `target`을 찾아 그 인덱스를 반환하라. 배열에 해당 원소가 없으면 $-1$을 반환하라. 예시는 아래 그림(10-1)과 같다.

![이진 탐색 예시 데이터](binary_search.assets/binary_search_example.png){ class="animation-figure" }

<p align="center"> 그림 10-1 &nbsp; 이진 탐색 예시 데이터 </p>

아래 그림(10-2)과 같이 포인터 $i = 0$과 $j = n - 1$을 초기화하여 각각 배열의 첫 원소와 마지막 원소를 가리키게 한다. 이는 탐색 구간 $[0, n - 1]$을 나타낸다. 대괄호는 경곗값 자체를 포함하는 닫힌 구간을 뜻한다.

이어서 다음 두 단계를 반복한다.

1. 중간 인덱스 $m = \lfloor {(i + j) / 2} \rfloor$를 계산한다. 여기서 $\lfloor \: \rfloor$는 내림 연산이다.
2. `nums[m]`과 `target`의 대소 관계를 비교하며, 다음 세 경우로 나뉜다.
    1. `nums[m] < target`이면 `target`은 구간 $[m + 1, j]$에 있으므로 $i = m + 1$을 수행한다.
    2. `nums[m] > target`이면 `target`은 구간 $[i, m - 1]$에 있으므로 $j = m - 1$을 수행한다.
    3. `nums[m] = target`이면 `target`을 찾았으므로 인덱스 $m$을 반환한다.

배열에 목표 원소가 없으면 탐색 구간은 결국 비게 된다. 이때 $-1$을 반환한다.

=== "<1>"
    ![이진 탐색 과정](binary_search.assets/binary_search_step1.png){ class="animation-figure" }

=== "<2>"
    ![이진 탐색 2단계](binary_search.assets/binary_search_step2.png){ class="animation-figure" }

=== "<3>"
    ![이진 탐색 3단계](binary_search.assets/binary_search_step3.png){ class="animation-figure" }

=== "<4>"
    ![이진 탐색 4단계](binary_search.assets/binary_search_step4.png){ class="animation-figure" }

=== "<5>"
    ![이진 탐색 5단계](binary_search.assets/binary_search_step5.png){ class="animation-figure" }

=== "<6>"
    ![이진 탐색 6단계](binary_search.assets/binary_search_step6.png){ class="animation-figure" }

=== "<7>"
    ![이진 탐색 7단계](binary_search.assets/binary_search_step7.png){ class="animation-figure" }

<p align="center"> 그림 10-2 &nbsp; 이진 탐색 과정 </p>

$i$와 $j$가 모두 `int` 타입이므로 **$i + j$가 `int` 타입의 표현 범위를 벗어날 수 있다**. 정수 오버플로를 피하기 위해 보통 $m = \lfloor {i + (j - i) / 2} \rfloor$ 공식으로 중간 인덱스를 계산한다.

코드는 다음과 같다.

=== "Python"

    ```python title="binary_search.py"
    def binary_search(nums: list[int], target: int) -> int:
        """이진 탐색(양 끝을 포함하는 닫힌 구간)"""
        # 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
        i, j = 0, len(nums) - 1
        # 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
        while i <= j:
            # 이론적으로 Python의 수는 메모리 크기에 따라 무한히 커질 수 있으므로 큰 수의 범위 초과를 고려할 필요가 없다
            m = (i + j) // 2  # 중간 인덱스 m을 계산한다
            if nums[m] < target:
                i = m + 1  # 이 경우 target은 구간 [m+1, j]에 있다
            elif nums[m] > target:
                j = m - 1  # 이 경우 target은 구간 [i, m-1]에 있다
            else:
                return m  # 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        return -1  # 목표 원소를 찾지 못했으므로 -1을 반환한다
    ```

=== "C++"

    ```cpp title="binary_search.cpp"
    /* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
    int binarySearch(vector<int> &nums, int target) {
        // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
        int i = 0, j = nums.size() - 1;
        // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target)    // 이 경우 target은 구간 [m+1, j]에 있다
                i = m + 1;
            else if (nums[m] > target) // 이 경우 target은 구간 [i, m-1]에 있다
                j = m - 1;
            else // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m;
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }
    ```

=== "Java"

    ```java title="binary_search.java"
    /* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
    int binarySearch(int[] nums, int target) {
        // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
        int i = 0, j = nums.length - 1;
        // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target) // 이 경우 target은 구간 [m+1, j]에 있다
                i = m + 1;
            else if (nums[m] > target) // 이 경우 target은 구간 [i, m-1]에 있다
                j = m - 1;
            else // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m;
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }
    ```

=== "C#"

    ```csharp title="binary_search.cs"
    /* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
    int BinarySearch(int[] nums, int target) {
        // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
        int i = 0, j = nums.Length - 1;
        // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
        while (i <= j) {
            int m = i + (j - i) / 2;   // 중간 인덱스 m을 계산한다
            if (nums[m] < target)      // 이 경우 target은 구간 [m+1, j]에 있다
                i = m + 1;
            else if (nums[m] > target) // 이 경우 target은 구간 [i, m-1]에 있다
                j = m - 1;
            else                       // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m;
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }
    ```

=== "Go"

    ```go title="binary_search.go"
    /* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
    func binarySearch(nums []int, target int) int {
        // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
        i, j := 0, len(nums)-1
        // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
        for i <= j {
            m := i + (j-i)/2      // 중간 인덱스 m을 계산한다
            if nums[m] < target { // 이 경우 target은 구간 [m+1, j]에 있다
                i = m + 1
            } else if nums[m] > target { // 이 경우 target은 구간 [i, m-1]에 있다
                j = m - 1
            } else { // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m
            }
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1
    }
    ```

=== "Swift"

    ```swift title="binary_search.swift"
    /* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
    func binarySearch(nums: [Int], target: Int) -> Int {
        // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
        var i = nums.startIndex
        var j = nums.endIndex - 1
        // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
        while i <= j {
            let m = i + (j - i) / 2 // 중간 인덱스 m을 계산한다
            if nums[m] < target { // 이 경우 target은 구간 [m+1, j]에 있다
                i = m + 1
            } else if nums[m] > target { // 이 경우 target은 구간 [i, m-1]에 있다
                j = m - 1
            } else { // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m
            }
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1
    }
    ```

=== "JS"

    ```javascript title="binary_search.js"
    /* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
    function binarySearch(nums, target) {
        // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
        let i = 0,
            j = nums.length - 1;
        // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
        while (i <= j) {
            // 중간 인덱스 m을 계산하며, parseInt()로 소수 부분을 버린다
            const m = parseInt(i + (j - i) / 2);
            if (nums[m] < target)
                // 이 경우 target은 구간 [m+1, j]에 있다
                i = m + 1;
            else if (nums[m] > target)
                // 이 경우 target은 구간 [i, m-1]에 있다
                j = m - 1;
            else return m; // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }
    ```

=== "TS"

    ```typescript title="binary_search.ts"
    /* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
    function binarySearch(nums: number[], target: number): number {
        // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
        let i = 0,
            j = nums.length - 1;
        // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
        while (i <= j) {
            // 중간 인덱스 m을 계산한다
            const m = Math.floor(i + (j - i) / 2);
            if (nums[m] < target) {
                // 이 경우 target은 구간 [m+1, j]에 있다
                i = m + 1;
            } else if (nums[m] > target) {
                // 이 경우 target은 구간 [i, m-1]에 있다
                j = m - 1;
            } else {
                // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m;
            }
        }
        return -1; // 목표 원소를 찾지 못했으므로 -1을 반환한다
    }
    ```

=== "Dart"

    ```dart title="binary_search.dart"
    /* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
    int binarySearch(List<int> nums, int target) {
      // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
      int i = 0, j = nums.length - 1;
      // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // 중간 인덱스 m을 계산한다
        if (nums[m] < target) {
          // 이 경우 target은 구간 [m+1, j]에 있다
          i = m + 1;
        } else if (nums[m] > target) {
          // 이 경우 target은 구간 [i, m-1]에 있다
          j = m - 1;
        } else {
          // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
          return m;
        }
      }
      // 목표 원소를 찾지 못했으므로 -1을 반환한다
      return -1;
    }
    ```

=== "Rust"

    ```rust title="binary_search.rs"
    /* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
    fn binary_search(nums: &[i32], target: i32) -> i32 {
        // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
        let mut i = 0;
        let mut j = nums.len() as i32 - 1;
        // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
        while i <= j {
            let m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if nums[m as usize] < target {
                // 이 경우 target은 구간 [m+1, j]에 있다
                i = m + 1;
            } else if nums[m as usize] > target {
                // 이 경우 target은 구간 [i, m-1]에 있다
                j = m - 1;
            } else {
                // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m;
            }
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }
    ```

=== "C"

    ```c title="binary_search.c"
    /* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
    int binarySearch(int *nums, int len, int target) {
        // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
        int i = 0, j = len - 1;
        // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
        while (i <= j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target)    // 이 경우 target은 구간 [m+1, j]에 있다
                i = m + 1;
            else if (nums[m] > target) // 이 경우 target은 구간 [i, m-1]에 있다
                j = m - 1;
            else // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m;
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search.kt"
    /* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
    fun binarySearch(nums: IntArray, target: Int): Int {
        // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
        var i = 0
        var j = nums.size - 1
        // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
        while (i <= j) {
            val m = i + (j - i) / 2 // 중간 인덱스 m을 계산한다
            if (nums[m] < target) // 이 경우 target은 구간 [m+1, j]에 있다
                i = m + 1
            else if (nums[m] > target) // 이 경우 target은 구간 [i, m-1]에 있다
                j = m - 1
            else  // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="binary_search.rb"
    ### 이진 탐색(양 끝을 포함하는 닫힌 구간) ###
    def binary_search(nums, target)
      # 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
      i, j = 0, nums.length - 1

      # 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
      while i <= j
        # Ruby의 정수는 이론상 메모리가 허용하는 만큼 커질 수 있으므로 큰 수의 오버플로를 고려할 필요가 없다
        m = (i + j) / 2   # 중간 인덱스 m을 계산한다
      
        if nums[m] < target
          i = m + 1 # 이 경우 target은 구간 [m+1, j]에 있다
        elsif nums[m] > target
          j = m - 1 # 이 경우 target은 구간 [i, m-1]에 있다
        else
          return m  # 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        end
      end

      -1  # 목표 원소를 찾지 못했으므로 -1을 반환한다
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%96%91%20%EB%81%9D%EC%9D%84%20%ED%8F%AC%ED%95%A8%ED%95%98%EB%8A%94%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%29%22%22%22%0A%20%20%20%20%23%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%20%5B0,%20n-1%5D%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4.%20i%EC%99%80%20j%EB%8A%94%20%EA%B0%81%EA%B0%81%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%EC%99%80%20%EB%A7%88%EC%A7%80%EB%A7%89%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B0%80%EB%A6%AC%ED%82%A8%EB%8B%A4%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%ED%95%98%EB%8B%A4%20%ED%83%90%EC%83%89%20%EA%B5%AC%EA%B0%84%EC%9D%B4%20%EB%B9%84%EB%A9%B4%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%28i%20%3E%20j%EC%9D%B4%EB%A9%B4%20%EB%B9%88%20%EA%B5%AC%EA%B0%84%EC%9D%B4%EB%8B%A4%29%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%9D%B4%EB%A1%A0%EC%A0%81%EC%9C%BC%EB%A1%9C%20Python%EC%9D%98%20%EC%88%98%EB%8A%94%20%EB%A9%94%EB%AA%A8%EB%A6%AC%20%ED%81%AC%EA%B8%B0%EC%97%90%20%EB%94%B0%EB%9D%BC%20%EB%AC%B4%ED%95%9C%ED%9E%88%20%EC%BB%A4%EC%A7%88%20%EC%88%98%20%EC%9E%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20%ED%81%B0%20%EC%88%98%EC%9D%98%20%EB%B2%94%EC%9C%84%20%EC%B4%88%EA%B3%BC%EB%A5%BC%20%EA%B3%A0%EB%A0%A4%ED%95%A0%20%ED%95%84%EC%9A%94%EA%B0%80%20%EC%97%86%EB%8B%A4%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20m%EC%9D%84%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20%EC%9D%B4%20%EA%B2%BD%EC%9A%B0%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bm%2B1,%20j%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%EC%9D%B4%20%EA%B2%BD%EC%9A%B0%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%EB%AA%A9%ED%91%9C%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%B0%BE%EC%95%98%EC%9C%BC%EB%AF%80%EB%A1%9C%20%ED%95%B4%EB%8B%B9%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20-1%20%20%23%20%EB%AA%A9%ED%91%9C%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%B0%BE%EC%A7%80%20%EB%AA%BB%ED%96%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20-1%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%96%91%20%EB%81%9D%EC%9D%84%20%ED%8F%AC%ED%95%A8%ED%95%98%EB%8A%94%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%29%0A%20%20%20%20index%20%3D%20binary_search%28nums,%20target%29%0A%20%20%20%20print%28%22%EB%AA%A9%ED%91%9C%20%EC%9B%90%EC%86%8C%206%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%3D%20%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%96%91%20%EB%81%9D%EC%9D%84%20%ED%8F%AC%ED%95%A8%ED%95%98%EB%8A%94%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%29%22%22%22%0A%20%20%20%20%23%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%20%5B0,%20n-1%5D%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4.%20i%EC%99%80%20j%EB%8A%94%20%EA%B0%81%EA%B0%81%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%EC%99%80%20%EB%A7%88%EC%A7%80%EB%A7%89%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B0%80%EB%A6%AC%ED%82%A8%EB%8B%A4%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%ED%95%98%EB%8B%A4%20%ED%83%90%EC%83%89%20%EA%B5%AC%EA%B0%84%EC%9D%B4%20%EB%B9%84%EB%A9%B4%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%28i%20%3E%20j%EC%9D%B4%EB%A9%B4%20%EB%B9%88%20%EA%B5%AC%EA%B0%84%EC%9D%B4%EB%8B%A4%29%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%9D%B4%EB%A1%A0%EC%A0%81%EC%9C%BC%EB%A1%9C%20Python%EC%9D%98%20%EC%88%98%EB%8A%94%20%EB%A9%94%EB%AA%A8%EB%A6%AC%20%ED%81%AC%EA%B8%B0%EC%97%90%20%EB%94%B0%EB%9D%BC%20%EB%AC%B4%ED%95%9C%ED%9E%88%20%EC%BB%A4%EC%A7%88%20%EC%88%98%20%EC%9E%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20%ED%81%B0%20%EC%88%98%EC%9D%98%20%EB%B2%94%EC%9C%84%20%EC%B4%88%EA%B3%BC%EB%A5%BC%20%EA%B3%A0%EB%A0%A4%ED%95%A0%20%ED%95%84%EC%9A%94%EA%B0%80%20%EC%97%86%EB%8B%A4%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20m%EC%9D%84%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20%EC%9D%B4%20%EA%B2%BD%EC%9A%B0%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bm%2B1,%20j%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%EC%9D%B4%20%EA%B2%BD%EC%9A%B0%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%EB%AA%A9%ED%91%9C%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%B0%BE%EC%95%98%EC%9C%BC%EB%AF%80%EB%A1%9C%20%ED%95%B4%EB%8B%B9%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20-1%20%20%23%20%EB%AA%A9%ED%91%9C%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%B0%BE%EC%A7%80%20%EB%AA%BB%ED%96%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20-1%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%96%91%20%EB%81%9D%EC%9D%84%20%ED%8F%AC%ED%95%A8%ED%95%98%EB%8A%94%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%29%0A%20%20%20%20index%20%3D%20binary_search%28nums,%20target%29%0A%20%20%20%20print%28%22%EB%AA%A9%ED%91%9C%20%EC%9B%90%EC%86%8C%206%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%3D%20%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

**시간 복잡도는 $O(\log n)$이다**. 이진 탐색의 반복문에서 구간이 매번 절반으로 줄어들므로 반복 횟수는 $\log_2 n$이다.

**공간 복잡도는 $O(1)$이다**. 포인터 $i$와 $j$는 상수 크기의 공간을 사용한다.

## 10.1.1 &nbsp; 구간 표현 방법

위의 양끝이 닫힌 구간 외에 '왼쪽은 닫히고 오른쪽은 열린' 구간도 자주 사용한다. $[0, n)$으로 정의하며 왼쪽 경곗값은 포함하고 오른쪽 경곗값은 포함하지 않는다. 이 표현에서 구간 $[i, j)$는 $i = j$일 때 비어 있다.

이 표현을 사용하여 같은 기능의 이진 탐색 알고리즘을 구현할 수 있다.

=== "Python"

    ```python title="binary_search.py"
    def binary_search_lcro(nums: list[int], target: int) -> int:
        """이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간)"""
        # 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
        i, j = 0, len(nums)
        # 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
        while i < j:
            m = (i + j) // 2  # 중간 인덱스 m을 계산한다
            if nums[m] < target:
                i = m + 1  # 이 경우 target은 구간 [m+1, j)에 있다
            elif nums[m] > target:
                j = m  # 이 경우 target은 구간 [i, m)에 있다
            else:
                return m  # 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        return -1  # 목표 원소를 찾지 못했으므로 -1을 반환한다
    ```

=== "C++"

    ```cpp title="binary_search.cpp"
    /* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
    int binarySearchLCRO(vector<int> &nums, int target) {
        // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
        int i = 0, j = nums.size();
        // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
        while (i < j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target)    // 이 경우 target은 구간 [m+1, j)에 있다
                i = m + 1;
            else if (nums[m] > target) // 이 경우 target은 구간 [i, m)에 있다
                j = m;
            else // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m;
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }
    ```

=== "Java"

    ```java title="binary_search.java"
    /* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
    int binarySearchLCRO(int[] nums, int target) {
        // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
        int i = 0, j = nums.length;
        // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
        while (i < j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target) // 이 경우 target은 구간 [m+1, j)에 있다
                i = m + 1;
            else if (nums[m] > target) // 이 경우 target은 구간 [i, m)에 있다
                j = m;
            else // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m;
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }
    ```

=== "C#"

    ```csharp title="binary_search.cs"
    /* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
    int BinarySearchLCRO(int[] nums, int target) {
        // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
        int i = 0, j = nums.Length;
        // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
        while (i < j) {
            int m = i + (j - i) / 2;   // 중간 인덱스 m을 계산한다
            if (nums[m] < target)      // 이 경우 target은 구간 [m+1, j)에 있다
                i = m + 1;
            else if (nums[m] > target) // 이 경우 target은 구간 [i, m)에 있다
                j = m;
            else                       // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m;
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }
    ```

=== "Go"

    ```go title="binary_search.go"
    /* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
    func binarySearchLCRO(nums []int, target int) int {
        // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
        i, j := 0, len(nums)
        // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
        for i < j {
            m := i + (j-i)/2      // 중간 인덱스 m을 계산한다
            if nums[m] < target { // 이 경우 target은 구간 [m+1, j)에 있다
                i = m + 1
            } else if nums[m] > target { // 이 경우 target은 구간 [i, m)에 있다
                j = m
            } else { // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m
            }
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1
    }
    ```

=== "Swift"

    ```swift title="binary_search.swift"
    /* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
    func binarySearchLCRO(nums: [Int], target: Int) -> Int {
        // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
        var i = nums.startIndex
        var j = nums.endIndex
        // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
        while i < j {
            let m = i + (j - i) / 2 // 중간 인덱스 m을 계산한다
            if nums[m] < target { // 이 경우 target은 구간 [m+1, j)에 있다
                i = m + 1
            } else if nums[m] > target { // 이 경우 target은 구간 [i, m)에 있다
                j = m
            } else { // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m
            }
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1
    }
    ```

=== "JS"

    ```javascript title="binary_search.js"
    /* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
    function binarySearchLCRO(nums, target) {
        // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
        let i = 0,
            j = nums.length;
        // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
        while (i < j) {
            // 중간 인덱스 m을 계산하며, parseInt()로 소수 부분을 버린다
            const m = parseInt(i + (j - i) / 2);
            if (nums[m] < target)
                // 이 경우 target은 구간 [m+1, j)에 있다
                i = m + 1;
            else if (nums[m] > target)
                // 이 경우 target은 구간 [i, m)에 있다
                j = m;
            // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
            else return m;
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }
    ```

=== "TS"

    ```typescript title="binary_search.ts"
    /* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
    function binarySearchLCRO(nums: number[], target: number): number {
        // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
        let i = 0,
            j = nums.length;
        // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
        while (i < j) {
            // 중간 인덱스 m을 계산한다
            const m = Math.floor(i + (j - i) / 2);
            if (nums[m] < target) {
                // 이 경우 target은 구간 [m+1, j)에 있다
                i = m + 1;
            } else if (nums[m] > target) {
                // 이 경우 target은 구간 [i, m)에 있다
                j = m;
            } else {
                // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m;
            }
        }
        return -1; // 목표 원소를 찾지 못했으므로 -1을 반환한다
    }
    ```

=== "Dart"

    ```dart title="binary_search.dart"
    /* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
    int binarySearchLCRO(List<int> nums, int target) {
      // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
      int i = 0, j = nums.length;
      // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
      while (i < j) {
        int m = i + (j - i) ~/ 2; // 중간 인덱스 m을 계산한다
        if (nums[m] < target) {
          // 이 경우 target은 구간 [m+1, j)에 있다
          i = m + 1;
        } else if (nums[m] > target) {
          // 이 경우 target은 구간 [i, m)에 있다
          j = m;
        } else {
          // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
          return m;
        }
      }
      // 목표 원소를 찾지 못했으므로 -1을 반환한다
      return -1;
    }
    ```

=== "Rust"

    ```rust title="binary_search.rs"
    /* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
    fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
        // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
        let mut i = 0;
        let mut j = nums.len() as i32;
        // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
        while i < j {
            let m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if nums[m as usize] < target {
                // 이 경우 target은 구간 [m+1, j)에 있다
                i = m + 1;
            } else if nums[m as usize] > target {
                // 이 경우 target은 구간 [i, m)에 있다
                j = m;
            } else {
                // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m;
            }
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }
    ```

=== "C"

    ```c title="binary_search.c"
    /* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
    int binarySearchLCRO(int *nums, int len, int target) {
        // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
        int i = 0, j = len;
        // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
        while (i < j) {
            int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
            if (nums[m] < target)    // 이 경우 target은 구간 [m+1, j)에 있다
                i = m + 1;
            else if (nums[m] > target) // 이 경우 target은 구간 [i, m)에 있다
                j = m;
            else // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m;
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search.kt"
    /* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
    fun binarySearchLCRO(nums: IntArray, target: Int): Int {
        // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
        var i = 0
        var j = nums.size
        // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
        while (i < j) {
            val m = i + (j - i) / 2 // 중간 인덱스 m을 계산한다
            if (nums[m] < target) // 이 경우 target은 구간 [m+1, j)에 있다
                i = m + 1
            else if (nums[m] > target) // 이 경우 target은 구간 [i, m)에 있다
                j = m
            else  // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
                return m
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="binary_search.rb"
    ### 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) ###
    def binary_search_lcro(nums, target)
      # 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
      i, j = 0, nums.length

      # 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
      while i < j
        # 중간 인덱스 m을 계산한다
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # 이 경우 target은 구간 [m+1, j)에 있다
        elsif nums[m] > target
          j = m - 1 # 이 경우 target은 구간 [i, m)에 있다
        else
          return m  # 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        end
      end

      -1  # 목표 원소를 찾지 못했으므로 -1을 반환한다
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_lcro%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%99%BC%EC%AA%BD%20%EB%81%9D%EC%9D%80%20%ED%8F%AC%ED%95%A8%ED%95%98%EA%B3%A0%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%81%9D%EC%9D%80%20%EC%A0%9C%EC%99%B8%ED%95%98%EB%8A%94%20%EA%B5%AC%EA%B0%84%29%22%22%22%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EB%81%9D%EB%A7%8C%20%ED%8F%AC%ED%95%A8%ED%95%98%EB%8A%94%20%EA%B5%AC%EA%B0%84%20%5B0,%20n%29%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4.%20i%EB%8A%94%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%EB%A5%BC,%20j%EB%8A%94%20%EB%A7%88%EC%A7%80%EB%A7%89%20%EC%9B%90%EC%86%8C%20%EB%B0%94%EB%A1%9C%20%EB%8B%A4%EC%9D%8C%20%EC%9C%84%EC%B9%98%EB%A5%BC%20%EA%B0%80%EB%A6%AC%ED%82%A8%EB%8B%A4%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%ED%95%98%EB%8B%A4%20%ED%83%90%EC%83%89%20%EA%B5%AC%EA%B0%84%EC%9D%B4%20%EB%B9%84%EB%A9%B4%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%28i%20%3D%20j%EC%9D%B4%EB%A9%B4%20%EB%B9%88%20%EA%B5%AC%EA%B0%84%EC%9D%B4%EB%8B%A4%29%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20m%EC%9D%84%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20%EC%9D%B4%20%EA%B2%BD%EC%9A%B0%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bm%2B1,%20j%29%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20%20%23%20%EC%9D%B4%20%EA%B2%BD%EC%9A%B0%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m%29%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%EB%AA%A9%ED%91%9C%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%B0%BE%EC%95%98%EC%9C%BC%EB%AF%80%EB%A1%9C%20%ED%95%B4%EB%8B%B9%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20-1%20%20%23%20%EB%AA%A9%ED%91%9C%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%B0%BE%EC%A7%80%20%EB%AA%BB%ED%96%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20-1%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%99%BC%EC%AA%BD%20%EB%81%9D%EC%9D%80%20%ED%8F%AC%ED%95%A8%ED%95%98%EA%B3%A0%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%81%9D%EC%9D%80%20%EC%A0%9C%EC%99%B8%ED%95%98%EB%8A%94%20%EA%B5%AC%EA%B0%84%29%0A%20%20%20%20index%20%3D%20binary_search_lcro%28nums,%20target%29%0A%20%20%20%20print%28%22%EB%AA%A9%ED%91%9C%20%EC%9B%90%EC%86%8C%206%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%3D%20%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_lcro%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%99%BC%EC%AA%BD%20%EB%81%9D%EC%9D%80%20%ED%8F%AC%ED%95%A8%ED%95%98%EA%B3%A0%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%81%9D%EC%9D%80%20%EC%A0%9C%EC%99%B8%ED%95%98%EB%8A%94%20%EA%B5%AC%EA%B0%84%29%22%22%22%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EB%81%9D%EB%A7%8C%20%ED%8F%AC%ED%95%A8%ED%95%98%EB%8A%94%20%EA%B5%AC%EA%B0%84%20%5B0,%20n%29%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4.%20i%EB%8A%94%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%B2%AB%20%EC%9B%90%EC%86%8C%EB%A5%BC,%20j%EB%8A%94%20%EB%A7%88%EC%A7%80%EB%A7%89%20%EC%9B%90%EC%86%8C%20%EB%B0%94%EB%A1%9C%20%EB%8B%A4%EC%9D%8C%20%EC%9C%84%EC%B9%98%EB%A5%BC%20%EA%B0%80%EB%A6%AC%ED%82%A8%EB%8B%A4%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%ED%95%98%EB%8B%A4%20%ED%83%90%EC%83%89%20%EA%B5%AC%EA%B0%84%EC%9D%B4%20%EB%B9%84%EB%A9%B4%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%28i%20%3D%20j%EC%9D%B4%EB%A9%B4%20%EB%B9%88%20%EA%B5%AC%EA%B0%84%EC%9D%B4%EB%8B%A4%29%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20m%EC%9D%84%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20%EC%9D%B4%20%EA%B2%BD%EC%9A%B0%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bm%2B1,%20j%29%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20%20%23%20%EC%9D%B4%20%EA%B2%BD%EC%9A%B0%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m%29%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%EB%AA%A9%ED%91%9C%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%B0%BE%EC%95%98%EC%9C%BC%EB%AF%80%EB%A1%9C%20%ED%95%B4%EB%8B%B9%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20-1%20%20%23%20%EB%AA%A9%ED%91%9C%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%B0%BE%EC%A7%80%20%EB%AA%BB%ED%96%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20-1%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%99%BC%EC%AA%BD%20%EB%81%9D%EC%9D%80%20%ED%8F%AC%ED%95%A8%ED%95%98%EA%B3%A0%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%81%9D%EC%9D%80%20%EC%A0%9C%EC%99%B8%ED%95%98%EB%8A%94%20%EA%B5%AC%EA%B0%84%29%0A%20%20%20%20index%20%3D%20binary_search_lcro%28nums,%20target%29%0A%20%20%20%20print%28%22%EB%AA%A9%ED%91%9C%20%EC%9B%90%EC%86%8C%206%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%3D%20%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

아래 그림(10-3)과 같이 구간을 표현하는 방식에 따라 이진 탐색 알고리즘의 초기화, 반복 조건, 구간 축소 연산이 모두 달라진다.

'양끝이 닫힌 구간'에서는 왼쪽과 오른쪽 경계를 모두 포함하므로, 포인터 $i$와 $j$로 구간을 줄이는 연산도 대칭적이다. 실수할 가능성이 더 작으므로 **일반적으로 '양끝이 닫힌 구간'으로 작성하기를 권장한다**.

![두 가지 구간 정의](binary_search.assets/binary_search_ranges.png){ class="animation-figure" }

<p align="center"> 그림 10-3 &nbsp; 두 가지 구간 정의 </p>

## 10.1.2 &nbsp; 장점과 한계

이진 탐색은 시간과 공간 양쪽에서 좋은 성능을 보인다.

- 이진 탐색은 시간 효율이 높다. 데이터가 많을수록 로그 시간 복잡도의 이점이 뚜렷하다. 예를 들어 데이터 크기가 $n = 2^{20}$이면 선형 탐색은 $2^{20} = 1048576$ 번 반복해야 하지만, 이진 탐색은 $\log_2 2^{20} = 20$ 번이면 된다.
- 이진 탐색은 추가 공간이 필요하지 않다. 해시 탐색처럼 추가 공간을 사용하는 탐색 알고리즘보다 공간을 절약한다.

하지만 이진 탐색이 모든 상황에 적합한 것은 아니다. 주요 이유는 다음과 같다.

- 이진 탐색은 정렬된 데이터에만 적용할 수 있다. 입력이 정렬되지 않았다면 이진 탐색만을 위해 정렬하는 것은 오히려 손해다. 정렬 알고리즘의 시간 복잡도는 보통 $O(n \log n)$으로 선형 탐색과 이진 탐색보다 높기 때문이다. 원소를 자주 삽입하는 상황에서도 정렬 상태를 유지하려면 특정 위치에 삽입해야 하므로, $O(n)$의 큰 시간 비용이 든다.
- 이진 탐색은 배열에만 적합하다. 원소를 건너뛰며(연속적이지 않게) 접근해야 하는데, 연결 리스트에서는 이런 접근이 비효율적이다. 따라서 연결 리스트나 연결 리스트 기반 자료 구조에는 적합하지 않다.
- 데이터가 적을 때는 선형 탐색의 성능이 더 좋다. 선형 탐색은 매번 비교 1회만 필요하지만, 이진 탐색은 덧셈 1회, 나눗셈 1회, 비교 1 ~ 3회, 덧셈(뺄셈) 1회로 총 4 ~ 6회의 기본 연산이 필요하다. 따라서 데이터 수 $n$이 작으면 선형 탐색이 오히려 더 빠르다.
