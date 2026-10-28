# AVL 트리 *

'이진 탐색 트리' 절에서 삽입과 삭제를 여러 번 수행하면 트리가 연결 리스트로 퇴화할 수 있다고 설명했다. 이 경우 모든 연산의 시간 복잡도가 $O(\log n)$에서 $O(n)$으로 저하된다.

아래 그림의 이진 탐색 트리는 노드를 두 번 삭제하면 연결 리스트로 퇴화한다.

![노드 삭제 후 퇴화한 AVL 트리](avl_tree.assets/avltree_degradation_from_removing_node.png)

또한 아래 그림의 포화 이진 트리에 노드 두 개를 삽입하면 왼쪽으로 심하게 기울어 탐색의 시간 복잡도도 저하된다.

![노드 삽입 후 퇴화한 AVL 트리](avl_tree.assets/avltree_degradation_from_inserting_node.png)

1962년 G. M. Adelson-Velsky와 E. M. Landis는 논문 'An algorithm for the organization of information'에서 <u>AVL 트리</u>를 제안했다. 논문은 노드를 계속 추가하거나 삭제해도 트리가 퇴화하지 않게 하는 일련의 연산을 상세히 설명하여, 각 연산의 시간 복잡도를 $O(\log n)$으로 유지하도록 했다. 즉, 추가, 삭제, 조회, 수정이 잦은 상황에서도 효율적인 데이터 연산 성능을 유지하므로 활용 가치가 높다.

## AVL 트리의 주요 용어

AVL 트리는 이진 탐색 트리이면서 균형 이진 트리다. 두 종류의 모든 성질을 함께 만족하므로 <u>균형 이진 탐색 트리(balanced binary search tree)</u>다.

### 노드 높이

AVL 트리 연산에는 노드 높이가 필요하므로 노드 클래스에 `height` 변수를 추가해야 한다.

=== "Python"

    ```python title=""
    class TreeNode:
        """AVL 트리 노드 클래스"""
        def __init__(self, val: int):
            self.val: int = val                 # 노드 값
            self.height: int = 0                # 노드 높이
            self.left: TreeNode | None = None   # 왼쪽 자식 노드 참조
            self.right: TreeNode | None = None  # 오른쪽 자식 노드 참조
    ```

=== "C++"

    ```cpp title=""
    /* AVL 트리 노드 클래스 */
    struct TreeNode {
        int val{};          // 노드 값
        int height = 0;     // 노드 높이
        TreeNode *left{};   // 왼쪽 자식 노드
        TreeNode *right{};  // 오른쪽 자식 노드
        TreeNode() = default;
        explicit TreeNode(int x) : val(x){}
    };
    ```

=== "Java"

    ```java title=""
    /* AVL 트리 노드 클래스 */
    class TreeNode {
        public int val;        // 노드 값
        public int height;     // 노드 높이
        public TreeNode left;  // 왼쪽 자식 노드
        public TreeNode right; // 오른쪽 자식 노드
        public TreeNode(int x) { val = x; }
    }
    ```

=== "C#"

    ```csharp title=""
    /* AVL 트리 노드 클래스 */
    class TreeNode(int? x) {
        public int? val = x;    // 노드 값
        public int height;      // 노드 높이
        public TreeNode? left;  // 왼쪽 자식 노드 참조
        public TreeNode? right; // 오른쪽 자식 노드 참조
    }
    ```

=== "Go"

    ```go title=""
    /* AVL 트리 노드 구조체 */
    type TreeNode struct {
        Val    int       // 노드 값
        Height int       // 노드 높이
        Left   *TreeNode // 왼쪽 자식 노드 참조
        Right  *TreeNode // 오른쪽 자식 노드 참조
    }
    ```

=== "Swift"

    ```swift title=""
    /* AVL 트리 노드 클래스 */
    class TreeNode {
        var val: Int // 노드 값
        var height: Int // 노드 높이
        var left: TreeNode? // 왼쪽 자식 노드
        var right: TreeNode? // 오른쪽 자식 노드

        init(x: Int) {
            val = x
            height = 0
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* AVL 트리 노드 클래스 */
    class TreeNode {
        val; // 노드 값
        height; //노드 높이
        left; // 왼쪽 자식 노드 포인터
        right; // 오른쪽 자식 노드 포인터
        constructor(val, left, right, height) {
            this.val = val === undefined ? 0 : val;
            this.height = height === undefined ? 0 : height;
            this.left = left === undefined ? null : left;
            this.right = right === undefined ? null : right;
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* AVL 트리 노드 클래스 */
    class TreeNode {
        val: number;            // 노드 값
        height: number;         // 노드 높이
        left: TreeNode | null;  // 왼쪽 자식 노드 포인터
        right: TreeNode | null; // 오른쪽 자식 노드 포인터
        constructor(val?: number, height?: number, left?: TreeNode | null, right?: TreeNode | null) {
            this.val = val === undefined ? 0 : val;
            this.height = height === undefined ? 0 : height;
            this.left = left === undefined ? null : left;
            this.right = right === undefined ? null : right;
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* AVL 트리 노드 클래스 */
    class TreeNode {
      int val;         // 노드 값
      int height;      // 노드 높이
      TreeNode? left;  // 왼쪽 자식 노드
      TreeNode? right; // 오른쪽 자식 노드
      TreeNode(this.val, [this.height = 0, this.left, this.right]);
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;

    /* AVL 트리 노드 구조체 */
    struct TreeNode {
        val: i32,                               // 노드 값
        height: i32,                            // 노드 높이
        left: Option<Rc<RefCell<TreeNode>>>,    // 왼쪽 자식 노드
        right: Option<Rc<RefCell<TreeNode>>>,   // 오른쪽 자식 노드
    }

    impl TreeNode {
        /* 생성자 */
        fn new(val: i32) -> Rc<RefCell<Self>> {
            Rc::new(RefCell::new(Self {
                val,
                height: 0,
                left: None,
                right: None
            }))
        }
    }
    ```

=== "C"

    ```c title=""
    /* AVL 트리 노드 구조체 */
    typedef struct TreeNode {
        int val;
        int height;
        struct TreeNode *left;
        struct TreeNode *right;
    } TreeNode;

    /* 생성자 */
    TreeNode *newTreeNode(int val) {
        TreeNode *node;

        node = (TreeNode *)malloc(sizeof(TreeNode));
        node->val = val;
        node->height = 0;
        node->left = NULL;
        node->right = NULL;
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* AVL 트리 노드 클래스 */
    class TreeNode(val _val: Int) {  // 노드 값
        var height: Int = 0          // 노드 높이
        var left: TreeNode? = null   // 왼쪽 자식 노드
        var right: TreeNode? = null  // 오른쪽 자식 노드
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### AVL 트리 노드 클래스 ###
    class TreeNode
      attr_accessor :val    # 노드 값
      attr_accessor :height # 노드 높이
      attr_accessor :left   # 왼쪽 자식 노드 참조
      attr_accessor :right  # 오른쪽 자식 노드 참조

      def initialize(val)
        @val = val
        @height = 0
      end
    end
    ```

'노드 높이'는 해당 노드에서 가장 먼 리프까지의 거리, 즉 거치는 '간선' 수다. 특히 리프의 높이는 $0$, 빈 노드의 높이는 $-1$임에 주의하자. 높이를 조회하고 갱신하는 두 보조 함수를 만든다.

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{update_height}
```

### 노드의 균형 인수

노드의 <u>균형 인수(balance factor)</u>는 왼쪽 서브트리 높이에서 오른쪽 서브트리 높이를 뺀 값이며, 빈 노드의 균형 인수는 $0$으로 정한다. 이후 편리하게 쓰도록 균형 인수를 구하는 기능도 함수로 만든다.

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{balance_factor}
```

!!! tip "참고"

    균형 인수를 $f$라고 하면 AVL 트리의 모든 노드는 $-1 \le f \le 1$을 만족한다.

## AVL 트리의 회전

AVL 트리의 특징은 '회전' 연산이다. 이진 트리의 중위 순회 결과를 바꾸지 않으면서 불균형 노드의 균형을 회복한다. 즉, **회전은 '이진 탐색 트리'의 성질을 유지하면서 트리를 다시 '균형 이진 트리'로 만든다**.

균형 인수의 절댓값이 $> 1$인 노드를 '불균형 노드'라고 한다. 불균형 상황에 따라 오른쪽 회전, 왼쪽 회전, 오른쪽 후 왼쪽 회전, 왼쪽 후 오른쪽 회전의 네 종류로 나뉜다. 각각 자세히 알아보자.

### 오른쪽 회전

아래 그림에서 노드 아래의 수는 균형 인수다. 아래에서 위로 볼 때 첫 불균형 노드는 '노드 3'이다. 이 노드를 루트로 하는 서브트리에 주목하여 불균형 노드를 `node`, 왼쪽 자식을 `child`라고 하고 '오른쪽 회전'을 수행한다. 회전 후 서브트리는 균형을 되찾으며 이진 탐색 트리의 성질도 유지한다.

=== "<1>"
    ![오른쪽 회전 단계](avl_tree.assets/avltree_right_rotate_step1.png)

=== "<2>"
    ![오른쪽 회전 2단계](avl_tree.assets/avltree_right_rotate_step2.png)

=== "<3>"
    ![오른쪽 회전 3단계](avl_tree.assets/avltree_right_rotate_step3.png)

=== "<4>"
    ![오른쪽 회전 4단계](avl_tree.assets/avltree_right_rotate_step4.png)

아래 그림처럼 `child`에 오른쪽 자식 `grand_child`가 있으면, 오른쪽 회전 중 `grand_child`를 `node`의 왼쪽 자식으로 연결하는 단계를 추가해야 한다.

![grand_child가 있는 오른쪽 회전](avl_tree.assets/avltree_right_rotate_with_grandchild.png)

'오른쪽으로 회전한다'는 시각적인 표현이며, 실제로는 노드 포인터를 수정하여 구현한다. 코드는 다음과 같다.

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{right_rotate}
```

### 왼쪽 회전

앞의 불균형 이진 트리를 '거울에 비춘' 경우에는 아래 그림과 같이 '왼쪽 회전'이 필요하다.

![왼쪽 회전](avl_tree.assets/avltree_left_rotate.png)

마찬가지로 아래 그림처럼 `child`에 왼쪽 자식 `grand_child`가 있으면, 왼쪽 회전 중 `grand_child`를 `node`의 오른쪽 자식으로 연결하는 단계를 추가해야 한다.

![grand_child가 있는 왼쪽 회전](avl_tree.assets/avltree_left_rotate_with_grandchild.png)

**오른쪽 회전과 왼쪽 회전은 논리적으로 거울 대칭이며, 각각 해결하는 불균형 상황도 대칭이다**. 따라서 오른쪽 회전 코드의 모든 `left`를 `right`로, 모든 `right`를 `left`로 바꾸면 왼쪽 회전 코드를 얻는다.

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{left_rotate}
```

### 왼쪽 회전 후 오른쪽 회전

아래 그림의 불균형 노드 3은 왼쪽 회전이나 오른쪽 회전 한 번만으로 균형을 회복할 수 없다. 먼저 `child`를 '왼쪽 회전'한 뒤 `node`를 '오른쪽 회전'해야 한다.

![왼쪽 회전 후 오른쪽 회전](avl_tree.assets/avltree_left_right_rotate.png)

### 오른쪽 회전 후 왼쪽 회전

아래 그림처럼 앞 상황의 거울 대칭인 경우에는 먼저 `child`를 '오른쪽 회전'한 뒤 `node`를 '왼쪽 회전'해야 한다.

![오른쪽 회전 후 왼쪽 회전](avl_tree.assets/avltree_right_left_rotate.png)

### 회전 선택

아래 그림의 네 불균형 상황은 앞의 예시들과 각각 대응한다. 순서대로 오른쪽 회전, 왼쪽 후 오른쪽 회전, 오른쪽 후 왼쪽 회전, 왼쪽 회전이 필요하다.

![AVL 트리의 네 가지 회전 상황](avl_tree.assets/avltree_rotation_cases.png)

아래 표처럼 불균형 노드의 균형 인수와 더 높은 쪽 자식의 균형 인수 부호를 확인하여 어느 상황에 해당하는지 판단한다.

<p align="center"> 표 <id> &nbsp; 네 가지 회전의 선택 조건 </p>

| 불균형 노드의 균형 인수 | 자식 노드의 균형 인수 | 사용할 회전 |
| ------------------ | ---------------- | ---------------- |
| $> 1$ (왼쪽으로 치우친 트리) | $\geq 0$ | 오른쪽 회전 |
| $> 1$ (왼쪽으로 치우친 트리) | $<0$ | 왼쪽 회전 후 오른쪽 회전 |
| $< -1$ (오른쪽으로 치우친 트리) | $\leq 0$ | 왼쪽 회전 |
| $< -1$ (오른쪽으로 치우친 트리) | $>0$ | 오른쪽 회전 후 왼쪽 회전 |

편리하게 사용하도록 회전 연산을 함수 하나로 묶는다. **이 함수를 사용하면 여러 불균형 상황에 맞게 회전하여 노드의 균형을 복구할 수 있다**. 코드는 다음과 같다.

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{rotate}
```

## AVL 트리의 주요 연산

### 노드 삽입

AVL 트리의 삽입은 기본적으로 이진 탐색 트리와 비슷하다. 다만 삽입한 노드에서 루트까지의 경로에 불균형 노드가 여러 개 생길 수 있다는 차이가 있다. 따라서 **삽입한 노드부터 아래에서 위로 회전하여 모든 불균형 노드의 균형을 회복해야 한다**. 코드는 다음과 같다.

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{insert_helper}
```

### 노드 삭제

마찬가지로 이진 탐색 트리의 삭제 방법에 더하여 아래에서 위로 회전하며 모든 불균형 노드의 균형을 회복한다. 코드는 다음과 같다.

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{remove_helper}
```

### 노드 탐색

AVL 트리의 노드 탐색은 이진 탐색 트리와 같으므로 다시 설명하지 않는다.

## AVL 트리의 대표적인 응용

- 대규모 데이터를 구성하고 저장하며, 탐색이 잦고 추가와 삭제가 드문 상황에 적합하다.
- 데이터베이스의 인덱스 시스템을 구축하는 데 사용한다.
- 레드-블랙 트리도 대표적인 균형 이진 탐색 트리다. AVL 트리보다 균형 조건이 느슨하여 삽입과 삭제에 필요한 회전 수가 적고, 노드 추가와 삭제의 평균 효율이 더 높다.
