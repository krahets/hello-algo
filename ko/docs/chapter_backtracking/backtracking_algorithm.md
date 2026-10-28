---
comments: true
---

# 13.1 &nbsp; 백트래킹 알고리즘

<u>백트래킹 알고리즘(backtracking algorithm)</u>은 모든 경우를 열거하여 문제를 푸는 방법이다. 초기 상태에서 출발하여 가능한 모든 해결 방법을 완전 탐색하고, 올바른 해를 만나면 기록한다. 해를 찾거나 가능한 선택을 모두 시도해도 찾을 수 없을 때까지 진행하는 것이 핵심이다.

백트래킹은 보통 '깊이 우선 탐색'으로 해 공간을 순회한다. '이진 트리' 장에서 전위, 중위, 후위 순회가 모두 깊이 우선 탐색이라고 설명했다. 이제 전위 순회를 이용한 백트래킹 문제를 만들어 작동 원리를 차근차근 알아보자.

!!! question "예제 1"

    이진 트리가 주어졌을 때 값이 $7$인 모든 노드를 찾아 기록하고, 노드 리스트를 반환하라.

이 문제에서는 트리를 전위 순회하며 현재 노드의 값이 $7$인지 확인하고, 맞으면 해당 노드의 값을 결과 리스트 `res`에 추가한다. 과정은 아래 그림(13-1)과 코드에 나타나 있다.

=== "Python"

    ```python title="preorder_traversal_i_compact.py"
    def pre_order(root: TreeNode):
        """전위 순회: 예제 1"""
        if root is None:
            return
        if root.val == 7:
            # 해를 기록한다
            res.append(root)
        pre_order(root.left)
        pre_order(root.right)
    ```

=== "C++"

    ```cpp title="preorder_traversal_i_compact.cpp"
    /* 전위 순회: 예제 1 */
    void preOrder(TreeNode *root) {
        if (root == nullptr) {
            return;
        }
        if (root->val == 7) {
            // 해를 기록한다
            res.push_back(root);
        }
        preOrder(root->left);
        preOrder(root->right);
    }
    ```

=== "Java"

    ```java title="preorder_traversal_i_compact.java"
    /* 전위 순회: 예제 1 */
    void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // 해를 기록한다
            res.add(root);
        }
        preOrder(root.left);
        preOrder(root.right);
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_i_compact.cs"
    /* 전위 순회: 예제 1 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // 해를 기록한다
            res.Add(root);
        }
        PreOrder(root.left);
        PreOrder(root.right);
    }
    ```

=== "Go"

    ```go title="preorder_traversal_i_compact.go"
    /* 전위 순회: 예제 1 */
    func preOrderI(root *TreeNode, res *[]*TreeNode) {
        if root == nil {
            return
        }
        if (root.Val).(int) == 7 {
            // 해를 기록한다
            *res = append(*res, root)
        }
        preOrderI(root.Left, res)
        preOrderI(root.Right, res)
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_i_compact.swift"
    /* 전위 순회: 예제 1 */
    func preOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        if root.val == 7 {
            // 해를 기록한다
            res.append(root)
        }
        preOrder(root: root.left)
        preOrder(root: root.right)
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_i_compact.js"
    /* 전위 순회: 예제 1 */
    function preOrder(root, res) {
        if (root === null) {
            return;
        }
        if (root.val === 7) {
            // 해를 기록한다
            res.push(root);
        }
        preOrder(root.left, res);
        preOrder(root.right, res);
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_i_compact.ts"
    /* 전위 순회: 예제 1 */
    function preOrder(root: TreeNode | null, res: TreeNode[]): void {
        if (root === null) {
            return;
        }
        if (root.val === 7) {
            // 해를 기록한다
            res.push(root);
        }
        preOrder(root.left, res);
        preOrder(root.right, res);
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_i_compact.dart"
    /* 전위 순회: 예제 1 */
    void preOrder(TreeNode? root, List<TreeNode> res) {
      if (root == null) {
        return;
      }
      if (root.val == 7) {
        // 해를 기록한다
        res.add(root);
      }
      preOrder(root.left, res);
      preOrder(root.right, res);
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_i_compact.rs"
    /* 전위 순회: 예제 1 */
    fn pre_order(res: &mut Vec<Rc<RefCell<TreeNode>>>, root: Option<&Rc<RefCell<TreeNode>>>) {
        if root.is_none() {
            return;
        }
        if let Some(node) = root {
            if node.borrow().val == 7 {
                // 해를 기록한다
                res.push(node.clone());
            }
            pre_order(res, node.borrow().left.as_ref());
            pre_order(res, node.borrow().right.as_ref());
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_i_compact.c"
    /* 전위 순회: 예제 1 */
    void preOrder(TreeNode *root) {
        if (root == NULL) {
            return;
        }
        if (root->val == 7) {
            // 해를 기록한다
            res[resSize++] = root;
        }
        preOrder(root->left);
        preOrder(root->right);
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_i_compact.kt"
    /* 전위 순회: 예제 1 */
    fun preOrder(root: TreeNode?) {
        if (root == null) {
            return
        }
        if (root._val == 7) {
            // 해를 기록한다
            res!!.add(root)
        }
        preOrder(root.left)
        preOrder(root.right)
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_i_compact.rb"
    ### 전위 순회: 예제 1 ###
    def pre_order(root)
      return unless root

      # 해를 기록한다
      $res << root if root.val == 7

      pre_order(root.left)
      pre_order(root.right)
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%3A%20%EC%9E%AC%EA%B7%80%22%22%22%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B0%B0%EC%97%B4%20%EA%B8%B8%EC%9D%B4%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EA%B1%B0%EB%82%98%20%ED%95%B4%EB%8B%B9%20%EC%9B%90%EC%86%8C%EA%B0%80%20None%EC%9D%B4%EB%A9%B4%20None%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%ED%98%84%EC%9E%AC%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%83%9D%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%EB%A5%BC%20%EC%9E%AC%EA%B7%80%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%3A%20%EC%98%88%EC%A0%9C%201%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20res.append%28root%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%20%20%20%23%20%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20res%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%EA%B0%92%EC%9D%B4%207%EC%9D%B8%20%EB%AA%A8%EB%93%A0%20%EB%85%B8%EB%93%9C%20%EC%B6%9C%EB%A0%A5%22%29%0A%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20res%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%3A%20%EC%9E%AC%EA%B7%80%22%22%22%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B0%B0%EC%97%B4%20%EA%B8%B8%EC%9D%B4%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EA%B1%B0%EB%82%98%20%ED%95%B4%EB%8B%B9%20%EC%9B%90%EC%86%8C%EA%B0%80%20None%EC%9D%B4%EB%A9%B4%20None%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%ED%98%84%EC%9E%AC%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%83%9D%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%EB%A5%BC%20%EC%9E%AC%EA%B7%80%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%3A%20%EC%98%88%EC%A0%9C%201%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20res.append%28root%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%20%20%20%23%20%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20res%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%EA%B0%92%EC%9D%B4%207%EC%9D%B8%20%EB%AA%A8%EB%93%A0%20%EB%85%B8%EB%93%9C%20%EC%B6%9C%EB%A0%A5%22%29%0A%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20res%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

![전위 순회로 노드 탐색](backtracking_algorithm.assets/preorder_find_nodes.png){ class="animation-figure" }

<p align="center"> 그림 13-1 &nbsp; 전위 순회로 노드 탐색 </p>

## 13.1.1 &nbsp; 시도와 되돌리기

**백트래킹이라고 부르는 이유는 해 공간을 탐색할 때 '시도'와 '되돌리기' 전략을 사용하기 때문이다**. 탐색 중 더 진행할 수 없거나 조건을 만족하는 해를 얻을 수 없는 상태를 만나면, 직전 선택을 취소하고 이전 상태로 돌아가 다른 선택을 시도한다.

예제 1에서는 각 노드의 방문이 한 번의 '시도'이며, 리프 노드를 지나거나 부모 노드로 돌아가는 `return`이 '되돌리기'에 해당한다.

**되돌리기에는 함수 반환만 포함되는 것이 아니다**. 이를 설명하기 위해 예제 1을 조금 확장해 보자.

!!! question "예제 2"

    이진 트리에서 값이 $7$인 모든 노드를 찾아 **루트 노드에서 각 노드까지의 경로를 반환하라**.

예제 1의 코드에 리스트 `path`를 추가하여 방문한 노드의 경로를 기록해야 한다. 값이 $7$인 노드를 방문하면 `path`를 복사하여 결과 리스트 `res`에 추가한다. 순회를 마치면 `res`에 모든 해가 저장된다. 코드는 다음과 같다.

=== "Python"

    ```python title="preorder_traversal_ii_compact.py"
    def pre_order(root: TreeNode):
        """전위 순회: 예제 2"""
        if root is None:
            return
        # 시도
        path.append(root)
        if root.val == 7:
            # 해를 기록한다
            res.append(list(path))
        pre_order(root.left)
        pre_order(root.right)
        # 되돌리기
        path.pop()
    ```

=== "C++"

    ```cpp title="preorder_traversal_ii_compact.cpp"
    /* 전위 순회: 예제 2 */
    void preOrder(TreeNode *root) {
        if (root == nullptr) {
            return;
        }
        // 시도
        path.push_back(root);
        if (root->val == 7) {
            // 해를 기록한다
            res.push_back(path);
        }
        preOrder(root->left);
        preOrder(root->right);
        // 되돌리기
        path.pop_back();
    }
    ```

=== "Java"

    ```java title="preorder_traversal_ii_compact.java"
    /* 전위 순회: 예제 2 */
    void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        // 시도
        path.add(root);
        if (root.val == 7) {
            // 해를 기록한다
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // 되돌리기
        path.remove(path.size() - 1);
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_ii_compact.cs"
    /* 전위 순회: 예제 2 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        // 시도
        path.Add(root);
        if (root.val == 7) {
            // 해를 기록한다
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // 되돌리기
        path.RemoveAt(path.Count - 1);
    }
    ```

=== "Go"

    ```go title="preorder_traversal_ii_compact.go"
    /* 전위 순회: 예제 2 */
    func preOrderII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
        if root == nil {
            return
        }
        // 시도
        *path = append(*path, root)
        if root.Val.(int) == 7 {
            // 해를 기록한다
            *res = append(*res, append([]*TreeNode{}, *path...))
        }
        preOrderII(root.Left, res, path)
        preOrderII(root.Right, res, path)
        // 되돌리기
        *path = (*path)[:len(*path)-1]
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_ii_compact.swift"
    /* 전위 순회: 예제 2 */
    func preOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        // 시도
        path.append(root)
        if root.val == 7 {
            // 해를 기록한다
            res.append(path)
        }
        preOrder(root: root.left)
        preOrder(root: root.right)
        // 되돌리기
        path.removeLast()
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_ii_compact.js"
    /* 전위 순회: 예제 2 */
    function preOrder(root, path, res) {
        if (root === null) {
            return;
        }
        // 시도
        path.push(root);
        if (root.val === 7) {
            // 해를 기록한다
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // 되돌리기
        path.pop();
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_ii_compact.ts"
    /* 전위 순회: 예제 2 */
    function preOrder(
        root: TreeNode | null,
        path: TreeNode[],
        res: TreeNode[][]
    ): void {
        if (root === null) {
            return;
        }
        // 시도
        path.push(root);
        if (root.val === 7) {
            // 해를 기록한다
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // 되돌리기
        path.pop();
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_ii_compact.dart"
    /* 전위 순회: 예제 2 */
    void preOrder(
      TreeNode? root,
      List<TreeNode> path,
      List<List<TreeNode>> res,
    ) {
      if (root == null) {
        return;
      }

      // 시도
      path.add(root);
      if (root.val == 7) {
        // 해를 기록한다
        res.add(List.from(path));
      }
      preOrder(root.left, path, res);
      preOrder(root.right, path, res);
      // 되돌리기
      path.removeLast();
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_ii_compact.rs"
    /* 전위 순회: 예제 2 */
    fn pre_order(
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
        path: &mut Vec<Rc<RefCell<TreeNode>>>,
        root: Option<&Rc<RefCell<TreeNode>>>,
    ) {
        if root.is_none() {
            return;
        }
        if let Some(node) = root {
            // 시도
            path.push(node.clone());
            if node.borrow().val == 7 {
                // 해를 기록한다
                res.push(path.clone());
            }
            pre_order(res, path, node.borrow().left.as_ref());
            pre_order(res, path, node.borrow().right.as_ref());
            // 되돌리기
            path.pop();
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_ii_compact.c"
    /* 전위 순회: 예제 2 */
    void preOrder(TreeNode *root) {
        if (root == NULL) {
            return;
        }
        // 시도
        path[pathSize++] = root;
        if (root->val == 7) {
            // 해를 기록한다
            for (int i = 0; i < pathSize; ++i) {
                res[resSize][i] = path[i];
            }
            resSize++;
        }
        preOrder(root->left);
        preOrder(root->right);
        // 되돌리기
        pathSize--;
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_ii_compact.kt"
    /* 전위 순회: 예제 2 */
    fun preOrder(root: TreeNode?) {
        if (root == null) {
            return
        }
        // 시도
        path!!.add(root)
        if (root._val == 7) {
            // 해를 기록한다
            res!!.add(path!!.toMutableList())
        }
        preOrder(root.left)
        preOrder(root.right)
        // 되돌리기
        path!!.removeAt(path!!.size - 1)
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_ii_compact.rb"
    ### 전위 순회: 예제 2 ###
    def pre_order(root)
      return unless root

      # 시도
      $path << root

      # 해를 기록한다
      $res << $path.dup if root.val == 7

      pre_order(root.left)
      pre_order(root.right)

      # 되돌리기
      $path.pop
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%3A%20%EC%9E%AC%EA%B7%80%22%22%22%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B0%B0%EC%97%B4%20%EA%B8%B8%EC%9D%B4%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EA%B1%B0%EB%82%98%20%ED%95%B4%EB%8B%B9%20%EC%9B%90%EC%86%8C%EA%B0%80%20None%EC%9D%B4%EB%A9%B4%20None%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%ED%98%84%EC%9E%AC%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%83%9D%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%EB%A5%BC%20%EC%9E%AC%EA%B7%80%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%3A%20%EC%98%88%EC%A0%9C%202%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EC%8B%9C%EB%8F%84%0A%20%20%20%20path.append%28root%29%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20res.append%28list%28path%29%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%20%20%20%20%23%20%EB%90%98%EB%8F%8C%EB%A6%AC%EA%B8%B0%0A%20%20%20%20path.pop%28%29%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%20%20%20%23%20%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20path%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20res%20%3D%20list%5Blist%5BTreeNode%5D%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EC%97%90%EC%84%9C%20%EB%85%B8%EB%93%9C%207%EA%B9%8C%EC%A7%80%EC%9D%98%20%EB%AA%A8%EB%93%A0%20%EA%B2%BD%EB%A1%9C%20%EC%B6%9C%EB%A0%A5%22%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%3A%20%EC%9E%AC%EA%B7%80%22%22%22%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B0%B0%EC%97%B4%20%EA%B8%B8%EC%9D%B4%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EA%B1%B0%EB%82%98%20%ED%95%B4%EB%8B%B9%20%EC%9B%90%EC%86%8C%EA%B0%80%20None%EC%9D%B4%EB%A9%B4%20None%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%ED%98%84%EC%9E%AC%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%83%9D%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%EB%A5%BC%20%EC%9E%AC%EA%B7%80%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%3A%20%EC%98%88%EC%A0%9C%202%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EC%8B%9C%EB%8F%84%0A%20%20%20%20path.append%28root%29%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20res.append%28list%28path%29%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%20%20%20%20%23%20%EB%90%98%EB%8F%8C%EB%A6%AC%EA%B8%B0%0A%20%20%20%20path.pop%28%29%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%20%20%20%23%20%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20path%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20res%20%3D%20list%5Blist%5BTreeNode%5D%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EC%97%90%EC%84%9C%20%EB%85%B8%EB%93%9C%207%EA%B9%8C%EC%A7%80%EC%9D%98%20%EB%AA%A8%EB%93%A0%20%EA%B2%BD%EB%A1%9C%20%EC%B6%9C%EB%A0%A5%22%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

매번 '시도'할 때는 현재 노드를 `path`에 추가하여 경로를 기록한다. '되돌리기' 전에는 이 노드를 `path`에서 꺼내어 **이번 시도 이전의 상태를 복원해야 한다**.

아래 그림(13-2)의 과정을 보면 **시도와 되돌리기를 각각 '전진'과 '취소'로 이해할 수 있으며**, 두 연산은 서로 반대 방향이다.

=== "<1>"
    ![시도와 되돌리기](backtracking_algorithm.assets/preorder_find_paths_step1.png){ class="animation-figure" }

=== "<2>"
    ![경로 탐색 2단계](backtracking_algorithm.assets/preorder_find_paths_step2.png){ class="animation-figure" }

=== "<3>"
    ![경로 탐색 3단계](backtracking_algorithm.assets/preorder_find_paths_step3.png){ class="animation-figure" }

=== "<4>"
    ![경로 탐색 4단계](backtracking_algorithm.assets/preorder_find_paths_step4.png){ class="animation-figure" }

=== "<5>"
    ![경로 탐색 5단계](backtracking_algorithm.assets/preorder_find_paths_step5.png){ class="animation-figure" }

=== "<6>"
    ![경로 탐색 6단계](backtracking_algorithm.assets/preorder_find_paths_step6.png){ class="animation-figure" }

=== "<7>"
    ![경로 탐색 7단계](backtracking_algorithm.assets/preorder_find_paths_step7.png){ class="animation-figure" }

=== "<8>"
    ![경로 탐색 8단계](backtracking_algorithm.assets/preorder_find_paths_step8.png){ class="animation-figure" }

=== "<9>"
    ![경로 탐색 9단계](backtracking_algorithm.assets/preorder_find_paths_step9.png){ class="animation-figure" }

=== "<10>"
    ![경로 탐색 10단계](backtracking_algorithm.assets/preorder_find_paths_step10.png){ class="animation-figure" }

=== "<11>"
    ![경로 탐색 11단계](backtracking_algorithm.assets/preorder_find_paths_step11.png){ class="animation-figure" }

<p align="center"> 그림 13-2 &nbsp; 시도와 되돌리기 </p>

## 13.1.2 &nbsp; 가지치기

복잡한 백트래킹 문제에는 보통 하나 이상의 제약 조건이 있으며, **이 제약 조건을 '가지치기'에 활용할 수 있다**.

!!! question "예제 3"

    이진 트리에서 값이 $7$인 모든 노드를 찾아 루트 노드에서 각 노드까지의 경로를 반환하라. **단, 경로에 값이 $3$인 노드가 포함되면 안 된다**.

이 제약을 만족하려면 **가지치기 연산을 추가해야 한다**. 탐색 중 값이 $3$인 노드를 만나면 더 탐색하지 않고 조기에 반환한다. 코드는 다음과 같다.

=== "Python"

    ```python title="preorder_traversal_iii_compact.py"
    def pre_order(root: TreeNode):
        """전위 순회: 예제 3"""
        # 가지치기
        if root is None or root.val == 3:
            return
        # 시도
        path.append(root)
        if root.val == 7:
            # 해를 기록한다
            res.append(list(path))
        pre_order(root.left)
        pre_order(root.right)
        # 되돌리기
        path.pop()
    ```

=== "C++"

    ```cpp title="preorder_traversal_iii_compact.cpp"
    /* 전위 순회: 예제 3 */
    void preOrder(TreeNode *root) {
        // 가지치기
        if (root == nullptr || root->val == 3) {
            return;
        }
        // 시도
        path.push_back(root);
        if (root->val == 7) {
            // 해를 기록한다
            res.push_back(path);
        }
        preOrder(root->left);
        preOrder(root->right);
        // 되돌리기
        path.pop_back();
    }
    ```

=== "Java"

    ```java title="preorder_traversal_iii_compact.java"
    /* 전위 순회: 예제 3 */
    void preOrder(TreeNode root) {
        // 가지치기
        if (root == null || root.val == 3) {
            return;
        }
        // 시도
        path.add(root);
        if (root.val == 7) {
            // 해를 기록한다
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // 되돌리기
        path.remove(path.size() - 1);
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_iii_compact.cs"
    /* 전위 순회: 예제 3 */
    void PreOrder(TreeNode? root) {
        // 가지치기
        if (root == null || root.val == 3) {
            return;
        }
        // 시도
        path.Add(root);
        if (root.val == 7) {
            // 해를 기록한다
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // 되돌리기
        path.RemoveAt(path.Count - 1);
    }
    ```

=== "Go"

    ```go title="preorder_traversal_iii_compact.go"
    /* 전위 순회: 예제 3 */
    func preOrderIII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
        // 가지치기
        if root == nil || root.Val == 3 {
            return
        }
        // 시도
        *path = append(*path, root)
        if root.Val.(int) == 7 {
            // 해를 기록한다
            *res = append(*res, append([]*TreeNode{}, *path...))
        }
        preOrderIII(root.Left, res, path)
        preOrderIII(root.Right, res, path)
        // 되돌리기
        *path = (*path)[:len(*path)-1]
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_iii_compact.swift"
    /* 전위 순회: 예제 3 */
    func preOrder(root: TreeNode?) {
        // 가지치기
        guard let root = root, root.val != 3 else {
            return
        }
        // 시도
        path.append(root)
        if root.val == 7 {
            // 해를 기록한다
            res.append(path)
        }
        preOrder(root: root.left)
        preOrder(root: root.right)
        // 되돌리기
        path.removeLast()
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_iii_compact.js"
    /* 전위 순회: 예제 3 */
    function preOrder(root, path, res) {
        // 가지치기
        if (root === null || root.val === 3) {
            return;
        }
        // 시도
        path.push(root);
        if (root.val === 7) {
            // 해를 기록한다
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // 되돌리기
        path.pop();
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_iii_compact.ts"
    /* 전위 순회: 예제 3 */
    function preOrder(
        root: TreeNode | null,
        path: TreeNode[],
        res: TreeNode[][]
    ): void {
        // 가지치기
        if (root === null || root.val === 3) {
            return;
        }
        // 시도
        path.push(root);
        if (root.val === 7) {
            // 해를 기록한다
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // 되돌리기
        path.pop();
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_iii_compact.dart"
    /* 전위 순회: 예제 3 */
    void preOrder(
      TreeNode? root,
      List<TreeNode> path,
      List<List<TreeNode>> res,
    ) {
      if (root == null || root.val == 3) {
        return;
      }

      // 시도
      path.add(root);
      if (root.val == 7) {
        // 해를 기록한다
        res.add(List.from(path));
      }
      preOrder(root.left, path, res);
      preOrder(root.right, path, res);
      // 되돌리기
      path.removeLast();
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_iii_compact.rs"
    /* 전위 순회: 예제 3 */
    fn pre_order(
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
        path: &mut Vec<Rc<RefCell<TreeNode>>>,
        root: Option<&Rc<RefCell<TreeNode>>>,
    ) {
        // 가지치기
        if root.is_none() || root.as_ref().unwrap().borrow().val == 3 {
            return;
        }
        if let Some(node) = root {
            // 시도
            path.push(node.clone());
            if node.borrow().val == 7 {
                // 해를 기록한다
                res.push(path.clone());
            }
            pre_order(res, path, node.borrow().left.as_ref());
            pre_order(res, path, node.borrow().right.as_ref());
            // 되돌리기
            path.pop();
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_iii_compact.c"
    /* 전위 순회: 예제 3 */
    void preOrder(TreeNode *root) {
        // 가지치기
        if (root == NULL || root->val == 3) {
            return;
        }
        // 시도
        path[pathSize++] = root;
        if (root->val == 7) {
            // 해를 기록한다
            for (int i = 0; i < pathSize; i++) {
                res[resSize][i] = path[i];
            }
            resSize++;
        }
        preOrder(root->left);
        preOrder(root->right);
        // 되돌리기
        pathSize--;
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_iii_compact.kt"
    /* 전위 순회: 예제 3 */
    fun preOrder(root: TreeNode?) {
        // 가지치기
        if (root == null || root._val == 3) {
            return
        }
        // 시도
        path!!.add(root)
        if (root._val == 7) {
            // 해를 기록한다
            res!!.add(path!!.toMutableList())
        }
        preOrder(root.left)
        preOrder(root.right)
        // 되돌리기
        path!!.removeAt(path!!.size - 1)
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_iii_compact.rb"
    ### 전위 순회: 예제 3 ###
    def pre_order(root)
      # 가지치기
      return if !root || root.val == 3

      # 시도
      $path.append(root)

      # 해를 기록한다
      $res << $path.dup if root.val == 7

      pre_order(root.left)
      pre_order(root.right)

      # 되돌리기
      $path.pop
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%3A%20%EC%9E%AC%EA%B7%80%22%22%22%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B0%B0%EC%97%B4%20%EA%B8%B8%EC%9D%B4%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EA%B1%B0%EB%82%98%20%ED%95%B4%EB%8B%B9%20%EC%9B%90%EC%86%8C%EA%B0%80%20None%EC%9D%B4%EB%A9%B4%20None%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%ED%98%84%EC%9E%AC%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%83%9D%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%EB%A5%BC%20%EC%9E%AC%EA%B7%80%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%3A%20%EC%98%88%EC%A0%9C%203%22%22%22%0A%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%0A%20%20%20%20if%20root%20is%20None%20or%20root.val%20%3D%3D%203%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EC%8B%9C%EB%8F%84%0A%20%20%20%20path.append%28root%29%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20res.append%28list%28path%29%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%20%20%20%20%23%20%EB%90%98%EB%8F%8C%EB%A6%AC%EA%B8%B0%0A%20%20%20%20path.pop%28%29%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%20%20%20%23%20%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20path%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20res%20%3D%20list%5Blist%5BTreeNode%5D%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EC%97%90%EC%84%9C%20%EB%85%B8%EB%93%9C%207%EA%B9%8C%EC%A7%80%EC%9D%98%20%EB%AA%A8%EB%93%A0%20%EA%B2%BD%EB%A1%9C%20%EC%B6%9C%EB%A0%A5.%20%EA%B2%BD%EB%A1%9C%EC%97%90%EB%8A%94%20%EA%B0%92%EC%9D%B4%203%EC%9D%B8%20%EB%85%B8%EB%93%9C%EA%B0%80%20%ED%8F%AC%ED%95%A8%EB%90%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%22%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%3A%20%EC%9E%AC%EA%B7%80%22%22%22%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B0%B0%EC%97%B4%20%EA%B8%B8%EC%9D%B4%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EA%B1%B0%EB%82%98%20%ED%95%B4%EB%8B%B9%20%EC%9B%90%EC%86%8C%EA%B0%80%20None%EC%9D%B4%EB%A9%B4%20None%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%ED%98%84%EC%9E%AC%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%83%9D%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%EB%A5%BC%20%EC%9E%AC%EA%B7%80%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%3A%20%EC%98%88%EC%A0%9C%203%22%22%22%0A%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%0A%20%20%20%20if%20root%20is%20None%20or%20root.val%20%3D%3D%203%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EC%8B%9C%EB%8F%84%0A%20%20%20%20path.append%28root%29%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20res.append%28list%28path%29%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%20%20%20%20%23%20%EB%90%98%EB%8F%8C%EB%A6%AC%EA%B8%B0%0A%20%20%20%20path.pop%28%29%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%20%20%20%23%20%EC%A0%84%EC%9C%84%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20path%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20res%20%3D%20list%5Blist%5BTreeNode%5D%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EC%97%90%EC%84%9C%20%EB%85%B8%EB%93%9C%207%EA%B9%8C%EC%A7%80%EC%9D%98%20%EB%AA%A8%EB%93%A0%20%EA%B2%BD%EB%A1%9C%20%EC%B6%9C%EB%A0%A5.%20%EA%B2%BD%EB%A1%9C%EC%97%90%EB%8A%94%20%EA%B0%92%EC%9D%B4%203%EC%9D%B8%20%EB%85%B8%EB%93%9C%EA%B0%80%20%ED%8F%AC%ED%95%A8%EB%90%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%22%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

'가지치기'는 매우 직관적인 이름이다. 아래 그림(13-3)과 같이 탐색 중 **제약 조건을 만족하지 않는 탐색 가지를 '잘라 내어'** 의미 없는 시도를 많이 피하고 탐색 효율을 높인다.

![제약 조건에 따른 가지치기](backtracking_algorithm.assets/preorder_find_constrained_paths.png){ class="animation-figure" }

<p align="center"> 그림 13-3 &nbsp; 제약 조건에 따른 가지치기 </p>

## 13.1.3 &nbsp; 기본 틀 코드

이제 백트래킹의 '시도, 되돌리기, 가지치기'라는 기본 틀을 추출하여 코드의 범용성을 높여 보자.

아래 기본 틀 코드에서 `state`는 문제의 현재 상태를, `choices`는 그 상태에서 가능한 선택들을 나타낸다.

=== "Python"

    ```python title=""
    def backtrack(state: State, choices: list[choice], res: list[state]):
        """백트래킹 알고리즘의 기본 틀"""
        # 해인지 확인
        if is_solution(state):
            # 해 기록
            record_solution(state, res)
            # 더 이상 탐색하지 않는다
            return
        # 모든 선택지 순회
        for choice in choices:
            # 가지치기: 선택이 유효한지 확인
            if is_valid(state, choice):
                # 시도: 선택하고 상태 갱신
                make_choice(state, choice)
                backtrack(state, choices, res)
                # 되돌리기: 선택을 취소하고 이전 상태 복원
                undo_choice(state, choice)
    ```

=== "C++"

    ```cpp title=""
    /* 백트래킹 알고리즘의 기본 틀 */
    void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
        // 해인지 확인
        if (isSolution(state)) {
            // 해 기록
            recordSolution(state, res);
            // 더 이상 탐색하지 않는다
            return;
        }
        // 모든 선택지 순회
        for (Choice choice : choices) {
            // 가지치기: 선택이 유효한지 확인
            if (isValid(state, choice)) {
                // 시도: 선택하고 상태 갱신
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 되돌리기: 선택을 취소하고 이전 상태 복원
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Java"

    ```java title=""
    /* 백트래킹 알고리즘의 기본 틀 */
    void backtrack(State state, List<Choice> choices, List<State> res) {
        // 해인지 확인
        if (isSolution(state)) {
            // 해 기록
            recordSolution(state, res);
            // 더 이상 탐색하지 않는다
            return;
        }
        // 모든 선택지 순회
        for (Choice choice : choices) {
            // 가지치기: 선택이 유효한지 확인
            if (isValid(state, choice)) {
                // 시도: 선택하고 상태 갱신
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 되돌리기: 선택을 취소하고 이전 상태 복원
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "C#"

    ```csharp title=""
    /* 백트래킹 알고리즘의 기본 틀 */
    void Backtrack(State state, List<Choice> choices, List<State> res) {
        // 해인지 확인
        if (IsSolution(state)) {
            // 해 기록
            RecordSolution(state, res);
            // 더 이상 탐색하지 않는다
            return;
        }
        // 모든 선택지 순회
        foreach (Choice choice in choices) {
            // 가지치기: 선택이 유효한지 확인
            if (IsValid(state, choice)) {
                // 시도: 선택하고 상태 갱신
                MakeChoice(state, choice);
                Backtrack(state, choices, res);
                // 되돌리기: 선택을 취소하고 이전 상태 복원
                UndoChoice(state, choice);
            }
        }
    }
    ```

=== "Go"

    ```go title=""
    /* 백트래킹 알고리즘의 기본 틀 */
    func backtrack(state *State, choices []Choice, res *[]State) {
        // 해인지 확인
        if isSolution(state) {
            // 해 기록
            recordSolution(state, res)
            // 더 이상 탐색하지 않는다
            return
        }
        // 모든 선택지 순회
        for _, choice := range choices {
            // 가지치기: 선택이 유효한지 확인
            if isValid(state, choice) {
                // 시도: 선택하고 상태 갱신
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // 되돌리기: 선택을 취소하고 이전 상태 복원
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* 백트래킹 알고리즘의 기본 틀 */
    func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
        // 해인지 확인
        if isSolution(state: state) {
            // 해 기록
            recordSolution(state: state, res: &res)
            // 더 이상 탐색하지 않는다
            return
        }
        // 모든 선택지 순회
        for choice in choices {
            // 가지치기: 선택이 유효한지 확인
            if isValid(state: state, choice: choice) {
                // 시도: 선택하고 상태 갱신
                makeChoice(state: &state, choice: choice)
                backtrack(state: &state, choices: choices, res: &res)
                // 되돌리기: 선택을 취소하고 이전 상태 복원
                undoChoice(state: &state, choice: choice)
            }
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* 백트래킹 알고리즘의 기본 틀 */
    function backtrack(state, choices, res) {
        // 해인지 확인
        if (isSolution(state)) {
            // 해 기록
            recordSolution(state, res);
            // 더 이상 탐색하지 않는다
            return;
        }
        // 모든 선택지 순회
        for (let choice of choices) {
            // 가지치기: 선택이 유효한지 확인
            if (isValid(state, choice)) {
                // 시도: 선택하고 상태 갱신
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 되돌리기: 선택을 취소하고 이전 상태 복원
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* 백트래킹 알고리즘의 기본 틀 */
    function backtrack(state: State, choices: Choice[], res: State[]): void {
        // 해인지 확인
        if (isSolution(state)) {
            // 해 기록
            recordSolution(state, res);
            // 더 이상 탐색하지 않는다
            return;
        }
        // 모든 선택지 순회
        for (let choice of choices) {
            // 가지치기: 선택이 유효한지 확인
            if (isValid(state, choice)) {
                // 시도: 선택하고 상태 갱신
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 되돌리기: 선택을 취소하고 이전 상태 복원
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* 백트래킹 알고리즘의 기본 틀 */
    void backtrack(State state, List<Choice>, List<State> res) {
      // 해인지 확인
      if (isSolution(state)) {
        // 해 기록
        recordSolution(state, res);
        // 더 이상 탐색하지 않는다
        return;
      }
      // 모든 선택지 순회
      for (Choice choice in choices) {
        // 가지치기: 선택이 유효한지 확인
        if (isValid(state, choice)) {
          // 시도: 선택하고 상태 갱신
          makeChoice(state, choice);
          backtrack(state, choices, res);
          // 되돌리기: 선택을 취소하고 이전 상태 복원
          undoChoice(state, choice);
        }
      }
    }
    ```

=== "Rust"

    ```rust title=""
    /* 백트래킹 알고리즘의 기본 틀 */
    fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
        // 해인지 확인
        if is_solution(state) {
            // 해 기록
            record_solution(state, res);
            // 더 이상 탐색하지 않는다
            return;
        }
        // 모든 선택지 순회
        for choice in choices {
            // 가지치기: 선택이 유효한지 확인
            if is_valid(state, choice) {
                // 시도: 선택하고 상태 갱신
                make_choice(state, choice);
                backtrack(state, choices, res);
                // 되돌리기: 선택을 취소하고 이전 상태 복원
                undo_choice(state, choice);
            }
        }
    }
    ```

=== "C"

    ```c title=""
    /* 백트래킹 알고리즘의 기본 틀 */
    void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
        // 해인지 확인
        if (isSolution(state)) {
            // 해 기록
            recordSolution(state, res, numRes);
            // 더 이상 탐색하지 않는다
            return;
        }
        // 모든 선택지 순회
        for (int i = 0; i < numChoices; i++) {
            // 가지치기: 선택이 유효한지 확인
            if (isValid(state, &choices[i])) {
                // 시도: 선택하고 상태 갱신
                makeChoice(state, &choices[i]);
                backtrack(state, choices, numChoices, res, numRes);
                // 되돌리기: 선택을 취소하고 이전 상태 복원
                undoChoice(state, &choices[i]);
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* 백트래킹 알고리즘의 기본 틀 */
    fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
        // 해인지 확인
        if (isSolution(state)) {
            // 해 기록
            recordSolution(state, res)
            // 더 이상 탐색하지 않는다
            return
        }
        // 모든 선택지 순회
        for (choice in choices) {
            // 가지치기: 선택이 유효한지 확인
            if (isValid(state, choice)) {
                // 시도: 선택하고 상태 갱신
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // 되돌리기: 선택을 취소하고 이전 상태 복원
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### 백트래킹 알고리즘의 기본 틀 ###
    def backtrack(state, choices, res)
        # 해인지 확인
        if is_solution?(state)
            # 해 기록
            record_solution(state, res)
            return
        end

        # 모든 선택지 순회
        for choice in choices
            # 가지치기: 선택이 유효한지 확인
            if is_valid?(state, choice)
                # 시도: 선택하고 상태 갱신
                make_choice(state, choice)
                backtrack(state, choices, res)
                # 되돌리기: 선택을 취소하고 이전 상태 복원
                undo_choice(state, choice)
            end
        end
    end
    ```

이제 기본 틀 코드로 예제 3을 해결해 보자. 상태 `state`는 노드 순회 경로, 선택지 `choices`는 현재 노드의 왼쪽과 오른쪽 자식 노드, 결과 `res`는 경로들의 리스트다.

=== "Python"

    ```python title="preorder_traversal_iii_template.py"
    def is_solution(state: list[TreeNode]) -> bool:
        """현재 상태가 해인지 판단"""
        return state and state[-1].val == 7

    def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
        """해를 기록한다"""
        res.append(list(state))

    def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
        """현재 상태에서 해당 선택이 유효한지 판단"""
        return choice is not None and choice.val != 3

    def make_choice(state: list[TreeNode], choice: TreeNode):
        """상태 갱신"""
        state.append(choice)

    def undo_choice(state: list[TreeNode], choice: TreeNode):
        """상태 복원"""
        state.pop()

    def backtrack(
        state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
    ):
        """백트래킹 알고리즘: 예제 3"""
        # 해인지 확인한다
        if is_solution(state):
            # 해를 기록한다
            record_solution(state, res)
        # 모든 선택지를 순회한다
        for choice in choices:
            # 가지치기: 선택이 유효한지 확인한다
            if is_valid(state, choice):
                # 시도: 선택하고 상태를 갱신한다
                make_choice(state, choice)
                # 다음 선택을 진행한다
                backtrack(state, [choice.left, choice.right], res)
                # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                undo_choice(state, choice)
    ```

=== "C++"

    ```cpp title="preorder_traversal_iii_template.cpp"
    /* 현재 상태가 해인지 판단 */
    bool isSolution(vector<TreeNode *> &state) {
        return !state.empty() && state.back()->val == 7;
    }

    /* 해를 기록한다 */
    void recordSolution(vector<TreeNode *> &state, vector<vector<TreeNode *>> &res) {
        res.push_back(state);
    }

    /* 현재 상태에서 해당 선택이 유효한지 판단 */
    bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
        return choice != nullptr && choice->val != 3;
    }

    /* 상태 갱신 */
    void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
        state.push_back(choice);
    }

    /* 상태 복원 */
    void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
        state.pop_back();
    }

    /* 백트래킹 알고리즘: 예제 3 */
    void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
        // 해인지 확인한다
        if (isSolution(state)) {
            // 해를 기록한다
            recordSolution(state, res);
        }
        // 모든 선택지를 순회한다
        for (TreeNode *choice : choices) {
            // 가지치기: 선택이 유효한지 확인한다
            if (isValid(state, choice)) {
                // 시도: 선택하고 상태를 갱신한다
                makeChoice(state, choice);
                // 다음 선택을 진행한다
                vector<TreeNode *> nextChoices{choice->left, choice->right};
                backtrack(state, nextChoices, res);
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Java"

    ```java title="preorder_traversal_iii_template.java"
    /* 현재 상태가 해인지 판단 */
    boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* 해를 기록한다 */
    void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* 현재 상태에서 해당 선택이 유효한지 판단 */
    boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 상태 갱신 */
    void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* 상태 복원 */
    void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* 백트래킹 알고리즘: 예제 3 */
    void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 해인지 확인한다
        if (isSolution(state)) {
            // 해를 기록한다
            recordSolution(state, res);
        }
        // 모든 선택지를 순회한다
        for (TreeNode choice : choices) {
            // 가지치기: 선택이 유효한지 확인한다
            if (isValid(state, choice)) {
                // 시도: 선택하고 상태를 갱신한다
                makeChoice(state, choice);
                // 다음 선택을 진행한다
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_iii_template.cs"
    /* 현재 상태가 해인지 판단 */
    bool IsSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* 해를 기록한다 */
    void RecordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* 현재 상태에서 해당 선택이 유효한지 판단 */
    bool IsValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 상태 갱신 */
    void MakeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* 상태 복원 */
    void UndoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* 백트래킹 알고리즘: 예제 3 */
    void Backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 해인지 확인한다
        if (IsSolution(state)) {
            // 해를 기록한다
            RecordSolution(state, res);
        }
        // 모든 선택지를 순회한다
        foreach (TreeNode choice in choices) {
            // 가지치기: 선택이 유효한지 확인한다
            if (IsValid(state, choice)) {
                // 시도: 선택하고 상태를 갱신한다
                MakeChoice(state, choice);
                // 다음 선택을 진행한다
                Backtrack(state, [choice.left!, choice.right!], res);
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                UndoChoice(state, choice);
            }
        }
    }
    ```

=== "Go"

    ```go title="preorder_traversal_iii_template.go"
    /* 현재 상태가 해인지 판단 */
    func isSolution(state *[]*TreeNode) bool {
        return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
    }

    /* 해를 기록한다 */
    func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
        *res = append(*res, append([]*TreeNode{}, *state...))
    }

    /* 현재 상태에서 해당 선택이 유효한지 판단 */
    func isValid(state *[]*TreeNode, choice *TreeNode) bool {
        return choice != nil && choice.Val != 3
    }

    /* 상태 갱신 */
    func makeChoice(state *[]*TreeNode, choice *TreeNode) {
        *state = append(*state, choice)
    }

    /* 상태 복원 */
    func undoChoice(state *[]*TreeNode, choice *TreeNode) {
        *state = (*state)[:len(*state)-1]
    }

    /* 백트래킹 알고리즘: 예제 3 */
    func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
        // 해인지 확인한다
        if isSolution(state) {
            // 해를 기록한다
            recordSolution(state, res)
        }
        // 모든 선택지를 순회한다
        for _, choice := range *choices {
            // 가지치기: 선택이 유효한지 확인한다
            if isValid(state, choice) {
                // 시도: 선택하고 상태를 갱신한다
                makeChoice(state, choice)
                // 다음 선택을 진행한다
                temp := make([]*TreeNode, 0)
                temp = append(temp, choice.Left, choice.Right)
                backtrackIII(state, &temp, res)
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_iii_template.swift"
    /* 현재 상태가 해인지 판단 */
    func isSolution(state: [TreeNode]) -> Bool {
        !state.isEmpty && state.last!.val == 7
    }

    /* 해를 기록한다 */
    func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
        res.append(state)
    }

    /* 현재 상태에서 해당 선택이 유효한지 판단 */
    func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
        choice != nil && choice!.val != 3
    }

    /* 상태 갱신 */
    func makeChoice(state: inout [TreeNode], choice: TreeNode) {
        state.append(choice)
    }

    /* 상태 복원 */
    func undoChoice(state: inout [TreeNode], choice: TreeNode) {
        state.removeLast()
    }

    /* 백트래킹 알고리즘: 예제 3 */
    func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
        // 해인지 확인한다
        if isSolution(state: state) {
            recordSolution(state: state, res: &res)
        }
        // 모든 선택지를 순회한다
        for choice in choices {
            // 가지치기: 선택이 유효한지 확인한다
            if isValid(state: state, choice: choice) {
                // 시도: 선택하고 상태를 갱신한다
                makeChoice(state: &state, choice: choice)
                // 다음 선택을 진행한다
                backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                undoChoice(state: &state, choice: choice)
            }
        }
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_iii_template.js"
    /* 현재 상태가 해인지 판단 */
    function isSolution(state) {
        return state && state[state.length - 1]?.val === 7;
    }

    /* 해를 기록한다 */
    function recordSolution(state, res) {
        res.push([...state]);
    }

    /* 현재 상태에서 해당 선택이 유효한지 판단 */
    function isValid(state, choice) {
        return choice !== null && choice.val !== 3;
    }

    /* 상태 갱신 */
    function makeChoice(state, choice) {
        state.push(choice);
    }

    /* 상태 복원 */
    function undoChoice(state) {
        state.pop();
    }

    /* 백트래킹 알고리즘: 예제 3 */
    function backtrack(state, choices, res) {
        // 해인지 확인한다
        if (isSolution(state)) {
            // 해를 기록한다
            recordSolution(state, res);
        }
        // 모든 선택지를 순회한다
        for (const choice of choices) {
            // 가지치기: 선택이 유효한지 확인한다
            if (isValid(state, choice)) {
                // 시도: 선택하고 상태를 갱신한다
                makeChoice(state, choice);
                // 다음 선택을 진행한다
                backtrack(state, [choice.left, choice.right], res);
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                undoChoice(state);
            }
        }
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_iii_template.ts"
    /* 현재 상태가 해인지 판단 */
    function isSolution(state: TreeNode[]): boolean {
        return state && state[state.length - 1]?.val === 7;
    }

    /* 해를 기록한다 */
    function recordSolution(state: TreeNode[], res: TreeNode[][]): void {
        res.push([...state]);
    }

    /* 현재 상태에서 해당 선택이 유효한지 판단 */
    function isValid(state: TreeNode[], choice: TreeNode): boolean {
        return choice !== null && choice.val !== 3;
    }

    /* 상태 갱신 */
    function makeChoice(state: TreeNode[], choice: TreeNode): void {
        state.push(choice);
    }

    /* 상태 복원 */
    function undoChoice(state: TreeNode[]): void {
        state.pop();
    }

    /* 백트래킹 알고리즘: 예제 3 */
    function backtrack(
        state: TreeNode[],
        choices: TreeNode[],
        res: TreeNode[][]
    ): void {
        // 해인지 확인한다
        if (isSolution(state)) {
            // 해를 기록한다
            recordSolution(state, res);
        }
        // 모든 선택지를 순회한다
        for (const choice of choices) {
            // 가지치기: 선택이 유효한지 확인한다
            if (isValid(state, choice)) {
                // 시도: 선택하고 상태를 갱신한다
                makeChoice(state, choice);
                // 다음 선택을 진행한다
                backtrack(state, [choice.left, choice.right], res);
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                undoChoice(state);
            }
        }
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_iii_template.dart"
    /* 현재 상태가 해인지 판단 */
    bool isSolution(List<TreeNode> state) {
      return state.isNotEmpty && state.last.val == 7;
    }

    /* 해를 기록한다 */
    void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
      res.add(List.from(state));
    }

    /* 현재 상태에서 해당 선택이 유효한지 판단 */
    bool isValid(List<TreeNode> state, TreeNode? choice) {
      return choice != null && choice.val != 3;
    }

    /* 상태 갱신 */
    void makeChoice(List<TreeNode> state, TreeNode? choice) {
      state.add(choice!);
    }

    /* 상태 복원 */
    void undoChoice(List<TreeNode> state, TreeNode? choice) {
      state.removeLast();
    }

    /* 백트래킹 알고리즘: 예제 3 */
    void backtrack(
      List<TreeNode> state,
      List<TreeNode?> choices,
      List<List<TreeNode>> res,
    ) {
      // 해인지 확인한다
      if (isSolution(state)) {
        // 해를 기록한다
        recordSolution(state, res);
      }
      // 모든 선택지를 순회한다
      for (TreeNode? choice in choices) {
        // 가지치기: 선택이 유효한지 확인한다
        if (isValid(state, choice)) {
          // 시도: 선택하고 상태를 갱신한다
          makeChoice(state, choice);
          // 다음 선택을 진행한다
          backtrack(state, [choice!.left, choice.right], res);
          // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
          undoChoice(state, choice);
        }
      }
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_iii_template.rs"
    /* 현재 상태가 해인지 판단 */
    fn is_solution(state: &mut Vec<Rc<RefCell<TreeNode>>>) -> bool {
        return !state.is_empty() && state.last().unwrap().borrow().val == 7;
    }

    /* 해를 기록한다 */
    fn record_solution(
        state: &mut Vec<Rc<RefCell<TreeNode>>>,
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    ) {
        res.push(state.clone());
    }

    /* 현재 상태에서 해당 선택이 유효한지 판단 */
    fn is_valid(_: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Option<&Rc<RefCell<TreeNode>>>) -> bool {
        return choice.is_some() && choice.unwrap().borrow().val != 3;
    }

    /* 상태 갱신 */
    fn make_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) {
        state.push(choice);
    }

    /* 상태 복원 */
    fn undo_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, _: Rc<RefCell<TreeNode>>) {
        state.pop();
    }

    /* 백트래킹 알고리즘: 예제 3 */
    fn backtrack(
        state: &mut Vec<Rc<RefCell<TreeNode>>>,
        choices: &Vec<Option<&Rc<RefCell<TreeNode>>>>,
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    ) {
        // 해인지 확인한다
        if is_solution(state) {
            // 해를 기록한다
            record_solution(state, res);
        }
        // 모든 선택지를 순회한다
        for &choice in choices.iter() {
            // 가지치기: 선택이 유효한지 확인한다
            if is_valid(state, choice) {
                // 시도: 선택하고 상태를 갱신한다
                make_choice(state, choice.unwrap().clone());
                // 다음 선택을 진행한다
                backtrack(
                    state,
                    &vec![
                        choice.unwrap().borrow().left.as_ref(),
                        choice.unwrap().borrow().right.as_ref(),
                    ],
                    res,
                );
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                undo_choice(state, choice.unwrap().clone());
            }
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_iii_template.c"
    /* 현재 상태가 해인지 판단 */
    bool isSolution(void) {
        return pathSize > 0 && path[pathSize - 1]->val == 7;
    }

    /* 해를 기록한다 */
    void recordSolution(void) {
        for (int i = 0; i < pathSize; i++) {
            res[resSize][i] = path[i];
        }
        resSize++;
    }

    /* 현재 상태에서 해당 선택이 유효한지 판단 */
    bool isValid(TreeNode *choice) {
        return choice != NULL && choice->val != 3;
    }

    /* 상태 갱신 */
    void makeChoice(TreeNode *choice) {
        path[pathSize++] = choice;
    }

    /* 상태 복원 */
    void undoChoice(void) {
        pathSize--;
    }

    /* 백트래킹 알고리즘: 예제 3 */
    void backtrack(TreeNode *choices[2]) {
        // 해인지 확인한다
        if (isSolution()) {
            // 해를 기록한다
            recordSolution();
        }
        // 모든 선택지를 순회한다
        for (int i = 0; i < 2; i++) {
            TreeNode *choice = choices[i];
            // 가지치기: 선택이 유효한지 확인한다
            if (isValid(choice)) {
                // 시도: 선택하고 상태를 갱신한다
                makeChoice(choice);
                // 다음 선택을 진행한다
                TreeNode *nextChoices[2] = {choice->left, choice->right};
                backtrack(nextChoices);
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                undoChoice();
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_iii_template.kt"
    /* 현재 상태가 해인지 판단 */
    fun isSolution(state: MutableList<TreeNode?>): Boolean {
        return state.isNotEmpty() && state[state.size - 1]?._val == 7
    }

    /* 해를 기록한다 */
    fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
        res.add(state!!.toMutableList())
    }

    /* 현재 상태에서 해당 선택이 유효한지 판단 */
    fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
        return choice != null && choice._val != 3
    }

    /* 상태 갱신 */
    fun makeChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
        state.add(choice)
    }

    /* 상태 복원 */
    fun undoChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
        state.removeLast()
    }

    /* 백트래킹 알고리즘: 예제 3 */
    fun backtrack(
        state: MutableList<TreeNode?>,
        choices: MutableList<TreeNode?>,
        res: MutableList<MutableList<TreeNode?>?>
    ) {
        // 해인지 확인한다
        if (isSolution(state)) {
            // 해를 기록한다
            recordSolution(state, res)
        }
        // 모든 선택지를 순회한다
        for (choice in choices) {
            // 가지치기: 선택이 유효한지 확인한다
            if (isValid(state, choice)) {
                // 시도: 선택하고 상태를 갱신한다
                makeChoice(state, choice)
                // 다음 선택을 진행한다
                backtrack(state, mutableListOf(choice!!.left, choice.right), res)
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_iii_template.rb"
    ### 현재 상태가 해인지 판단 ###
    def is_solution?(state)
      !state.empty? && state.last.val == 7
    end

    ### 해를 기록한다 ###
    def record_solution(state, res)
      res << state.dup
    end

    ### 현재 상태에서 해당 선택이 유효한지 판단 ###
    def is_valid?(state, choice)
      choice && choice.val != 3
    end

    ### 상태 갱신 ###
    def make_choice(state, choice)
      state << choice
    end

    ### 상태 복원 ###
    def undo_choice(state, choice)
      state.pop
    end

    ### 백트래킹 알고리즘: 예제 3 ###
    def backtrack(state, choices, res)
      # 해인지 확인한다
      record_solution(state, res) if is_solution?(state)

      # 모든 선택지를 순회한다
      for choice in choices
        # 가지치기: 선택이 유효한지 확인한다
        if is_valid?(state, choice)
          # 시도: 선택하고 상태를 갱신한다
          make_choice(state, choice)
          # 다음 선택을 진행한다
          backtrack(state, [choice.left, choice.right], res)
          # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
          undo_choice(state, choice)
        end
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%0A%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%3A%20%EC%9E%AC%EA%B7%80%22%22%22%0A%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B0%B0%EC%97%B4%20%EA%B8%B8%EC%9D%B4%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EA%B1%B0%EB%82%98%20%ED%95%B4%EB%8B%B9%20%EC%9B%90%EC%86%8C%EA%B0%80%20None%EC%9D%B4%EB%A9%B4%20None%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20return%20None%0A%20%23%20%ED%98%84%EC%9E%AC%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%83%9D%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%23%20%EC%99%BC%EC%AA%BD%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%EB%A5%BC%20%EC%9E%AC%EA%B7%80%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%22%22%22%0A%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20is_solution%28state%3A%20list%5BTreeNode%5D%29%20-%3E%20bool%3A%0A%20%22%22%22%ED%98%84%EC%9E%AC%20%EC%83%81%ED%83%9C%EA%B0%80%20%ED%95%B4%EC%9D%B8%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20return%20state%20and%20state%5B-1%5D.val%20%3D%3D%207%0A%0Adef%20record_solution%28state%3A%20list%5BTreeNode%5D,%20res%3A%20list%5Blist%5BTreeNode%5D%5D%29%3A%0A%20%22%22%22%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%22%22%22%0A%20res.append%28list%28state%29%29%0A%0Adef%20is_valid%28state%3A%20list%5BTreeNode%5D,%20choice%3A%20TreeNode%29%20-%3E%20bool%3A%0A%20%22%22%22%ED%98%84%EC%9E%AC%20%EC%83%81%ED%83%9C%EC%97%90%EC%84%9C%20%ED%95%B4%EB%8B%B9%20%EC%84%A0%ED%83%9D%EC%9D%B4%20%EC%9C%A0%ED%9A%A8%ED%95%9C%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20return%20choice%20is%20not%20None%20and%20choice.val%20%21%3D%203%0A%0Adef%20make_choice%28state%3A%20list%5BTreeNode%5D,%20choice%3A%20TreeNode%29%3A%0A%20%22%22%22%EC%83%81%ED%83%9C%20%EA%B0%B1%EC%8B%A0%22%22%22%0A%20state.append%28choice%29%0A%0Adef%20undo_choice%28state%3A%20list%5BTreeNode%5D,%20choice%3A%20TreeNode%29%3A%0A%20%22%22%22%EC%83%81%ED%83%9C%20%EB%B3%B5%EC%9B%90%22%22%22%0A%20state.pop%28%29%0A%0Adef%20backtrack%28%0A%20state%3A%20list%5BTreeNode%5D,%20choices%3A%20list%5BTreeNode%5D,%20res%3A%20list%5Blist%5BTreeNode%5D%5D%0A%29%3A%0A%20%22%22%22%EB%B0%B1%ED%8A%B8%EB%9E%98%ED%82%B9%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%3A%20%EC%98%88%EC%A0%9C%203%22%22%22%0A%20%23%20%ED%95%B4%EC%9D%B8%EC%A7%80%20%ED%99%95%EC%9D%B8%ED%95%9C%EB%8B%A4%0A%20if%20is_solution%28state%29%3A%0A%20%20%23%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20record_solution%28state,%20res%29%0A%20%23%20%EB%AA%A8%EB%93%A0%20%EC%84%A0%ED%83%9D%EC%A7%80%EB%A5%BC%20%EC%88%9C%ED%9A%8C%ED%95%9C%EB%8B%A4%0A%20for%20choice%20in%20choices%3A%0A%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%3A%20%EC%84%A0%ED%83%9D%EC%9D%B4%20%EC%9C%A0%ED%9A%A8%ED%95%9C%EC%A7%80%20%ED%99%95%EC%9D%B8%ED%95%9C%EB%8B%A4%0A%20%20if%20is_valid%28state,%20choice%29%3A%0A%20%20%20%23%20%EC%8B%9C%EB%8F%84%3A%20%EC%84%A0%ED%83%9D%ED%95%98%EA%B3%A0%20%EC%83%81%ED%83%9C%EB%A5%BC%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20make_choice%28state,%20choice%29%0A%20%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%A7%84%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20backtrack%28state,%20%5Bchoice.left,%20choice.right%5D,%20res%29%0A%20%20%20%23%20%EB%90%98%EB%8F%8C%EB%A6%AC%EA%B8%B0%3A%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%B7%A8%EC%86%8C%ED%95%98%EA%B3%A0%20%EC%9D%B4%EC%A0%84%20%EC%83%81%ED%83%9C%EB%A1%9C%20%EB%90%98%EB%8F%8C%EB%A6%B0%EB%8B%A4%0A%20%20%20undo_choice%28state,%20choice%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%23%20%EB%B0%B1%ED%8A%B8%EB%9E%98%ED%82%B9%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%0A%20res%20%3D%20%5B%5D%0A%20backtrack%28state%3D%5B%5D,%20choices%3D%5Broot%5D,%20res%3Dres%29%0A%20print%28%22%5Cn%EB%AA%A8%EB%93%A0%20%EA%B2%BD%EB%A1%9C%20%EC%B6%9C%EB%A0%A5%22%29%0A%20for%20path%20in%20res%3A%0A%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=138&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%0A%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%3A%20%EC%9E%AC%EA%B7%80%22%22%22%0A%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B0%B0%EC%97%B4%20%EA%B8%B8%EC%9D%B4%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EA%B1%B0%EB%82%98%20%ED%95%B4%EB%8B%B9%20%EC%9B%90%EC%86%8C%EA%B0%80%20None%EC%9D%B4%EB%A9%B4%20None%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20return%20None%0A%20%23%20%ED%98%84%EC%9E%AC%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%83%9D%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%23%20%EC%99%BC%EC%AA%BD%EA%B3%BC%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%84%9C%EB%B8%8C%ED%8A%B8%EB%A6%AC%EB%A5%BC%20%EC%9E%AC%EA%B7%80%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%EC%84%B1%ED%95%9C%EB%8B%A4%0A%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%22%22%22%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%EB%A1%9C%20%EC%97%AD%EC%A7%81%EB%A0%AC%ED%99%94%22%22%22%0A%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20is_solution%28state%3A%20list%5BTreeNode%5D%29%20-%3E%20bool%3A%0A%20%22%22%22%ED%98%84%EC%9E%AC%20%EC%83%81%ED%83%9C%EA%B0%80%20%ED%95%B4%EC%9D%B8%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20return%20state%20and%20state%5B-1%5D.val%20%3D%3D%207%0A%0Adef%20record_solution%28state%3A%20list%5BTreeNode%5D,%20res%3A%20list%5Blist%5BTreeNode%5D%5D%29%3A%0A%20%22%22%22%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%22%22%22%0A%20res.append%28list%28state%29%29%0A%0Adef%20is_valid%28state%3A%20list%5BTreeNode%5D,%20choice%3A%20TreeNode%29%20-%3E%20bool%3A%0A%20%22%22%22%ED%98%84%EC%9E%AC%20%EC%83%81%ED%83%9C%EC%97%90%EC%84%9C%20%ED%95%B4%EB%8B%B9%20%EC%84%A0%ED%83%9D%EC%9D%B4%20%EC%9C%A0%ED%9A%A8%ED%95%9C%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20return%20choice%20is%20not%20None%20and%20choice.val%20%21%3D%203%0A%0Adef%20make_choice%28state%3A%20list%5BTreeNode%5D,%20choice%3A%20TreeNode%29%3A%0A%20%22%22%22%EC%83%81%ED%83%9C%20%EA%B0%B1%EC%8B%A0%22%22%22%0A%20state.append%28choice%29%0A%0Adef%20undo_choice%28state%3A%20list%5BTreeNode%5D,%20choice%3A%20TreeNode%29%3A%0A%20%22%22%22%EC%83%81%ED%83%9C%20%EB%B3%B5%EC%9B%90%22%22%22%0A%20state.pop%28%29%0A%0Adef%20backtrack%28%0A%20state%3A%20list%5BTreeNode%5D,%20choices%3A%20list%5BTreeNode%5D,%20res%3A%20list%5Blist%5BTreeNode%5D%5D%0A%29%3A%0A%20%22%22%22%EB%B0%B1%ED%8A%B8%EB%9E%98%ED%82%B9%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%3A%20%EC%98%88%EC%A0%9C%203%22%22%22%0A%20%23%20%ED%95%B4%EC%9D%B8%EC%A7%80%20%ED%99%95%EC%9D%B8%ED%95%9C%EB%8B%A4%0A%20if%20is_solution%28state%29%3A%0A%20%20%23%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20record_solution%28state,%20res%29%0A%20%23%20%EB%AA%A8%EB%93%A0%20%EC%84%A0%ED%83%9D%EC%A7%80%EB%A5%BC%20%EC%88%9C%ED%9A%8C%ED%95%9C%EB%8B%A4%0A%20for%20choice%20in%20choices%3A%0A%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%3A%20%EC%84%A0%ED%83%9D%EC%9D%B4%20%EC%9C%A0%ED%9A%A8%ED%95%9C%EC%A7%80%20%ED%99%95%EC%9D%B8%ED%95%9C%EB%8B%A4%0A%20%20if%20is_valid%28state,%20choice%29%3A%0A%20%20%20%23%20%EC%8B%9C%EB%8F%84%3A%20%EC%84%A0%ED%83%9D%ED%95%98%EA%B3%A0%20%EC%83%81%ED%83%9C%EB%A5%BC%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20make_choice%28state,%20choice%29%0A%20%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%A7%84%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20backtrack%28state,%20%5Bchoice.left,%20choice.right%5D,%20res%29%0A%20%20%20%23%20%EB%90%98%EB%8F%8C%EB%A6%AC%EA%B8%B0%3A%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%B7%A8%EC%86%8C%ED%95%98%EA%B3%A0%20%EC%9D%B4%EC%A0%84%20%EC%83%81%ED%83%9C%EB%A1%9C%20%EB%90%98%EB%8F%8C%EB%A6%B0%EB%8B%A4%0A%20%20%20undo_choice%28state,%20choice%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%23%20%EB%B0%B1%ED%8A%B8%EB%9E%98%ED%82%B9%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%0A%20res%20%3D%20%5B%5D%0A%20backtrack%28state%3D%5B%5D,%20choices%3D%5Broot%5D,%20res%3Dres%29%0A%20print%28%22%5Cn%EB%AA%A8%EB%93%A0%20%EA%B2%BD%EB%A1%9C%20%EC%B6%9C%EB%A0%A5%22%29%0A%20for%20path%20in%20res%3A%0A%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=138&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

문제의 요구에 따르면 값이 $7$인 노드를 찾은 뒤에도 탐색을 계속해야 한다. **따라서 해를 기록한 뒤의 `return` 문을 삭제해야 한다**. 아래 그림(13-4)은 `return` 문을 유지하거나 삭제했을 때의 탐색 과정을 비교한다.

![return 유지 여부에 따른 탐색 과정 비교](backtracking_algorithm.assets/backtrack_remove_return_or_not.png){ class="animation-figure" }

<p align="center"> 그림 13-4 &nbsp; return 유지 여부에 따른 탐색 과정 비교 </p>

전위 순회 기반 코드에 비해 백트래킹 기본 틀을 사용한 코드는 다소 장황하지만 범용성이 더 좋다. 실제로 **많은 백트래킹 문제를 이 틀 안에서 해결할 수 있다**. 구체적인 문제에 맞게 `state`와 `choices`를 정의하고, 틀 안의 각 메서드만 구현하면 된다.

## 13.1.4 &nbsp; 주요 용어

알고리즘 문제를 더 명확히 분석하기 위해 백트래킹에서 자주 쓰는 용어를 정리하고, 예제 3에 대응하는 사례를 아래 표(13-1)에 나타냈다.

<p align="center"> 표 13-1 &nbsp; 백트래킹 알고리즘의 주요 용어 </p>

<div class="center-table" markdown>

| 용어 | 정의 | 예제 3 |
| ---------------------- | -------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| 해(solution) | 문제의 특정 조건을 만족하는 답으로, 하나 또는 여러 개일 수 있다 | 루트 노드에서 노드 $7$까지 제약 조건을 만족하는 모든 경로 |
| 제약 조건(constraint) | 해의 유효성을 제한하는 조건으로, 보통 가지치기에 사용한다 | 경로에 노드 $3$이 포함되지 않는다 |
| 상태(state) | 이미 내린 선택을 포함하여 특정 시점의 문제 상황을 나타낸다 | 현재까지 방문한 노드의 경로, 즉 노드 리스트 `path` |
| 시도(attempt) | 가능한 선택으로 해 공간을 탐색하는 과정으로, 선택, 상태 갱신, 해인지 확인하는 작업을 포함한다 | 왼쪽(오른쪽) 자식 노드를 재귀적으로 방문하고 `path`에 추가한 뒤 값이 $7$인지 확인한다 |
| 되돌리기(backtracking) | 제약 조건을 만족하지 않는 상태를 만나면 이전 선택을 취소하고 직전 상태로 돌아간다 | 리프 노드를 지나거나 노드 방문을 마치거나 값이 $3$인 노드를 만나면 탐색을 멈추고 함수가 반환된다 |
| 가지치기(pruning) | 문제의 특성과 제약 조건에 따라 의미 없는 탐색 경로를 피하여 효율을 높이는 방법이다 | 값이 $3$인 노드를 만나면 탐색을 더 진행하지 않는다 |

</div>

!!! tip "참고"

    문제, 해, 상태 등의 개념은 분할 정복, 백트래킹, 동적 계획법, 탐욕 알고리즘 등에서 공통으로 사용된다.

## 13.1.5 &nbsp; 장점과 한계

백트래킹은 본질적으로 깊이 우선 탐색 알고리즘으로, 조건을 만족하는 해를 찾을 때까지 가능한 모든 해결 방법을 시도한다. 모든 가능한 해를 찾을 수 있으며, 적절히 가지치기하면 매우 효율적이라는 장점이 있다.

하지만 규모가 크거나 복잡한 문제에서는 **백트래킹의 실행 효율을 받아들이기 어려울 수 있다**.

- **시간**: 상태 공간의 모든 가능성을 순회해야 하는 경우가 많아 시간 복잡도가 지수 또는 팩토리얼 수준에 이를 수 있다.
- **공간**: 재귀 호출 중 현재 상태(경로, 가지치기용 보조 변수 등)를 저장해야 하므로 깊이가 크면 공간 요구량도 매우 커질 수 있다.

그렇더라도 **일부 탐색 문제와 제약 만족 문제에서는 백트래킹이 여전히 최선의 해결 방법이다**. 어떤 선택이 유효한 해를 만들지 예측할 수 없으므로 가능한 모든 선택을 순회해야 하기 때문이다. 이때는 **효율을 어떻게 최적화하느냐가 핵심**이며, 대표적인 방법은 두 가지다.

- **가지치기**: 해가 나올 수 없는 경로를 탐색하지 않아 시간과 공간을 절약한다.
- **휴리스틱 탐색**: 탐색에 전략이나 추정값을 도입하여 유효한 해가 나올 가능성이 높은 경로를 먼저 탐색한다.

## 13.1.6 &nbsp; 대표적인 백트래킹 문제

백트래킹은 많은 탐색 문제, 제약 만족 문제, 조합 최적화 문제를 해결하는 데 사용할 수 있다.

**탐색 문제**: 특정 조건을 만족하는 해결 방법을 찾는 것이 목표다.

- 모든 순열 문제: 집합이 주어졌을 때 가능한 모든 배열 순서를 구한다.
- 부분 집합 합 문제: 집합과 목표 합이 주어졌을 때 원소의 합이 목표 합인 모든 부분 집합을 찾는다.
- 하노이의 탑 문제: 기둥 세 개와 크기가 다른 원판들이 주어졌을 때 모든 원판을 한 기둥에서 다른 기둥으로 옮긴다. 한 번에 하나만 옮길 수 있고 큰 원판을 작은 원판 위에 놓으면 안 된다.

**제약 만족 문제**: 모든 제약 조건을 만족하는 해를 찾는 것이 목표다.

- $n$-퀸: $n \times n$ 체스판에 퀸 $n$ 개를 서로 공격하지 않도록 놓는다.
- 스도쿠: $9 \times 9$ 격자에 $1$ ~ $9$를 넣되, 각 행과 열 및 각 $3 \times 3$ 부분 격자에서 숫자가 중복되지 않게 한다.
- 그래프 색칠 문제: 무방향 그래프의 각 정점을 가능한 한 적은 색으로 칠하되, 인접한 정점은 서로 다른 색을 갖게 한다.

**조합 최적화 문제**: 조합 공간에서 특정 조건을 만족하는 최적해를 찾는 것이 목표다.

- 0-1 배낭 문제: 가치와 무게가 있는 물건들과 배낭이 주어졌을 때, 용량 제한 안에서 총가치가 최대가 되도록 물건을 고른다.
- 외판원 문제: 그래프의 한 점에서 출발하여 다른 모든 점을 정확히 한 번 방문한 뒤 출발점으로 돌아오는 최단 경로를 구한다.
- 최대 클리크 문제: 무방향 그래프에서 가장 큰 완전 부분 그래프, 즉 임의의 두 정점 사이에 간선이 있는 부분 그래프를 찾는다.

많은 조합 최적화 문제에서 백트래킹이 최적의 해결 방법은 아니라는 점에 주의하자.

- 0-1 배낭 문제는 더 높은 시간 효율을 위해 보통 동적 계획법으로 해결한다.
- 외판원 문제는 유명한 NP-Hard 문제이며, 유전 알고리즘과 개미 군집 알고리즘 등이 자주 쓰인다.
- 최대 클리크 문제는 그래프 이론의 대표적인 문제로, 탐욕 알고리즘 같은 휴리스틱 알고리즘을 사용할 수 있다.
