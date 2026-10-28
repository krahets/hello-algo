---
comments: true
---

# 10.3 &nbsp; 이진 탐색으로 경계 찾기

## 10.3.1 &nbsp; 왼쪽 경계 찾기

!!! question "문제"

    중복 원소를 포함할 수 있는 길이 $n$의 정렬된 배열 `nums`가 주어진다. 배열에서 가장 왼쪽에 있는 원소 `target`의 인덱스를 반환하라. 해당 원소가 없으면 $-1$을 반환하라.

이진 탐색으로 삽입 위치를 찾는 방법을 떠올려 보자. 탐색이 끝나면 $i$는 가장 왼쪽의 `target`을 가리킨다. **따라서 삽입 위치 찾기는 본질적으로 가장 왼쪽 `target`의 인덱스를 찾는 과정이다**.

삽입 위치를 찾는 함수를 이용하여 왼쪽 경계를 찾아 보자. 배열에 `target`이 없을 수도 있으며, 이때는 다음 두 결과 중 하나가 나올 수 있다.

- 삽입 위치의 인덱스 $i$가 범위를 벗어난다.
- 원소 `nums[i]`가 `target`과 다르다.

위 두 경우에는 $-1$을 바로 반환하면 된다. 코드는 다음과 같다.

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_left_edge(nums: list[int], target: int) -> int:
        """가장 왼쪽에 있는 target을 이진 탐색"""
        # target의 삽입 위치를 찾는 것과 같다
        i = binary_search_insertion(nums, target)
        # target을 찾지 못했으므로 -1을 반환한다
        if i == len(nums) or nums[i] != target:
            return -1
        # target을 찾았으므로 인덱스 i를 반환한다
        return i
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 가장 왼쪽에 있는 target을 이진 탐색 */
    int binarySearchLeftEdge(vector<int> &nums, int target) {
        // target의 삽입 위치를 찾는 것과 같다
        int i = binarySearchInsertion(nums, target);
        // target을 찾지 못했으므로 -1을 반환한다
        if (i == nums.size() || nums[i] != target) {
            return -1;
        }
        // target을 찾았으므로 인덱스 i를 반환한다
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* 가장 왼쪽에 있는 target을 이진 탐색 */
    int binarySearchLeftEdge(int[] nums, int target) {
        // target의 삽입 위치를 찾는 것과 같다
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // target을 찾지 못했으므로 -1을 반환한다
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // target을 찾았으므로 인덱스 i를 반환한다
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* 가장 왼쪽에 있는 target을 이진 탐색 */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // target의 삽입 위치를 찾는 것과 같다
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // target을 찾지 못했으므로 -1을 반환한다
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // target을 찾았으므로 인덱스 i를 반환한다
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* 가장 왼쪽에 있는 target을 이진 탐색 */
    func binarySearchLeftEdge(nums []int, target int) int {
        // target의 삽입 위치를 찾는 것과 같다
        i := binarySearchInsertion(nums, target)
        // target을 찾지 못했으므로 -1을 반환한다
        if i == len(nums) || nums[i] != target {
            return -1
        }
        // target을 찾았으므로 인덱스 i를 반환한다
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* 가장 왼쪽에 있는 target을 이진 탐색 */
    func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
        // target의 삽입 위치를 찾는 것과 같다
        let i = binarySearchInsertion(nums: nums, target: target)
        // target을 찾지 못했으므로 -1을 반환한다
        if i == nums.endIndex || nums[i] != target {
            return -1
        }
        // target을 찾았으므로 인덱스 i를 반환한다
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* 가장 왼쪽에 있는 target을 이진 탐색 */
    function binarySearchLeftEdge(nums, target) {
        // target의 삽입 위치를 찾는 것과 같다
        const i = binarySearchInsertion(nums, target);
        // target을 찾지 못했으므로 -1을 반환한다
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // target을 찾았으므로 인덱스 i를 반환한다
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* 가장 왼쪽에 있는 target을 이진 탐색 */
    function binarySearchLeftEdge(nums: Array<number>, target: number): number {
        // target의 삽입 위치를 찾는 것과 같다
        const i = binarySearchInsertion(nums, target);
        // target을 찾지 못했으므로 -1을 반환한다
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // target을 찾았으므로 인덱스 i를 반환한다
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* 가장 왼쪽에 있는 target을 이진 탐색 */
    int binarySearchLeftEdge(List<int> nums, int target) {
      // target의 삽입 위치를 찾는 것과 같다
      int i = binarySearchInsertion(nums, target);
      // target을 찾지 못했으므로 -1을 반환한다
      if (i == nums.length || nums[i] != target) {
        return -1;
      }
      // target을 찾았으므로 인덱스 i를 반환한다
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* 가장 왼쪽에 있는 target을 이진 탐색 */
    fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
        // target의 삽입 위치를 찾는 것과 같다
        let i = binary_search_insertion(nums, target);
        // target을 찾지 못했으므로 -1을 반환한다
        if i == nums.len() as i32 || nums[i as usize] != target {
            return -1;
        }
        // target을 찾았으므로 인덱스 i를 반환한다
        i
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* 가장 왼쪽에 있는 target을 이진 탐색 */
    int binarySearchLeftEdge(int *nums, int numSize, int target) {
        // target의 삽입 위치를 찾는 것과 같다
        int i = binarySearchInsertion(nums, numSize, target);
        // target을 찾지 못했으므로 -1을 반환한다
        if (i == numSize || nums[i] != target) {
            return -1;
        }
        // target을 찾았으므로 인덱스 i를 반환한다
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* 가장 왼쪽에 있는 target을 이진 탐색 */
    fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
        // target의 삽입 위치를 찾는 것과 같다
        val i = binarySearchInsertion(nums, target)
        // target을 찾지 못했으므로 -1을 반환한다
        if (i == nums.size || nums[i] != target) {
            return -1
        }
        // target을 찾았으므로 인덱스 i를 반환한다
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### 가장 왼쪽에 있는 target을 이진 탐색 ###
    def binary_search_left_edge(nums, target)
      # target의 삽입 위치를 찾는 것과 같다
      i = binary_search_insertion(nums, target)

      # target을 찾지 못했으므로 -1을 반환한다
      return -1 if i == nums.length || nums[i] != target

      i # target을 찾았으므로 인덱스 i를 반환한다
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%20%EC%9E%88%EC%9D%8C%29%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%20%5B0,%20n-1%5D%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20m%EC%9D%84%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bm%2B1,%20j%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%9B%90%EC%86%8C%EB%8A%94%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%23%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20i%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EA%B0%80%EC%9E%A5%20%EC%99%BC%EC%AA%BD%EC%97%90%20%EC%9E%88%EB%8A%94%20target%EC%9D%84%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%22%22%22%0A%20%20%20%20%23%20target%EC%9D%98%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EB%A5%BC%20%EC%B0%BE%EB%8A%94%20%EA%B2%83%EA%B3%BC%20%EA%B0%99%EB%8B%A4%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20%23%20target%EC%9D%84%20%EC%B0%BE%EC%A7%80%20%EB%AA%BB%ED%96%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20-1%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20target%EC%9D%84%20%EC%B0%BE%EC%95%98%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20i%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20i%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%ED%8F%AC%ED%95%A8%ED%95%98%EB%8A%94%20%EB%B0%B0%EC%97%B4%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EA%B2%BD%EA%B3%84%EC%99%80%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EA%B2%BD%EA%B3%84%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%EA%B0%80%EC%9E%A5%20%EC%99%BC%EC%AA%BD%20%EC%9B%90%EC%86%8C%20%7Btarget%7D%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%8A%94%20%7Bindex%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%20%EC%9E%88%EC%9D%8C%29%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%20%5B0,%20n-1%5D%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20m%EC%9D%84%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bm%2B1,%20j%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%9B%90%EC%86%8C%EB%8A%94%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%23%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20i%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EA%B0%80%EC%9E%A5%20%EC%99%BC%EC%AA%BD%EC%97%90%20%EC%9E%88%EB%8A%94%20target%EC%9D%84%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%22%22%22%0A%20%20%20%20%23%20target%EC%9D%98%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EB%A5%BC%20%EC%B0%BE%EB%8A%94%20%EA%B2%83%EA%B3%BC%20%EA%B0%99%EB%8B%A4%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20%23%20target%EC%9D%84%20%EC%B0%BE%EC%A7%80%20%EB%AA%BB%ED%96%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20-1%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20target%EC%9D%84%20%EC%B0%BE%EC%95%98%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20i%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20i%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%ED%8F%AC%ED%95%A8%ED%95%98%EB%8A%94%20%EB%B0%B0%EC%97%B4%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EA%B2%BD%EA%B3%84%EC%99%80%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EA%B2%BD%EA%B3%84%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%EA%B0%80%EC%9E%A5%20%EC%99%BC%EC%AA%BD%20%EC%9B%90%EC%86%8C%20%7Btarget%7D%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%8A%94%20%7Bindex%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 10.3.2 &nbsp; 오른쪽 경계 찾기

가장 오른쪽에 있는 `target`은 어떻게 찾을까? 가장 직접적인 방법은 코드를 수정하여 `nums[m] == target`일 때 포인터로 구간을 줄이는 방식을 바꾸는 것이다. 코드는 생략하니, 관심 있는 독자는 직접 구현해 보자.

아래에서는 더 기발한 두 가지 방법을 소개한다.

### 1. &nbsp; 왼쪽 경계 찾기 재활용

가장 왼쪽 원소를 찾는 함수로 가장 오른쪽 원소도 찾을 수 있다. 구체적으로는 **가장 오른쪽 `target`을 찾는 문제를 가장 왼쪽 `target + 1`을 찾는 문제로 바꾼다**.

아래 그림(10-7)과 같이 탐색이 끝나면 포인터 $i$는 가장 왼쪽 `target + 1`(존재한다면)을 가리키고, $j$는 가장 오른쪽 `target`을 가리킨다. **따라서 $j$를 반환하면 된다**.

![오른쪽 경계 찾기를 왼쪽 경계 찾기로 변환](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png){ class="animation-figure" }

<p align="center"> 그림 10-7 &nbsp; 오른쪽 경계 찾기를 왼쪽 경계 찾기로 변환 </p>

반환되는 삽입 위치는 $i$이므로, 여기서 $1$을 빼야 $j$를 얻을 수 있다.

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_right_edge(nums: list[int], target: int) -> int:
        """가장 오른쪽에 있는 target을 이진 탐색"""
        # 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
        i = binary_search_insertion(nums, target + 1)
        # j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
        j = i - 1
        # target을 찾지 못했으므로 -1을 반환한다
        if j == -1 or nums[j] != target:
            return -1
        # target을 찾았으므로 인덱스 j를 반환한다
        return j
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 가장 오른쪽에 있는 target을 이진 탐색 */
    int binarySearchRightEdge(vector<int> &nums, int target) {
        // 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
        int i = binarySearchInsertion(nums, target + 1);
        // j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
        int j = i - 1;
        // target을 찾지 못했으므로 -1을 반환한다
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target을 찾았으므로 인덱스 j를 반환한다
        return j;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* 가장 오른쪽에 있는 target을 이진 탐색 */
    int binarySearchRightEdge(int[] nums, int target) {
        // 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
        int j = i - 1;
        // target을 찾지 못했으므로 -1을 반환한다
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target을 찾았으므로 인덱스 j를 반환한다
        return j;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* 가장 오른쪽에 있는 target을 이진 탐색 */
    int BinarySearchRightEdge(int[] nums, int target) {
        // 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
        int j = i - 1;
        // target을 찾지 못했으므로 -1을 반환한다
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target을 찾았으므로 인덱스 j를 반환한다
        return j;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* 가장 오른쪽에 있는 target을 이진 탐색 */
    func binarySearchRightEdge(nums []int, target int) int {
        // 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
        i := binarySearchInsertion(nums, target+1)
        // j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
        j := i - 1
        // target을 찾지 못했으므로 -1을 반환한다
        if j == -1 || nums[j] != target {
            return -1
        }
        // target을 찾았으므로 인덱스 j를 반환한다
        return j
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* 가장 오른쪽에 있는 target을 이진 탐색 */
    func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
        // 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
        let i = binarySearchInsertion(nums: nums, target: target + 1)
        // j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
        let j = i - 1
        // target을 찾지 못했으므로 -1을 반환한다
        if j == -1 || nums[j] != target {
            return -1
        }
        // target을 찾았으므로 인덱스 j를 반환한다
        return j
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* 가장 오른쪽에 있는 target을 이진 탐색 */
    function binarySearchRightEdge(nums, target) {
        // 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
        const i = binarySearchInsertion(nums, target + 1);
        // j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
        const j = i - 1;
        // target을 찾지 못했으므로 -1을 반환한다
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // target을 찾았으므로 인덱스 j를 반환한다
        return j;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* 가장 오른쪽에 있는 target을 이진 탐색 */
    function binarySearchRightEdge(nums: Array<number>, target: number): number {
        // 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
        const i = binarySearchInsertion(nums, target + 1);
        // j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
        const j = i - 1;
        // target을 찾지 못했으므로 -1을 반환한다
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // target을 찾았으므로 인덱스 j를 반환한다
        return j;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* 가장 오른쪽에 있는 target을 이진 탐색 */
    int binarySearchRightEdge(List<int> nums, int target) {
      // 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
      int i = binarySearchInsertion(nums, target + 1);
      // j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
      int j = i - 1;
      // target을 찾지 못했으므로 -1을 반환한다
      if (j == -1 || nums[j] != target) {
        return -1;
      }
      // target을 찾았으므로 인덱스 j를 반환한다
      return j;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* 가장 오른쪽에 있는 target을 이진 탐색 */
    fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
        // 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
        let i = binary_search_insertion(nums, target + 1);
        // j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
        let j = i - 1;
        // target을 찾지 못했으므로 -1을 반환한다
        if j == -1 || nums[j as usize] != target {
            return -1;
        }
        // target을 찾았으므로 인덱스 j를 반환한다
        j
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* 가장 오른쪽에 있는 target을 이진 탐색 */
    int binarySearchRightEdge(int *nums, int numSize, int target) {
        // 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
        int i = binarySearchInsertion(nums, numSize, target + 1);
        // j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
        int j = i - 1;
        // target을 찾지 못했으므로 -1을 반환한다
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target을 찾았으므로 인덱스 j를 반환한다
        return j;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* 가장 오른쪽에 있는 target을 이진 탐색 */
    fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
        // 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
        val i = binarySearchInsertion(nums, target + 1)
        // j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
        val j = i - 1
        // target을 찾지 못했으므로 -1을 반환한다
        if (j == -1 || nums[j] != target) {
            return -1
        }
        // target을 찾았으므로 인덱스 j를 반환한다
        return j
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### 가장 오른쪽에 있는 target을 이진 탐색 ###
    def binary_search_right_edge(nums, target)
      # 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
      i = binary_search_insertion(nums, target + 1)

      # j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
      j = i - 1

      # target을 찾지 못했으므로 -1을 반환한다
      return -1 if j == -1 || nums[j] != target

      j # target을 찾았으므로 인덱스 j를 반환한다
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%20%EC%9E%88%EC%9D%8C%29%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%20%5B0,%20n-1%5D%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20m%EC%9D%84%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bm%2B1,%20j%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%9B%90%EC%86%8C%EB%8A%94%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%23%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20i%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EA%B0%80%EC%9E%A5%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%97%90%20%EC%9E%88%EB%8A%94%20target%EC%9D%84%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%22%22%22%0A%20%20%20%20%23%20%EA%B0%80%EC%9E%A5%20%EC%99%BC%EC%AA%BD%EC%97%90%20%EC%9E%88%EB%8A%94%20target%20%2B%201%EC%9D%84%20%EC%B0%BE%EB%8A%94%20%EB%AC%B8%EC%A0%9C%EB%A1%9C%20%EB%B0%94%EA%BE%BC%EB%8B%A4%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%20%2B%201%29%0A%20%20%20%20%23%20j%EB%8A%94%20%EA%B0%80%EC%9E%A5%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%9D%98%20target%EC%9D%84%20%EA%B0%80%EB%A6%AC%ED%82%A4%EA%B3%A0,%20i%EB%8A%94%20target%EB%B3%B4%EB%8B%A4%20%ED%81%B0%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B0%80%EB%A6%AC%ED%82%A8%EB%8B%A4%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20target%EC%9D%84%20%EC%B0%BE%EC%A7%80%20%EB%AA%BB%ED%96%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20-1%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20target%EC%9D%84%20%EC%B0%BE%EC%95%98%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20j%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20j%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%ED%8F%AC%ED%95%A8%ED%95%98%EB%8A%94%20%EB%B0%B0%EC%97%B4%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EA%B2%BD%EA%B3%84%EC%99%80%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EA%B2%BD%EA%B3%84%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%EA%B0%80%EC%9E%A5%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9B%90%EC%86%8C%20%7Btarget%7D%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%8A%94%20%7Bindex%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%28%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%20%EC%9E%88%EC%9D%8C%29%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%EB%8B%AB%ED%9E%8C%20%EA%B5%AC%EA%B0%84%20%5B0,%20n-1%5D%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%EC%A4%91%EA%B0%84%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20m%EC%9D%84%20%EA%B3%84%EC%82%B0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bm%2B1,%20j%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EC%9D%80%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%EB%B3%B4%EB%8B%A4%20%EC%9E%91%EC%9D%80%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%9B%90%EC%86%8C%EB%8A%94%20%EA%B5%AC%EA%B0%84%20%5Bi,%20m-1%5D%EC%97%90%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%23%20%EC%82%BD%EC%9E%85%20%EC%9C%84%EC%B9%98%20i%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EA%B0%80%EC%9E%A5%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%97%90%20%EC%9E%88%EB%8A%94%20target%EC%9D%84%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%22%22%22%0A%20%20%20%20%23%20%EA%B0%80%EC%9E%A5%20%EC%99%BC%EC%AA%BD%EC%97%90%20%EC%9E%88%EB%8A%94%20target%20%2B%201%EC%9D%84%20%EC%B0%BE%EB%8A%94%20%EB%AC%B8%EC%A0%9C%EB%A1%9C%20%EB%B0%94%EA%BE%BC%EB%8B%A4%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%20%2B%201%29%0A%20%20%20%20%23%20j%EB%8A%94%20%EA%B0%80%EC%9E%A5%20%EC%98%A4%EB%A5%B8%EC%AA%BD%EC%9D%98%20target%EC%9D%84%20%EA%B0%80%EB%A6%AC%ED%82%A4%EA%B3%A0,%20i%EB%8A%94%20target%EB%B3%B4%EB%8B%A4%20%ED%81%B0%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B0%80%EB%A6%AC%ED%82%A8%EB%8B%A4%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20target%EC%9D%84%20%EC%B0%BE%EC%A7%80%20%EB%AA%BB%ED%96%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20-1%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20target%EC%9D%84%20%EC%B0%BE%EC%95%98%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20j%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20j%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%A4%91%EB%B3%B5%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%ED%8F%AC%ED%95%A8%ED%95%98%EB%8A%94%20%EB%B0%B0%EC%97%B4%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EA%B2%BD%EA%B3%84%EC%99%80%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EA%B2%BD%EA%B3%84%EC%9D%98%20%EC%9D%B4%EC%A7%84%20%ED%83%90%EC%83%89%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%EA%B0%80%EC%9E%A5%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9B%90%EC%86%8C%20%7Btarget%7D%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%8A%94%20%7Bindex%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

### 2. &nbsp; 원소 찾기로 변환

배열에 `target`이 없으면 최종적으로 $i$는 `target`보다 큰 첫 번째 원소를, $j$는 `target`보다 작은 가장 오른쪽 원소를 가리킨다.

따라서 아래 그림(10-8)과 같이 배열에 없는 원소를 만들어 왼쪽 경계와 오른쪽 경계를 찾을 수 있다.

- 가장 왼쪽 `target` 찾기: `target - 0.5`를 탐색하고 포인터 $i$를 반환하는 것으로 바꿀 수 있다.
- 가장 오른쪽 `target` 찾기: `target + 0.5`를 탐색하고 포인터 $j$를 반환하는 것으로 바꿀 수 있다.

![경계 찾기를 원소 찾기로 변환](binary_search_edge.assets/binary_search_edge_by_element.png){ class="animation-figure" }

<p align="center"> 그림 10-8 &nbsp; 경계 찾기를 원소 찾기로 변환 </p>

코드는 생략하며, 다음 두 가지에 주의하자.

- 주어진 배열에는 소수가 없으므로 값이 같은 경우의 처리는 고려하지 않아도 된다.
- 이 방법은 소수를 사용하므로 함수의 변수 `target`을 부동 소수점 타입으로 바꿔야 한다(Python은 수정할 필요가 없다).
