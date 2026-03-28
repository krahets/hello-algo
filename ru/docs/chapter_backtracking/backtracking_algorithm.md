---
comments: true
---

# 13.1 &nbsp; Алгоритм поиска с возвратом

<u>Алгоритм поиска с возвратом (backtracking algorithm)</u> - это метод решения задач путем полного перебора. Его основная идея состоит в том, чтобы, начиная с некоторого исходного состояния, грубо перебрать все возможные решения, записывать корректные решения и продолжать поиск до тех пор, пока решение не будет найдено или пока не будут исчерпаны все возможные варианты.

Обычно алгоритмы поиска с возвратом используют "поиск в глубину" для обхода пространства решений. В главе "Бинарные деревья" мы уже упоминали, что прямой, симметричный и обратный обходы относятся к поиску в глубину. Теперь мы на основе прямого обхода построим задачу backtracking и постепенно разберем принцип работы этого алгоритма.

!!! question "Пример 1"

    Дано двоичное дерево. Найдите и запишите все узлы со значением $7$ ; верните список этих узлов.

Для этой задачи мы выполняем прямой обход дерева и проверяем, равно ли значение текущего узла $7$ ; если да, то добавляем значение этого узла в список результатов `res` . Соответствующий процесс показан на рисунке 13-1 и в коде:

=== "Python"

    ```python title="preorder_traversal_i_compact.py"
    def pre_order(root: TreeNode):
        """Предварительный обход: пример 1"""
        if root is None:
            return
        if root.val == 7:
            # Записать решение
            res.append(root)
        pre_order(root.left)
        pre_order(root.right)
    ```

=== "C++"

    ```cpp title="preorder_traversal_i_compact.cpp"
    /* Предварительный обход: пример 1 */
    void preOrder(TreeNode *root) {
        if (root == nullptr) {
            return;
        }
        if (root->val == 7) {
            // Записать решение
            res.push_back(root);
        }
        preOrder(root->left);
        preOrder(root->right);
    }
    ```

=== "Java"

    ```java title="preorder_traversal_i_compact.java"
    /* Предварительный обход: пример 1 */
    void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // Записать решение
            res.add(root);
        }
        preOrder(root.left);
        preOrder(root.right);
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_i_compact.cs"
    /* Предварительный обход: пример 1 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // Записать решение
            res.Add(root);
        }
        PreOrder(root.left);
        PreOrder(root.right);
    }
    ```

=== "Go"

    ```go title="preorder_traversal_i_compact.go"
    /* Предварительный обход: пример 1 */
    func preOrderI(root *TreeNode, res *[]*TreeNode) {
        if root == nil {
            return
        }
        if (root.Val).(int) == 7 {
            // Записать решение
            *res = append(*res, root)
        }
        preOrderI(root.Left, res)
        preOrderI(root.Right, res)
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_i_compact.swift"
    /* Предварительный обход: пример 1 */
    func preOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        if root.val == 7 {
            // Записать решение
            res.append(root)
        }
        preOrder(root: root.left)
        preOrder(root: root.right)
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_i_compact.js"
    /* Предварительный обход: пример 1 */
    function preOrder(root, res) {
        if (root === null) {
            return;
        }
        if (root.val === 7) {
            // Записать решение
            res.push(root);
        }
        preOrder(root.left, res);
        preOrder(root.right, res);
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_i_compact.ts"
    /* Предварительный обход: пример 1 */
    function preOrder(root: TreeNode | null, res: TreeNode[]): void {
        if (root === null) {
            return;
        }
        if (root.val === 7) {
            // Записать решение
            res.push(root);
        }
        preOrder(root.left, res);
        preOrder(root.right, res);
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_i_compact.dart"
    /* Предварительный обход: пример 1 */
    void preOrder(TreeNode? root, List<TreeNode> res) {
      if (root == null) {
        return;
      }
      if (root.val == 7) {
        // Записать решение
        res.add(root);
      }
      preOrder(root.left, res);
      preOrder(root.right, res);
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_i_compact.rs"
    /* Предварительный обход: пример 1 */
    fn pre_order(res: &mut Vec<Rc<RefCell<TreeNode>>>, root: Option<&Rc<RefCell<TreeNode>>>) {
        if root.is_none() {
            return;
        }
        if let Some(node) = root {
            if node.borrow().val == 7 {
                // Записать решение
                res.push(node.clone());
            }
            pre_order(res, node.borrow().left.as_ref());
            pre_order(res, node.borrow().right.as_ref());
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_i_compact.c"
    /* Предварительный обход: пример 1 */
    void preOrder(TreeNode *root) {
        if (root == NULL) {
            return;
        }
        if (root->val == 7) {
            // Записать решение
            res[resSize++] = root;
        }
        preOrder(root->left);
        preOrder(root->right);
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_i_compact.kt"
    /* Предварительный обход: пример 1 */
    fun preOrder(root: TreeNode?) {
        if (root == null) {
            return
        }
        if (root._val == 7) {
            // Записать решение
            res!!.add(root)
        }
        preOrder(root.left)
        preOrder(root.right)
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_i_compact.rb"
    =begin
    File: preorder_traversal_i_compact.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative '../utils/tree_node'
    require_relative '../utils/print_util'

    # ## Предварительный обход: пример 1 ###
    def pre_order(root)
      return unless root

      # Записать решение
      $res << root if root.val == 7

      pre_order(root.left)
      pre_order(root.right)
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D%2C%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B5%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%3A%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B8%D0%BB%D0%B8%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20None%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20None%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%BE%20%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D1%8C%D1%8F%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B5%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr%2C%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%3A%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%201%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20res.append%28root%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1%2C%207%2C%203%2C%204%2C%205%2C%206%2C%207%5D%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20%20%20res%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%D0%92%D1%81%D0%B5%20%D1%83%D0%B7%D0%BB%D1%8B%20%D1%81%D0%BE%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC%207%22%29%0A%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20res%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D%2C%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B5%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%3A%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B8%D0%BB%D0%B8%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20None%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20None%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%BE%20%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D1%8C%D1%8F%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B5%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr%2C%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%3A%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%201%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20res.append%28root%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1%2C%207%2C%203%2C%204%2C%205%2C%206%2C%207%5D%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20%20%20res%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%D0%92%D1%81%D0%B5%20%D1%83%D0%B7%D0%BB%D1%8B%20%D1%81%D0%BE%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC%207%22%29%0A%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20res%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

![Поиск узлов при прямом обходе](backtracking_algorithm.assets/preorder_find_nodes.png){ class="animation-figure" }

<p align="center"> Рисунок 13-1 &nbsp; Поиск узлов при прямом обходе </p>

## 13.1.1 &nbsp; Попытка и откат

**Алгоритм называется backtracking, потому что при поиске в пространстве решений он использует стратегию "попытка" и "откат"**. Когда в процессе поиска алгоритм приходит в состояние, из которого нельзя двигаться дальше или нельзя получить удовлетворяющее условиям решение, он отменяет предыдущий выбор, возвращается к более раннему состоянию и пробует другие возможные варианты.

Для примера 1 посещение каждого узла представляет собой "попытку", а прохождение листового узла или возврат к родителю через `return` означает "откат".

Важно понимать, что **откат не сводится только к возврату из функции**. Чтобы показать это, слегка расширим пример 1.

!!! question "Пример 2"

    Найдите в двоичном дереве все узлы со значением $7$ и **верните пути от корня до этих узлов**.

Взяв за основу код примера 1, добавим список `path` для записи пути посещенных узлов. Когда встречается узел со значением $7$ , мы копируем `path` и добавляем его в список результатов `res` . После завершения обхода именно `res` будет содержать все решения. Код приведен ниже:

=== "Python"

    ```python title="preorder_traversal_ii_compact.py"
    def pre_order(root: TreeNode):
        """Предварительный обход: пример 2"""
        if root is None:
            return
        # Попытка
        path.append(root)
        if root.val == 7:
            # Записать решение
            res.append(list(path))
        pre_order(root.left)
        pre_order(root.right)
        # Откат
        path.pop()
    ```

=== "C++"

    ```cpp title="preorder_traversal_ii_compact.cpp"
    /* Предварительный обход: пример 2 */
    void preOrder(TreeNode *root) {
        if (root == nullptr) {
            return;
        }
        // Попытка
        path.push_back(root);
        if (root->val == 7) {
            // Записать решение
            res.push_back(path);
        }
        preOrder(root->left);
        preOrder(root->right);
        // Откат
        path.pop_back();
    }
    ```

=== "Java"

    ```java title="preorder_traversal_ii_compact.java"
    /* Предварительный обход: пример 2 */
    void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        // Попытка
        path.add(root);
        if (root.val == 7) {
            // Записать решение
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // Откат
        path.remove(path.size() - 1);
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_ii_compact.cs"
    /* Предварительный обход: пример 2 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        // Попытка
        path.Add(root);
        if (root.val == 7) {
            // Записать решение
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // Откат
        path.RemoveAt(path.Count - 1);
    }
    ```

=== "Go"

    ```go title="preorder_traversal_ii_compact.go"
    /* Предварительный обход: пример 2 */
    func preOrderII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
        if root == nil {
            return
        }
        // Попытка
        *path = append(*path, root)
        if root.Val.(int) == 7 {
            // Записать решение
            *res = append(*res, append([]*TreeNode{}, *path...))
        }
        preOrderII(root.Left, res, path)
        preOrderII(root.Right, res, path)
        // Откат
        *path = (*path)[:len(*path)-1]
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_ii_compact.swift"
    /* Предварительный обход: пример 2 */
    func preOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        // Попытка
        path.append(root)
        if root.val == 7 {
            // Записать решение
            res.append(path)
        }
        preOrder(root: root.left)
        preOrder(root: root.right)
        // Откат
        path.removeLast()
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_ii_compact.js"
    /* Предварительный обход: пример 2 */
    function preOrder(root, path, res) {
        if (root === null) {
            return;
        }
        // Попытка
        path.push(root);
        if (root.val === 7) {
            // Записать решение
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // Откат
        path.pop();
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_ii_compact.ts"
    /* Предварительный обход: пример 2 */
    function preOrder(
        root: TreeNode | null,
        path: TreeNode[],
        res: TreeNode[][]
    ): void {
        if (root === null) {
            return;
        }
        // Попытка
        path.push(root);
        if (root.val === 7) {
            // Записать решение
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // Откат
        path.pop();
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_ii_compact.dart"
    /* Предварительный обход: пример 2 */
    void preOrder(
      TreeNode? root,
      List<TreeNode> path,
      List<List<TreeNode>> res,
    ) {
      if (root == null) {
        return;
      }

      // Попытка
      path.add(root);
      if (root.val == 7) {
        // Записать решение
        res.add(List.from(path));
      }
      preOrder(root.left, path, res);
      preOrder(root.right, path, res);
      // Откат
      path.removeLast();
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_ii_compact.rs"
    /* Предварительный обход: пример 2 */
    fn pre_order(
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
        path: &mut Vec<Rc<RefCell<TreeNode>>>,
        root: Option<&Rc<RefCell<TreeNode>>>,
    ) {
        if root.is_none() {
            return;
        }
        if let Some(node) = root {
            // Попытка
            path.push(node.clone());
            if node.borrow().val == 7 {
                // Записать решение
                res.push(path.clone());
            }
            pre_order(res, path, node.borrow().left.as_ref());
            pre_order(res, path, node.borrow().right.as_ref());
            // Откат
            path.pop();
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_ii_compact.c"
    /* Предварительный обход: пример 2 */
    void preOrder(TreeNode *root) {
        if (root == NULL) {
            return;
        }
        // Попытка
        path[pathSize++] = root;
        if (root->val == 7) {
            // Записать решение
            for (int i = 0; i < pathSize; ++i) {
                res[resSize][i] = path[i];
            }
            resSize++;
        }
        preOrder(root->left);
        preOrder(root->right);
        // Откат
        pathSize--;
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_ii_compact.kt"
    /* Предварительный обход: пример 2 */
    fun preOrder(root: TreeNode?) {
        if (root == null) {
            return
        }
        // Попытка
        path!!.add(root)
        if (root._val == 7) {
            // Записать решение
            res!!.add(path!!.toMutableList())
        }
        preOrder(root.left)
        preOrder(root.right)
        // Откат
        path!!.removeAt(path!!.size - 1)
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_ii_compact.rb"
    =begin
    File: preorder_traversal_ii_compact.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative '../utils/tree_node'
    require_relative '../utils/print_util'

    # ## Предварительный обход: пример 2 ###
    def pre_order(root)
      return unless root

      # Попытка
      $path << root

      # Записать решение
      $res << $path.dup if root.val == 7

      pre_order(root.left)
      pre_order(root.right)

      # Откат
      $path.pop
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D%2C%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B5%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%3A%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B8%D0%BB%D0%B8%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20None%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20None%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%BE%20%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D1%8C%D1%8F%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B5%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr%2C%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%3A%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%202%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%0A%20%20%20%20path.append%28root%29%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20res.append%28list%28path%29%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%0A%20%20%20%20path.pop%28%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1%2C%207%2C%203%2C%204%2C%205%2C%206%2C%207%5D%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20%20%20path%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20res%20%3D%20list%5Blist%5BTreeNode%5D%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%D0%92%D1%81%D0%B5%20%D0%BF%D1%83%D1%82%D0%B8%20%D0%BE%D1%82%20%D0%BA%D0%BE%D1%80%D0%BD%D1%8F%20%D0%BA%20%D1%83%D0%B7%D0%BB%D1%83%207%22%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D%2C%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B5%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%3A%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B8%D0%BB%D0%B8%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20None%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20None%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%BE%20%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D1%8C%D1%8F%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B5%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr%2C%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%3A%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%202%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%0A%20%20%20%20path.append%28root%29%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20res.append%28list%28path%29%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%0A%20%20%20%20path.pop%28%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1%2C%207%2C%203%2C%204%2C%205%2C%206%2C%207%5D%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20%20%20path%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20res%20%3D%20list%5Blist%5BTreeNode%5D%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%D0%92%D1%81%D0%B5%20%D0%BF%D1%83%D1%82%D0%B8%20%D0%BE%D1%82%20%D0%BA%D0%BE%D1%80%D0%BD%D1%8F%20%D0%BA%20%D1%83%D0%B7%D0%BB%D1%83%207%22%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

В каждой "попытке" мы добавляем текущий узел в `path` , чтобы записать путь; а перед "откатом" нам нужно удалить этот узел из `path` , **чтобы восстановить состояние, существовавшее до текущей попытки**.

Если посмотреть на процесс, изображенный на рисунке 13-2, **то попытку и откат можно понимать как "движение вперед" и "отмену"**: это два взаимно противоположных действия.

=== "<1>"
    ![Попытка и откат](backtracking_algorithm.assets/preorder_find_paths_step1.png){ class="animation-figure" }

=== "<2>"
    ![preorder_find_paths_step2](backtracking_algorithm.assets/preorder_find_paths_step2.png){ class="animation-figure" }

=== "<3>"
    ![preorder_find_paths_step3](backtracking_algorithm.assets/preorder_find_paths_step3.png){ class="animation-figure" }

=== "<4>"
    ![preorder_find_paths_step4](backtracking_algorithm.assets/preorder_find_paths_step4.png){ class="animation-figure" }

=== "<5>"
    ![preorder_find_paths_step5](backtracking_algorithm.assets/preorder_find_paths_step5.png){ class="animation-figure" }

=== "<6>"
    ![preorder_find_paths_step6](backtracking_algorithm.assets/preorder_find_paths_step6.png){ class="animation-figure" }

=== "<7>"
    ![preorder_find_paths_step7](backtracking_algorithm.assets/preorder_find_paths_step7.png){ class="animation-figure" }

=== "<8>"
    ![preorder_find_paths_step8](backtracking_algorithm.assets/preorder_find_paths_step8.png){ class="animation-figure" }

=== "<9>"
    ![preorder_find_paths_step9](backtracking_algorithm.assets/preorder_find_paths_step9.png){ class="animation-figure" }

=== "<10>"
    ![preorder_find_paths_step10](backtracking_algorithm.assets/preorder_find_paths_step10.png){ class="animation-figure" }

=== "<11>"
    ![preorder_find_paths_step11](backtracking_algorithm.assets/preorder_find_paths_step11.png){ class="animation-figure" }

<p align="center"> Рисунок 13-2 &nbsp; Попытка и откат </p>

## 13.1.2 &nbsp; Обрезка

Сложные задачи backtracking обычно содержат одно или несколько ограничений, **которые часто можно использовать для "обрезки"**.

!!! question "Пример 3"

    Найдите в двоичном дереве все узлы со значением $7$ , верните пути от корня до этих узлов, **причем путь не должен содержать узлы со значением $3$**.

Чтобы выполнить это ограничение, **нам нужно добавить операцию обрезки**: во время поиска, если встречается узел со значением $3$ , мы сразу возвращаемся и не продолжаем дальнейший поиск. Код выглядит так:

=== "Python"

    ```python title="preorder_traversal_iii_compact.py"
    def pre_order(root: TreeNode):
        """Предварительный обход: пример 3"""
        # Отсечение
        if root is None or root.val == 3:
            return
        # Попытка
        path.append(root)
        if root.val == 7:
            # Записать решение
            res.append(list(path))
        pre_order(root.left)
        pre_order(root.right)
        # Откат
        path.pop()
    ```

=== "C++"

    ```cpp title="preorder_traversal_iii_compact.cpp"
    /* Предварительный обход: пример 3 */
    void preOrder(TreeNode *root) {
        // Отсечение
        if (root == nullptr || root->val == 3) {
            return;
        }
        // Попытка
        path.push_back(root);
        if (root->val == 7) {
            // Записать решение
            res.push_back(path);
        }
        preOrder(root->left);
        preOrder(root->right);
        // Откат
        path.pop_back();
    }
    ```

=== "Java"

    ```java title="preorder_traversal_iii_compact.java"
    /* Предварительный обход: пример 3 */
    void preOrder(TreeNode root) {
        // Отсечение
        if (root == null || root.val == 3) {
            return;
        }
        // Попытка
        path.add(root);
        if (root.val == 7) {
            // Записать решение
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // Откат
        path.remove(path.size() - 1);
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_iii_compact.cs"
    /* Предварительный обход: пример 3 */
    void PreOrder(TreeNode? root) {
        // Отсечение
        if (root == null || root.val == 3) {
            return;
        }
        // Попытка
        path.Add(root);
        if (root.val == 7) {
            // Записать решение
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // Откат
        path.RemoveAt(path.Count - 1);
    }
    ```

=== "Go"

    ```go title="preorder_traversal_iii_compact.go"
    /* Предварительный обход: пример 3 */
    func preOrderIII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
        // Отсечение
        if root == nil || root.Val == 3 {
            return
        }
        // Попытка
        *path = append(*path, root)
        if root.Val.(int) == 7 {
            // Записать решение
            *res = append(*res, append([]*TreeNode{}, *path...))
        }
        preOrderIII(root.Left, res, path)
        preOrderIII(root.Right, res, path)
        // Откат
        *path = (*path)[:len(*path)-1]
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_iii_compact.swift"
    /* Предварительный обход: пример 3 */
    func preOrder(root: TreeNode?) {
        // Отсечение
        guard let root = root, root.val != 3 else {
            return
        }
        // Попытка
        path.append(root)
        if root.val == 7 {
            // Записать решение
            res.append(path)
        }
        preOrder(root: root.left)
        preOrder(root: root.right)
        // Откат
        path.removeLast()
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_iii_compact.js"
    /* Предварительный обход: пример 3 */
    function preOrder(root, path, res) {
        // Отсечение
        if (root === null || root.val === 3) {
            return;
        }
        // Попытка
        path.push(root);
        if (root.val === 7) {
            // Записать решение
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // Откат
        path.pop();
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_iii_compact.ts"
    /* Предварительный обход: пример 3 */
    function preOrder(
        root: TreeNode | null,
        path: TreeNode[],
        res: TreeNode[][]
    ): void {
        // Отсечение
        if (root === null || root.val === 3) {
            return;
        }
        // Попытка
        path.push(root);
        if (root.val === 7) {
            // Записать решение
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // Откат
        path.pop();
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_iii_compact.dart"
    /* Предварительный обход: пример 3 */
    void preOrder(
      TreeNode? root,
      List<TreeNode> path,
      List<List<TreeNode>> res,
    ) {
      if (root == null || root.val == 3) {
        return;
      }

      // Попытка
      path.add(root);
      if (root.val == 7) {
        // Записать решение
        res.add(List.from(path));
      }
      preOrder(root.left, path, res);
      preOrder(root.right, path, res);
      // Откат
      path.removeLast();
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_iii_compact.rs"
    /* Предварительный обход: пример 3 */
    fn pre_order(
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
        path: &mut Vec<Rc<RefCell<TreeNode>>>,
        root: Option<&Rc<RefCell<TreeNode>>>,
    ) {
        // Отсечение
        if root.is_none() || root.as_ref().unwrap().borrow().val == 3 {
            return;
        }
        if let Some(node) = root {
            // Попытка
            path.push(node.clone());
            if node.borrow().val == 7 {
                // Записать решение
                res.push(path.clone());
            }
            pre_order(res, path, node.borrow().left.as_ref());
            pre_order(res, path, node.borrow().right.as_ref());
            // Откат
            path.pop();
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_iii_compact.c"
    /* Предварительный обход: пример 3 */
    void preOrder(TreeNode *root) {
        // Отсечение
        if (root == NULL || root->val == 3) {
            return;
        }
        // Попытка
        path[pathSize++] = root;
        if (root->val == 7) {
            // Записать решение
            for (int i = 0; i < pathSize; i++) {
                res[resSize][i] = path[i];
            }
            resSize++;
        }
        preOrder(root->left);
        preOrder(root->right);
        // Откат
        pathSize--;
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_iii_compact.kt"
    /* Предварительный обход: пример 3 */
    fun preOrder(root: TreeNode?) {
        // Отсечение
        if (root == null || root._val == 3) {
            return
        }
        // Попытка
        path!!.add(root)
        if (root._val == 7) {
            // Записать решение
            res!!.add(path!!.toMutableList())
        }
        preOrder(root.left)
        preOrder(root.right)
        // Откат
        path!!.removeAt(path!!.size - 1)
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_iii_compact.rb"
    =begin
    File: preorder_traversal_iii_compact.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative '../utils/tree_node'
    require_relative '../utils/print_util'

    # ## Предварительный обход: пример 3 ###
    def pre_order(root)
      # Отсечение
      return if !root || root.val == 3

      # Попытка
      $path.append(root)

      # Записать решение
      $res << $path.dup if root.val == 7

      pre_order(root.left)
      pre_order(root.right)

      # Откат
      $path.pop
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D%2C%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B5%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%3A%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B8%D0%BB%D0%B8%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20None%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20None%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%BE%20%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D1%8C%D1%8F%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B5%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr%2C%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%3A%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%203%22%22%22%0A%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20root%20is%20None%20or%20root.val%20%3D%3D%203%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%0A%20%20%20%20path.append%28root%29%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20res.append%28list%28path%29%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%0A%20%20%20%20path.pop%28%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1%2C%207%2C%203%2C%204%2C%205%2C%206%2C%207%5D%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20%20%20path%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20res%20%3D%20list%5Blist%5BTreeNode%5D%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%D0%92%D1%81%D0%B5%20%D0%BF%D1%83%D1%82%D0%B8%20%D0%BE%D1%82%20%D0%BA%D0%BE%D1%80%D0%BD%D1%8F%20%D0%BA%20%D1%83%D0%B7%D0%BB%D1%83%207%2C%20%D0%BD%D0%B5%20%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B0%D1%89%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%BE%D0%B2%20%D1%81%D0%BE%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC%203%22%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D%2C%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B5%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%3A%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B8%D0%BB%D0%B8%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20None%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20None%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%BE%20%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D1%8C%D1%8F%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B5%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr%2C%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%3A%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%203%22%22%22%0A%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20root%20is%20None%20or%20root.val%20%3D%3D%203%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%0A%20%20%20%20path.append%28root%29%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20res.append%28list%28path%29%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%0A%20%20%20%20path.pop%28%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1%2C%207%2C%203%2C%204%2C%205%2C%206%2C%207%5D%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20%20%20path%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20res%20%3D%20list%5Blist%5BTreeNode%5D%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%D0%92%D1%81%D0%B5%20%D0%BF%D1%83%D1%82%D0%B8%20%D0%BE%D1%82%20%D0%BA%D0%BE%D1%80%D0%BD%D1%8F%20%D0%BA%20%D1%83%D0%B7%D0%BB%D1%83%207%2C%20%D0%BD%D0%B5%20%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B0%D1%89%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%BE%D0%B2%20%D1%81%D0%BE%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC%203%22%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Термин "обрезка" очень нагляден. Как показано на рисунке 13-3, во время поиска **мы "срезаем" ветви поиска, не удовлетворяющие ограничениям** , тем самым избегая множества бессмысленных попыток и повышая эффективность поиска.

![Обрезка по условиям задачи](backtracking_algorithm.assets/preorder_find_constrained_paths.png){ class="animation-figure" }

<p align="center"> Рисунок 13-3 &nbsp; Обрезка по условиям задачи </p>

## 13.1.3 &nbsp; Каркас кода

Теперь попробуем извлечь общий каркас из действий "попытка", "откат" и "обрезка", чтобы сделать код более универсальным.

В следующем каркасе кода `state` обозначает текущее состояние задачи, а `choices` - список выборов, доступных в текущем состоянии:

=== "Python"

    ```python title=""
    def backtrack(state: State, choices: list[choice], res: list[state]):
        """Каркас алгоритма поиска с возвратом"""
        # Проверка, является ли текущее состояние решением
        if is_solution(state):
            # Запись решения
            record_solution(state, res)
            # Дальше не продолжаем поиск
            return
        # Перебор всех возможных выборов
        for choice in choices:
            # Обрезка: проверка допустимости выбора
            if is_valid(state, choice):
                # Попытка: сделать выбор и обновить состояние
                make_choice(state, choice)
                backtrack(state, choices, res)
                # Откат: отменить выбор и восстановить предыдущее состояние
                undo_choice(state, choice)
    ```

=== "C++"

    ```cpp title=""
    /* Каркас алгоритма поиска с возвратом */
    void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
        // Проверка, является ли текущее состояние решением
        if (isSolution(state)) {
            // Запись решения
            recordSolution(state, res);
            // Дальше не продолжаем поиск
            return;
        }
        // Перебор всех возможных выборов
        for (Choice choice : choices) {
            // Обрезка: проверка допустимости выбора
            if (isValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Java"

    ```java title=""
    /* Каркас алгоритма поиска с возвратом */
    void backtrack(State state, List<Choice> choices, List<State> res) {
        // Проверка, является ли текущее состояние решением
        if (isSolution(state)) {
            // Запись решения
            recordSolution(state, res);
            // Дальше не продолжаем поиск
            return;
        }
        // Перебор всех возможных выборов
        for (Choice choice : choices) {
            // Обрезка: проверка допустимости выбора
            if (isValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "C#"

    ```csharp title=""
    /* Каркас алгоритма поиска с возвратом */
    void Backtrack(State state, List<Choice> choices, List<State> res) {
        // Проверка, является ли текущее состояние решением
        if (IsSolution(state)) {
            // Запись решения
            RecordSolution(state, res);
            // Дальше не продолжаем поиск
            return;
        }
        // Перебор всех возможных выборов
        foreach (Choice choice in choices) {
            // Обрезка: проверка допустимости выбора
            if (IsValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                MakeChoice(state, choice);
                Backtrack(state, choices, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                UndoChoice(state, choice);
            }
        }
    }
    ```

=== "Go"

    ```go title=""
    /* Каркас алгоритма поиска с возвратом */
    func backtrack(state *State, choices []Choice, res *[]State) {
        // Проверка, является ли текущее состояние решением
        if isSolution(state) {
            // Запись решения
            recordSolution(state, res)
            // Дальше не продолжаем поиск
            return
        }
        // Перебор всех возможных выборов
        for _, choice := range choices {
            // Обрезка: проверка допустимости выбора
            if isValid(state, choice) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* Каркас алгоритма поиска с возвратом */
    func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
        // Проверка, является ли текущее состояние решением
        if isSolution(state: state) {
            // Запись решения
            recordSolution(state: state, res: &res)
            // Дальше не продолжаем поиск
            return
        }
        // Перебор всех возможных выборов
        for choice in choices {
            // Обрезка: проверка допустимости выбора
            if isValid(state: state, choice: choice) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state: &state, choice: choice)
                backtrack(state: &state, choices: choices, res: &res)
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state: &state, choice: choice)
            }
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* Каркас алгоритма поиска с возвратом */
    function backtrack(state, choices, res) {
        // Проверка, является ли текущее состояние решением
        if (isSolution(state)) {
            // Запись решения
            recordSolution(state, res);
            // Дальше не продолжаем поиск
            return;
        }
        // Перебор всех возможных выборов
        for (let choice of choices) {
            // Обрезка: проверка допустимости выбора
            if (isValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* Каркас алгоритма поиска с возвратом */
    function backtrack(state: State, choices: Choice[], res: State[]): void {
        // Проверка, является ли текущее состояние решением
        if (isSolution(state)) {
            // Запись решения
            recordSolution(state, res);
            // Дальше не продолжаем поиск
            return;
        }
        // Перебор всех возможных выборов
        for (let choice of choices) {
            // Обрезка: проверка допустимости выбора
            if (isValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* Каркас алгоритма поиска с возвратом */
    void backtrack(State state, List<Choice>, List<State> res) {
      // Проверка, является ли текущее состояние решением
      if (isSolution(state)) {
        // Запись решения
        recordSolution(state, res);
        // Дальше не продолжаем поиск
        return;
      }
      // Перебор всех возможных выборов
      for (Choice choice in choices) {
        // Обрезка: проверка допустимости выбора
        if (isValid(state, choice)) {
          // Попытка: сделать выбор и обновить состояние
          makeChoice(state, choice);
          backtrack(state, choices, res);
          // Откат: отменить выбор и восстановить предыдущее состояние
          undoChoice(state, choice);
        }
      }
    }
    ```

=== "Rust"

    ```rust title=""
    /* Каркас алгоритма поиска с возвратом */
    fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
        // Проверка, является ли текущее состояние решением
        if is_solution(state) {
            // Запись решения
            record_solution(state, res);
            // Дальше не продолжаем поиск
            return;
        }
        // Перебор всех возможных выборов
        for choice in choices {
            // Обрезка: проверка допустимости выбора
            if is_valid(state, choice) {
                // Попытка: сделать выбор и обновить состояние
                make_choice(state, choice);
                backtrack(state, choices, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                undo_choice(state, choice);
            }
        }
    }
    ```

=== "C"

    ```c title=""
    /* Каркас алгоритма поиска с возвратом */
    void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
        // Проверка, является ли текущее состояние решением
        if (isSolution(state)) {
            // Запись решения
            recordSolution(state, res, numRes);
            // Дальше не продолжаем поиск
            return;
        }
        // Перебор всех возможных выборов
        for (int i = 0; i < numChoices; i++) {
            // Обрезка: проверка допустимости выбора
            if (isValid(state, &choices[i])) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, &choices[i]);
                backtrack(state, choices, numChoices, res, numRes);
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state, &choices[i]);
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Каркас алгоритма поиска с возвратом */
    fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
        // Проверка, является ли текущее состояние решением
        if (isSolution(state)) {
            // Запись решения
            recordSolution(state, res)
            // Дальше не продолжаем поиск
            return
        }
        // Перебор всех возможных выборов
        for (choice in choices) {
            // Обрезка: проверка допустимости выбора
            if (isValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### Каркас алгоритма поиска с возвратом ###
    def backtrack(state, choices, res)
        # Проверка, является ли текущее состояние решением
        if is_solution?(state)
            # Запись решения
            record_solution(state, res)
            return
        end

        # Перебор всех возможных выборов
        for choice in choices
            # Обрезка: проверка допустимости выбора
            if is_valid?(state, choice)
                # Попытка: сделать выбор и обновить состояние
                make_choice(state, choice)
                backtrack(state, choices, res)
                # Откат: отменить выбор и восстановить предыдущее состояние
                undo_choice(state, choice)
            end
        end
    end
    ```

Теперь, опираясь на этот каркас, решим пример 3. Состояние `state` здесь - это путь обхода узлов, выбор `choices` - левый и правый потомки текущего узла, а результат `res` - список путей:

=== "Python"

    ```python title="preorder_traversal_iii_template.py"
    def is_solution(state: list[TreeNode]) -> bool:
        """Проверить, является ли текущее состояние решением"""
        return state and state[-1].val == 7

    def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
        """Записать решение"""
        res.append(list(state))

    def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
        """Проверить, допустим ли этот выбор в текущем состоянии"""
        return choice is not None and choice.val != 3

    def make_choice(state: list[TreeNode], choice: TreeNode):
        """Обновить состояние"""
        state.append(choice)

    def undo_choice(state: list[TreeNode], choice: TreeNode):
        """Восстановить состояние"""
        state.pop()

    def backtrack(
        state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
    ):
        """Алгоритм бэктрекинга: пример 3"""
        # Проверить, является ли текущее состояние решением
        if is_solution(state):
            # Записать решение
            record_solution(state, res)
        # Перебор всех вариантов выбора
        for choice in choices:
            # Отсечение: проверить допустимость выбора
            if is_valid(state, choice):
                # Попытка: сделать выбор и обновить состояние
                make_choice(state, choice)
                # Перейти к следующему выбору
                backtrack(state, [choice.left, choice.right], res)
                # Откат: отменить выбор и восстановить предыдущее состояние
                undo_choice(state, choice)
    ```

=== "C++"

    ```cpp title="preorder_traversal_iii_template.cpp"
    /* Проверить, является ли текущее состояние решением */
    bool isSolution(vector<TreeNode *> &state) {
        return !state.empty() && state.back()->val == 7;
    }

    /* Записать решение */
    void recordSolution(vector<TreeNode *> &state, vector<vector<TreeNode *>> &res) {
        res.push_back(state);
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
        return choice != nullptr && choice->val != 3;
    }

    /* Обновить состояние */
    void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
        state.push_back(choice);
    }

    /* Восстановить состояние */
    void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
        state.pop_back();
    }

    /* Алгоритм бэктрекинга: пример 3 */
    void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
        // Проверить, является ли текущее состояние решением
        if (isSolution(state)) {
            // Записать решение
            recordSolution(state, res);
        }
        // Перебор всех вариантов выбора
        for (TreeNode *choice : choices) {
            // Отсечение: проверить допустимость выбора
            if (isValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice);
                // Перейти к следующему выбору
                vector<TreeNode *> nextChoices{choice->left, choice->right};
                backtrack(state, nextChoices, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Java"

    ```java title="preorder_traversal_iii_template.java"
    /* Проверить, является ли текущее состояние решением */
    boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* Записать решение */
    void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Обновить состояние */
    void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* Восстановить состояние */
    void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* Алгоритм бэктрекинга: пример 3 */
    void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Проверить, является ли текущее состояние решением
        if (isSolution(state)) {
            // Записать решение
            recordSolution(state, res);
        }
        // Перебор всех вариантов выбора
        for (TreeNode choice : choices) {
            // Отсечение: проверить допустимость выбора
            if (isValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice);
                // Перейти к следующему выбору
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_iii_template.cs"
    /* Проверить, является ли текущее состояние решением */
    bool IsSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* Записать решение */
    void RecordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    bool IsValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Обновить состояние */
    void MakeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* Восстановить состояние */
    void UndoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* Алгоритм бэктрекинга: пример 3 */
    void Backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Проверить, является ли текущее состояние решением
        if (IsSolution(state)) {
            // Записать решение
            RecordSolution(state, res);
        }
        // Перебор всех вариантов выбора
        foreach (TreeNode choice in choices) {
            // Отсечение: проверить допустимость выбора
            if (IsValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                MakeChoice(state, choice);
                // Перейти к следующему выбору
                Backtrack(state, [choice.left!, choice.right!], res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                UndoChoice(state, choice);
            }
        }
    }
    ```

=== "Go"

    ```go title="preorder_traversal_iii_template.go"
    /* Проверить, является ли текущее состояние решением */
    func isSolution(state *[]*TreeNode) bool {
        return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
    }

    /* Записать решение */
    func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
        *res = append(*res, append([]*TreeNode{}, *state...))
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    func isValid(state *[]*TreeNode, choice *TreeNode) bool {
        return choice != nil && choice.Val != 3
    }

    /* Обновить состояние */
    func makeChoice(state *[]*TreeNode, choice *TreeNode) {
        *state = append(*state, choice)
    }

    /* Восстановить состояние */
    func undoChoice(state *[]*TreeNode, choice *TreeNode) {
        *state = (*state)[:len(*state)-1]
    }

    /* Алгоритм бэктрекинга: пример 3 */
    func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
        // Проверить, является ли текущее состояние решением
        if isSolution(state) {
            // Записать решение
            recordSolution(state, res)
        }
        // Перебор всех вариантов выбора
        for _, choice := range *choices {
            // Отсечение: проверить допустимость выбора
            if isValid(state, choice) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice)
                // Перейти к следующему выбору
                temp := make([]*TreeNode, 0)
                temp = append(temp, choice.Left, choice.Right)
                backtrackIII(state, &temp, res)
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_iii_template.swift"
    /* Проверить, является ли текущее состояние решением */
    func isSolution(state: [TreeNode]) -> Bool {
        !state.isEmpty && state.last!.val == 7
    }

    /* Записать решение */
    func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
        res.append(state)
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
        choice != nil && choice!.val != 3
    }

    /* Обновить состояние */
    func makeChoice(state: inout [TreeNode], choice: TreeNode) {
        state.append(choice)
    }

    /* Восстановить состояние */
    func undoChoice(state: inout [TreeNode], choice: TreeNode) {
        state.removeLast()
    }

    /* Алгоритм бэктрекинга: пример 3 */
    func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
        // Проверить, является ли текущее состояние решением
        if isSolution(state: state) {
            recordSolution(state: state, res: &res)
        }
        // Перебор всех вариантов выбора
        for choice in choices {
            // Отсечение: проверить допустимость выбора
            if isValid(state: state, choice: choice) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state: &state, choice: choice)
                // Перейти к следующему выбору
                backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state: &state, choice: choice)
            }
        }
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_iii_template.js"
    /* Проверить, является ли текущее состояние решением */
    function isSolution(state) {
        return state && state[state.length - 1]?.val === 7;
    }

    /* Записать решение */
    function recordSolution(state, res) {
        res.push([...state]);
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    function isValid(state, choice) {
        return choice !== null && choice.val !== 3;
    }

    /* Обновить состояние */
    function makeChoice(state, choice) {
        state.push(choice);
    }

    /* Восстановить состояние */
    function undoChoice(state) {
        state.pop();
    }

    /* Алгоритм бэктрекинга: пример 3 */
    function backtrack(state, choices, res) {
        // Проверить, является ли текущее состояние решением
        if (isSolution(state)) {
            // Записать решение
            recordSolution(state, res);
        }
        // Перебор всех вариантов выбора
        for (const choice of choices) {
            // Отсечение: проверить допустимость выбора
            if (isValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice);
                // Перейти к следующему выбору
                backtrack(state, [choice.left, choice.right], res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state);
            }
        }
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_iii_template.ts"
    /* Проверить, является ли текущее состояние решением */
    function isSolution(state: TreeNode[]): boolean {
        return state && state[state.length - 1]?.val === 7;
    }

    /* Записать решение */
    function recordSolution(state: TreeNode[], res: TreeNode[][]): void {
        res.push([...state]);
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    function isValid(state: TreeNode[], choice: TreeNode): boolean {
        return choice !== null && choice.val !== 3;
    }

    /* Обновить состояние */
    function makeChoice(state: TreeNode[], choice: TreeNode): void {
        state.push(choice);
    }

    /* Восстановить состояние */
    function undoChoice(state: TreeNode[]): void {
        state.pop();
    }

    /* Алгоритм бэктрекинга: пример 3 */
    function backtrack(
        state: TreeNode[],
        choices: TreeNode[],
        res: TreeNode[][]
    ): void {
        // Проверить, является ли текущее состояние решением
        if (isSolution(state)) {
            // Записать решение
            recordSolution(state, res);
        }
        // Перебор всех вариантов выбора
        for (const choice of choices) {
            // Отсечение: проверить допустимость выбора
            if (isValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice);
                // Перейти к следующему выбору
                backtrack(state, [choice.left, choice.right], res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state);
            }
        }
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_iii_template.dart"
    /* Проверить, является ли текущее состояние решением */
    bool isSolution(List<TreeNode> state) {
      return state.isNotEmpty && state.last.val == 7;
    }

    /* Записать решение */
    void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
      res.add(List.from(state));
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    bool isValid(List<TreeNode> state, TreeNode? choice) {
      return choice != null && choice.val != 3;
    }

    /* Обновить состояние */
    void makeChoice(List<TreeNode> state, TreeNode? choice) {
      state.add(choice!);
    }

    /* Восстановить состояние */
    void undoChoice(List<TreeNode> state, TreeNode? choice) {
      state.removeLast();
    }

    /* Алгоритм бэктрекинга: пример 3 */
    void backtrack(
      List<TreeNode> state,
      List<TreeNode?> choices,
      List<List<TreeNode>> res,
    ) {
      // Проверить, является ли текущее состояние решением
      if (isSolution(state)) {
        // Записать решение
        recordSolution(state, res);
      }
      // Перебор всех вариантов выбора
      for (TreeNode? choice in choices) {
        // Отсечение: проверить допустимость выбора
        if (isValid(state, choice)) {
          // Попытка: сделать выбор и обновить состояние
          makeChoice(state, choice);
          // Перейти к следующему выбору
          backtrack(state, [choice!.left, choice.right], res);
          // Откат: отменить выбор и восстановить предыдущее состояние
          undoChoice(state, choice);
        }
      }
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_iii_template.rs"
    /* Проверить, является ли текущее состояние решением */
    fn is_solution(state: &mut Vec<Rc<RefCell<TreeNode>>>) -> bool {
        return !state.is_empty() && state.last().unwrap().borrow().val == 7;
    }

    /* Записать решение */
    fn record_solution(
        state: &mut Vec<Rc<RefCell<TreeNode>>>,
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    ) {
        res.push(state.clone());
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    fn is_valid(_: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Option<&Rc<RefCell<TreeNode>>>) -> bool {
        return choice.is_some() && choice.unwrap().borrow().val != 3;
    }

    /* Обновить состояние */
    fn make_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) {
        state.push(choice);
    }

    /* Восстановить состояние */
    fn undo_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, _: Rc<RefCell<TreeNode>>) {
        state.pop();
    }

    /* Алгоритм бэктрекинга: пример 3 */
    fn backtrack(
        state: &mut Vec<Rc<RefCell<TreeNode>>>,
        choices: &Vec<Option<&Rc<RefCell<TreeNode>>>>,
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    ) {
        // Проверить, является ли текущее состояние решением
        if is_solution(state) {
            // Записать решение
            record_solution(state, res);
        }
        // Перебор всех вариантов выбора
        for &choice in choices.iter() {
            // Отсечение: проверить допустимость выбора
            if is_valid(state, choice) {
                // Попытка: сделать выбор и обновить состояние
                make_choice(state, choice.unwrap().clone());
                // Перейти к следующему выбору
                backtrack(
                    state,
                    &vec![
                        choice.unwrap().borrow().left.as_ref(),
                        choice.unwrap().borrow().right.as_ref(),
                    ],
                    res,
                );
                // Откат: отменить выбор и восстановить предыдущее состояние
                undo_choice(state, choice.unwrap().clone());
            }
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_iii_template.c"
    /* Проверить, является ли текущее состояние решением */
    bool isSolution(void) {
        return pathSize > 0 && path[pathSize - 1]->val == 7;
    }

    /* Записать решение */
    void recordSolution(void) {
        for (int i = 0; i < pathSize; i++) {
            res[resSize][i] = path[i];
        }
        resSize++;
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    bool isValid(TreeNode *choice) {
        return choice != NULL && choice->val != 3;
    }

    /* Обновить состояние */
    void makeChoice(TreeNode *choice) {
        path[pathSize++] = choice;
    }

    /* Восстановить состояние */
    void undoChoice(void) {
        pathSize--;
    }

    /* Алгоритм бэктрекинга: пример 3 */
    void backtrack(TreeNode *choices[2]) {
        // Проверить, является ли текущее состояние решением
        if (isSolution()) {
            // Записать решение
            recordSolution();
        }
        // Перебор всех вариантов выбора
        for (int i = 0; i < 2; i++) {
            TreeNode *choice = choices[i];
            // Отсечение: проверить допустимость выбора
            if (isValid(choice)) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(choice);
                // Перейти к следующему выбору
                TreeNode *nextChoices[2] = {choice->left, choice->right};
                backtrack(nextChoices);
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice();
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_iii_template.kt"
    /* Проверить, является ли текущее состояние решением */
    fun isSolution(state: MutableList<TreeNode?>): Boolean {
        return state.isNotEmpty() && state[state.size - 1]?._val == 7
    }

    /* Записать решение */
    fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
        res.add(state!!.toMutableList())
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
        return choice != null && choice._val != 3
    }

    /* Обновить состояние */
    fun makeChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
        state.add(choice)
    }

    /* Восстановить состояние */
    fun undoChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
        state.removeLast()
    }

    /* Алгоритм бэктрекинга: пример 3 */
    fun backtrack(
        state: MutableList<TreeNode?>,
        choices: MutableList<TreeNode?>,
        res: MutableList<MutableList<TreeNode?>?>
    ) {
        // Проверить, является ли текущее состояние решением
        if (isSolution(state)) {
            // Записать решение
            recordSolution(state, res)
        }
        // Перебор всех вариантов выбора
        for (choice in choices) {
            // Отсечение: проверить допустимость выбора
            if (isValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice)
                // Перейти к следующему выбору
                backtrack(state, mutableListOf(choice!!.left, choice.right), res)
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_iii_template.rb"
    =begin
    File: preorder_traversal_iii_template.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative '../utils/tree_node'
    require_relative '../utils/print_util'

    # ## Проверка, является ли текущее состояние решением ###
    def is_solution?(state)
      !state.empty? && state.last.val == 7
    end

    =begin
    File: preorder_traversal_iii_template.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative '../utils/tree_node'
    require_relative '../utils/print_util'

    # ## Проверка, является ли текущее состояние решением ###
    def is_solution?(state)
      !state.empty? && state.last.val == 7
    end

    # ## Записать решение ###
    def record_solution(state, res)
      res << state.dup
    end

    =begin
    File: preorder_traversal_iii_template.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative '../utils/tree_node'
    require_relative '../utils/print_util'

    # ## Проверка, является ли текущее состояние решением ###
    def is_solution?(state)
      !state.empty? && state.last.val == 7
    end

    # ## Записать решение ###
    def record_solution(state, res)
      res << state.dup
    end

    # ## Проверка допустимости этого выбора в текущем состоянии ###
    def is_valid?(state, choice)
      choice && choice.val != 3
    end

    =begin
    File: preorder_traversal_iii_template.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative '../utils/tree_node'
    require_relative '../utils/print_util'

    # ## Проверка, является ли текущее состояние решением ###
    def is_solution?(state)
      !state.empty? && state.last.val == 7
    end

    # ## Записать решение ###
    def record_solution(state, res)
      res << state.dup
    end

    # ## Проверка допустимости этого выбора в текущем состоянии ###
    def is_valid?(state, choice)
      choice && choice.val != 3
    end

    # ## Обновить состояние ###
    def make_choice(state, choice)
      state << choice
    end

    =begin
    File: preorder_traversal_iii_template.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative '../utils/tree_node'
    require_relative '../utils/print_util'

    # ## Проверка, является ли текущее состояние решением ###
    def is_solution?(state)
      !state.empty? && state.last.val == 7
    end

    # ## Записать решение ###
    def record_solution(state, res)
      res << state.dup
    end

    # ## Проверка допустимости этого выбора в текущем состоянии ###
    def is_valid?(state, choice)
      choice && choice.val != 3
    end

    # ## Обновить состояние ###
    def make_choice(state, choice)
      state << choice
    end

    # ## Восстановить состояние ###
    def undo_choice(state, choice)
      state.pop
    end

    =begin
    File: preorder_traversal_iii_template.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative '../utils/tree_node'
    require_relative '../utils/print_util'

    # ## Проверка, является ли текущее состояние решением ###
    def is_solution?(state)
      !state.empty? && state.last.val == 7
    end

    # ## Записать решение ###
    def record_solution(state, res)
      res << state.dup
    end

    # ## Проверка допустимости этого выбора в текущем состоянии ###
    def is_valid?(state, choice)
      choice && choice.val != 3
    end

    # ## Обновить состояние ###
    def make_choice(state, choice)
      state << choice
    end

    # ## Восстановить состояние ###
    def undo_choice(state, choice)
      state.pop
    end

    # ## Алгоритм бэктрекинга: пример 3 ###
    def backtrack(state, choices, res)
      # Проверить, является ли текущее состояние решением
      record_solution(state, res) if is_solution?(state)

      # Перебор всех вариантов выбора
      for choice in choices
        # Отсечение: проверить допустимость выбора
        if is_valid?(state, choice)
          # Попытка: сделать выбор и обновить состояние
          make_choice(state, choice)
          # Перейти к следующему выбору
          backtrack(state, [choice.left, choice.right], res)
          # Откат: отменить выбор и восстановить предыдущее состояние
          undo_choice(state, choice)
        end
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%3D0%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D%2C%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20return%20list_to_tree_dfs%28arr%2C%200%29%0A%0Adef%20is_solution%28state%3A%20list%5BTreeNode%5D%29%20-%3E%20bool%3A%0A%20%20%20%20return%20state%20and%20state%5B-1%5D.val%20%3D%3D%207%0A%0Adef%20record_solution%28state%3A%20list%5BTreeNode%5D%2C%20res%3A%20list%5Blist%5BTreeNode%5D%5D%29%3A%0A%20%20%20%20res.append%28list%28state%29%29%0A%0Adef%20is_valid%28state%3A%20list%5BTreeNode%5D%2C%20choice%3A%20TreeNode%29%20-%3E%20bool%3A%0A%20%20%20%20return%20choice%20is%20not%20None%20and%20choice.val%20%21%3D%203%0A%0Adef%20make_choice%28state%3A%20list%5BTreeNode%5D%2C%20choice%3A%20TreeNode%29%3A%0A%20%20%20%20state.append%28choice%29%0A%0Adef%20undo_choice%28state%3A%20list%5BTreeNode%5D%2C%20choice%3A%20TreeNode%29%3A%0A%20%20%20%20state.pop%28%29%0A%0Adef%20backtrack%28state%3A%20list%5BTreeNode%5D%2C%20choices%3A%20list%5BTreeNode%5D%2C%20res%3A%20list%5Blist%5BTreeNode%5D%5D%29%3A%0A%20%20%20%20if%20is_solution%28state%29%3A%0A%20%20%20%20%20%20%20%20record_solution%28state%2C%20res%29%0A%20%20%20%20for%20choice%20in%20choices%3A%0A%20%20%20%20%20%20%20%20if%20is_valid%28state%2C%20choice%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20make_choice%28state%2C%20choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state%2C%20%5Bchoice.left%2C%20choice.right%5D%2C%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20undo_choice%28state%2C%20choice%29%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1%2C%207%2C%203%2C%204%2C%205%2C%206%2C%207%5D%29%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D%2C%20choices%3D%5Broot%5D%2C%20res%3Dres%29%0A%20%20%20%20print%28%27%5Cn%D0%92%D1%8B%D0%B2%D0%B5%D1%81%D1%82%D0%B8%20%D0%B2%D1%81%D0%B5%20%D0%BF%D1%83%D1%82%D0%B8%27%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=138&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%3D0%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D%2C%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20return%20list_to_tree_dfs%28arr%2C%200%29%0A%0Adef%20is_solution%28state%3A%20list%5BTreeNode%5D%29%20-%3E%20bool%3A%0A%20%20%20%20return%20state%20and%20state%5B-1%5D.val%20%3D%3D%207%0A%0Adef%20record_solution%28state%3A%20list%5BTreeNode%5D%2C%20res%3A%20list%5Blist%5BTreeNode%5D%5D%29%3A%0A%20%20%20%20res.append%28list%28state%29%29%0A%0Adef%20is_valid%28state%3A%20list%5BTreeNode%5D%2C%20choice%3A%20TreeNode%29%20-%3E%20bool%3A%0A%20%20%20%20return%20choice%20is%20not%20None%20and%20choice.val%20%21%3D%203%0A%0Adef%20make_choice%28state%3A%20list%5BTreeNode%5D%2C%20choice%3A%20TreeNode%29%3A%0A%20%20%20%20state.append%28choice%29%0A%0Adef%20undo_choice%28state%3A%20list%5BTreeNode%5D%2C%20choice%3A%20TreeNode%29%3A%0A%20%20%20%20state.pop%28%29%0A%0Adef%20backtrack%28state%3A%20list%5BTreeNode%5D%2C%20choices%3A%20list%5BTreeNode%5D%2C%20res%3A%20list%5Blist%5BTreeNode%5D%5D%29%3A%0A%20%20%20%20if%20is_solution%28state%29%3A%0A%20%20%20%20%20%20%20%20record_solution%28state%2C%20res%29%0A%20%20%20%20for%20choice%20in%20choices%3A%0A%20%20%20%20%20%20%20%20if%20is_valid%28state%2C%20choice%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20make_choice%28state%2C%20choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state%2C%20%5Bchoice.left%2C%20choice.right%5D%2C%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20undo_choice%28state%2C%20choice%29%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1%2C%207%2C%203%2C%204%2C%205%2C%206%2C%207%5D%29%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D%2C%20choices%3D%5Broot%5D%2C%20res%3Dres%29%0A%20%20%20%20print%28%27%5Cn%D0%92%D1%8B%D0%B2%D0%B5%D1%81%D1%82%D0%B8%20%D0%B2%D1%81%D0%B5%20%D0%BF%D1%83%D1%82%D0%B8%27%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=138&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Согласно условию задачи, после нахождения узла со значением $7$ мы должны продолжать поиск, **поэтому оператор `return` после записи решения нужно удалить**. На рисунке 13-4 сравниваются процессы поиска в случаях, когда `return` сохраняется и когда он удаляется.

![Сравнение поиска при сохранении и удалении return](backtracking_algorithm.assets/backtrack_remove_return_or_not.png){ class="animation-figure" }

<p align="center"> Рисунок 13-4 &nbsp; Сравнение поиска при сохранении и удалении return </p>

По сравнению с реализацией на основе прямого обхода, версия на основе общего каркаса backtracking выглядит более громоздкой, но при этом обладает лучшей универсальностью. На практике **многие задачи backtracking можно решать в рамках этого каркаса**. Для этого нужно лишь определить `state` и `choices` под конкретную задачу и реализовать соответствующие методы каркаса.

## 13.1.4 &nbsp; Часто используемые термины

Чтобы яснее анализировать алгоритмические задачи, подытожим значения часто используемых терминов backtracking и сопоставим их с примером 3, как показано в таблице 13-1.

<p align="center"> Таблица 13-1 &nbsp; Часто используемые термины алгоритма backtracking </p>

<div class="center-table" markdown>

| Термин                   | Определение                                                                | Пример 3                                                              |
| ------------------------ | -------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| Решение (solution)       | Решение - это ответ, удовлетворяющий условиям задачи; решений может быть одно или несколько | Все пути от корня до узла $7$ , удовлетворяющие ограничениям          |
| Ограничение (constraint) | Ограничение определяет допустимость решения и обычно используется для обрезки | Путь не содержит узлы со значением $3$                                |
| Состояние (state)        | Состояние описывает ситуацию задачи в некоторый момент времени, включая уже сделанные выборы | Текущий путь посещенных узлов, то есть список узлов `path`            |
| Попытка (attempt)        | Попытка - это исследование пространства решений на основе доступных выборов, включая выбор, обновление состояния и проверку, является ли состояние решением | Рекурсивный переход к левому или правому потомку, добавление узла в `path` и проверка, равно ли значение узла $7$ |
| Откат (backtracking)     | Откат означает отмену предыдущих выборов и возврат к более раннему состоянию при встрече состояния, не удовлетворяющего ограничениям | Завершение поиска при проходе через лист, окончании посещения узла или встрече узла со значением $3$ , то есть возврат из функции |
| Обрезка (pruning)        | Обрезка - это способ избегать бессмысленных путей поиска на основе свойств задачи и ее ограничений, повышающий эффективность | При встрече узла со значением $3$ поиск по этой ветви прекращается    |

</div>

!!! tip

    Такие понятия, как задача, решение и состояние, являются общими и встречаются не только в backtracking, но и в divide and conquer, динамическом программировании, жадных алгоритмах и других темах.

## 13.1.5 &nbsp; Преимущества и ограничения

Алгоритм поиска с возвратом по своей сути является алгоритмом поиска в глубину, который перебирает все возможные решения, пока не найдет удовлетворяющее условиям. Преимущество этого подхода в том, что он позволяет находить все возможные решения и при разумной обрезке может работать весьма эффективно.

Однако при работе с большими или сложными задачами **эффективность backtracking может оказаться неприемлемой**.

- **Время**: backtracking обычно требует обхода всех возможных состояний пространства состояний, и его временная сложность может достигать экспоненциального или факториального порядка.
- **Память**: при рекурсивных вызовах нужно хранить текущее состояние (например, путь, вспомогательные переменные для обрезки и т.д.), поэтому при большой глубине рекурсии потребность в памяти может стать значительной.

Тем не менее **backtracking по-прежнему остается лучшим решением для некоторых поисковых задач и задач удовлетворения ограничений**. В таких задачах заранее невозможно предсказать, какие выборы приведут к эффективному решению, поэтому приходится перебирать все возможные варианты. В этой ситуации **ключевым становится вопрос оптимизации эффективности** , и для этого обычно используют две стратегии.

- **Обрезка**: избегать поиска по тем путям, которые заведомо не приведут к решению, тем самым экономя время и память.
- **Эвристический поиск**: вводить во время поиска дополнительные стратегии или оценки, чтобы в первую очередь исследовать пути, наиболее вероятно ведущие к эффективному решению.

## 13.1.6 &nbsp; Типичные задачи backtracking

Алгоритм поиска с возвратом можно использовать для решения множества поисковых задач, задач удовлетворения ограничений и задач комбинаторной оптимизации.

**Поисковые задачи**: целью таких задач является поиск решений, удовлетворяющих определенным условиям.

- Задача о перестановках: дано множество, требуется найти все возможные перестановки его элементов.
- Задача о сумме подмножеств: даны множество и целевая сумма; нужно найти все подмножества, сумма элементов которых равна целевой.
- Задача о Ханойской башне: даны три стержня и набор дисков разного размера; требуется перенести все диски с одного стержня на другой, перемещая за раз только один диск и не помещая больший диск на меньший.

**Задачи удовлетворения ограничений**: целью таких задач является поиск решений, удовлетворяющих всем ограничениям.

- Задача о $n$ ферзях: разместить $n$ ферзей на шахматной доске размера $n \times n$ так, чтобы они не атаковали друг друга.
- Судоку: заполнить сетку $9 \times 9$ числами от $1$ до $9$ так, чтобы в каждой строке, каждом столбце и каждом блоке $3 \times 3$ числа не повторялись.
- Задача раскраски графа: дан неориентированный граф; требуется раскрасить его вершины минимальным числом цветов так, чтобы соседние вершины имели разные цвета.

**Задачи комбинаторной оптимизации**: целью таких задач является поиск оптимального решения в некотором комбинаторном пространстве при заданных ограничениях.

- Задача о рюкзаке 0-1: даны набор предметов и рюкзак; у каждого предмета есть ценность и вес, и нужно выбрать предметы так, чтобы при ограниченной вместимости рюкзака суммарная ценность была максимальной.
- Задача коммивояжера: начиная из некоторой вершины графа, требуется посетить все остальные вершины ровно по одному разу и вернуться в исходную вершину, найдя при этом кратчайший путь.
- Задача о максимальной клике: дан неориентированный граф; требуется найти в нем максимальный полный подграф, то есть подграф, в котором любая пара вершин соединена ребром.

Обратите внимание: для многих задач комбинаторной оптимизации backtracking не является оптимальным способом решения.

- Задача о рюкзаке 0-1 обычно решается с помощью динамического программирования, что дает более высокую временную эффективность.
- Задача коммивояжера является известной NP-Hard задачей; для ее решения часто используют генетические алгоритмы, муравьиные алгоритмы и другие методы.
- Задача о максимальной клике является классической задачей теории графов и может решаться жадными и другими эвристическими алгоритмами.
