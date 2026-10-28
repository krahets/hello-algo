---
comments: true
---

# 4.3 &nbsp; 리스트

<u>리스트(list)</u>는 순서가 있는 원소의 모음을 나타내는 추상적인 자료 구조 개념이다. 원소 접근, 수정, 추가, 삭제, 순회 등의 연산을 지원하며, 사용자가 용량 제한을 신경 쓰지 않아도 된다. 리스트는 연결 리스트나 배열로 구현할 수 있다.

- 연결 리스트는 원소의 삽입, 삭제, 탐색, 갱신을 지원하고 유연하게 용량을 늘릴 수 있으므로 자연스럽게 리스트로 볼 수 있다.
- 배열도 원소의 삽입, 삭제, 탐색, 갱신을 지원하지만 길이를 바꿀 수 없으므로 길이가 제한된 리스트로 볼 수 있다.

배열로 리스트를 구현하면 **길이를 바꿀 수 없다는 특성 때문에 실용성이 낮아진다**. 보통 저장할 데이터 양을 미리 알 수 없어 적절한 길이를 정하기 어렵기 때문이다. 길이가 너무 짧으면 필요를 충족하지 못하고, 너무 길면 메모리 공간을 낭비한다.

이 문제는 <u>동적 배열(dynamic array)</u>로 리스트를 구현하여 해결할 수 있다. 동적 배열은 배열의 장점을 이어받으면서도 프로그램 실행 중에 용량을 동적으로 늘릴 수 있다.

실제로 **많은 프로그래밍 언어의 표준 라이브러리가 제공하는 리스트는 동적 배열로 구현된다**. Python의 `list`, Java의 `ArrayList`, C++의 `vector`, C#의 `List` 등이 그 예다. 이후 설명에서는 ‘리스트’와 ‘동적 배열’을 같은 개념으로 다룬다.

## 4.3.1 &nbsp; 리스트의 기본 연산

### 1. &nbsp; 리스트 초기화

보통 ‘초깃값 없음’과 ‘초깃값 지정’의 두 가지 초기화 방식을 사용한다.

=== "Python"

    ```python title="list.py"
    # 리스트 초기화
    # 초깃값 없음
    nums1: list[int] = []
    # 초깃값 지정
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 리스트 초기화 */
    // C++의 vector가 이 글에서 설명하는 nums에 해당한다
    // 초깃값 없음
    vector<int> nums1;
    // 초깃값 지정
    vector<int> nums = { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="list.java"
    /* 리스트 초기화 */
    // 초깃값 없음
    List<Integer> nums1 = new ArrayList<>();
    // 초깃값 지정(배열은 int[]의 래퍼형인 Integer[]여야 함)
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 리스트 초기화 */
    // 초깃값 없음
    List<int> nums1 = [];
    // 초깃값 지정
    int[] numbers = [1, 3, 2, 5, 4];
    List<int> nums = [.. numbers];
    ```

=== "Go"

    ```go title="list_test.go"
    /* 리스트 초기화 */
    // 초깃값 없음
    nums1 := []int{}
    // 초깃값 지정
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 리스트 초기화 */
    // 초깃값 없음
    let nums1: [Int] = []
    // 초깃값 지정
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* 리스트 초기화 */
    // 초깃값 없음
    const nums1 = [];
    // 초깃값 지정
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 리스트 초기화 */
    // 초깃값 없음
    const nums1: number[] = [];
    // 초깃값 지정
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 리스트 초기화 */
    // 초깃값 없음
    List<int> nums1 = [];
    // 초깃값 지정
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 리스트 초기화 */
    // 초깃값 없음
    let nums1: Vec<i32> = Vec::new();
    // 초깃값 지정
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // C는 내장 동적 배열을 제공하지 않는다
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 리스트 초기화 */
    // 초깃값 없음
    var nums1 = listOf<Int>()
    // 초깃값 지정
    var numbers = arrayOf(1, 3, 2, 5, 4)
    var nums = numbers.toMutableList()
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 리스트 초기화
    # 초깃값 없음
    nums1 = []
    # 초깃값 지정
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "코드 시각화"

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EC%B4%88%EA%B9%83%EA%B0%92%20%EC%97%86%EC%9D%8C%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%EC%B4%88%EA%B9%83%EA%B0%92%20%EC%A7%80%EC%A0%95%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EC%B4%88%EA%B9%83%EA%B0%92%20%EC%97%86%EC%9D%8C%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%EC%B4%88%EA%B9%83%EA%B0%92%20%EC%A7%80%EC%A0%95%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

### 2. &nbsp; 원소 접근

리스트는 본질적으로 배열이므로 원소에 접근하고 갱신하는 데 $O(1)$ 시간이 걸려 매우 효율적이다.

=== "Python"

    ```python title="list.py"
    # 원소 접근
    num: int = nums[1]  # 인덱스 1의 원소에 접근

    # 원소 갱신
    nums[1] = 0    # 인덱스 1의 원소를 0으로 갱신
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 원소 접근 */
    int num = nums[1];  // 인덱스 1의 원소에 접근

    /* 원소 갱신 */
    nums[1] = 0;  // 인덱스 1의 원소를 0으로 갱신
    ```

=== "Java"

    ```java title="list.java"
    /* 원소 접근 */
    int num = nums.get(1);  // 인덱스 1의 원소에 접근

    /* 원소 갱신 */
    nums.set(1, 0);  // 인덱스 1의 원소를 0으로 갱신
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 원소 접근 */
    int num = nums[1];  // 인덱스 1의 원소에 접근

    /* 원소 갱신 */
    nums[1] = 0;  // 인덱스 1의 원소를 0으로 갱신
    ```

=== "Go"

    ```go title="list_test.go"
    /* 원소 접근 */
    num := nums[1]  // 인덱스 1의 원소에 접근

    /* 원소 갱신 */
    nums[1] = 0     // 인덱스 1의 원소를 0으로 갱신
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 원소 접근 */
    let num = nums[1] // 인덱스 1의 원소에 접근

    /* 원소 갱신 */
    nums[1] = 0 // 인덱스 1의 원소를 0으로 갱신
    ```

=== "JS"

    ```javascript title="list.js"
    /* 원소 접근 */
    const num = nums[1];  // 인덱스 1의 원소에 접근

    /* 원소 갱신 */
    nums[1] = 0;  // 인덱스 1의 원소를 0으로 갱신
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 원소 접근 */
    const num: number = nums[1];  // 인덱스 1의 원소에 접근

    /* 원소 갱신 */
    nums[1] = 0;  // 인덱스 1의 원소를 0으로 갱신
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 원소 접근 */
    int num = nums[1];  // 인덱스 1의 원소에 접근

    /* 원소 갱신 */
    nums[1] = 0;  // 인덱스 1의 원소를 0으로 갱신
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 원소 접근 */
    let num: i32 = nums[1];  // 인덱스 1의 원소에 접근
    /* 원소 갱신 */
    nums[1] = 0;             // 인덱스 1의 원소를 0으로 갱신
    ```

=== "C"

    ```c title="list.c"
    // C는 내장 동적 배열을 제공하지 않는다
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 원소 접근 */
    val num = nums[1]       // 인덱스 1의 원소에 접근
    /* 원소 갱신 */
    nums[1] = 0             // 인덱스 1의 원소를 0으로 갱신
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 원소 접근
    num = nums[1] # 인덱스 1의 원소에 접근
    # 원소 갱신
    nums[1] = 0 # 인덱스 1의 원소를 0으로 갱신
    ```

??? pythontutor "코드 시각화"

    <div style="height: 369px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%201%EC%9D%98%20%EC%9B%90%EC%86%8C%EC%97%90%20%EC%A0%91%EA%B7%BC%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B0%B1%EC%8B%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%201%EC%9D%98%20%EC%9B%90%EC%86%8C%EB%A5%BC%200%EC%9C%BC%EB%A1%9C%20%EA%B0%B1%EC%8B%A0&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%201%EC%9D%98%20%EC%9B%90%EC%86%8C%EC%97%90%20%EC%A0%91%EA%B7%BC%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B0%B1%EC%8B%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%201%EC%9D%98%20%EC%9B%90%EC%86%8C%EB%A5%BC%200%EC%9C%BC%EB%A1%9C%20%EA%B0%B1%EC%8B%A0&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

### 3. &nbsp; 원소 삽입과 삭제

배열과 달리 리스트는 원소를 자유롭게 추가하고 삭제할 수 있다. 끝에 원소를 추가하는 시간 복잡도는 $O(1)$이지만, 삽입과 삭제의 효율은 배열과 같아 시간 복잡도가 $O(n)$이다.

=== "Python"

    ```python title="list.py"
    # 리스트 비우기
    nums.clear()

    # 끝에 원소 추가
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # 중간에 원소 삽입
    nums.insert(3, 6)  # 인덱스 3에 숫자 6 삽입

    # 원소 삭제
    nums.pop(3)        # 인덱스 3의 원소 삭제
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 리스트 비우기 */
    nums.clear();

    /* 끝에 원소 추가 */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* 중간에 원소 삽입 */
    nums.insert(nums.begin() + 3, 6);  // 인덱스 3에 숫자 6 삽입

    /* 원소 삭제 */
    nums.erase(nums.begin() + 3);      // 인덱스 3의 원소 삭제
    ```

=== "Java"

    ```java title="list.java"
    /* 리스트 비우기 */
    nums.clear();

    /* 끝에 원소 추가 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 중간에 원소 삽입 */
    nums.add(3, 6);  // 인덱스 3에 숫자 6 삽입

    /* 원소 삭제 */
    nums.remove(3);  // 인덱스 3의 원소 삭제
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 리스트 비우기 */
    nums.Clear();

    /* 끝에 원소 추가 */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* 중간에 원소 삽입 */
    nums.Insert(3, 6);  // 인덱스 3에 숫자 6 삽입

    /* 원소 삭제 */
    nums.RemoveAt(3);  // 인덱스 3의 원소 삭제
    ```

=== "Go"

    ```go title="list_test.go"
    /* 리스트 비우기 */
    nums = nil

    /* 끝에 원소 추가 */
    nums = append(nums, 1)
    nums = append(nums, 3)
    nums = append(nums, 2)
    nums = append(nums, 5)
    nums = append(nums, 4)

    /* 중간에 원소 삽입 */
    nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // 인덱스 3에 숫자 6 삽입

    /* 원소 삭제 */
    nums = append(nums[:3], nums[4:]...) // 인덱스 3의 원소 삭제
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 리스트 비우기 */
    nums.removeAll()

    /* 끝에 원소 추가 */
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    /* 중간에 원소 삽입 */
    nums.insert(6, at: 3) // 인덱스 3에 숫자 6 삽입

    /* 원소 삭제 */
    nums.remove(at: 3) // 인덱스 3의 원소 삭제
    ```

=== "JS"

    ```javascript title="list.js"
    /* 리스트 비우기 */
    nums.length = 0;

    /* 끝에 원소 추가 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 중간에 원소 삽입 */
    nums.splice(3, 0, 6); // 인덱스 3에 숫자 6 삽입

    /* 원소 삭제 */
    nums.splice(3, 1);  // 인덱스 3의 원소 삭제
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 리스트 비우기 */
    nums.length = 0;

    /* 끝에 원소 추가 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 중간에 원소 삽입 */
    nums.splice(3, 0, 6); // 인덱스 3에 숫자 6 삽입

    /* 원소 삭제 */
    nums.splice(3, 1);  // 인덱스 3의 원소 삭제
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 리스트 비우기 */
    nums.clear();

    /* 끝에 원소 추가 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 중간에 원소 삽입 */
    nums.insert(3, 6); // 인덱스 3에 숫자 6 삽입

    /* 원소 삭제 */
    nums.removeAt(3); // 인덱스 3의 원소 삭제
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 리스트 비우기 */
    nums.clear();

    /* 끝에 원소 추가 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 중간에 원소 삽입 */
    nums.insert(3, 6);  // 인덱스 3에 숫자 6 삽입

    /* 원소 삭제 */
    nums.remove(3);    // 인덱스 3의 원소 삭제
    ```

=== "C"

    ```c title="list.c"
    // C는 내장 동적 배열을 제공하지 않는다
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 리스트 비우기 */
    nums.clear();

    /* 끝에 원소 추가 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 중간에 원소 삽입 */
    nums.add(3, 6);  // 인덱스 3에 숫자 6 삽입

    /* 원소 삭제 */
    nums.remove(3);  // 인덱스 3의 원소 삭제
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 리스트 비우기
    nums.clear

    # 끝에 원소 추가
    nums << 1
    nums << 3
    nums << 2
    nums << 5
    nums << 4

    # 중간에 원소 삽입
    nums.insert(3, 6) # 인덱스 3에 숫자 6 삽입

    # 원소 삭제
    nums.delete_at(3) # 인덱스 3의 원소 삭제
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B4%88%EA%B9%83%EA%B0%92%20%EC%A7%80%EC%A0%95%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%B9%84%EC%9A%B0%EA%B8%B0%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%81%9D%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%B6%94%EA%B0%80%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%A4%91%EA%B0%84%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20nums.insert%283%2C%206%29%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%203%EC%97%90%20%EC%88%AB%EC%9E%90%206%20%EC%82%BD%EC%9E%85%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%82%AD%EC%A0%9C%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%203%EC%9D%98%20%EC%9B%90%EC%86%8C%20%EC%82%AD%EC%A0%9C&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B4%88%EA%B9%83%EA%B0%92%20%EC%A7%80%EC%A0%95%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%B9%84%EC%9A%B0%EA%B8%B0%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%81%9D%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%B6%94%EA%B0%80%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%A4%91%EA%B0%84%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20nums.insert%283%2C%206%29%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%203%EC%97%90%20%EC%88%AB%EC%9E%90%206%20%EC%82%BD%EC%9E%85%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%82%AD%EC%A0%9C%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%203%EC%9D%98%20%EC%9B%90%EC%86%8C%20%EC%82%AD%EC%A0%9C&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

### 4. &nbsp; 리스트 순회

배열처럼 리스트도 인덱스로 순회하거나 각 원소를 직접 순회할 수 있다.

=== "Python"

    ```python title="list.py"
    # 인덱스로 리스트 순회
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # 리스트 원소를 직접 순회
    for num in nums:
        count += num
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 인덱스로 리스트 순회 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }

    /* 리스트 원소를 직접 순회 */
    count = 0;
    for (int num : nums) {
        count += num;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* 인덱스로 리스트 순회 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums.get(i);
    }

    /* 리스트 원소를 직접 순회 */
    for (int num : nums) {
        count += num;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 인덱스로 리스트 순회 */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count += nums[i];
    }

    /* 리스트 원소를 직접 순회 */
    count = 0;
    foreach (int num in nums) {
        count += num;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* 인덱스로 리스트 순회 */
    count := 0
    for i := 0; i < len(nums); i++ {
        count += nums[i]
    }

    /* 리스트 원소를 직접 순회 */
    count = 0
    for _, num := range nums {
        count += num
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 인덱스로 리스트 순회 */
    var count = 0
    for i in nums.indices {
        count += nums[i]
    }

    /* 리스트 원소를 직접 순회 */
    count = 0
    for num in nums {
        count += num
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* 인덱스로 리스트 순회 */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* 리스트 원소를 직접 순회 */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 인덱스로 리스트 순회 */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* 리스트 원소를 직접 순회 */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 인덱스로 리스트 순회 */
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* 리스트 원소를 직접 순회 */
    count = 0;
    for (var num in nums) {
        count += num;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    // 인덱스로 리스트 순회
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // 리스트 원소를 직접 순회
    _count = 0;
    for num in &nums {
        _count += num;
    }
    ```

=== "C"

    ```c title="list.c"
    // C는 내장 동적 배열을 제공하지 않는다
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 인덱스로 리스트 순회 */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* 리스트 원소를 직접 순회 */
    for (num in nums) {
        count += num
    }
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 인덱스로 리스트 순회
    count = 0
    for i in 0...nums.length
        count += nums[i]
    end

    # 리스트 원소를 직접 순회
    count = 0
    for num in nums
        count += num
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A1%9C%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%A7%81%EC%A0%91%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A1%9C%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%A7%81%EC%A0%91%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

### 5. &nbsp; 리스트 연결

새 리스트 `nums1`이 주어지면 기존 리스트의 끝에 이어 붙일 수 있다.

=== "Python"

    ```python title="list.py"
    # 두 리스트 연결
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # 리스트 nums1을 nums 뒤에 연결
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 두 리스트 연결 */
    vector<int> nums1 = { 6, 8, 7, 10, 9 };
    // 리스트 nums1을 nums 뒤에 연결
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* 두 리스트 연결 */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // 리스트 nums1을 nums 뒤에 연결
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 두 리스트 연결 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1);  // 리스트 nums1을 nums 뒤에 연결
    ```

=== "Go"

    ```go title="list_test.go"
    /* 두 리스트 연결 */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...)  // 리스트 nums1을 nums 뒤에 연결
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 두 리스트 연결 */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // 리스트 nums1을 nums 뒤에 연결
    ```

=== "JS"

    ```javascript title="list.js"
    /* 두 리스트 연결 */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // 리스트 nums1을 nums 뒤에 연결
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 두 리스트 연결 */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // 리스트 nums1을 nums 뒤에 연결
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 두 리스트 연결 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1);  // 리스트 nums1을 nums 뒤에 연결
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 두 리스트 연결 */
    let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
    nums.extend(nums1);
    ```

=== "C"

    ```c title="list.c"
    // C는 내장 동적 배열을 제공하지 않는다
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 두 리스트 연결 */
    val nums1 = intArrayOf(6, 8, 7, 10, 9).toMutableList()
    nums.addAll(nums1)  // 리스트 nums1을 nums 뒤에 연결
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 두 리스트 연결
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    ```

??? pythontutor "코드 시각화"

    <div style="height: 333px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%91%90%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%97%B0%EA%B2%B0%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20nums1%EC%9D%84%20nums%20%EB%92%A4%EC%97%90%20%EC%97%B0%EA%B2%B0&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%91%90%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%97%B0%EA%B2%B0%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20nums1%EC%9D%84%20nums%20%EB%92%A4%EC%97%90%20%EC%97%B0%EA%B2%B0&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

### 6. &nbsp; 리스트 정렬

리스트를 정렬하면 배열 관련 알고리즘 문제에 자주 등장하는 ‘이진 탐색’과 ‘투 포인터’ 알고리즘을 사용할 수 있다.

=== "Python"

    ```python title="list.py"
    # 리스트 정렬
    nums.sort()  # 정렬 후 리스트 원소가 오름차순으로 배치됨
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 리스트 정렬 */
    sort(nums.begin(), nums.end());  // 정렬 후 리스트 원소가 오름차순으로 배치됨
    ```

=== "Java"

    ```java title="list.java"
    /* 리스트 정렬 */
    Collections.sort(nums);  // 정렬 후 리스트 원소가 오름차순으로 배치됨
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 리스트 정렬 */
    nums.Sort(); // 정렬 후 리스트 원소가 오름차순으로 배치됨
    ```

=== "Go"

    ```go title="list_test.go"
    /* 리스트 정렬 */
    sort.Ints(nums)  // 정렬 후 리스트 원소가 오름차순으로 배치됨
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 리스트 정렬 */
    nums.sort() // 정렬 후 리스트 원소가 오름차순으로 배치됨
    ```

=== "JS"

    ```javascript title="list.js"
    /* 리스트 정렬 */
    nums.sort((a, b) => a - b);  // 정렬 후 리스트 원소가 오름차순으로 배치됨
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 리스트 정렬 */
    nums.sort((a, b) => a - b);  // 정렬 후 리스트 원소가 오름차순으로 배치됨
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 리스트 정렬 */
    nums.sort(); // 정렬 후 리스트 원소가 오름차순으로 배치됨
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 리스트 정렬 */
    nums.sort(); // 정렬 후 리스트 원소가 오름차순으로 배치됨
    ```

=== "C"

    ```c title="list.c"
    // C는 내장 동적 배열을 제공하지 않는다
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 리스트 정렬 */
    nums.sort() // 정렬 후 리스트 원소가 오름차순으로 배치됨
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 리스트 정렬
    nums = nums.sort { |a, b| a <=> b } # 정렬 후 리스트 원소가 오름차순으로 배치됨
    ```

??? pythontutor "코드 시각화"

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20nums.sort%28%29%20%20%23%20%EC%A0%95%EB%A0%AC%20%ED%9B%84%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EC%98%A4%EB%A6%84%EC%B0%A8%EC%88%9C%EC%9C%BC%EB%A1%9C%20%EB%B0%B0%EC%B9%98%EB%90%A8&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20nums.sort%28%29%20%20%23%20%EC%A0%95%EB%A0%AC%20%ED%9B%84%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EC%98%A4%EB%A6%84%EC%B0%A8%EC%88%9C%EC%9C%BC%EB%A1%9C%20%EB%B0%B0%EC%B9%98%EB%90%A8&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 4.3.2 &nbsp; 리스트 구현

Java, C++, Python 등 많은 프로그래밍 언어는 리스트를 내장하고 있다. 이들의 구현은 비교적 복잡하며 초기 용량, 확장 배수 등의 매개변수도 정교하게 설정되어 있다. 관심 있는 독자는 소스 코드를 살펴보며 학습할 수 있다.

리스트의 작동 원리를 더 깊이 이해하기 위해 간단한 리스트를 구현해 보자. 핵심 설계는 다음 세 가지다.

- **초기 용량**: 배열의 초기 용량을 적절히 선택한다. 이 예에서는 10을 초기 용량으로 정한다.
- **개수 기록**: 현재 원소 수를 기록하는 변수 `size`를 선언하고, 삽입과 삭제에 따라 즉시 갱신한다. 이 변수를 통해 리스트의 끝을 찾고 용량 확장이 필요한지 판단할 수 있다.
- **용량 확장 방식**: 원소를 삽입할 때 리스트가 가득 찼으면 용량을 늘려야 한다. 확장 배수에 따라 더 큰 배열을 만든 뒤 기존 원소를 모두 차례로 옮긴다. 이 예에서는 매번 배열 용량을 이전의 2배로 늘린다.

=== "Python"

    ```python title="my_list.py"
    class MyList:
        """리스트 클래스"""

        def __init__(self):
            """생성자"""
            self._capacity: int = 10  # 리스트 용량
            self._arr: list[int] = [0] * self._capacity  # 배열(리스트 원소 저장)
            self._size: int = 0  # 리스트 길이(현재 원소 개수)
            self._extend_ratio: int = 2  # 리스트의 용량을 확장할 때마다 적용하는 배수

        def size(self) -> int:
            """리스트 길이(현재 원소 개수) 반환"""
            return self._size

        def capacity(self) -> int:
            """리스트 용량 반환"""
            return self._capacity

        def get(self, index: int) -> int:
            """원소 접근"""
            # 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
            if index < 0 or index >= self._size:
                raise IndexError("인덱스가 범위를 벗어났다")
            return self._arr[index]

        def set(self, num: int, index: int):
            """원소 갱신"""
            if index < 0 or index >= self._size:
                raise IndexError("인덱스가 범위를 벗어났다")
            self._arr[index] = num

        def add(self, num: int):
            """맨 뒤에 원소 추가"""
            # 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if self.size() == self.capacity():
                self.extend_capacity()
            self._arr[self._size] = num
            self._size += 1

        def insert(self, num: int, index: int):
            """중간에 원소 삽입"""
            if index < 0 or index >= self._size:
                raise IndexError("인덱스가 범위를 벗어났다")
            # 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if self._size == self.capacity():
                self.extend_capacity()
            # 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
            for j in range(self._size - 1, index - 1, -1):
                self._arr[j + 1] = self._arr[j]
            self._arr[index] = num
            # 원소 개수를 갱신한다
            self._size += 1

        def remove(self, index: int) -> int:
            """원소 삭제"""
            if index < 0 or index >= self._size:
                raise IndexError("인덱스가 범위를 벗어났다")
            num = self._arr[index]
            # 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
            for j in range(index, self._size - 1):
                self._arr[j] = self._arr[j + 1]
            # 원소 개수를 갱신한다
            self._size -= 1
            # 삭제한 원소를 반환한다
            return num

        def extend_capacity(self):
            """리스트 용량 확장"""
            # 원래 배열 길이의 _extend_ratio 배인 새 배열을 만들고 원래 배열을 새 배열에 복사한다
            self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
            # 리스트 용량을 갱신한다
            self._capacity = len(self._arr)

        def to_array(self) -> list[int]:
            """유효한 길이만큼의 리스트 반환"""
            return self._arr[: self._size]
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    /* 리스트 클래스 */
    class MyList {
      private:
        int *arr;             // 배열(리스트 원소 저장)
        int arrCapacity = 10; // 리스트 용량
        int arrSize = 0;      // 리스트 길이(현재 원소 개수)
        int extendRatio = 2;   // 리스트의 용량을 확장할 때마다 적용하는 배수

      public:
        /* 생성자 */
        MyList() {
            arr = new int[arrCapacity];
        }

        /* 소멸자 */
        ~MyList() {
            delete[] arr;
        }

        /* 리스트 길이(현재 원소 개수) 반환*/
        int size() {
            return arrSize;
        }

        /* 리스트 용량 반환 */
        int capacity() {
            return arrCapacity;
        }

        /* 원소 접근 */
        int get(int index) {
            // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
            if (index < 0 || index >= size())
                throw out_of_range("인덱스가 범위를 벗어났다");
            return arr[index];
        }

        /* 원소 갱신 */
        void set(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("인덱스가 범위를 벗어났다");
            arr[index] = num;
        }

        /* 맨 뒤에 원소 추가 */
        void add(int num) {
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if (size() == capacity())
                extendCapacity();
            arr[size()] = num;
            // 원소 개수를 갱신한다
            arrSize++;
        }

        /* 중간에 원소 삽입 */
        void insert(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("인덱스가 범위를 벗어났다");
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if (size() == capacity())
                extendCapacity();
            // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
            for (int j = size() - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 원소 개수를 갱신한다
            arrSize++;
        }

        /* 원소 삭제 */
        int remove(int index) {
            if (index < 0 || index >= size())
                throw out_of_range("인덱스가 범위를 벗어났다");
            int num = arr[index];
            // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
            for (int j = index; j < size() - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 원소 개수를 갱신한다
            arrSize--;
            // 삭제한 원소를 반환한다
            return num;
        }

        /* 리스트 용량 확장 */
        void extendCapacity() {
            // 길이가 기존 배열의 extendRatio배인 새 배열 생성
            int newCapacity = capacity() * extendRatio;
            int *tmp = arr;
            arr = new int[newCapacity];
            // 원래 배열의 모든 원소를 새 배열에 복사한다
            for (int i = 0; i < size(); i++) {
                arr[i] = tmp[i];
            }
            // 메모리 해제
            delete[] tmp;
            arrCapacity = newCapacity;
        }

        /* 출력을 위해 리스트를 Vector로 변환 */
        vector<int> toVector() {
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            vector<int> vec(size());
            for (int i = 0; i < size(); i++) {
                vec[i] = arr[i];
            }
            return vec;
        }
    };
    ```

=== "Java"

    ```java title="my_list.java"
    /* 리스트 클래스 */
    class MyList {
        private int[] arr; // 배열(리스트 원소 저장)
        private int capacity = 10; // 리스트 용량
        private int size = 0; // 리스트 길이(현재 원소 개수)
        private int extendRatio = 2; // 리스트의 용량을 확장할 때마다 적용하는 배수

        /* 생성자 */
        public MyList() {
            arr = new int[capacity];
        }

        /* 리스트 길이(현재 원소 개수) 반환 */
        public int size() {
            return size;
        }

        /* 리스트 용량 반환 */
        public int capacity() {
            return capacity;
        }

        /* 원소 접근 */
        public int get(int index) {
            // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("인덱스가 범위를 벗어났다");
            return arr[index];
        }

        /* 원소 갱신 */
        public void set(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("인덱스가 범위를 벗어났다");
            arr[index] = num;
        }

        /* 맨 뒤에 원소 추가 */
        public void add(int num) {
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if (size == capacity())
                extendCapacity();
            arr[size] = num;
            // 원소 개수를 갱신한다
            size++;
        }

        /* 중간에 원소 삽입 */
        public void insert(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("인덱스가 범위를 벗어났다");
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if (size == capacity())
                extendCapacity();
            // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
            for (int j = size - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 원소 개수를 갱신한다
            size++;
        }

        /* 원소 삭제 */
        public int remove(int index) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("인덱스가 범위를 벗어났다");
            int num = arr[index];
            // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
            for (int j = index; j < size - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 원소 개수를 갱신한다
            size--;
            // 삭제한 원소를 반환한다
            return num;
        }

        /* 리스트 용량 확장 */
        public void extendCapacity() {
            // 길이가 원래 배열의 extendRatio배인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
            arr = Arrays.copyOf(arr, capacity() * extendRatio);
            // 리스트 용량을 갱신한다
            capacity = arr.length;
        }

        /* 리스트를 배열로 변환 */
        public int[] toArray() {
            int size = size();
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            int[] arr = new int[size];
            for (int i = 0; i < size; i++) {
                arr[i] = get(i);
            }
            return arr;
        }
    }
    ```

=== "C#"

    ```csharp title="my_list.cs"
    /* 리스트 클래스 */
    class MyList {
        private int[] arr;           // 배열(리스트 원소 저장)
        private int arrCapacity = 10;    // 리스트 용량
        private int arrSize = 0;         // 리스트 길이(현재 원소 개수)
        private readonly int extendRatio = 2;  // 리스트의 용량을 확장할 때마다 적용하는 배수

        /* 생성자 */
        public MyList() {
            arr = new int[arrCapacity];
        }

        /* 리스트 길이(현재 원소 개수) 반환*/
        public int Size() {
            return arrSize;
        }

        /* 리스트 용량 반환 */
        public int Capacity() {
            return arrCapacity;
        }

        /* 원소 접근 */
        public int Get(int index) {
            // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("인덱스가 범위를 벗어났다");
            return arr[index];
        }

        /* 원소 갱신 */
        public void Set(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("인덱스가 범위를 벗어났다");
            arr[index] = num;
        }

        /* 맨 뒤에 원소 추가 */
        public void Add(int num) {
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if (arrSize == arrCapacity)
                ExtendCapacity();
            arr[arrSize] = num;
            // 원소 개수를 갱신한다
            arrSize++;
        }

        /* 중간에 원소 삽입 */
        public void Insert(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("인덱스가 범위를 벗어났다");
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if (arrSize == arrCapacity)
                ExtendCapacity();
            // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
            for (int j = arrSize - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 원소 개수를 갱신한다
            arrSize++;
        }

        /* 원소 삭제 */
        public int Remove(int index) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("인덱스가 범위를 벗어났다");
            int num = arr[index];
            // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
            for (int j = index; j < arrSize - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 원소 개수를 갱신한다
            arrSize--;
            // 삭제한 원소를 반환한다
            return num;
        }

        /* 리스트 용량 확장 */
        public void ExtendCapacity() {
            // 길이가 arrCapacity * extendRatio인 배열을 만들고 기존 배열을 새 배열에 복사
            Array.Resize(ref arr, arrCapacity * extendRatio);
            // 리스트 용량을 갱신한다
            arrCapacity = arr.Length;
        }

        /* 리스트를 배열로 변환 */
        public int[] ToArray() {
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            int[] arr = new int[arrSize];
            for (int i = 0; i < arrSize; i++) {
                arr[i] = Get(i);
            }
            return arr;
        }
    }
    ```

=== "Go"

    ```go title="my_list.go"
    /* 리스트 클래스 */
    type myList struct {
        arrCapacity int
        arr         []int
        arrSize     int
        extendRatio int
    }

    /* 생성자 */
    func newMyList() *myList {
        return &myList{
            arrCapacity: 10,              // 리스트 용량
            arr:         make([]int, 10), // 배열(리스트 원소 저장)
            arrSize:     0,               // 리스트 길이(현재 원소 개수)
            extendRatio: 2,               // 리스트의 용량을 확장할 때마다 적용하는 배수
        }
    }

    /* 리스트 길이(현재 원소 개수) 반환 */
    func (l *myList) size() int {
        return l.arrSize
    }

    /*  리스트 용량 반환 */
    func (l *myList) capacity() int {
        return l.arrCapacity
    }

    /* 원소 접근 */
    func (l *myList) get(index int) int {
        // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
        if index < 0 || index >= l.arrSize {
            panic("인덱스가 범위를 벗어났다")
        }
        return l.arr[index]
    }

    /* 원소 갱신 */
    func (l *myList) set(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("인덱스가 범위를 벗어났다")
        }
        l.arr[index] = num
    }

    /* 맨 뒤에 원소 추가 */
    func (l *myList) add(num int) {
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        l.arr[l.arrSize] = num
        // 원소 개수를 갱신한다
        l.arrSize++
    }

    /* 중간에 원소 삽입 */
    func (l *myList) insert(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("인덱스가 범위를 벗어났다")
        }
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
        for j := l.arrSize - 1; j >= index; j-- {
            l.arr[j+1] = l.arr[j]
        }
        l.arr[index] = num
        // 원소 개수를 갱신한다
        l.arrSize++
    }

    /* 원소 삭제 */
    func (l *myList) remove(index int) int {
        if index < 0 || index >= l.arrSize {
            panic("인덱스가 범위를 벗어났다")
        }
        num := l.arr[index]
        // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
        for j := index; j < l.arrSize-1; j++ {
            l.arr[j] = l.arr[j+1]
        }
        // 원소 개수를 갱신한다
        l.arrSize--
        // 삭제한 원소를 반환한다
        return num
    }

    /* 리스트 용량 확장 */
    func (l *myList) extendCapacity() {
        // 길이가 원래 배열의 extendRatio배인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
        l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
        // 리스트 용량을 갱신한다
        l.arrCapacity = len(l.arr)
    }

    /* 유효한 길이만큼의 리스트 반환 */
    func (l *myList) toArray() []int {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        return l.arr[:l.arrSize]
    }
    ```

=== "Swift"

    ```swift title="my_list.swift"
    /* 리스트 클래스 */
    class MyList {
        private var arr: [Int] // 배열(리스트 원소 저장)
        private var _capacity: Int // 리스트 용량
        private var _size: Int // 리스트 길이(현재 원소 개수)
        private let extendRatio: Int // 리스트의 용량을 확장할 때마다 적용하는 배수

        /* 생성자 */
        init() {
            _capacity = 10
            _size = 0
            extendRatio = 2
            arr = Array(repeating: 0, count: _capacity)
        }

        /* 리스트 길이(현재 원소 개수) 반환*/
        func size() -> Int {
            _size
        }

        /* 리스트 용량 반환 */
        func capacity() -> Int {
            _capacity
        }

        /* 원소 접근 */
        func get(index: Int) -> Int {
            // 인덱스가 범위를 벗어나면 오류를 발생시킨다. 아래에서도 동일하다
            if index < 0 || index >= size() {
                fatalError("인덱스가 범위를 벗어났다")
            }
            return arr[index]
        }

        /* 원소 갱신 */
        func set(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("인덱스가 범위를 벗어났다")
            }
            arr[index] = num
        }

        /* 맨 뒤에 원소 추가 */
        func add(num: Int) {
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if size() == capacity() {
                extendCapacity()
            }
            arr[size()] = num
            // 원소 개수를 갱신한다
            _size += 1
        }

        /* 중간에 원소 삽입 */
        func insert(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("인덱스가 범위를 벗어났다")
            }
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if size() == capacity() {
                extendCapacity()
            }
            // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
            for j in (index ..< size()).reversed() {
                arr[j + 1] = arr[j]
            }
            arr[index] = num
            // 원소 개수를 갱신한다
            _size += 1
        }

        /* 원소 삭제 */
        @discardableResult
        func remove(index: Int) -> Int {
            if index < 0 || index >= size() {
                fatalError("인덱스가 범위를 벗어났다")
            }
            let num = arr[index]
            // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
            for j in index ..< (size() - 1) {
                arr[j] = arr[j + 1]
            }
            // 원소 개수를 갱신한다
            _size -= 1
            // 삭제한 원소를 반환한다
            return num
        }

        /* 리스트 용량 확장 */
        func extendCapacity() {
            // 길이가 원래 배열의 extendRatio배인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
            arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
            // 리스트 용량을 갱신한다
            _capacity = arr.count
        }

        /* 리스트를 배열로 변환 */
        func toArray() -> [Int] {
            Array(arr.prefix(size()))
        }
    }
    ```

=== "JS"

    ```javascript title="my_list.js"
    /* 리스트 클래스 */
    class MyList {
        #arr = new Array(); // 배열(리스트 원소 저장)
        #capacity = 10; // 리스트 용량
        #size = 0; // 리스트 길이(현재 원소 개수)
        #extendRatio = 2; // 리스트의 용량을 확장할 때마다 적용하는 배수

        /* 생성자 */
        constructor() {
            this.#arr = new Array(this.#capacity);
        }

        /* 리스트 길이(현재 원소 개수) 반환*/
        size() {
            return this.#size;
        }

        /* 리스트 용량 반환 */
        capacity() {
            return this.#capacity;
        }

        /* 원소 접근 */
        get(index) {
            // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
            if (index < 0 || index >= this.#size) throw new Error('인덱스가 범위를 벗어났다');
            return this.#arr[index];
        }

        /* 원소 갱신 */
        set(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('인덱스가 범위를 벗어났다');
            this.#arr[index] = num;
        }

        /* 맨 뒤에 원소 추가 */
        add(num) {
            // 길이가 용량과 같으면 용량을 확장해야 한다
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 새 원소를 리스트 맨 뒤에 추가한다
            this.#arr[this.#size] = num;
            this.#size++;
        }

        /* 중간에 원소 삽입 */
        insert(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('인덱스가 범위를 벗어났다');
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
            for (let j = this.#size - 1; j >= index; j--) {
                this.#arr[j + 1] = this.#arr[j];
            }
            // 원소 개수를 갱신한다
            this.#arr[index] = num;
            this.#size++;
        }

        /* 원소 삭제 */
        remove(index) {
            if (index < 0 || index >= this.#size) throw new Error('인덱스가 범위를 벗어났다');
            let num = this.#arr[index];
            // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
            for (let j = index; j < this.#size - 1; j++) {
                this.#arr[j] = this.#arr[j + 1];
            }
            // 원소 개수를 갱신한다
            this.#size--;
            // 삭제한 원소를 반환한다
            return num;
        }

        /* 리스트 용량 확장 */
        extendCapacity() {
            // 길이가 원래 배열의 extendRatio배인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
            this.#arr = this.#arr.concat(
                new Array(this.capacity() * (this.#extendRatio - 1))
            );
            // 리스트 용량을 갱신한다
            this.#capacity = this.#arr.length;
        }

        /* 리스트를 배열로 변환 */
        toArray() {
            let size = this.size();
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            const arr = new Array(size);
            for (let i = 0; i < size; i++) {
                arr[i] = this.get(i);
            }
            return arr;
        }
    }
    ```

=== "TS"

    ```typescript title="my_list.ts"
    /* 리스트 클래스 */
    class MyList {
        private arr: Array<number>; // 배열(리스트 원소 저장)
        private _capacity: number = 10; // 리스트 용량
        private _size: number = 0; // 리스트 길이(현재 원소 개수)
        private extendRatio: number = 2; // 리스트의 용량을 확장할 때마다 적용하는 배수

        /* 생성자 */
        constructor() {
            this.arr = new Array(this._capacity);
        }

        /* 리스트 길이(현재 원소 개수) 반환*/
        public size(): number {
            return this._size;
        }

        /* 리스트 용량 반환 */
        public capacity(): number {
            return this._capacity;
        }

        /* 원소 접근 */
        public get(index: number): number {
            // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
            if (index < 0 || index >= this._size) throw new Error('인덱스가 범위를 벗어났다');
            return this.arr[index];
        }

        /* 원소 갱신 */
        public set(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('인덱스가 범위를 벗어났다');
            this.arr[index] = num;
        }

        /* 맨 뒤에 원소 추가 */
        public add(num: number): void {
            // 길이가 용량과 같으면 용량을 확장해야 한다
            if (this._size === this._capacity) this.extendCapacity();
            // 새 원소를 리스트 맨 뒤에 추가한다
            this.arr[this._size] = num;
            this._size++;
        }

        /* 중간에 원소 삽입 */
        public insert(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('인덱스가 범위를 벗어났다');
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if (this._size === this._capacity) {
                this.extendCapacity();
            }
            // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
            for (let j = this._size - 1; j >= index; j--) {
                this.arr[j + 1] = this.arr[j];
            }
            // 원소 개수를 갱신한다
            this.arr[index] = num;
            this._size++;
        }

        /* 원소 삭제 */
        public remove(index: number): number {
            if (index < 0 || index >= this._size) throw new Error('인덱스가 범위를 벗어났다');
            let num = this.arr[index];
            // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
            for (let j = index; j < this._size - 1; j++) {
                this.arr[j] = this.arr[j + 1];
            }
            // 원소 개수를 갱신한다
            this._size--;
            // 삭제한 원소를 반환한다
            return num;
        }

        /* 리스트 용량 확장 */
        public extendCapacity(): void {
            // 길이가 size인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
            this.arr = this.arr.concat(
                new Array(this.capacity() * (this.extendRatio - 1))
            );
            // 리스트 용량을 갱신한다
            this._capacity = this.arr.length;
        }

        /* 리스트를 배열로 변환 */
        public toArray(): number[] {
            let size = this.size();
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            const arr = new Array(size);
            for (let i = 0; i < size; i++) {
                arr[i] = this.get(i);
            }
            return arr;
        }
    }
    ```

=== "Dart"

    ```dart title="my_list.dart"
    /* 리스트 클래스 */
    class MyList {
      late List<int> _arr; // 배열(리스트 원소 저장)
      int _capacity = 10; // 리스트 용량
      int _size = 0; // 리스트 길이(현재 원소 개수)
      int _extendRatio = 2; // 리스트의 용량을 확장할 때마다 적용하는 배수

      /* 생성자 */
      MyList() {
        _arr = List.filled(_capacity, 0);
      }

      /* 리스트 길이(현재 원소 개수) 반환*/
      int size() => _size;

      /* 리스트 용량 반환 */
      int capacity() => _capacity;

      /* 원소 접근 */
      int get(int index) {
        if (index >= _size) throw RangeError('인덱스가 범위를 벗어났다');
        return _arr[index];
      }

      /* 원소 갱신 */
      void set(int index, int _num) {
        if (index >= _size) throw RangeError('인덱스가 범위를 벗어났다');
        _arr[index] = _num;
      }

      /* 맨 뒤에 원소 추가 */
      void add(int _num) {
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if (_size == _capacity) extendCapacity();
        _arr[_size] = _num;
        // 원소 개수를 갱신한다
        _size++;
      }

      /* 중간에 원소 삽입 */
      void insert(int index, int _num) {
        if (index >= _size) throw RangeError('인덱스가 범위를 벗어났다');
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if (_size == _capacity) extendCapacity();
        // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
        for (var j = _size - 1; j >= index; j--) {
          _arr[j + 1] = _arr[j];
        }
        _arr[index] = _num;
        // 원소 개수를 갱신한다
        _size++;
      }

      /* 원소 삭제 */
      int remove(int index) {
        if (index >= _size) throw RangeError('인덱스가 범위를 벗어났다');
        int _num = _arr[index];
        // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
        for (var j = index; j < _size - 1; j++) {
          _arr[j] = _arr[j + 1];
        }
        // 원소 개수를 갱신한다
        _size--;
        // 삭제한 원소를 반환한다
        return _num;
      }

      /* 리스트 용량 확장 */
      void extendCapacity() {
        // 길이가 원래 배열의 _extendRatio배인 새 배열을 생성한다
        final _newNums = List.filled(_capacity * _extendRatio, 0);
        // 원래 배열을 새 배열에 복사한다
        List.copyRange(_newNums, 0, _arr);
        // _arr의 참조를 갱신한다
        _arr = _newNums;
        // 리스트 용량을 갱신한다
        _capacity = _arr.length;
      }

      /* 리스트를 배열로 변환 */
      List<int> toArray() {
        List<int> arr = [];
        for (var i = 0; i < _size; i++) {
          arr.add(get(i));
        }
        return arr;
      }
    }
    ```

=== "Rust"

    ```rust title="my_list.rs"
    /* 리스트 클래스 */
    #[allow(dead_code)]
    struct MyList {
        arr: Vec<i32>,       // 배열(리스트 원소 저장)
        capacity: usize,     // 리스트 용량
        size: usize,         // 리스트 길이(현재 원소 개수)
        extend_ratio: usize, // 리스트의 용량을 확장할 때마다 적용하는 배수
    }

    #[allow(unused, unused_comparisons)]
    impl MyList {
        /* 생성자 */
        pub fn new(capacity: usize) -> Self {
            let mut vec = vec![0; capacity];
            Self {
                arr: vec,
                capacity,
                size: 0,
                extend_ratio: 2,
            }
        }

        /* 리스트 길이(현재 원소 개수) 반환*/
        pub fn size(&self) -> usize {
            return self.size;
        }

        /* 리스트 용량 반환 */
        pub fn capacity(&self) -> usize {
            return self.capacity;
        }

        /* 원소 접근 */
        pub fn get(&self, index: usize) -> i32 {
            // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
            if index >= self.size {
                panic!("인덱스가 범위를 벗어났다")
            };
            return self.arr[index];
        }

        /* 원소 갱신 */
        pub fn set(&mut self, index: usize, num: i32) {
            if index >= self.size {
                panic!("인덱스가 범위를 벗어났다")
            };
            self.arr[index] = num;
        }

        /* 맨 뒤에 원소 추가 */
        pub fn add(&mut self, num: i32) {
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            self.arr[self.size] = num;
            // 원소 개수를 갱신한다
            self.size += 1;
        }

        /* 중간에 원소 삽입 */
        pub fn insert(&mut self, index: usize, num: i32) {
            if index >= self.size() {
                panic!("인덱스가 범위를 벗어났다")
            };
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
            for j in (index..self.size).rev() {
                self.arr[j + 1] = self.arr[j];
            }
            self.arr[index] = num;
            // 원소 개수를 갱신한다
            self.size += 1;
        }

        /* 원소 삭제 */
        pub fn remove(&mut self, index: usize) -> i32 {
            if index >= self.size() {
                panic!("인덱스가 범위를 벗어났다")
            };
            let num = self.arr[index];
            // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
            for j in index..self.size - 1 {
                self.arr[j] = self.arr[j + 1];
            }
            // 원소 개수를 갱신한다
            self.size -= 1;
            // 삭제한 원소를 반환한다
            return num;
        }

        /* 리스트 용량 확장 */
        pub fn extend_capacity(&mut self) {
            // 길이가 원래 배열의 extend_ratio배인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
            let new_capacity = self.capacity * self.extend_ratio;
            self.arr.resize(new_capacity, 0);
            // 리스트 용량을 갱신한다
            self.capacity = new_capacity;
        }

        /* 리스트를 배열로 변환 */
        pub fn to_array(&self) -> Vec<i32> {
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            let mut arr = Vec::new();
            for i in 0..self.size {
                arr.push(self.get(i));
            }
            arr
        }
    }
    ```

=== "C"

    ```c title="my_list.c"
    /* 리스트 클래스 */
    typedef struct {
        int *arr;        // 배열(리스트 원소 저장)
        int capacity;    // 리스트 용량
        int size;        // 리스트 크기
        int extendRatio; // 리스트 용량을 확장할 때마다 적용하는 배수
    } MyList;

    /* 생성자 */
    MyList *newMyList() {
        MyList *nums = malloc(sizeof(MyList));
        nums->capacity = 10;
        nums->arr = malloc(sizeof(int) * nums->capacity);
        nums->size = 0;
        nums->extendRatio = 2;
        return nums;
    }

    /* 소멸자 */
    void delMyList(MyList *nums) {
        free(nums->arr);
        free(nums);
    }

    /* 리스트 길이 구하기 */
    int size(MyList *nums) {
        return nums->size;
    }

    /* 리스트 용량 반환 */
    int capacity(MyList *nums) {
        return nums->capacity;
    }

    /* 원소 접근 */
    int get(MyList *nums, int index) {
        assert(index >= 0 && index < nums->size);
        return nums->arr[index];
    }

    /* 원소 갱신 */
    void set(MyList *nums, int index, int num) {
        assert(index >= 0 && index < nums->size);
        nums->arr[index] = num;
    }

    /* 맨 뒤에 원소 추가 */
    void add(MyList *nums, int num) {
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 용량 확장
        }
        nums->arr[size(nums)] = num;
        nums->size++;
    }

    /* 중간에 원소 삽입 */
    void insert(MyList *nums, int index, int num) {
        assert(index >= 0 && index < size(nums));
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 용량 확장
        }
        for (int i = size(nums); i > index; --i) {
            nums->arr[i] = nums->arr[i - 1];
        }
        nums->arr[index] = num;
        nums->size++;
    }

    /* 원소 삭제 */
    // 주의: stdio.h가 remove라는 이름을 사용한다
    int removeItem(MyList *nums, int index) {
        assert(index >= 0 && index < size(nums));
        int num = nums->arr[index];
        for (int i = index; i < size(nums) - 1; i++) {
            nums->arr[i] = nums->arr[i + 1];
        }
        nums->size--;
        return num;
    }

    /* 리스트 용량 확장 */
    void extendCapacity(MyList *nums) {
        // 먼저 공간 할당
        int newCapacity = capacity(nums) * nums->extendRatio;
        int *extend = (int *)malloc(sizeof(int) * newCapacity);
        int *temp = nums->arr;

        // 기존 데이터를 새 공간에 복사
        for (int i = 0; i < size(nums); i++)
            extend[i] = nums->arr[i];

        // 기존 데이터 공간 해제
        free(temp);

        // 새 데이터로 갱신
        nums->arr = extend;
        nums->capacity = newCapacity;
    }

    /* 출력을 위해 리스트를 Array로 변환 */
    int *toArray(MyList *nums) {
        return nums->arr;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_list.kt"
    /* 리스트 클래스 */
    class MyList {
        private var arr: IntArray = intArrayOf() // 배열(리스트 원소 저장)
        private var capacity: Int = 10 // 리스트 용량
        private var size: Int = 0 // 리스트 길이(현재 원소 개수)
        private var extendRatio: Int = 2 // 리스트의 용량을 확장할 때마다 적용하는 배수

        /* 생성자 */
        init {
            arr = IntArray(capacity)
        }

        /* 리스트 길이(현재 원소 개수) 반환 */
        fun size(): Int {
            return size
        }

        /* 리스트 용량 반환 */
        fun capacity(): Int {
            return capacity
        }

        /* 원소 접근 */
        fun get(index: Int): Int {
            // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("인덱스가 범위를 벗어났다")
            return arr[index]
        }

        /* 원소 갱신 */
        fun set(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("인덱스가 범위를 벗어났다")
            arr[index] = num
        }

        /* 맨 뒤에 원소 추가 */
        fun add(num: Int) {
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if (size == capacity())
                extendCapacity()
            arr[size] = num
            // 원소 개수를 갱신한다
            size++
        }

        /* 중간에 원소 삽입 */
        fun insert(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("인덱스가 범위를 벗어났다")
            // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
            if (size == capacity())
                extendCapacity()
            // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
            for (j in size - 1 downTo index)
                arr[j + 1] = arr[j]
            arr[index] = num
            // 원소 개수를 갱신한다
            size++
        }

        /* 원소 삭제 */
        fun remove(index: Int): Int {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("인덱스가 범위를 벗어났다")
            val num = arr[index]
            // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
            for (j in index..<size - 1)
                arr[j] = arr[j + 1]
            // 원소 개수를 갱신한다
            size--
            // 삭제한 원소를 반환한다
            return num
        }

        /* 리스트 용량 확장 */
        fun extendCapacity() {
            // 길이가 원래 배열의 extendRatio배인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
            arr = arr.copyOf(capacity() * extendRatio)
            // 리스트 용량을 갱신한다
            capacity = arr.size
        }

        /* 리스트를 배열로 변환 */
        fun toArray(): IntArray {
            val size = size()
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            val arr = IntArray(size)
            for (i in 0..<size) {
                arr[i] = get(i)
            }
            return arr
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_list.rb"
    ### 리스트 클래스 ###
    class MyList
      attr_reader :size       # 리스트 길이(현재 원소 개수) 반환
      attr_reader :capacity   # 리스트 용량 반환

      ### 생성자 ###
      def initialize
        @capacity = 10
        @size = 0
        @extend_ratio = 2
        @arr = Array.new(capacity)
      end

      ### 원소 접근 ###
      def get(index)
        # 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
        raise IndexError, "인덱스가 범위를 벗어났다" if index < 0 || index >= size
        @arr[index]
      end

      ### 원소 접근 ###
      def set(index, num)
        raise IndexError, "인덱스가 범위를 벗어났다" if index < 0 || index >= size
        @arr[index] = num
      end

      ### 맨 뒤에 원소 추가 ###
      def add(num)
        # 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        extend_capacity if size == capacity
        @arr[size] = num

        # 원소 개수를 갱신한다
        @size += 1
      end

      ### 중간에 원소 삽입 ###
      def insert(index, num)
        raise IndexError, "인덱스가 범위를 벗어났다" if index < 0 || index >= size

        # 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        extend_capacity if size == capacity

        # 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
        for j in (size - 1).downto(index)
          @arr[j + 1] = @arr[j]
        end
        @arr[index] = num

        # 원소 개수를 갱신한다
        @size += 1
      end

      ### 원소 삭제 ###
      def remove(index)
        raise IndexError, "인덱스가 범위를 벗어났다" if index < 0 || index >= size
        num = @arr[index]

        # 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
        for j in index...size
          @arr[j] = @arr[j + 1]
        end

        # 원소 개수를 갱신한다
        @size -= 1

        # 삭제한 원소를 반환한다
        num
      end

      ### 리스트 용량 확장 ###
      def extend_capacity
        # 길이가 원래 배열의 extend_ratio배인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
        arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
        # 리스트 용량을 갱신한다
        @capacity = arr.length
      end

      ### 리스트를 배열로 변환 ###
      def to_array
        sz = size
        # 유효한 길이 범위 안의 리스트 원소만 변환한다
        arr = Array.new(sz)
        for i in 0...sz
          arr[i] = get(i)
        end
        arr
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%0A%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EA%B8%B8%EC%9D%B4%28%ED%98%84%EC%9E%AC%20%EC%9B%90%EC%86%8C%20%EA%B0%9C%EC%88%98%29%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20return%20self._size%0A%0A%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9A%A9%EB%9F%89%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20return%20self._capacity%0A%0A%20%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%AC%EB%8B%A4%22%29%0A%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EA%B0%B1%EC%8B%A0%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%AC%EB%8B%A4%22%29%0A%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EB%A7%A8%20%EB%92%A4%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%B6%94%EA%B0%80%22%22%22%0A%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%A4%91%EA%B0%84%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%AC%EB%8B%A4%22%29%0A%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20index%EC%99%80%20%EA%B7%B8%20%EB%92%A4%EC%9D%98%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EB%AA%A8%EB%91%90%20%ED%95%9C%20%EC%B9%B8%EC%94%A9%20%EB%92%A4%EB%A1%9C%20%EC%9D%B4%EB%8F%99%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EC%82%AD%EC%A0%9C%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%AC%EB%8B%A4%22%29%0A%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20i%20%EB%92%A4%EC%9D%98%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EB%AA%A8%EB%91%90%20%ED%95%9C%20%EC%B9%B8%20%EC%95%9E%EC%9C%BC%EB%A1%9C%20%EC%9D%B4%EB%8F%99%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20return%20num%0A%0A%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9A%A9%EB%9F%89%20%ED%99%95%EC%9E%A5%22%22%22%0A%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20nums%20%3D%20MyList%28%29%0A%20%20%23%20%EB%A7%A8%20%EB%92%A4%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%B6%94%EA%B0%80%0A%20%20nums.add%281%29%0A%20%20nums.add%283%29%0A%20%20nums.add%282%29%0A%20%20nums.add%285%29%0A%20%20nums.add%284%29%0A%0A%20%20%23%20%EC%A4%91%EA%B0%84%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20nums.insert%286,%20index%3D3%29%0A%0A%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%82%AD%EC%A0%9C%0A%20%20nums.remove%283%29%0A%0A%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20num%20%3D%20nums.get%281%29%0A%0A%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B0%B1%EC%8B%A0%0A%20%20nums.set%280,%201%29%0A%0A%20%20%23%20%EC%9A%A9%EB%9F%89%20%ED%99%95%EC%9E%A5%20%EB%8F%99%EC%9E%91%20%ED%85%8C%EC%8A%A4%ED%8A%B8%0A%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20nums.add%28i%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%0A%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EA%B8%B8%EC%9D%B4%28%ED%98%84%EC%9E%AC%20%EC%9B%90%EC%86%8C%20%EA%B0%9C%EC%88%98%29%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20return%20self._size%0A%0A%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9A%A9%EB%9F%89%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20return%20self._capacity%0A%0A%20%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%AC%EB%8B%A4%22%29%0A%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EA%B0%B1%EC%8B%A0%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%AC%EB%8B%A4%22%29%0A%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EB%A7%A8%20%EB%92%A4%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%B6%94%EA%B0%80%22%22%22%0A%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%A4%91%EA%B0%84%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%AC%EB%8B%A4%22%29%0A%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20index%EC%99%80%20%EA%B7%B8%20%EB%92%A4%EC%9D%98%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EB%AA%A8%EB%91%90%20%ED%95%9C%20%EC%B9%B8%EC%94%A9%20%EB%92%A4%EB%A1%9C%20%EC%9D%B4%EB%8F%99%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EC%82%AD%EC%A0%9C%22%22%22%0A%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%AC%EB%8B%A4%22%29%0A%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20i%20%EB%92%A4%EC%9D%98%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EB%AA%A8%EB%91%90%20%ED%95%9C%20%EC%B9%B8%20%EC%95%9E%EC%9C%BC%EB%A1%9C%20%EC%9D%B4%EB%8F%99%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20return%20num%0A%0A%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9A%A9%EB%9F%89%20%ED%99%95%EC%9E%A5%22%22%22%0A%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20nums%20%3D%20MyList%28%29%0A%20%20%23%20%EB%A7%A8%20%EB%92%A4%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%B6%94%EA%B0%80%0A%20%20nums.add%281%29%0A%20%20nums.add%283%29%0A%20%20nums.add%282%29%0A%20%20nums.add%285%29%0A%20%20nums.add%284%29%0A%0A%20%20%23%20%EC%A4%91%EA%B0%84%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20nums.insert%286,%20index%3D3%29%0A%0A%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%82%AD%EC%A0%9C%0A%20%20nums.remove%283%29%0A%0A%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20num%20%3D%20nums.get%281%29%0A%0A%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B0%B1%EC%8B%A0%0A%20%20nums.set%280,%201%29%0A%0A%20%20%23%20%EC%9A%A9%EB%9F%89%20%ED%99%95%EC%9E%A5%20%EB%8F%99%EC%9E%91%20%ED%85%8C%EC%8A%A4%ED%8A%B8%0A%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20nums.add%28i%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>
