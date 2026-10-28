---
comments: true
---

# 11.6 &nbsp; 병합 정렬

<u>병합 정렬(merge sort)</u>은 분할 정복 전략에 기반한 정렬 알고리즘으로, 아래 그림(11-10)의 '분할' 단계와 '병합' 단계로 이루어진다.

1. **분할 단계**: 재귀적으로 배열을 계속 중간에서 나누어, 긴 배열을 정렬하는 문제를 짧은 배열을 정렬하는 문제로 바꾼다.
2. **병합 단계**: 부분 배열의 길이가 1이 되면 분할을 멈추고 병합을 시작한다. 정렬된 짧은 왼쪽 배열과 오른쪽 배열을 하나의 더 긴 정렬된 배열로 계속 합치며, 끝날 때까지 반복한다.

![병합 정렬의 분할 단계와 병합 단계](merge_sort.assets/merge_sort_overview.png){ class="animation-figure" }

<p align="center"> 그림 11-10 &nbsp; 병합 정렬의 분할 단계와 병합 단계 </p>

## 11.6.1 &nbsp; 알고리즘 과정

아래 그림(11-11)과 같이 '분할 단계'에서는 위에서 아래로 재귀하며 배열을 중간에서 두 부분 배열로 나눈다.

1. 배열의 중간 인덱스 `mid`를 계산하고 왼쪽 부분 배열(구간 `[left, mid]`)과 오른쪽 부분 배열(구간 `[mid + 1, right]`)을 재귀적으로 나눈다.
2. 부분 배열 구간의 길이가 1이 될 때까지 `1.` 단계를 재귀적으로 반복한다.

'병합 단계'에서는 아래에서 위로 왼쪽 부분 배열과 오른쪽 부분 배열을 하나의 정렬된 배열로 합친다. 길이가 1인 부분 배열부터 병합하므로, 병합 단계의 각 부분 배열은 이미 정렬되어 있다.

=== "<1>"
    ![병합 정렬 단계](merge_sort.assets/merge_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![병합 정렬 2단계](merge_sort.assets/merge_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![병합 정렬 3단계](merge_sort.assets/merge_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![병합 정렬 4단계](merge_sort.assets/merge_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![병합 정렬 5단계](merge_sort.assets/merge_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![병합 정렬 6단계](merge_sort.assets/merge_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![병합 정렬 7단계](merge_sort.assets/merge_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![병합 정렬 8단계](merge_sort.assets/merge_sort_step8.png){ class="animation-figure" }

=== "<9>"
    ![병합 정렬 9단계](merge_sort.assets/merge_sort_step9.png){ class="animation-figure" }

=== "<10>"
    ![병합 정렬 10단계](merge_sort.assets/merge_sort_step10.png){ class="animation-figure" }

<p align="center"> 그림 11-11 &nbsp; 병합 정렬 단계 </p>

병합 정렬의 재귀 순서는 이진 트리의 후위 순회와 같다는 것을 알 수 있다.

- **후위 순회**: 왼쪽 서브트리에 재귀한 다음 오른쪽 서브트리에 재귀하고, 마지막으로 루트 노드를 처리한다.
- **병합 정렬**: 왼쪽 부분 배열에 재귀한 다음 오른쪽 부분 배열에 재귀하고, 마지막으로 병합한다.

병합 정렬의 구현은 다음 코드와 같다. `nums`에서 병합할 구간은 `[left, right]`이고, 이에 대응하는 `tmp`의 구간은 `[0, right - left]`라는 점에 주의하자.

=== "Python"

    ```python title="merge_sort.py"
    def merge(nums: list[int], left: int, mid: int, right: int):
        """왼쪽 부분 배열과 오른쪽 부분 배열 병합"""
        # 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
        # 병합 결과를 저장할 임시 배열 tmp를 생성한다
        tmp = [0] * (right - left + 1)
        # 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
        i, j, k = left, mid + 1, 0
        # 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
        while i <= mid and j <= right:
            if nums[i] <= nums[j]:
                tmp[k] = nums[i]
                i += 1
            else:
                tmp[k] = nums[j]
                j += 1
            k += 1
        # 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
        while i <= mid:
            tmp[k] = nums[i]
            i += 1
            k += 1
        while j <= right:
            tmp[k] = nums[j]
            j += 1
            k += 1
        # 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
        for k in range(0, len(tmp)):
            nums[left + k] = tmp[k]

    def merge_sort(nums: list[int], left: int, right: int):
        """병합 정렬"""
        # 종료 조건
        if left >= right:
            return  # 부분 배열의 길이가 1이면 재귀를 종료한다
        # 분할 단계
        mid = (left + right) // 2 # 중간 위치를 계산한다
        merge_sort(nums, left, mid)  # 왼쪽 부분 배열에 재귀 호출한다
        merge_sort(nums, mid + 1, right)  # 오른쪽 부분 배열에 재귀 호출한다
        # 병합 단계
        merge(nums, left, mid, right)
    ```

=== "C++"

    ```cpp title="merge_sort.cpp"
    /* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
    void merge(vector<int> &nums, int left, int mid, int right) {
        // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
        // 병합 결과를 저장할 임시 배열 tmp를 생성한다
        vector<int> tmp(right - left + 1);
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
        int i = left, j = mid + 1, k = 0;
        // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
        for (k = 0; k < tmp.size(); k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* 병합 정렬 */
    void mergeSort(vector<int> &nums, int left, int right) {
        // 종료 조건
        if (left >= right)
            return; // 부분 배열의 길이가 1이면 재귀를 종료한다
        // 분할 단계
        int mid = left + (right - left) / 2;    // 중간 위치를 계산한다
        mergeSort(nums, left, mid);      // 왼쪽 부분 배열에 재귀 호출한다
        mergeSort(nums, mid + 1, right); // 오른쪽 부분 배열에 재귀 호출한다
        // 병합 단계
        merge(nums, left, mid, right);
    }
    ```

=== "Java"

    ```java title="merge_sort.java"
    /* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
    void merge(int[] nums, int left, int mid, int right) {
        // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
        // 병합 결과를 저장할 임시 배열 tmp를 생성한다
        int[] tmp = new int[right - left + 1];
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
        int i = left, j = mid + 1, k = 0;
        // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* 병합 정렬 */
    void mergeSort(int[] nums, int left, int right) {
        // 종료 조건
        if (left >= right)
            return; // 부분 배열의 길이가 1이면 재귀를 종료한다
        // 분할 단계
        int mid = left + (right - left) / 2; // 중간 위치를 계산한다
        mergeSort(nums, left, mid); // 왼쪽 부분 배열에 재귀 호출한다
        mergeSort(nums, mid + 1, right); // 오른쪽 부분 배열에 재귀 호출한다
        // 병합 단계
        merge(nums, left, mid, right);
    }
    ```

=== "C#"

    ```csharp title="merge_sort.cs"
    /* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
    void Merge(int[] nums, int left, int mid, int right) {
        // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
        // 병합 결과를 저장할 임시 배열 tmp를 생성한다
        int[] tmp = new int[right - left + 1];
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
        int i = left, j = mid + 1, k = 0;
        // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
        for (k = 0; k < tmp.Length; ++k) {
            nums[left + k] = tmp[k];
        }
    }

    /* 병합 정렬 */
    void MergeSort(int[] nums, int left, int right) {
        // 종료 조건
        if (left >= right) return;       // 부분 배열의 길이가 1이면 재귀를 종료한다
        // 분할 단계
        int mid = left + (right - left) / 2;    // 중간 위치를 계산한다
        MergeSort(nums, left, mid);      // 왼쪽 부분 배열에 재귀 호출한다
        MergeSort(nums, mid + 1, right); // 오른쪽 부분 배열에 재귀 호출한다
        // 병합 단계
        Merge(nums, left, mid, right);
    }
    ```

=== "Go"

    ```go title="merge_sort.go"
    /* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
    func merge(nums []int, left, mid, right int) {
        // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
        // 병합 결과를 저장할 임시 배열 tmp를 생성한다
        tmp := make([]int, right-left+1)
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
        i, j, k := left, mid+1, 0
        // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
        for i <= mid && j <= right {
            if nums[i] <= nums[j] {
                tmp[k] = nums[i]
                i++
            } else {
                tmp[k] = nums[j]
                j++
            }
            k++
        }
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
        for i <= mid {
            tmp[k] = nums[i]
            i++
            k++
        }
        for j <= right {
            tmp[k] = nums[j]
            j++
            k++
        }
        // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
        for k := 0; k < len(tmp); k++ {
            nums[left+k] = tmp[k]
        }
    }

    /* 병합 정렬 */
    func mergeSort(nums []int, left, right int) {
        // 종료 조건
        if left >= right {
            return
        }
        // 분할 단계
        mid := left + (right - left) / 2
        mergeSort(nums, left, mid)
        mergeSort(nums, mid+1, right)
        // 병합 단계
        merge(nums, left, mid, right)
    }
    ```

=== "Swift"

    ```swift title="merge_sort.swift"
    /* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
    func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
        // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
        // 병합 결과를 저장할 임시 배열 tmp를 생성한다
        var tmp = Array(repeating: 0, count: right - left + 1)
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
        var i = left, j = mid + 1, k = 0
        // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
        while i <= mid, j <= right {
            if nums[i] <= nums[j] {
                tmp[k] = nums[i]
                i += 1
            } else {
                tmp[k] = nums[j]
                j += 1
            }
            k += 1
        }
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
        while i <= mid {
            tmp[k] = nums[i]
            i += 1
            k += 1
        }
        while j <= right {
            tmp[k] = nums[j]
            j += 1
            k += 1
        }
        // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
        for k in tmp.indices {
            nums[left + k] = tmp[k]
        }
    }

    /* 병합 정렬 */
    func mergeSort(nums: inout [Int], left: Int, right: Int) {
        // 종료 조건
        if left >= right { // 부분 배열의 길이가 1이면 재귀를 종료한다
            return
        }
        // 분할 단계
        let mid = left + (right - left) / 2 // 중간 위치를 계산한다
        mergeSort(nums: &nums, left: left, right: mid) // 왼쪽 부분 배열에 재귀 호출한다
        mergeSort(nums: &nums, left: mid + 1, right: right) // 오른쪽 부분 배열에 재귀 호출한다
        // 병합 단계
        merge(nums: &nums, left: left, mid: mid, right: right)
    }
    ```

=== "JS"

    ```javascript title="merge_sort.js"
    /* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
    function merge(nums, left, mid, right) {
        // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
        // 병합 결과를 저장할 임시 배열 tmp를 생성한다
        const tmp = new Array(right - left + 1);
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
        let i = left,
            j = mid + 1,
            k = 0;
        // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* 병합 정렬 */
    function mergeSort(nums, left, right) {
        // 종료 조건
        if (left >= right) return; // 부분 배열의 길이가 1이면 재귀를 종료한다
        // 분할 단계
        let mid = Math.floor(left + (right - left) / 2); // 중간 위치를 계산한다
        mergeSort(nums, left, mid); // 왼쪽 부분 배열에 재귀 호출한다
        mergeSort(nums, mid + 1, right); // 오른쪽 부분 배열에 재귀 호출한다
        // 병합 단계
        merge(nums, left, mid, right);
    }
    ```

=== "TS"

    ```typescript title="merge_sort.ts"
    /* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
    function merge(nums: number[], left: number, mid: number, right: number): void {
        // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
        // 병합 결과를 저장할 임시 배열 tmp를 생성한다
        const tmp = new Array(right - left + 1);
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
        let i = left,
            j = mid + 1,
            k = 0;
        // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* 병합 정렬 */
    function mergeSort(nums: number[], left: number, right: number): void {
        // 종료 조건
        if (left >= right) return; // 부분 배열의 길이가 1이면 재귀를 종료한다
        // 분할 단계
        let mid = Math.floor(left + (right - left) / 2); // 중간 위치를 계산한다
        mergeSort(nums, left, mid); // 왼쪽 부분 배열에 재귀 호출한다
        mergeSort(nums, mid + 1, right); // 오른쪽 부분 배열에 재귀 호출한다
        // 병합 단계
        merge(nums, left, mid, right);
    }
    ```

=== "Dart"

    ```dart title="merge_sort.dart"
    /* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
    void merge(List<int> nums, int left, int mid, int right) {
      // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
      // 병합 결과를 저장할 임시 배열 tmp를 생성한다
      List<int> tmp = List.filled(right - left + 1, 0);
      // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
      int i = left, j = mid + 1, k = 0;
      // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
      while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
          tmp[k++] = nums[i++];
        else
          tmp[k++] = nums[j++];
      }
      // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
      while (i <= mid) {
        tmp[k++] = nums[i++];
      }
      while (j <= right) {
        tmp[k++] = nums[j++];
      }
      // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
      for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
      }
    }

    /* 병합 정렬 */
    void mergeSort(List<int> nums, int left, int right) {
      // 종료 조건
      if (left >= right) return; // 부분 배열의 길이가 1이면 재귀를 종료한다
      // 분할 단계
      int mid = left + (right - left) ~/ 2; // 중간 위치를 계산한다
      mergeSort(nums, left, mid); // 왼쪽 부분 배열에 재귀 호출한다
      mergeSort(nums, mid + 1, right); // 오른쪽 부분 배열에 재귀 호출한다
      // 병합 단계
      merge(nums, left, mid, right);
    }
    ```

=== "Rust"

    ```rust title="merge_sort.rs"
    /* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
    fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
        // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
        // 병합 결과를 저장할 임시 배열 tmp를 생성한다
        let tmp_size = right - left + 1;
        let mut tmp = vec![0; tmp_size];
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
        let (mut i, mut j, mut k) = (left, mid + 1, 0);
        // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
        while i <= mid && j <= right {
            if nums[i] <= nums[j] {
                tmp[k] = nums[i];
                i += 1;
            } else {
                tmp[k] = nums[j];
                j += 1;
            }
            k += 1;
        }
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
        while i <= mid {
            tmp[k] = nums[i];
            k += 1;
            i += 1;
        }
        while j <= right {
            tmp[k] = nums[j];
            k += 1;
            j += 1;
        }
        // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
        for k in 0..tmp_size {
            nums[left + k] = tmp[k];
        }
    }

    /* 병합 정렬 */
    fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
        // 종료 조건
        if left >= right {
            return; // 부분 배열의 길이가 1이면 재귀를 종료한다
        }

        // 분할 단계
        let mid = left + (right - left) / 2; // 중간 위치를 계산한다
        merge_sort(nums, left, mid); // 왼쪽 부분 배열에 재귀 호출한다
        merge_sort(nums, mid + 1, right); // 오른쪽 부분 배열에 재귀 호출한다

        // 병합 단계
        merge(nums, left, mid, right);
    }
    ```

=== "C"

    ```c title="merge_sort.c"
    /* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
    void merge(int *nums, int left, int mid, int right) {
        // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
        // 병합 결과를 저장할 임시 배열 tmp를 생성한다
        int tmpSize = right - left + 1;
        int *tmp = (int *)malloc(tmpSize * sizeof(int));
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
        int i = left, j = mid + 1, k = 0;
        // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
        for (k = 0; k < tmpSize; ++k) {
            nums[left + k] = tmp[k];
        }
        // 메모리 해제
        free(tmp);
    }

    /* 병합 정렬 */
    void mergeSort(int *nums, int left, int right) {
        // 종료 조건
        if (left >= right)
            return; // 부분 배열의 길이가 1이면 재귀를 종료한다
        // 분할 단계
        int mid = left + (right - left) / 2;    // 중간 위치를 계산한다
        mergeSort(nums, left, mid);      // 왼쪽 부분 배열에 재귀 호출한다
        mergeSort(nums, mid + 1, right); // 오른쪽 부분 배열에 재귀 호출한다
        // 병합 단계
        merge(nums, left, mid, right);
    }
    ```

=== "Kotlin"

    ```kotlin title="merge_sort.kt"
    /* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
    fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
        // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
        // 병합 결과를 저장할 임시 배열 tmp를 생성한다
        val tmp = IntArray(right - left + 1)
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
        var i = left
        var j = mid + 1
        var k = 0
        // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++]
            else
                tmp[k++] = nums[j++]
        }
        // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
        while (i <= mid) {
            tmp[k++] = nums[i++]
        }
        while (j <= right) {
            tmp[k++] = nums[j++]
        }
        // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
        for (l in tmp.indices) {
            nums[left + l] = tmp[l]
        }
    }

    /* 병합 정렬 */
    fun mergeSort(nums: IntArray, left: Int, right: Int) {
        // 종료 조건
        if (left >= right) return  // 부분 배열의 길이가 1이면 재귀를 종료한다
        // 분할 단계
        val mid = left + (right - left) / 2 // 중간 위치를 계산한다
        mergeSort(nums, left, mid) // 왼쪽 부분 배열에 재귀 호출한다
        mergeSort(nums, mid + 1, right) // 오른쪽 부분 배열에 재귀 호출한다
        // 병합 단계
        merge(nums, left, mid, right)
    }
    ```

=== "Ruby"

    ```ruby title="merge_sort.rb"
    ### 왼쪽 부분 배열과 오른쪽 부분 배열 병합 ###
    def merge(nums, left, mid, right)
      # 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
      # 병합 결과를 저장할 임시 배열 tmp를 생성한다
      tmp = Array.new(right - left + 1, 0)
      # 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
      i, j, k = left, mid + 1, 0
      # 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
      while i <= mid && j <= right
        if nums[i] <= nums[j]
          tmp[k] = nums[i]
          i += 1
        else
          tmp[k] = nums[j]
          j += 1
        end
        k += 1
      end
      # 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
      while i <= mid
        tmp[k] = nums[i]
        i += 1
        k += 1
      end
      while j <= right
        tmp[k] = nums[j]
        j += 1
        k += 1
      end
      # 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
      (0...tmp.length).each do |k|
        nums[left + k] = tmp[k]
      end
    end

    ### 병합 정렬 ###
    def merge_sort(nums, left, right)
      # 종료 조건
      # 부분 배열의 길이가 1이면 재귀를 종료한다
      return if left >= right
      # 분할 단계
      mid = left + (right - left) / 2 # 중간 위치를 계산한다
      merge_sort(nums, left, mid) # 왼쪽 부분 배열에 재귀 호출한다
      merge_sort(nums, mid + 1, right) # 오른쪽 부분 배열에 재귀 호출한다
      # 병합 단계
      merge(nums, left, mid, right)
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20merge%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%20%EB%B3%91%ED%95%A9%22%22%22%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B5%AC%EA%B0%84%EC%9D%80%20%5Bleft,%20mid%5D%EC%9D%B4%EA%B3%A0,%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B5%AC%EA%B0%84%EC%9D%80%20%5Bmid%2B1,%20right%5D%EC%9D%B4%EB%8B%A4%0A%20%20%20%20%23%20%EB%B3%91%ED%95%A9%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EC%A0%80%EC%9E%A5%ED%95%A0%20%EC%9E%84%EC%8B%9C%20%EB%B0%B0%EC%97%B4%20tmp%EB%A5%BC%20%EC%83%9D%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20tmp%20%3D%20%5B0%5D%20%2A%20%28right%20-%20left%20%2B%201%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%8B%9C%EC%9E%91%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A5%BC%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20i,%20j,%20k%20%3D%20left,%20mid%20%2B%201,%200%0A%20%20%20%20%23%20%EC%96%91%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%20%EB%AA%A8%EB%91%90%EC%97%90%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EB%82%A8%EC%95%84%20%EC%9E%88%EC%9C%BC%EB%A9%B4%20%EB%B9%84%EA%B5%90%ED%95%98%EC%97%AC%20%EB%8D%94%20%EC%9E%91%EC%9D%80%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%9E%84%EC%8B%9C%20%EB%B0%B0%EC%97%B4%EC%97%90%20%EB%B3%B5%EC%82%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20mid%20and%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3C%3D%20nums%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EB%82%A8%EC%9D%80%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%9E%84%EC%8B%9C%20%EB%B0%B0%EC%97%B4%EC%97%90%20%EB%B3%B5%EC%82%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20mid%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20while%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%EC%9E%84%EC%8B%9C%20%EB%B0%B0%EC%97%B4%20tmp%EC%9D%98%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%9B%90%EB%9E%98%20%EB%B0%B0%EC%97%B4%20nums%EC%9D%98%20%ED%95%B4%EB%8B%B9%20%EA%B5%AC%EA%B0%84%EC%97%90%20%EB%8B%A4%EC%8B%9C%20%EB%B3%B5%EC%82%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20k%20in%20range%280,%20len%28tmp%29%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bleft%20%2B%20k%5D%20%3D%20tmp%5Bk%5D%0A%0A%0Adef%20merge_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EB%B3%91%ED%95%A9%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%23%20%EC%A2%85%EB%A3%8C%20%EC%A1%B0%EA%B1%B4%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B8%B8%EC%9D%B4%EA%B0%80%201%EC%9D%B4%EB%A9%B4%20%EC%9E%AC%EA%B7%80%EB%A5%BC%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EB%B6%84%ED%95%A0%20%EB%8B%A8%EA%B3%84%0A%20%20%20%20mid%20%3D%20%28left%20%2B%20right%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9C%84%EC%B9%98%EB%A5%BC%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20merge_sort%28nums,%20left,%20mid%29%20%20%23%20%EC%99%BC%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%97%90%20%EC%9E%AC%EA%B7%80%20%ED%98%B8%EC%B6%9C%ED%95%9C%EB%8B%A4%0A%20%20%20%20merge_sort%28nums,%20mid%20%2B%201,%20right%29%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%97%90%20%EC%9E%AC%EA%B7%80%20%ED%98%B8%EC%B6%9C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EB%B3%91%ED%95%A9%20%EB%8B%A8%EA%B3%84%0A%20%20%20%20merge%28nums,%20left,%20mid,%20right%29%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B7,%203,%202,%206,%200,%201,%205,%204%5D%0A%20%20%20%20merge_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%EB%B3%91%ED%95%A9%20%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%A7%88%EC%B9%9C%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20merge%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%20%EB%B3%91%ED%95%A9%22%22%22%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B5%AC%EA%B0%84%EC%9D%80%20%5Bleft,%20mid%5D%EC%9D%B4%EA%B3%A0,%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B5%AC%EA%B0%84%EC%9D%80%20%5Bmid%2B1,%20right%5D%EC%9D%B4%EB%8B%A4%0A%20%20%20%20%23%20%EB%B3%91%ED%95%A9%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EC%A0%80%EC%9E%A5%ED%95%A0%20%EC%9E%84%EC%8B%9C%20%EB%B0%B0%EC%97%B4%20tmp%EB%A5%BC%20%EC%83%9D%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20tmp%20%3D%20%5B0%5D%20%2A%20%28right%20-%20left%20%2B%201%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%8B%9C%EC%9E%91%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A5%BC%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20i,%20j,%20k%20%3D%20left,%20mid%20%2B%201,%200%0A%20%20%20%20%23%20%EC%96%91%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%20%EB%AA%A8%EB%91%90%EC%97%90%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EB%82%A8%EC%95%84%20%EC%9E%88%EC%9C%BC%EB%A9%B4%20%EB%B9%84%EA%B5%90%ED%95%98%EC%97%AC%20%EB%8D%94%20%EC%9E%91%EC%9D%80%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%9E%84%EC%8B%9C%20%EB%B0%B0%EC%97%B4%EC%97%90%20%EB%B3%B5%EC%82%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20mid%20and%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3C%3D%20nums%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EB%82%A8%EC%9D%80%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%9E%84%EC%8B%9C%20%EB%B0%B0%EC%97%B4%EC%97%90%20%EB%B3%B5%EC%82%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20mid%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20while%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%EC%9E%84%EC%8B%9C%20%EB%B0%B0%EC%97%B4%20tmp%EC%9D%98%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%9B%90%EB%9E%98%20%EB%B0%B0%EC%97%B4%20nums%EC%9D%98%20%ED%95%B4%EB%8B%B9%20%EA%B5%AC%EA%B0%84%EC%97%90%20%EB%8B%A4%EC%8B%9C%20%EB%B3%B5%EC%82%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20k%20in%20range%280,%20len%28tmp%29%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bleft%20%2B%20k%5D%20%3D%20tmp%5Bk%5D%0A%0A%0Adef%20merge_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EB%B3%91%ED%95%A9%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%23%20%EC%A2%85%EB%A3%8C%20%EC%A1%B0%EA%B1%B4%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EA%B8%B8%EC%9D%B4%EA%B0%80%201%EC%9D%B4%EB%A9%B4%20%EC%9E%AC%EA%B7%80%EB%A5%BC%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EB%B6%84%ED%95%A0%20%EB%8B%A8%EA%B3%84%0A%20%20%20%20mid%20%3D%20%28left%20%2B%20right%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9C%84%EC%B9%98%EB%A5%BC%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20merge_sort%28nums,%20left,%20mid%29%20%20%23%20%EC%99%BC%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%97%90%20%EC%9E%AC%EA%B7%80%20%ED%98%B8%EC%B6%9C%ED%95%9C%EB%8B%A4%0A%20%20%20%20merge_sort%28nums,%20mid%20%2B%201,%20right%29%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%B6%80%EB%B6%84%20%EB%B0%B0%EC%97%B4%EC%97%90%20%EC%9E%AC%EA%B7%80%20%ED%98%B8%EC%B6%9C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EB%B3%91%ED%95%A9%20%EB%8B%A8%EA%B3%84%0A%20%20%20%20merge%28nums,%20left,%20mid,%20right%29%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B7,%203,%202,%206,%200,%201,%205,%204%5D%0A%20%20%20%20merge_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%EB%B3%91%ED%95%A9%20%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%A7%88%EC%B9%9C%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 11.6.2 &nbsp; 알고리즘 특성

- **시간 복잡도 $O(n \log n)$, 비적응형 정렬**: 분할 과정에서 높이 $\log n$의 재귀 트리가 만들어지고, 각 레벨에서 병합에 필요한 총연산 수는 $n$이므로 전체 시간 복잡도는 $O(n \log n)$이다.
- **공간 복잡도 $O(n)$, 제자리 정렬이 아님**: 재귀 깊이가 $\log n$이므로 $O(\log n)$ 크기의 스택 프레임 공간을 사용한다. 병합에는 보조 배열이 필요하여 $O(n)$의 추가 공간을 사용한다.
- **안정 정렬**: 병합 과정에서 값이 같은 원소들의 순서가 유지된다.

## 11.6.3 &nbsp; 연결 리스트 정렬

연결 리스트에서는 병합 정렬이 다른 정렬 알고리즘보다 뚜렷한 장점을 가진다. **연결 리스트 정렬의 공간 복잡도를 $O(1)$까지 최적화할 수 있다**.

- **분할 단계**: 연결 리스트를 나눌 때 '재귀' 대신 '반복'을 사용하면 재귀에 필요한 스택 프레임 공간을 없앨 수 있다.
- **병합 단계**: 연결 리스트에서는 참조(포인터)만 바꾸어 노드를 추가하거나 삭제할 수 있다. 따라서 정렬된 짧은 연결 리스트 두 개를 하나의 긴 연결 리스트로 합칠 때 추가 연결 리스트를 만들 필요가 없다.

구체적인 구현은 다소 복잡하므로, 관심 있는 독자는 관련 자료를 찾아 학습해 보자.
