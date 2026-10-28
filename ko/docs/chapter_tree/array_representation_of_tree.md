---
comments: true
---

# 7.3 &nbsp; 이진 트리의 배열 표현

연결 리스트로 표현할 때 이진 트리의 저장 단위는 노드 `TreeNode`이며, 노드들은 포인터로 연결된다. 앞 절에서는 이 표현을 사용하는 이진 트리의 기본 연산들을 살펴보았다.

그렇다면 배열로도 이진 트리를 표현할 수 있을까? 가능하다.

## 7.3.1 &nbsp; 포화 이진 트리 표현

먼저 간단한 경우를 살펴보자. 포화 이진 트리의 모든 노드를 레벨 순서 순회 순서대로 배열에 저장하면 각 노드는 고유한 배열 인덱스에 대응한다.

레벨 순서 순회의 특성에서 부모와 자식 인덱스 사이의 '매핑 공식'을 도출할 수 있다. **노드의 인덱스가 $i$이면 왼쪽 자식의 인덱스는 $2i + 1$, 오른쪽 자식의 인덱스는 $2i + 2$다**. 아래 그림(7-12)은 노드 인덱스 사이의 매핑 관계를 보여 준다.

![포화 이진 트리의 배열 표현](array_representation_of_tree.assets/array_representation_binary_tree.png){ class="animation-figure" }

<p align="center"> 그림 7-12 &nbsp; 포화 이진 트리의 배열 표현 </p>

**매핑 공식은 연결 리스트의 노드 참조(포인터)와 같은 역할을 한다**. 배열의 임의의 노드가 주어지면 이 공식으로 왼쪽(오른쪽) 자식에 접근할 수 있다.

## 7.3.2 &nbsp; 임의의 이진 트리 표현

포화 이진 트리는 특수한 경우이며, 일반적인 이진 트리의 중간 레벨에는 `None`이 많이 존재한다. 레벨 순서 순회 결과에는 이 `None`들이 포함되지 않으므로 결과만으로는 개수와 위치를 알 수 없다. **즉, 같은 레벨 순서 순회 결과에 여러 이진 트리 구조가 대응할 수 있다**.

아래 그림(7-13)처럼 포화 이진 트리가 아니면 앞의 배열 표현 방법은 더 이상 유효하지 않다.

![하나의 레벨 순서 순회 결과에 대응하는 여러 이진 트리](array_representation_of_tree.assets/array_representation_without_empty.png){ class="animation-figure" }

<p align="center"> 그림 7-13 &nbsp; 하나의 레벨 순서 순회 결과에 대응하는 여러 이진 트리 </p>

이를 해결하려면 **레벨 순서 순회 결과에 모든 `None`을 명시적으로 넣을 수 있다**. 아래 그림(7-14)처럼 처리하면 순회 결과가 이진 트리를 유일하게 나타낸다. 예시 코드는 다음과 같다.

=== "Python"

    ```python title=""
    # 이진 트리의 배열 표현
    # None으로 빈자리 표시
    tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    ```

=== "C++"

    ```cpp title=""
    /* 이진 트리의 배열 표현 */
    // int의 최댓값 INT_MAX로 빈자리 표시
    vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Java"

    ```java title=""
    /* 이진 트리의 배열 표현 */
    // int의 래퍼 클래스 Integer를 사용하면 null로 빈자리를 표시할 수 있다
    Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
    ```

=== "C#"

    ```csharp title=""
    /* 이진 트리의 배열 표현 */
    // 널 허용 타입 int?를 사용하면 null로 빈자리를 표시할 수 있다
    int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Go"

    ```go title=""
    /* 이진 트리의 배열 표현 */
    // any 타입의 슬라이스를 사용하면 nil로 빈자리를 표시할 수 있다
    tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
    ```

=== "Swift"

    ```swift title=""
    /* 이진 트리의 배열 표현 */
    // 널 허용 타입 Int?를 사용하면 nil로 빈자리를 표시할 수 있다
    let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

=== "JS"

    ```javascript title=""
    /* 이진 트리의 배열 표현 */
    // null로 빈자리 표시
    let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "TS"

    ```typescript title=""
    /* 이진 트리의 배열 표현 */
    // null로 빈자리 표시
    let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Dart"

    ```dart title=""
    /* 이진 트리의 배열 표현 */
    // 널 허용 타입 int?를 사용하면 null로 빈자리를 표시할 수 있다
    List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Rust"

    ```rust title=""
    /* 이진 트리의 배열 표현 */
    // None으로 빈자리 표시
    let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
    ```

=== "C"

    ```c title=""
    /* 이진 트리의 배열 표현 */
    // int의 최댓값으로 빈자리를 표시하므로 노드 값은 INT_MAX이면 안 된다
    int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Kotlin"

    ```kotlin title=""
    /* 이진 트리의 배열 표현 */
    // null로 빈자리 표시
    val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
    ```

=== "Ruby"

    ```ruby title=""
    ### 이진 트리의 배열 표현 ###
    # nil로 빈자리 표시
    tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

![임의의 이진 트리의 배열 표현](array_representation_of_tree.assets/array_representation_with_empty.png){ class="animation-figure" }

<p align="center"> 그림 7-14 &nbsp; 임의의 이진 트리의 배열 표현 </p>

**완전 이진 트리는 배열로 표현하기에 매우 적합하다**. 정의를 떠올려 보면 `None`은 맨 아래 레벨의 오른쪽에만 있으므로 **레벨 순서 순회 결과의 끝에만 나타난다**.

따라서 완전 이진 트리를 배열로 표현할 때는 모든 `None`의 저장을 생략할 수 있어 매우 편리하다. 아래 그림(7-15)은 그 예다.

![완전 이진 트리의 배열 표현](array_representation_of_tree.assets/array_representation_complete_binary_tree.png){ class="animation-figure" }

<p align="center"> 그림 7-15 &nbsp; 완전 이진 트리의 배열 표현 </p>

다음 코드는 배열로 표현한 이진 트리를 구현하며 아래 연산들을 포함한다.

- 주어진 노드의 값, 왼쪽(오른쪽) 자식, 부모 노드를 구한다.
- 전위, 중위, 후위, 레벨 순서 순회 결과를 구한다.

=== "Python"

    ```python title="array_binary_tree.py"
    class ArrayBinaryTree:
        """배열로 표현한 이진 트리 클래스"""

        def __init__(self, arr: list[int | None]):
            """생성자"""
            self._tree = list(arr)

        def size(self):
            """리스트 용량"""
            return len(self._tree)

        def val(self, i: int) -> int | None:
            """인덱스가 i인 노드의 값 반환"""
            # 인덱스가 범위를 벗어나면 빈칸을 나타내는 None을 반환한다
            if i < 0 or i >= self.size():
                return None
            return self._tree[i]

        def left(self, i: int) -> int | None:
            """인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환"""
            return 2 * i + 1

        def right(self, i: int) -> int | None:
            """인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환"""
            return 2 * i + 2

        def parent(self, i: int) -> int | None:
            """인덱스가 i인 노드의 부모 노드 인덱스 반환"""
            return (i - 1) // 2

        def level_order(self) -> list[int]:
            """레벨 순서 순회"""
            self.res = []
            # 배열을 직접 순회한다
            for i in range(self.size()):
                if self.val(i) is not None:
                    self.res.append(self.val(i))
            return self.res

        def dfs(self, i: int, order: str):
            """깊이 우선 순회"""
            if self.val(i) is None:
                return
            # 전위 순회
            if order == "pre":
                self.res.append(self.val(i))
            self.dfs(self.left(i), order)
            # 중위 순회
            if order == "in":
                self.res.append(self.val(i))
            self.dfs(self.right(i), order)
            # 후위 순회
            if order == "post":
                self.res.append(self.val(i))

        def pre_order(self) -> list[int]:
            """전위 순회"""
            self.res = []
            self.dfs(0, order="pre")
            return self.res

        def in_order(self) -> list[int]:
            """중위 순회"""
            self.res = []
            self.dfs(0, order="in")
            return self.res

        def post_order(self) -> list[int]:
            """후위 순회"""
            self.res = []
            self.dfs(0, order="post")
            return self.res
    ```

=== "C++"

    ```cpp title="array_binary_tree.cpp"
    /* 배열로 표현한 이진 트리 클래스 */
    class ArrayBinaryTree {
      public:
        /* 생성자 */
        ArrayBinaryTree(vector<int> arr) {
            tree = arr;
        }

        /* 리스트 용량 */
        int size() {
            return tree.size();
        }

        /* 인덱스가 i인 노드의 값 반환 */
        int val(int i) {
            // 인덱스가 범위를 벗어나면 빈자리를 나타내는 INT_MAX를 반환한다
            if (i < 0 || i >= size())
                return INT_MAX;
            return tree[i];
        }

        /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
        int left(int i) {
            return 2 * i + 1;
        }

        /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
        int right(int i) {
            return 2 * i + 2;
        }

        /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
        int parent(int i) {
            return (i - 1) / 2;
        }

        /* 레벨 순서 순회 */
        vector<int> levelOrder() {
            vector<int> res;
            // 배열을 직접 순회한다
            for (int i = 0; i < size(); i++) {
                if (val(i) != INT_MAX)
                    res.push_back(val(i));
            }
            return res;
        }

        /* 전위 순회 */
        vector<int> preOrder() {
            vector<int> res;
            dfs(0, "pre", res);
            return res;
        }

        /* 중위 순회 */
        vector<int> inOrder() {
            vector<int> res;
            dfs(0, "in", res);
            return res;
        }

        /* 후위 순회 */
        vector<int> postOrder() {
            vector<int> res;
            dfs(0, "post", res);
            return res;
        }

      private:
        vector<int> tree;

        /* 깊이 우선 순회 */
        void dfs(int i, string order, vector<int> &res) {
            // 빈칸이면 반환한다
            if (val(i) == INT_MAX)
                return;
            // 전위 순회
            if (order == "pre")
                res.push_back(val(i));
            dfs(left(i), order, res);
            // 중위 순회
            if (order == "in")
                res.push_back(val(i));
            dfs(right(i), order, res);
            // 후위 순회
            if (order == "post")
                res.push_back(val(i));
        }
    };
    ```

=== "Java"

    ```java title="array_binary_tree.java"
    /* 배열로 표현한 이진 트리 클래스 */
    class ArrayBinaryTree {
        private List<Integer> tree;

        /* 생성자 */
        public ArrayBinaryTree(List<Integer> arr) {
            tree = new ArrayList<>(arr);
        }

        /* 리스트 용량 */
        public int size() {
            return tree.size();
        }

        /* 인덱스가 i인 노드의 값 반환 */
        public Integer val(int i) {
            // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
            if (i < 0 || i >= size())
                return null;
            return tree.get(i);
        }

        /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
        public Integer left(int i) {
            return 2 * i + 1;
        }

        /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
        public Integer right(int i) {
            return 2 * i + 2;
        }

        /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
        public Integer parent(int i) {
            return (i - 1) / 2;
        }

        /* 레벨 순서 순회 */
        public List<Integer> levelOrder() {
            List<Integer> res = new ArrayList<>();
            // 배열을 직접 순회한다
            for (int i = 0; i < size(); i++) {
                if (val(i) != null)
                    res.add(val(i));
            }
            return res;
        }

        /* 깊이 우선 순회 */
        private void dfs(Integer i, String order, List<Integer> res) {
            // 빈칸이면 반환한다
            if (val(i) == null)
                return;
            // 전위 순회
            if ("pre".equals(order))
                res.add(val(i));
            dfs(left(i), order, res);
            // 중위 순회
            if ("in".equals(order))
                res.add(val(i));
            dfs(right(i), order, res);
            // 후위 순회
            if ("post".equals(order))
                res.add(val(i));
        }

        /* 전위 순회 */
        public List<Integer> preOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "pre", res);
            return res;
        }

        /* 중위 순회 */
        public List<Integer> inOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "in", res);
            return res;
        }

        /* 후위 순회 */
        public List<Integer> postOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "post", res);
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_binary_tree.cs"
    /* 배열로 표현한 이진 트리 클래스 */
    class ArrayBinaryTree(List<int?> arr) {
        List<int?> tree = new(arr);

        /* 리스트 용량 */
        public int Size() {
            return tree.Count;
        }

        /* 인덱스가 i인 노드의 값 반환 */
        public int? Val(int i) {
            // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
            if (i < 0 || i >= Size())
                return null;
            return tree[i];
        }

        /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
        public int Left(int i) {
            return 2 * i + 1;
        }

        /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
        public int Right(int i) {
            return 2 * i + 2;
        }

        /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
        public int Parent(int i) {
            return (i - 1) / 2;
        }

        /* 레벨 순서 순회 */
        public List<int> LevelOrder() {
            List<int> res = [];
            // 배열을 직접 순회한다
            for (int i = 0; i < Size(); i++) {
                if (Val(i).HasValue)
                    res.Add(Val(i)!.Value);
            }
            return res;
        }

        /* 깊이 우선 순회 */
        void DFS(int i, string order, List<int> res) {
            // 빈칸이면 반환한다
            if (!Val(i).HasValue)
                return;
            // 전위 순회
            if (order == "pre")
                res.Add(Val(i)!.Value);
            DFS(Left(i), order, res);
            // 중위 순회
            if (order == "in")
                res.Add(Val(i)!.Value);
            DFS(Right(i), order, res);
            // 후위 순회
            if (order == "post")
                res.Add(Val(i)!.Value);
        }

        /* 전위 순회 */
        public List<int> PreOrder() {
            List<int> res = [];
            DFS(0, "pre", res);
            return res;
        }

        /* 중위 순회 */
        public List<int> InOrder() {
            List<int> res = [];
            DFS(0, "in", res);
            return res;
        }

        /* 후위 순회 */
        public List<int> PostOrder() {
            List<int> res = [];
            DFS(0, "post", res);
            return res;
        }
    }
    ```

=== "Go"

    ```go title="array_binary_tree.go"
    /* 배열로 표현한 이진 트리 클래스 */
    type arrayBinaryTree struct {
        tree []any
    }

    /* 생성자 */
    func newArrayBinaryTree(arr []any) *arrayBinaryTree {
        return &arrayBinaryTree{
            tree: arr,
        }
    }

    /* 리스트 용량 */
    func (abt *arrayBinaryTree) size() int {
        return len(abt.tree)
    }

    /* 인덱스가 i인 노드의 값 반환 */
    func (abt *arrayBinaryTree) val(i int) any {
        // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
        if i < 0 || i >= abt.size() {
            return nil
        }
        return abt.tree[i]
    }

    /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
    func (abt *arrayBinaryTree) left(i int) int {
        return 2*i + 1
    }

    /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
    func (abt *arrayBinaryTree) right(i int) int {
        return 2*i + 2
    }

    /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
    func (abt *arrayBinaryTree) parent(i int) int {
        return (i - 1) / 2
    }

    /* 레벨 순서 순회 */
    func (abt *arrayBinaryTree) levelOrder() []any {
        var res []any
        // 배열을 직접 순회한다
        for i := 0; i < abt.size(); i++ {
            if abt.val(i) != nil {
                res = append(res, abt.val(i))
            }
        }
        return res
    }

    /* 깊이 우선 순회 */
    func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
        // 빈칸이면 반환한다
        if abt.val(i) == nil {
            return
        }
        // 전위 순회
        if order == "pre" {
            *res = append(*res, abt.val(i))
        }
        abt.dfs(abt.left(i), order, res)
        // 중위 순회
        if order == "in" {
            *res = append(*res, abt.val(i))
        }
        abt.dfs(abt.right(i), order, res)
        // 후위 순회
        if order == "post" {
            *res = append(*res, abt.val(i))
        }
    }

    /* 전위 순회 */
    func (abt *arrayBinaryTree) preOrder() []any {
        var res []any
        abt.dfs(0, "pre", &res)
        return res
    }

    /* 중위 순회 */
    func (abt *arrayBinaryTree) inOrder() []any {
        var res []any
        abt.dfs(0, "in", &res)
        return res
    }

    /* 후위 순회 */
    func (abt *arrayBinaryTree) postOrder() []any {
        var res []any
        abt.dfs(0, "post", &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="array_binary_tree.swift"
    /* 배열로 표현한 이진 트리 클래스 */
    class ArrayBinaryTree {
        private var tree: [Int?]

        /* 생성자 */
        init(arr: [Int?]) {
            tree = arr
        }

        /* 리스트 용량 */
        func size() -> Int {
            tree.count
        }

        /* 인덱스가 i인 노드의 값 반환 */
        func val(i: Int) -> Int? {
            // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
            if i < 0 || i >= size() {
                return nil
            }
            return tree[i]
        }

        /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
        func left(i: Int) -> Int {
            2 * i + 1
        }

        /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
        func right(i: Int) -> Int {
            2 * i + 2
        }

        /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
        func parent(i: Int) -> Int {
            (i - 1) / 2
        }

        /* 레벨 순서 순회 */
        func levelOrder() -> [Int] {
            var res: [Int] = []
            // 배열을 직접 순회한다
            for i in 0 ..< size() {
                if let val = val(i: i) {
                    res.append(val)
                }
            }
            return res
        }

        /* 깊이 우선 순회 */
        private func dfs(i: Int, order: String, res: inout [Int]) {
            // 빈칸이면 반환한다
            guard let val = val(i: i) else {
                return
            }
            // 전위 순회
            if order == "pre" {
                res.append(val)
            }
            dfs(i: left(i: i), order: order, res: &res)
            // 중위 순회
            if order == "in" {
                res.append(val)
            }
            dfs(i: right(i: i), order: order, res: &res)
            // 후위 순회
            if order == "post" {
                res.append(val)
            }
        }

        /* 전위 순회 */
        func preOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "pre", res: &res)
            return res
        }

        /* 중위 순회 */
        func inOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "in", res: &res)
            return res
        }

        /* 후위 순회 */
        func postOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "post", res: &res)
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="array_binary_tree.js"
    /* 배열로 표현한 이진 트리 클래스 */
    class ArrayBinaryTree {
        #tree;

        /* 생성자 */
        constructor(arr) {
            this.#tree = arr;
        }

        /* 리스트 용량 */
        size() {
            return this.#tree.length;
        }

        /* 인덱스가 i인 노드의 값 반환 */
        val(i) {
            // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
        left(i) {
            return 2 * i + 1;
        }

        /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
        right(i) {
            return 2 * i + 2;
        }

        /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
        parent(i) {
            return Math.floor((i - 1) / 2); // 나눗셈의 결과를 내림한다
        }

        /* 레벨 순서 순회 */
        levelOrder() {
            let res = [];
            // 배열을 직접 순회한다
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* 깊이 우선 순회 */
        #dfs(i, order, res) {
            // 빈칸이면 반환한다
            if (this.val(i) === null) return;
            // 전위 순회
            if (order === 'pre') res.push(this.val(i));
            this.#dfs(this.left(i), order, res);
            // 중위 순회
            if (order === 'in') res.push(this.val(i));
            this.#dfs(this.right(i), order, res);
            // 후위 순회
            if (order === 'post') res.push(this.val(i));
        }

        /* 전위 순회 */
        preOrder() {
            const res = [];
            this.#dfs(0, 'pre', res);
            return res;
        }

        /* 중위 순회 */
        inOrder() {
            const res = [];
            this.#dfs(0, 'in', res);
            return res;
        }

        /* 후위 순회 */
        postOrder() {
            const res = [];
            this.#dfs(0, 'post', res);
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="array_binary_tree.ts"
    /* 배열로 표현한 이진 트리 클래스 */
    class ArrayBinaryTree {
        #tree: (number | null)[];

        /* 생성자 */
        constructor(arr: (number | null)[]) {
            this.#tree = arr;
        }

        /* 리스트 용량 */
        size(): number {
            return this.#tree.length;
        }

        /* 인덱스가 i인 노드의 값 반환 */
        val(i: number): number | null {
            // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
        left(i: number): number {
            return 2 * i + 1;
        }

        /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
        right(i: number): number {
            return 2 * i + 2;
        }

        /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
        parent(i: number): number {
            return Math.floor((i - 1) / 2); // 나눗셈의 결과를 내림한다
        }

        /* 레벨 순서 순회 */
        levelOrder(): number[] {
            let res = [];
            // 배열을 직접 순회한다
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* 깊이 우선 순회 */
        #dfs(i: number, order: Order, res: (number | null)[]): void {
            // 빈칸이면 반환한다
            if (this.val(i) === null) return;
            // 전위 순회
            if (order === 'pre') res.push(this.val(i));
            this.#dfs(this.left(i), order, res);
            // 중위 순회
            if (order === 'in') res.push(this.val(i));
            this.#dfs(this.right(i), order, res);
            // 후위 순회
            if (order === 'post') res.push(this.val(i));
        }

        /* 전위 순회 */
        preOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'pre', res);
            return res;
        }

        /* 중위 순회 */
        inOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'in', res);
            return res;
        }

        /* 후위 순회 */
        postOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'post', res);
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="array_binary_tree.dart"
    /* 배열로 표현한 이진 트리 클래스 */
    class ArrayBinaryTree {
      late List<int?> _tree;

      /* 생성자 */
      ArrayBinaryTree(this._tree);

      /* 리스트 용량 */
      int size() {
        return _tree.length;
      }

      /* 인덱스가 i인 노드의 값 반환 */
      int? val(int i) {
        // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
        if (i < 0 || i >= size()) {
          return null;
        }
        return _tree[i];
      }

      /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
      int? left(int i) {
        return 2 * i + 1;
      }

      /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
      int? right(int i) {
        return 2 * i + 2;
      }

      /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
      int? parent(int i) {
        return (i - 1) ~/ 2;
      }

      /* 레벨 순서 순회 */
      List<int> levelOrder() {
        List<int> res = [];
        for (int i = 0; i < size(); i++) {
          if (val(i) != null) {
            res.add(val(i)!);
          }
        }
        return res;
      }

      /* 깊이 우선 순회 */
      void dfs(int i, String order, List<int?> res) {
        // 빈칸이면 반환한다
        if (val(i) == null) {
          return;
        }
        // 전위 순회
        if (order == 'pre') {
          res.add(val(i));
        }
        dfs(left(i)!, order, res);
        // 중위 순회
        if (order == 'in') {
          res.add(val(i));
        }
        dfs(right(i)!, order, res);
        // 후위 순회
        if (order == 'post') {
          res.add(val(i));
        }
      }

      /* 전위 순회 */
      List<int?> preOrder() {
        List<int?> res = [];
        dfs(0, 'pre', res);
        return res;
      }

      /* 중위 순회 */
      List<int?> inOrder() {
        List<int?> res = [];
        dfs(0, 'in', res);
        return res;
      }

      /* 후위 순회 */
      List<int?> postOrder() {
        List<int?> res = [];
        dfs(0, 'post', res);
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="array_binary_tree.rs"
    /* 배열로 표현한 이진 트리 클래스 */
    struct ArrayBinaryTree {
        tree: Vec<Option<i32>>,
    }

    impl ArrayBinaryTree {
        /* 생성자 */
        fn new(arr: Vec<Option<i32>>) -> Self {
            Self { tree: arr }
        }

        /* 리스트 용량 */
        fn size(&self) -> i32 {
            self.tree.len() as i32
        }

        /* 인덱스가 i인 노드의 값 반환 */
        fn val(&self, i: i32) -> Option<i32> {
            // 인덱스가 범위를 벗어나면 빈칸을 나타내는 None을 반환한다
            if i < 0 || i >= self.size() {
                None
            } else {
                self.tree[i as usize]
            }
        }

        /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
        fn left(&self, i: i32) -> i32 {
            2 * i + 1
        }

        /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
        fn right(&self, i: i32) -> i32 {
            2 * i + 2
        }

        /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
        fn parent(&self, i: i32) -> i32 {
            (i - 1) / 2
        }

        /* 레벨 순서 순회 */
        fn level_order(&self) -> Vec<i32> {
            self.tree.iter().filter_map(|&x| x).collect()
        }

        /* 깊이 우선 순회 */
        fn dfs(&self, i: i32, order: &'static str, res: &mut Vec<i32>) {
            if self.val(i).is_none() {
                return;
            }
            let val = self.val(i).unwrap();
            // 전위 순회
            if order == "pre" {
                res.push(val);
            }
            self.dfs(self.left(i), order, res);
            // 중위 순회
            if order == "in" {
                res.push(val);
            }
            self.dfs(self.right(i), order, res);
            // 후위 순회
            if order == "post" {
                res.push(val);
            }
        }

        /* 전위 순회 */
        fn pre_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "pre", &mut res);
            res
        }

        /* 중위 순회 */
        fn in_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "in", &mut res);
            res
        }

        /* 후위 순회 */
        fn post_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "post", &mut res);
            res
        }
    }
    ```

=== "C"

    ```c title="array_binary_tree.c"
    /* 배열로 표현한 이진 트리 구조체 */
    typedef struct {
        int *tree;
        int size;
    } ArrayBinaryTree;

    /* 생성자 */
    ArrayBinaryTree *newArrayBinaryTree(int *arr, int arrSize) {
        ArrayBinaryTree *abt = (ArrayBinaryTree *)malloc(sizeof(ArrayBinaryTree));
        abt->tree = malloc(sizeof(int) * arrSize);
        memcpy(abt->tree, arr, sizeof(int) * arrSize);
        abt->size = arrSize;
        return abt;
    }

    /* 소멸자 */
    void delArrayBinaryTree(ArrayBinaryTree *abt) {
        free(abt->tree);
        free(abt);
    }

    /* 리스트 용량 */
    int size(ArrayBinaryTree *abt) {
        return abt->size;
    }

    /* 인덱스가 i인 노드의 값 반환 */
    int val(ArrayBinaryTree *abt, int i) {
        // 인덱스가 범위를 벗어나면 빈자리를 나타내는 INT_MAX를 반환한다
        if (i < 0 || i >= size(abt))
            return INT_MAX;
        return abt->tree[i];
    }

    /* 레벨 순서 순회 */
    int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        // 배열을 직접 순회한다
        for (int i = 0; i < size(abt); i++) {
            if (val(abt, i) != INT_MAX)
                res[index++] = val(abt, i);
        }
        *returnSize = index;
        return res;
    }

    /* 깊이 우선 순회 */
    void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
        // 빈칸이면 반환한다
        if (val(abt, i) == INT_MAX)
            return;
        // 전위 순회
        if (strcmp(order, "pre") == 0)
            res[(*index)++] = val(abt, i);
        dfs(abt, left(i), order, res, index);
        // 중위 순회
        if (strcmp(order, "in") == 0)
            res[(*index)++] = val(abt, i);
        dfs(abt, right(i), order, res, index);
        // 후위 순회
        if (strcmp(order, "post") == 0)
            res[(*index)++] = val(abt, i);
    }

    /* 전위 순회 */
    int *preOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        dfs(abt, 0, "pre", res, &index);
        *returnSize = index;
        return res;
    }

    /* 중위 순회 */
    int *inOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        dfs(abt, 0, "in", res, &index);
        *returnSize = index;
        return res;
    }

    /* 후위 순회 */
    int *postOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        dfs(abt, 0, "post", res, &index);
        *returnSize = index;
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="array_binary_tree.kt"
    /* 배열로 표현한 이진 트리 클래스 */
    class ArrayBinaryTree(val tree: MutableList<Int?>) {
        /* 리스트 용량 */
        fun size(): Int {
            return tree.size
        }

        /* 인덱스가 i인 노드의 값 반환 */
        fun _val(i: Int): Int? {
            // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
            if (i < 0 || i >= size()) return null
            return tree[i]
        }

        /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
        fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
        fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
        fun parent(i: Int): Int {
            return (i - 1) / 2
        }

        /* 레벨 순서 순회 */
        fun levelOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            // 배열을 직접 순회한다
            for (i in 0..<size()) {
                if (_val(i) != null)
                    res.add(_val(i))
            }
            return res
        }

        /* 깊이 우선 순회 */
        fun dfs(i: Int, order: String, res: MutableList<Int?>) {
            // 빈칸이면 반환한다
            if (_val(i) == null)
                return
            // 전위 순회
            if ("pre" == order)
                res.add(_val(i))
            dfs(left(i), order, res)
            // 중위 순회
            if ("in" == order)
                res.add(_val(i))
            dfs(right(i), order, res)
            // 후위 순회
            if ("post" == order)
                res.add(_val(i))
        }

        /* 전위 순회 */
        fun preOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "pre", res)
            return res
        }

        /* 중위 순회 */
        fun inOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "in", res)
            return res
        }

        /* 후위 순회 */
        fun postOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "post", res)
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_binary_tree.rb"
    ### 배열로 표현한 이진 트리 클래스 ###
    class ArrayBinaryTree
      ### 생성자 ###
      def initialize(arr)
        @tree = arr.to_a
      end

      ### 리스트 용량 ###
      def size
        @tree.length
      end

      ### 인덱스가 i인 노드의 값 반환 ###
      def val(i)
        # 인덱스가 범위를 벗어나면 빈칸을 나타내는 nil을 반환한다
        return if i < 0 || i >= size

        @tree[i]
      end

      ### 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 ###
      def left(i)
        2 * i + 1
      end

      ### 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 ###
      def right(i)
        2 * i + 2
      end

      ### 인덱스가 i인 노드의 부모 노드 인덱스 반환 ###
      def parent(i)
        (i - 1) / 2
      end

      ### 레벨 순서 순회 ###
      def level_order
        @res = []

        # 배열을 직접 순회한다
        for i in 0...size
          @res << val(i) unless val(i).nil?
        end

        @res
      end

      ### 깊이 우선 순회 ###
      def dfs(i, order)
        return if val(i).nil?
        # 전위 순회
        @res << val(i) if order == :pre
        dfs(left(i), order)
        # 중위 순회
        @res << val(i) if order == :in
        dfs(right(i), order)
        # 후위 순회
        @res << val(i) if order == :post
      end

      ### 전위 순회 ###
      def pre_order
        @res = []
        dfs(0, :pre)
        @res
      end

      ### 중위 순회 ###
      def in_order
        @res = []
        dfs(0, :in)
        @res
      end

      ### 후위 순회 ###
      def post_order
        @res = []
        dfs(0, :post)
        @res
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20ArrayBinaryTree%3A%0A%20%20%22%22%22%EB%B0%B0%EC%97%B4%EB%A1%9C%20%ED%91%9C%ED%98%84%ED%95%9C%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%0A%20%20def%20__init__%28self,%20arr%3A%20list%5Bint%20%7C%20None%5D%29%3A%0A%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20self._tree%20%3D%20list%28arr%29%0A%0A%20%20def%20size%28self%29%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9A%A9%EB%9F%89%22%22%22%0A%20%20%20%20return%20len%28self._tree%29%0A%0A%20%20def%20val%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20i%EC%9D%B8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EA%B0%92%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20return%20None%0A%20%20%20%20return%20self._tree%5Bi%5D%0A%0A%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20return%20%28i%20-%201%29%20//%202%0A%0A%20%20def%20level_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%EB%A0%88%EB%B2%A8%20%EC%88%9C%EC%84%9C%20%EC%88%9C%ED%9A%8C%22%22%22%0A%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%23%20%EB%B0%B0%EC%97%B4%EC%9D%84%20%EC%A7%81%EC%A0%91%20%EC%88%9C%ED%9A%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20if%20self.val%28i%29%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20return%20self.res%0A%0A%20%20def%20dfs%28self,%20i%3A%20int,%20order%3A%20str%29%3A%0A%20%20%20%20%22%22%22%EA%B9%8A%EC%9D%B4%20%EC%9A%B0%EC%84%A0%20%EC%88%9C%ED%9A%8C%22%22%22%0A%20%20%20%20if%20self.val%28i%29%20is%20None%3A%0A%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20if%20order%20%3D%3D%20%22pre%22%3A%0A%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20self.dfs%28self.left%28i%29,%20order%29%0A%20%20%20%20%23%20%EC%A4%91%EC%9C%84%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20if%20order%20%3D%3D%20%22in%22%3A%0A%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20self.dfs%28self.right%28i%29,%20order%29%0A%20%20%20%20%23%20%ED%9B%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20if%20order%20%3D%3D%20%22post%22%3A%0A%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%0A%20%20def%20pre_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%22%22%22%0A%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20self.dfs%280,%20order%3D%22pre%22%29%0A%20%20%20%20return%20self.res%0A%0A%20%20def%20in_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%EC%A4%91%EC%9C%84%20%EC%88%9C%ED%9A%8C%22%22%22%0A%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20self.dfs%280,%20order%3D%22in%22%29%0A%20%20%20%20return%20self.res%0A%0A%20%20def%20post_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%ED%9B%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%22%22%22%0A%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20self.dfs%280,%20order%3D%22post%22%29%0A%20%20%20%20return%20self.res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20arr%20%3D%20%5B1,%202,%203,%204,%20None,%206,%20None%5D%0A%20%20abt%20%3D%20ArrayBinaryTree%28arr%29%0A%0A%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%A0%91%EA%B7%BC%0A%20%20i%20%3D%201%0A%20%20l,%20r,%20p%20%3D%20abt.left%28i%29,%20abt.right%28i%29,%20abt.parent%28i%29%0A%0A%20%20%23%20%ED%8A%B8%EB%A6%AC%20%EC%88%9C%ED%9A%8C%0A%20%20res%20%3D%20abt.level_order%28%29%0A%20%20res%20%3D%20abt.pre_order%28%29%0A%20%20res%20%3D%20abt.in_order%28%29%0A%20%20res%20%3D%20abt.post_order%28%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20ArrayBinaryTree%3A%0A%20%20%22%22%22%EB%B0%B0%EC%97%B4%EB%A1%9C%20%ED%91%9C%ED%98%84%ED%95%9C%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%0A%20%20def%20__init__%28self,%20arr%3A%20list%5Bint%20%7C%20None%5D%29%3A%0A%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20self._tree%20%3D%20list%28arr%29%0A%0A%20%20def%20size%28self%29%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9A%A9%EB%9F%89%22%22%22%0A%20%20%20%20return%20len%28self._tree%29%0A%0A%20%20def%20val%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20i%EC%9D%B8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EA%B0%92%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20return%20None%0A%20%20%20%20return%20self._tree%5Bi%5D%0A%0A%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20return%20%28i%20-%201%29%20//%202%0A%0A%20%20def%20level_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%EB%A0%88%EB%B2%A8%20%EC%88%9C%EC%84%9C%20%EC%88%9C%ED%9A%8C%22%22%22%0A%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%23%20%EB%B0%B0%EC%97%B4%EC%9D%84%20%EC%A7%81%EC%A0%91%20%EC%88%9C%ED%9A%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20if%20self.val%28i%29%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20return%20self.res%0A%0A%20%20def%20dfs%28self,%20i%3A%20int,%20order%3A%20str%29%3A%0A%20%20%20%20%22%22%22%EA%B9%8A%EC%9D%B4%20%EC%9A%B0%EC%84%A0%20%EC%88%9C%ED%9A%8C%22%22%22%0A%20%20%20%20if%20self.val%28i%29%20is%20None%3A%0A%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20if%20order%20%3D%3D%20%22pre%22%3A%0A%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20self.dfs%28self.left%28i%29,%20order%29%0A%20%20%20%20%23%20%EC%A4%91%EC%9C%84%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20if%20order%20%3D%3D%20%22in%22%3A%0A%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20self.dfs%28self.right%28i%29,%20order%29%0A%20%20%20%20%23%20%ED%9B%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20if%20order%20%3D%3D%20%22post%22%3A%0A%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%0A%20%20def%20pre_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%22%22%22%0A%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20self.dfs%280,%20order%3D%22pre%22%29%0A%20%20%20%20return%20self.res%0A%0A%20%20def%20in_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%EC%A4%91%EC%9C%84%20%EC%88%9C%ED%9A%8C%22%22%22%0A%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20self.dfs%280,%20order%3D%22in%22%29%0A%20%20%20%20return%20self.res%0A%0A%20%20def%20post_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%ED%9B%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%22%22%22%0A%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20self.dfs%280,%20order%3D%22post%22%29%0A%20%20%20%20return%20self.res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20arr%20%3D%20%5B1,%202,%203,%204,%20None,%206,%20None%5D%0A%20%20abt%20%3D%20ArrayBinaryTree%28arr%29%0A%0A%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%A0%91%EA%B7%BC%0A%20%20i%20%3D%201%0A%20%20l,%20r,%20p%20%3D%20abt.left%28i%29,%20abt.right%28i%29,%20abt.parent%28i%29%0A%0A%20%20%23%20%ED%8A%B8%EB%A6%AC%20%EC%88%9C%ED%9A%8C%0A%20%20res%20%3D%20abt.level_order%28%29%0A%20%20res%20%3D%20abt.pre_order%28%29%0A%20%20res%20%3D%20abt.in_order%28%29%0A%20%20res%20%3D%20abt.post_order%28%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 7.3.3 &nbsp; 장점과 한계

이진 트리의 배열 표현에는 다음 장점이 있다.

- 배열은 연속된 메모리에 저장되어 캐시 친화적이며, 접근과 순회가 빠르다.
- 포인터를 저장할 필요가 없어 공간을 절약한다.
- 노드에 임의 접근할 수 있다.

하지만 다음과 같은 한계도 있다.

- 연속된 메모리가 필요하므로 데이터가 지나치게 많은 트리를 저장하기에는 적합하지 않다.
- 노드를 추가하거나 삭제하려면 배열의 삽입과 삭제 연산을 수행해야 하므로 효율이 낮다.
- 트리에 `None`이 많으면 배열에서 실제 노드 데이터가 차지하는 비율이 낮아 공간 활용률이 떨어진다.
