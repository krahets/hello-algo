---
comments: true
---

# 12.3 &nbsp; 이진 트리 구성 문제

!!! question "문제"

    이진 트리의 전위 순회 `preorder`와 중위 순회 `inorder`가 주어진다. 이를 이용해 이진 트리를 구성하고 루트 노드를 반환하라. 트리에는 값이 중복되는 노드가 없다고 가정한다(아래 그림(12-5) 참고).

![이진 트리 구성 예시 데이터](build_binary_tree_problem.assets/build_tree_example.png){ class="animation-figure" }

<p align="center"> 그림 12-5 &nbsp; 이진 트리 구성 예시 데이터 </p>

### 1. &nbsp; 분할 정복 문제인지 판단

원래 문제는 `preorder`와 `inorder`로 이진 트리를 구성하는 것으로, 전형적인 분할 정복 문제다.

- **문제를 나눌 수 있다**: 원래 문제를 왼쪽 서브트리 구성과 오른쪽 서브트리 구성이라는 두 부분 문제로 나누고, 루트 노드 초기화 연산을 하나 더할 수 있다. 각 서브트리(부분 문제)에도 같은 방법을 적용해 더 작은 서브트리(부분 문제)로 나눌 수 있으며, 가장 작은 부분 문제인 빈 서브트리에 도달하면 종료한다.
- **부분 문제가 독립적이다**: 왼쪽 서브트리와 오른쪽 서브트리는 겹치는 부분 없이 서로 독립적이다. 왼쪽 서브트리를 구성할 때는 중위 순회와 전위 순회에서 왼쪽 서브트리에 해당하는 부분만 보면 된다. 오른쪽도 마찬가지다.
- **부분 문제의 해를 합칠 수 있다**: 왼쪽 서브트리와 오른쪽 서브트리(부분 문제의 해)를 얻으면 루트 노드에 연결하여 원래 문제의 해를 만들 수 있다.

### 2. &nbsp; 서브트리를 나누는 방법

위 분석에 따르면 분할 정복으로 해결할 수 있다. **그런데 전위 순회 `preorder`와 중위 순회 `inorder`로 왼쪽과 오른쪽 서브트리를 어떻게 나눌까**?

정의에 따르면 `preorder`와 `inorder`는 모두 세 부분으로 나뉜다.

- 전위 순회: `[ 루트 노드 | 왼쪽 서브트리 | 오른쪽 서브트리 ]`. 예를 들어 위 그림(12-5)의 트리는 `[ 3 | 9 | 2 1 7 ]`에 해당한다.
- 중위 순회: `[ 왼쪽 서브트리 | 루트 노드 | 오른쪽 서브트리 ]`. 예를 들어 위 그림(12-5)의 트리는 `[ 9 | 3 | 1 2 7 ]`에 해당한다.

위 그림(12-5)의 데이터를 예로 들면 다음 그림(12-6)의 단계로 나눌 수 있다.

1. 전위 순회의 첫 원소 3은 루트 노드의 값이다.
2. `inorder`에서 루트 노드 3의 인덱스를 찾아 이를 기준으로 `inorder`를 `[ 9 | 3 | 1 2 7 ]`로 나눈다.
3. `inorder`의 분할 결과로 왼쪽 서브트리의 노드 수는 1, 오른쪽은 3임을 알 수 있다. 따라서 `preorder`를 `[ 3 | 9 | 2 1 7 ]`로 나눌 수 있다.

![전위 순회와 중위 순회에서 서브트리 나누기](build_binary_tree_problem.assets/build_tree_preorder_inorder_division.png){ class="animation-figure" }

<p align="center"> 그림 12-6 &nbsp; 전위 순회와 중위 순회에서 서브트리 나누기 </p>

### 3. &nbsp; 변수로 서브트리 구간 표현

위 방법으로 **`preorder`와 `inorder`에서 루트 노드, 왼쪽 서브트리, 오른쪽 서브트리의 인덱스 구간을 구했다**. 이 구간들을 표현하려면 몇 개의 포인터 변수가 필요하다.

- 현재 트리의 루트 노드가 `preorder`에서 갖는 인덱스를 $i$라고 한다.
- 현재 트리의 루트 노드가 `inorder`에서 갖는 인덱스를 $m$이라고 한다.
- 현재 트리가 `inorder`에서 차지하는 인덱스 구간을 $[l, r]$이라고 한다.

아래 표(12-1)와 같이 이 변수들로 `preorder`에서 루트 노드의 인덱스와 `inorder`에서 서브트리의 인덱스 구간을 나타낼 수 있다.

<p align="center"> 표 12-1 &nbsp; 전위 순회와 중위 순회에서 루트 노드와 서브트리의 인덱스 </p>

<div class="center-table" markdown>

|        | `preorder`에서 루트 노드의 인덱스 | `inorder`에서 서브트리의 인덱스 구간 |
| ------ | ---------------------------- | ----------------------------- |
| 현재 트리 | $i$                          | $[l, r]$                      |
| 왼쪽 서브트리 | $i + 1$                      | $[l, m-1]$                    |
| 오른쪽 서브트리 | $i + 1 + (m - l)$            | $[m+1, r]$                    |

</div>

오른쪽 서브트리의 루트 인덱스에 있는 $(m-l)$은 '왼쪽 서브트리의 노드 수'를 뜻한다. 아래 그림(12-7)과 함께 이해해 보자.

![루트 노드와 양쪽 서브트리의 인덱스 구간 표현](build_binary_tree_problem.assets/build_tree_division_pointers.png){ class="animation-figure" }

<p align="center"> 그림 12-7 &nbsp; 루트 노드와 양쪽 서브트리의 인덱스 구간 표현 </p>

### 4. &nbsp; 코드 구현

$m$을 더 효율적으로 조회하기 위해 해시 테이블 `hmap`에 배열 `inorder`의 원소와 인덱스 사이의 매핑을 저장한다.

=== "Python"

    ```python title="build_tree.py"
    def dfs(
        preorder: list[int],
        inorder_map: dict[int, int],
        i: int,
        l: int,
        r: int,
    ) -> TreeNode | None:
        """이진 트리 구성: 분할 정복"""
        # 서브트리 구간이 비어 있으면 종료한다
        if r - l < 0:
            return None
        # 루트 노드를 초기화한다
        root = TreeNode(preorder[i])
        # m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        m = inorder_map[preorder[i]]
        # 부분 문제: 왼쪽 서브트리 구성
        root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
        # 부분 문제: 오른쪽 서브트리 구성
        root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
        # 루트 노드를 반환한다
        return root

    def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
        """이진 트리 구성"""
        # inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        inorder_map = {val: i for i, val in enumerate(inorder)}
        root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
        return root
    ```

=== "C++"

    ```cpp title="build_tree.cpp"
    /* 이진 트리 구성: 분할 정복 */
    TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
        // 서브트리 구간이 비어 있으면 종료한다
        if (r - l < 0)
            return NULL;
        // 루트 노드를 초기화한다
        TreeNode *root = new TreeNode(preorder[i]);
        // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        int m = inorderMap[preorder[i]];
        // 부분 문제: 왼쪽 서브트리 구성
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 부분 문제: 오른쪽 서브트리 구성
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 루트 노드를 반환한다
        return root;
    }

    /* 이진 트리 구성 */
    TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
        // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        unordered_map<int, int> inorderMap;
        for (int i = 0; i < inorder.size(); i++) {
            inorderMap[inorder[i]] = i;
        }
        TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
        return root;
    }
    ```

=== "Java"

    ```java title="build_tree.java"
    /* 이진 트리 구성: 분할 정복 */
    TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // 서브트리 구간이 비어 있으면 종료한다
        if (r - l < 0)
            return null;
        // 루트 노드를 초기화한다
        TreeNode root = new TreeNode(preorder[i]);
        // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        int m = inorderMap.get(preorder[i]);
        // 부분 문제: 왼쪽 서브트리 구성
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 부분 문제: 오른쪽 서브트리 구성
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 루트 노드를 반환한다
        return root;
    }

    /* 이진 트리 구성 */
    TreeNode buildTree(int[] preorder, int[] inorder) {
        // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        Map<Integer, Integer> inorderMap = new HashMap<>();
        for (int i = 0; i < inorder.length; i++) {
            inorderMap.put(inorder[i], i);
        }
        TreeNode root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
        return root;
    }
    ```

=== "C#"

    ```csharp title="build_tree.cs"
    /* 이진 트리 구성: 분할 정복 */
    TreeNode? DFS(int[] preorder, Dictionary<int, int> inorderMap, int i, int l, int r) {
        // 서브트리 구간이 비어 있으면 종료한다
        if (r - l < 0)
            return null;
        // 루트 노드를 초기화한다
        TreeNode root = new(preorder[i]);
        // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        int m = inorderMap[preorder[i]];
        // 부분 문제: 왼쪽 서브트리 구성
        root.left = DFS(preorder, inorderMap, i + 1, l, m - 1);
        // 부분 문제: 오른쪽 서브트리 구성
        root.right = DFS(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 루트 노드를 반환한다
        return root;
    }

    /* 이진 트리 구성 */
    TreeNode? BuildTree(int[] preorder, int[] inorder) {
        // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        Dictionary<int, int> inorderMap = [];
        for (int i = 0; i < inorder.Length; i++) {
            inorderMap.TryAdd(inorder[i], i);
        }
        TreeNode? root = DFS(preorder, inorderMap, 0, 0, inorder.Length - 1);
        return root;
    }
    ```

=== "Go"

    ```go title="build_tree.go"
    /* 이진 트리 구성: 분할 정복 */
    func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
        // 서브트리 구간이 비어 있으면 종료한다
        if r-l < 0 {
            return nil
        }
        // 루트 노드를 초기화한다
        root := NewTreeNode(preorder[i])
        // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        m := inorderMap[preorder[i]]
        // 부분 문제: 왼쪽 서브트리 구성
        root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
        // 부분 문제: 오른쪽 서브트리 구성
        root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
        // 루트 노드를 반환한다
        return root
    }

    /* 이진 트리 구성 */
    func buildTree(preorder, inorder []int) *TreeNode {
        // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        inorderMap := make(map[int]int, len(inorder))
        for i := 0; i < len(inorder); i++ {
            inorderMap[inorder[i]] = i
        }

        root := dfsBuildTree(preorder, inorderMap, 0, 0, len(inorder)-1)
        return root
    }
    ```

=== "Swift"

    ```swift title="build_tree.swift"
    /* 이진 트리 구성: 분할 정복 */
    func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
        // 서브트리 구간이 비어 있으면 종료한다
        if r - l < 0 {
            return nil
        }
        // 루트 노드를 초기화한다
        let root = TreeNode(x: preorder[i])
        // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        let m = inorderMap[preorder[i]]!
        // 부분 문제: 왼쪽 서브트리 구성
        root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
        // 부분 문제: 오른쪽 서브트리 구성
        root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
        // 루트 노드를 반환한다
        return root
    }

    /* 이진 트리 구성 */
    func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
        // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
        return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
    }
    ```

=== "JS"

    ```javascript title="build_tree.js"
    /* 이진 트리 구성: 분할 정복 */
    function dfs(preorder, inorderMap, i, l, r) {
        // 서브트리 구간이 비어 있으면 종료한다
        if (r - l < 0) return null;
        // 루트 노드를 초기화한다
        const root = new TreeNode(preorder[i]);
        // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        const m = inorderMap.get(preorder[i]);
        // 부분 문제: 왼쪽 서브트리 구성
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 부분 문제: 오른쪽 서브트리 구성
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 루트 노드를 반환한다
        return root;
    }

    /* 이진 트리 구성 */
    function buildTree(preorder, inorder) {
        // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        let inorderMap = new Map();
        for (let i = 0; i < inorder.length; i++) {
            inorderMap.set(inorder[i], i);
        }
        const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
        return root;
    }
    ```

=== "TS"

    ```typescript title="build_tree.ts"
    /* 이진 트리 구성: 분할 정복 */
    function dfs(
        preorder: number[],
        inorderMap: Map<number, number>,
        i: number,
        l: number,
        r: number
    ): TreeNode | null {
        // 서브트리 구간이 비어 있으면 종료한다
        if (r - l < 0) return null;
        // 루트 노드를 초기화한다
        const root: TreeNode = new TreeNode(preorder[i]);
        // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        const m = inorderMap.get(preorder[i]);
        // 부분 문제: 왼쪽 서브트리 구성
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 부분 문제: 오른쪽 서브트리 구성
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 루트 노드를 반환한다
        return root;
    }

    /* 이진 트리 구성 */
    function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
        // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        let inorderMap = new Map<number, number>();
        for (let i = 0; i < inorder.length; i++) {
            inorderMap.set(inorder[i], i);
        }
        const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
        return root;
    }
    ```

=== "Dart"

    ```dart title="build_tree.dart"
    /* 이진 트리 구성: 분할 정복 */
    TreeNode? dfs(
      List<int> preorder,
      Map<int, int> inorderMap,
      int i,
      int l,
      int r,
    ) {
      // 서브트리 구간이 비어 있으면 종료한다
      if (r - l < 0) {
        return null;
      }
      // 루트 노드를 초기화한다
      TreeNode? root = TreeNode(preorder[i]);
      // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
      int m = inorderMap[preorder[i]]!;
      // 부분 문제: 왼쪽 서브트리 구성
      root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
      // 부분 문제: 오른쪽 서브트리 구성
      root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
      // 루트 노드를 반환한다
      return root;
    }

    /* 이진 트리 구성 */
    TreeNode? buildTree(List<int> preorder, List<int> inorder) {
      // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
      Map<int, int> inorderMap = {};
      for (int i = 0; i < inorder.length; i++) {
        inorderMap[inorder[i]] = i;
      }
      TreeNode? root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
      return root;
    }
    ```

=== "Rust"

    ```rust title="build_tree.rs"
    /* 이진 트리 구성: 분할 정복 */
    fn dfs(
        preorder: &[i32],
        inorder_map: &HashMap<i32, i32>,
        i: i32,
        l: i32,
        r: i32,
    ) -> Option<Rc<RefCell<TreeNode>>> {
        // 서브트리 구간이 비어 있으면 종료한다
        if r - l < 0 {
            return None;
        }
        // 루트 노드를 초기화한다
        let root = TreeNode::new(preorder[i as usize]);
        // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        let m = inorder_map.get(&preorder[i as usize]).unwrap();
        // 부분 문제: 왼쪽 서브트리 구성
        root.borrow_mut().left = dfs(preorder, inorder_map, i + 1, l, m - 1);
        // 부분 문제: 오른쪽 서브트리 구성
        root.borrow_mut().right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r);
        // 루트 노드를 반환한다
        Some(root)
    }

    /* 이진 트리 구성 */
    fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
        // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        let mut inorder_map: HashMap<i32, i32> = HashMap::new();
        for i in 0..inorder.len() {
            inorder_map.insert(inorder[i], i as i32);
        }
        let root = dfs(preorder, &inorder_map, 0, 0, inorder.len() as i32 - 1);
        root
    }
    ```

=== "C"

    ```c title="build_tree.c"
    /* 이진 트리 구성: 분할 정복 */
    TreeNode *dfs(int *preorder, int *inorderMap, int i, int l, int r, int size) {
        // 서브트리 구간이 비어 있으면 종료한다
        if (r - l < 0)
            return NULL;
        // 루트 노드를 초기화한다
        TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
        root->val = preorder[i];
        root->left = NULL;
        root->right = NULL;
        // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        int m = inorderMap[preorder[i]];
        // 부분 문제: 왼쪽 서브트리 구성
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1, size);
        // 부분 문제: 오른쪽 서브트리 구성
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r, size);
        // 루트 노드를 반환한다
        return root;
    }

    /* 이진 트리 구성 */
    TreeNode *buildTree(int *preorder, int preorderSize, int *inorder, int inorderSize) {
        // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        int *inorderMap = (int *)malloc(sizeof(int) * MAX_SIZE);
        for (int i = 0; i < inorderSize; i++) {
            inorderMap[inorder[i]] = i;
        }
        TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorderSize - 1, inorderSize);
        free(inorderMap);
        return root;
    }
    ```

=== "Kotlin"

    ```kotlin title="build_tree.kt"
    /* 이진 트리 구성: 분할 정복 */
    fun dfs(
        preorder: IntArray,
        inorderMap: Map<Int?, Int?>,
        i: Int,
        l: Int,
        r: Int
    ): TreeNode? {
        // 서브트리 구간이 비어 있으면 종료한다
        if (r - l < 0) return null
        // 루트 노드를 초기화한다
        val root = TreeNode(preorder[i])
        // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
        val m = inorderMap[preorder[i]]!!
        // 부분 문제: 왼쪽 서브트리 구성
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
        // 부분 문제: 오른쪽 서브트리 구성
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
        // 루트 노드를 반환한다
        return root
    }

    /* 이진 트리 구성 */
    fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
        // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
        val inorderMap = HashMap<Int?, Int?>()
        for (i in inorder.indices) {
            inorderMap[inorder[i]] = i
        }
        val root = dfs(preorder, inorderMap, 0, 0, inorder.size - 1)
        return root
    }
    ```

=== "Ruby"

    ```ruby title="build_tree.rb"
    ### 이진 트리 구성: 분할 정복 ###
    def dfs(preorder, inorder_map, i, l, r)
      # 서브트리 구간이 비어 있으면 종료한다
      return if r - l < 0

      # 루트 노드를 초기화한다
      root = TreeNode.new(preorder[i])
      # m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
      m = inorder_map[preorder[i]]
      # 부분 문제: 왼쪽 서브트리 구성
      root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
      # 부분 문제: 오른쪽 서브트리 구성
      root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

      # 루트 노드를 반환한다
      root
    end

    ### 이진 트리 구성 ###
    def build_tree(preorder, inorder)
      # inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
      inorder_map = {}
      inorder.each_with_index { |val, i| inorder_map[val] = i }
      dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20dfs%28%0A%20%20%20%20preorder%3A%20list%5Bint%5D,%0A%20%20%20%20inorder_map%3A%20dict%5Bint,%20int%5D,%0A%20%20%20%20i%3A%20int,%0A%20%20%20%20l%3A%20int,%0A%20%20%20%20r%3A%20int,%0A%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EA%B5%AC%EC%84%B1%3A%20%EB%B6%84%ED%95%A0%20%EC%A0%95%EB%B3%B5%22%22%22%0A%20%20%20%20%23%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%20%EA%B5%AC%EA%B0%84%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EC%9C%BC%EB%A9%B4%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20r%20-%20l%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20root%20%3D%20TreeNode%28preorder%5Bi%5D%29%0A%20%20%20%20%23%20m%EC%9D%84%20%EC%A1%B0%ED%9A%8C%ED%95%98%EC%97%AC%20%EC%99%BC%EC%AA%BD%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%EB%A5%BC%20%EB%82%98%EB%88%88%EB%8B%A4%0A%20%20%20%20m%20%3D%20inorder_map%5Bpreorder%5Bi%5D%5D%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%3A%20%EC%99%BC%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%20%EA%B5%AC%EC%84%B1%0A%20%20%20%20root.left%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201,%20l,%20m%20-%201%29%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%3A%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%20%EA%B5%AC%EC%84%B1%0A%20%20%20%20root.right%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201%20%2B%20m%20-%20l,%20m%20%2B%201,%20r%29%0A%20%20%20%20%23%20%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20root%0A%0A%0Adef%20build_tree%28preorder%3A%20list%5Bint%5D,%20inorder%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EA%B5%AC%EC%84%B1%22%22%22%0A%20%20%20%20%23%20inorder%20%EC%9B%90%EC%86%8C%EC%99%80%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EC%9D%98%20%EB%8C%80%EC%9D%91%20%EA%B4%80%EA%B3%84%EB%A5%BC%20%EC%A0%80%EC%9E%A5%ED%95%A0%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20inorder_map%20%3D%20%7Bval%3A%20i%20for%20i,%20val%20in%20enumerate%28inorder%29%7D%0A%20%20%20%20root%20%3D%20dfs%28preorder,%20inorder_map,%200,%200,%20len%28inorder%29%20-%201%29%0A%20%20%20%20return%20root%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20preorder%20%3D%20%5B3,%209,%202,%201,%207%5D%0A%20%20%20%20inorder%20%3D%20%5B9,%203,%201,%202,%207%5D%0A%20%20%20%20print%28f%22%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%20%3D%20%7Bpreorder%7D%22%29%0A%20%20%20%20print%28f%22%EC%A4%91%EC%9C%84%20%EC%88%9C%ED%9A%8C%20%3D%20%7Binorder%7D%22%29%0A%20%20%20%20root%20%3D%20build_tree%28preorder,%20inorder%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=21&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20dfs%28%0A%20%20%20%20preorder%3A%20list%5Bint%5D,%0A%20%20%20%20inorder_map%3A%20dict%5Bint,%20int%5D,%0A%20%20%20%20i%3A%20int,%0A%20%20%20%20l%3A%20int,%0A%20%20%20%20r%3A%20int,%0A%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EA%B5%AC%EC%84%B1%3A%20%EB%B6%84%ED%95%A0%20%EC%A0%95%EB%B3%B5%22%22%22%0A%20%20%20%20%23%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%20%EA%B5%AC%EA%B0%84%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EC%9C%BC%EB%A9%B4%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20r%20-%20l%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20root%20%3D%20TreeNode%28preorder%5Bi%5D%29%0A%20%20%20%20%23%20m%EC%9D%84%20%EC%A1%B0%ED%9A%8C%ED%95%98%EC%97%AC%20%EC%99%BC%EC%AA%BD%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%EB%A5%BC%20%EB%82%98%EB%88%88%EB%8B%A4%0A%20%20%20%20m%20%3D%20inorder_map%5Bpreorder%5Bi%5D%5D%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%3A%20%EC%99%BC%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%20%EA%B5%AC%EC%84%B1%0A%20%20%20%20root.left%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201,%20l,%20m%20-%201%29%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%3A%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%20%EA%B5%AC%EC%84%B1%0A%20%20%20%20root.right%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201%20%2B%20m%20-%20l,%20m%20%2B%201,%20r%29%0A%20%20%20%20%23%20%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20root%0A%0A%0Adef%20build_tree%28preorder%3A%20list%5Bint%5D,%20inorder%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EA%B5%AC%EC%84%B1%22%22%22%0A%20%20%20%20%23%20inorder%20%EC%9B%90%EC%86%8C%EC%99%80%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EC%9D%98%20%EB%8C%80%EC%9D%91%20%EA%B4%80%EA%B3%84%EB%A5%BC%20%EC%A0%80%EC%9E%A5%ED%95%A0%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20inorder_map%20%3D%20%7Bval%3A%20i%20for%20i,%20val%20in%20enumerate%28inorder%29%7D%0A%20%20%20%20root%20%3D%20dfs%28preorder,%20inorder_map,%200,%200,%20len%28inorder%29%20-%201%29%0A%20%20%20%20return%20root%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20preorder%20%3D%20%5B3,%209,%202,%201,%207%5D%0A%20%20%20%20inorder%20%3D%20%5B9,%203,%201,%202,%207%5D%0A%20%20%20%20print%28f%22%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%20%3D%20%7Bpreorder%7D%22%29%0A%20%20%20%20print%28f%22%EC%A4%91%EC%9C%84%20%EC%88%9C%ED%9A%8C%20%3D%20%7Binorder%7D%22%29%0A%20%20%20%20root%20%3D%20build_tree%28preorder,%20inorder%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=21&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

아래 그림(12-8)은 이진 트리 구성의 재귀 과정을 보여 준다. 각 노드는 아래로 '호출'하는 과정에서 만들어지고, 간선(참조)은 위로 '반환'하는 과정에서 만들어진다.

=== "<1>"
    ![이진 트리 구성의 재귀 과정](build_binary_tree_problem.assets/built_tree_step1.png){ class="animation-figure" }

=== "<2>"
    ![이진 트리 구성 2단계](build_binary_tree_problem.assets/built_tree_step2.png){ class="animation-figure" }

=== "<3>"
    ![이진 트리 구성 3단계](build_binary_tree_problem.assets/built_tree_step3.png){ class="animation-figure" }

=== "<4>"
    ![이진 트리 구성 4단계](build_binary_tree_problem.assets/built_tree_step4.png){ class="animation-figure" }

=== "<5>"
    ![이진 트리 구성 5단계](build_binary_tree_problem.assets/built_tree_step5.png){ class="animation-figure" }

=== "<6>"
    ![이진 트리 구성 6단계](build_binary_tree_problem.assets/built_tree_step6.png){ class="animation-figure" }

=== "<7>"
    ![이진 트리 구성 7단계](build_binary_tree_problem.assets/built_tree_step7.png){ class="animation-figure" }

=== "<8>"
    ![이진 트리 구성 8단계](build_binary_tree_problem.assets/built_tree_step8.png){ class="animation-figure" }

=== "<9>"
    ![이진 트리 구성 9단계](build_binary_tree_problem.assets/built_tree_step9.png){ class="animation-figure" }

<p align="center"> 그림 12-8 &nbsp; 이진 트리 구성의 재귀 과정 </p>

각 재귀 함수에서 전위 순회 `preorder`와 중위 순회 `inorder`를 나눈 결과는 아래 그림(12-9)과 같다.

![각 재귀 함수의 분할 결과](build_binary_tree_problem.assets/built_tree_overall.png){ class="animation-figure" }

<p align="center"> 그림 12-9 &nbsp; 각 재귀 함수의 분할 결과 </p>

트리의 노드 수가 $n$일 때 노드 하나를 초기화하는 데(재귀 함수 `dfs()` 한 번 실행) $O(1)$ 시간이 걸린다. **따라서 전체 시간 복잡도는 $O(n)$이다**.

해시 테이블은 `inorder` 원소와 인덱스의 매핑을 저장하므로 공간 복잡도가 $O(n)$이다. 최악의 경우인 이진 트리가 연결 리스트로 퇴화한 경우에는 재귀 깊이가 $n$에 이르러 $O(n)$의 스택 프레임 공간을 사용한다. **따라서 전체 공간 복잡도는 $O(n)$이다**.
