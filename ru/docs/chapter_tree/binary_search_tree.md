---
comments: true
---

# 7.4 &nbsp; Двоичное дерево поиска

Как показано на рисунке 7-16, <u>двоичное дерево поиска (binary search tree)</u> удовлетворяет следующим условиям.

1. Для корневого узла все значения в левом поддереве меньше значения корневого узла, а все значения в правом поддереве больше значения корневого узла.
2. Левое и правое поддеревья любого узла также являются двоичными деревьями поиска, то есть тоже удовлетворяют условию `1.` .

![Двоичное дерево поиска](binary_search_tree.assets/binary_search_tree.png){ class="animation-figure" }

<p align="center"> Рисунок 7-16 &nbsp; Двоичное дерево поиска </p>

## 7.4.1 &nbsp; Операции с двоичным деревом поиска

Мы инкапсулируем двоичное дерево поиска в класс `BinarySearchTree` и объявляем переменную-член `root` , которая указывает на корневой узел дерева.

### 1. &nbsp; Поиск узла

Для заданного целевого значения узла `num` можно выполнить поиск, опираясь на свойства двоичного дерева поиска. Как показано на рисунках ниже, мы объявляем узел `cur` , стартуем от корня дерева `root` и циклически сравниваем значения `cur.val` и `num` .

- Если `cur.val < num` , это означает, что целевой узел находится в правом поддереве `cur` , поэтому выполняем `cur = cur.right` .
- Если `cur.val > num` , это означает, что целевой узел находится в левом поддереве `cur` , поэтому выполняем `cur = cur.left` .
- Если `cur.val = num` , это означает, что целевой узел найден, и мы выходим из цикла, возвращая этот узел.

=== "<1>"
    ![Пример поиска узла в двоичном дереве поиска](binary_search_tree.assets/bst_search_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_search_step2](binary_search_tree.assets/bst_search_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_search_step3](binary_search_tree.assets/bst_search_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_search_step4](binary_search_tree.assets/bst_search_step4.png){ class="animation-figure" }

<p align="center"> Рисунок 7-17 &nbsp; Пример поиска узла в двоичном дереве поиска </p>

Операция поиска в двоичном дереве поиска работает по тому же принципу, что и бинарный поиск: на каждом шаге она отбрасывает половину вариантов. Число итераций не превосходит высоты двоичного дерева, а когда дерево сбалансировано, требуется $O(\log n)$ времени. Пример кода приведен ниже:

=== "Python"

    ```python title="binary_search_tree.py"
    def search(self, num: int) -> TreeNode | None:
        """Поиск узла"""
        cur = self._root
        # Искать в цикле и выйти после прохода за листовой узел
        while cur is not None:
            # Целевой узел находится в правом поддереве cur
            if cur.val < num:
                cur = cur.right
            # Целевой узел находится в левом поддереве cur
            elif cur.val > num:
                cur = cur.left
            # Найти целевой узел и выйти из цикла
            else:
                break
        return cur
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* Поиск узла */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != nullptr) {
            // Целевой узел находится в правом поддереве cur
            if (cur->val < num)
                cur = cur->right;
            // Целевой узел находится в левом поддереве cur
            else if (cur->val > num)
                cur = cur->left;
            // Найти целевой узел и выйти из цикла
            else
                break;
        }
        // Вернуть целевой узел
        return cur;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* Поиск узла */
    TreeNode search(int num) {
        TreeNode cur = root;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Целевой узел находится в правом поддереве cur
            if (cur.val < num)
                cur = cur.right;
            // Целевой узел находится в левом поддереве cur
            else if (cur.val > num)
                cur = cur.left;
            // Найти целевой узел и выйти из цикла
            else
                break;
        }
        // Вернуть целевой узел
        return cur;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* Поиск узла */
    TreeNode? Search(int num) {
        TreeNode? cur = root;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Целевой узел находится в правом поддереве cur
            if (cur.val < num) cur =
                cur.right;
            // Целевой узел находится в левом поддереве cur
            else if (cur.val > num)
                cur = cur.left;
            // Найти целевой узел и выйти из цикла
            else
                break;
        }
        // Вернуть целевой узел
        return cur;
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* Поиск узла */
    func (bst *binarySearchTree) search(num int) *TreeNode {
        node := bst.root
        // Искать в цикле и выйти после прохода за листовой узел
        for node != nil {
            if node.Val.(int) < num {
                // Целевой узел находится в правом поддереве cur
                node = node.Right
            } else if node.Val.(int) > num {
                // Целевой узел находится в левом поддереве cur
                node = node.Left
            } else {
                // Найти целевой узел и выйти из цикла
                break
            }
        }
        // Вернуть целевой узел
        return node
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* Поиск узла */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // Искать в цикле и выйти после прохода за листовой узел
        while cur != nil {
            // Целевой узел находится в правом поддереве cur
            if cur!.val < num {
                cur = cur?.right
            }
            // Целевой узел находится в левом поддереве cur
            else if cur!.val > num {
                cur = cur?.left
            }
            // Найти целевой узел и выйти из цикла
            else {
                break
            }
        }
        // Вернуть целевой узел
        return cur
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* Поиск узла */
    search(num) {
        let cur = this.root;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur !== null) {
            // Целевой узел находится в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Целевой узел находится в левом поддереве cur
            else if (cur.val > num) cur = cur.left;
            // Найти целевой узел и выйти из цикла
            else break;
        }
        // Вернуть целевой узел
        return cur;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* Поиск узла */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur !== null) {
            // Целевой узел находится в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Целевой узел находится в левом поддереве cur
            else if (cur.val > num) cur = cur.left;
            // Найти целевой узел и выйти из цикла
            else break;
        }
        // Вернуть целевой узел
        return cur;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* Поиск узла */
    TreeNode? search(int _num) {
      TreeNode? cur = _root;
      // Искать в цикле и выйти после прохода за листовой узел
      while (cur != null) {
        // Целевой узел находится в правом поддереве cur
        if (cur.val < _num)
          cur = cur.right;
        // Целевой узел находится в левом поддереве cur
        else if (cur.val > _num)
          cur = cur.left;
        // Найти целевой узел и выйти из цикла
        else
          break;
      }
      // Вернуть целевой узел
      return cur;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* Поиск узла */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // Искать в цикле и выйти после прохода за листовой узел
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Целевой узел находится в правом поддереве cur
                Ordering::Greater => cur = node.borrow().right.clone(),
                // Целевой узел находится в левом поддереве cur
                Ordering::Less => cur = node.borrow().left.clone(),
                // Найти целевой узел и выйти из цикла
                Ordering::Equal => break,
            }
        }

        // Вернуть целевой узел
        cur
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* Поиск узла */
    TreeNode *search(BinarySearchTree *bst, int num) {
        TreeNode *cur = bst->root;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != NULL) {
            if (cur->val < num) {
                // Целевой узел находится в правом поддереве cur
                cur = cur->right;
            } else if (cur->val > num) {
                // Целевой узел находится в левом поддереве cur
                cur = cur->left;
            } else {
                // Найти целевой узел и выйти из цикла
                break;
            }
        }
        // Вернуть целевой узел
        return cur;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* Поиск узла */
    fun search(num: Int): TreeNode? {
        var cur = root
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Целевой узел находится в правом поддереве cur
            cur = if (cur._val < num)
                cur.right
            // Целевой узел находится в левом поддереве cur
            else if (cur._val > num)
                cur.left
            // Найти целевой узел и выйти из цикла
            else
                break
        }
        // Вернуть целевой узел
        return cur
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
  =begin
  File: binary_search_tree.rb
  Created Time: 2024-04-18
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## Двоичное дерево поиска ###
  class BinarySearchTree
    # ## Конструктор ###
    def initialize
      # Инициализировать пустое дерево
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Поиск узла ###
    def search(num)
      cur = @root

      # Искать в цикле и выйти после прохода за листовой узел
      while !cur.nil?
        # Целевой узел находится в правом поддереве cur
        if cur.val < num
          cur = cur.right
        # Целевой узел находится в левом поддереве cur
        elsif cur.val > num
          cur = cur.left
        # Найти целевой узел и выйти из цикла
        else
          break
        end
      end

      cur
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20search%28self%2C%20num%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20self._root%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20elif%20cur.val%20%3E%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20return%20cur%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%28cur%2C%20pre%29%20%3D%20%28self._root%2C%20None%29%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%20%20%20%20node%20%3D%20bst.search%287%29%0A%20%20%20%20print%28%27%5Cn%D0%9D%D0%B0%D0%B9%D0%B4%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%20%D1%83%D0%B7%D0%BB%D0%B0%20%3D%20%7B%7D%2C%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%20%3D%20%7B%7D%27.format%28node%2C%20node.val%29%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20search%28self%2C%20num%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20self._root%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20elif%20cur.val%20%3E%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20return%20cur%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%28cur%2C%20pre%29%20%3D%20%28self._root%2C%20None%29%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%20%20%20%20node%20%3D%20bst.search%287%29%0A%20%20%20%20print%28%27%5Cn%D0%9D%D0%B0%D0%B9%D0%B4%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%20%D1%83%D0%B7%D0%BB%D0%B0%20%3D%20%7B%7D%2C%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%20%3D%20%7B%7D%27.format%28node%2C%20node.val%29%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 2. &nbsp; Вставка узла

Пусть дан элемент `num` , который нужно вставить. Чтобы сохранить свойство двоичного дерева поиска "левое поддерево < корень < правое поддерево", процесс вставки выглядит следующим образом.

1. **Найти позицию для вставки**: как и в операции поиска, начиная от корня, мы циклически спускаемся вниз в зависимости от соотношения между текущим значением узла и `num` , пока не выйдем за листовой узел (то есть не дойдем до `None` ).
2. **Вставить узел в найденную позицию**: инициализировать узел `num` и поставить его на место этого `None` .

![Вставка узла в двоичное дерево поиска](binary_search_tree.assets/bst_insert.png){ class="animation-figure" }

<p align="center"> Рисунок 7-18 &nbsp; Вставка узла в двоичное дерево поиска </p>

В реализации кода нужно обратить внимание на следующие два момента.

- Двоичное дерево поиска не допускает дублирующихся узлов, иначе его определение будет нарушено. Поэтому если вставляемый узел уже существует в дереве, вставка не выполняется и функция сразу возвращается.
- Чтобы реализовать вставку, нам нужно использовать узел `pre` для сохранения узла предыдущей итерации цикла. Тогда, когда обход дойдет до `None` , мы сможем получить его родителя и завершить вставку.

=== "Python"

    ```python title="binary_search_tree.py"
    def insert(self, num: int):
        """Вставка узла"""
        # Если дерево пусто, инициализировать корневой узел
        if self._root is None:
            self._root = TreeNode(num)
            return
        # Искать в цикле и выйти после прохода за листовой узел
        cur, pre = self._root, None
        while cur is not None:
            # Найти повторяющийся узел и сразу вернуть
            if cur.val == num:
                return
            pre = cur
            # Позиция вставки находится в правом поддереве cur
            if cur.val < num:
                cur = cur.right
            # Позиция вставки находится в левом поддереве cur
            else:
                cur = cur.left
        # Вставка узла
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* Вставка узла */
    void insert(int num) {
        // Если дерево пусто, инициализировать корневой узел
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != nullptr) {
            // Найти повторяющийся узел и сразу вернуть
            if (cur->val == num)
                return;
            pre = cur;
            // Позиция вставки находится в правом поддереве cur
            if (cur->val < num)
                cur = cur->right;
            // Позиция вставки находится в левом поддереве cur
            else
                cur = cur->left;
        }
        // Вставка узла
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* Вставка узла */
    void insert(int num) {
        // Если дерево пусто, инициализировать корневой узел
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Найти повторяющийся узел и сразу вернуть
            if (cur.val == num)
                return;
            pre = cur;
            // Позиция вставки находится в правом поддереве cur
            if (cur.val < num)
                cur = cur.right;
            // Позиция вставки находится в левом поддереве cur
            else
                cur = cur.left;
        }
        // Вставка узла
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* Вставка узла */
    void Insert(int num) {
        // Если дерево пусто, инициализировать корневой узел
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Найти повторяющийся узел и сразу вернуть
            if (cur.val == num)
                return;
            pre = cur;
            // Позиция вставки находится в правом поддереве cur
            if (cur.val < num)
                cur = cur.right;
            // Позиция вставки находится в левом поддереве cur
            else
                cur = cur.left;
        }

        // Вставка узла
        TreeNode node = new(num);
        if (pre != null) {
            if (pre.val < num)
                pre.right = node;
            else
                pre.left = node;
        }
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* Вставка узла */
    func (bst *binarySearchTree) insert(num int) {
        cur := bst.root
        // Если дерево пусто, инициализировать корневой узел
        if cur == nil {
            bst.root = NewTreeNode(num)
            return
        }
        // Позиция узла, предшествующего вставляемому
        var pre *TreeNode = nil
        // Искать в цикле и выйти после прохода за листовой узел
        for cur != nil {
            if cur.Val == num {
                return
            }
            pre = cur
            if cur.Val.(int) < num {
                cur = cur.Right
            } else {
                cur = cur.Left
            }
        }
        // Вставка узла
        node := NewTreeNode(num)
        if pre.Val.(int) < num {
            pre.Right = node
        } else {
            pre.Left = node
        }
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* Вставка узла */
    func insert(num: Int) {
        // Если дерево пусто, инициализировать корневой узел
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // Искать в цикле и выйти после прохода за листовой узел
        while cur != nil {
            // Найти повторяющийся узел и сразу вернуть
            if cur!.val == num {
                return
            }
            pre = cur
            // Позиция вставки находится в правом поддереве cur
            if cur!.val < num {
                cur = cur?.right
            }
            // Позиция вставки находится в левом поддереве cur
            else {
                cur = cur?.left
            }
        }
        // Вставка узла
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* Вставка узла */
    insert(num) {
        // Если дерево пусто, инициализировать корневой узел
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur = this.root,
            pre = null;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur !== null) {
            // Найти повторяющийся узел и сразу вернуть
            if (cur.val === num) return;
            pre = cur;
            // Позиция вставки находится в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Позиция вставки находится в левом поддереве cur
            else cur = cur.left;
        }
        // Вставка узла
        const node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* Вставка узла */
    insert(num: number): void {
        // Если дерево пусто, инициализировать корневой узел
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur !== null) {
            // Найти повторяющийся узел и сразу вернуть
            if (cur.val === num) return;
            pre = cur;
            // Позиция вставки находится в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Позиция вставки находится в левом поддереве cur
            else cur = cur.left;
        }
        // Вставка узла
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* Вставка узла */
    void insert(int _num) {
      // Если дерево пусто, инициализировать корневой узел
      if (_root == null) {
        _root = TreeNode(_num);
        return;
      }
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // Искать в цикле и выйти после прохода за листовой узел
      while (cur != null) {
        // Найти повторяющийся узел и сразу вернуть
        if (cur.val == _num) return;
        pre = cur;
        // Позиция вставки находится в правом поддереве cur
        if (cur.val < _num)
          cur = cur.right;
        // Позиция вставки находится в левом поддереве cur
        else
          cur = cur.left;
      }
      // Вставка узла
      TreeNode? node = TreeNode(_num);
      if (pre!.val < _num)
        pre.right = node;
      else
        pre.left = node;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* Вставка узла */
    pub fn insert(&mut self, num: i32) {
        // Если дерево пусто, инициализировать корневой узел
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Искать в цикле и выйти после прохода за листовой узел
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Найти повторяющийся узел и сразу вернуть
                Ordering::Equal => return,
                // Позиция вставки находится в правом поддереве cur
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // Позиция вставки находится в левом поддереве cur
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // Вставка узла
        let pre = pre.unwrap();
        let node = Some(TreeNode::new(num));
        if num > pre.borrow().val {
            pre.borrow_mut().right = node;
        } else {
            pre.borrow_mut().left = node;
        }
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* Вставка узла */
    void insert(BinarySearchTree *bst, int num) {
        // Если дерево пусто, инициализировать корневой узел
        if (bst->root == NULL) {
            bst->root = newTreeNode(num);
            return;
        }
        TreeNode *cur = bst->root, *pre = NULL;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != NULL) {
            // Найти повторяющийся узел и сразу вернуть
            if (cur->val == num) {
                return;
            }
            pre = cur;
            if (cur->val < num) {
                // Позиция вставки находится в правом поддереве cur
                cur = cur->right;
            } else {
                // Позиция вставки находится в левом поддереве cur
                cur = cur->left;
            }
        }
        // Вставка узла
        TreeNode *node = newTreeNode(num);
        if (pre->val < num) {
            pre->right = node;
        } else {
            pre->left = node;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* Вставка узла */
    fun insert(num: Int) {
        // Если дерево пусто, инициализировать корневой узел
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Найти повторяющийся узел и сразу вернуть
            if (cur._val == num)
                return
            pre = cur
            // Позиция вставки находится в правом поддереве cur
            cur = if (cur._val < num)
                cur.right
            // Позиция вставки находится в левом поддереве cur
            else
                cur.left
        }
        // Вставка узла
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
  =begin
  File: binary_search_tree.rb
  Created Time: 2024-04-18
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## Двоичное дерево поиска ###
  class BinarySearchTree
    # ## Конструктор ###
    def initialize
      # Инициализировать пустое дерево
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Поиск узла ###
    def search(num)
      cur = @root

      # Искать в цикле и выйти после прохода за листовой узел
      while !cur.nil?
        # Целевой узел находится в правом поддереве cur
        if cur.val < num
          cur = cur.right
        # Целевой узел находится в левом поддереве cur
        elsif cur.val > num
          cur = cur.left
        # Найти целевой узел и выйти из цикла
        else
          break
        end
      end

      cur
    end

    # ## Вставка узла ###
    def insert(num)
      # Если дерево пусто, инициализировать корневой узел
      if @root.nil?
        @root = TreeNode.new(num)
        return
      end

      # Искать в цикле и выйти после прохода за листовой узел
      cur, pre = @root, nil
      while !cur.nil?
        # Найти повторяющийся узел и сразу вернуть
        return if cur.val == num

        pre = cur
        # Позиция вставки находится в правом поддереве cur
        if cur.val < num
          cur = cur.right
        # Позиция вставки находится в левом поддереве cur
        else
          cur = cur.left
        end
      end

      # Вставка узла
      node = TreeNode.new(num)
      if pre.val < num
        pre.right = node
      else
        pre.left = node
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%20%D0%BF%D1%83%D1%81%D1%82%D0%BE%2C%20%D0%B8%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BA%D0%BE%D1%80%D0%BD%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%D0%98%D1%81%D0%BA%D0%B0%D1%82%D1%8C%20%D0%B2%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20%D0%B8%20%D0%B2%D1%8B%D0%B9%D1%82%D0%B8%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BF%D1%80%D0%BE%D1%85%D0%BE%D0%B4%D0%B0%20%D0%B7%D0%B0%20%D0%BB%D0%B8%D1%81%D1%82%D0%BE%D0%B2%D0%BE%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%B9%D1%81%D1%8F%20%D1%83%D0%B7%D0%B5%D0%BB%20%D0%B8%20%D1%81%D1%80%D0%B0%D0%B7%D1%83%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8F%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%BC%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B5%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8F%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%BC%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B5%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20bst.insert%2816%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%20%D0%BF%D1%83%D1%81%D1%82%D0%BE%2C%20%D0%B8%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BA%D0%BE%D1%80%D0%BD%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%D0%98%D1%81%D0%BA%D0%B0%D1%82%D1%8C%20%D0%B2%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20%D0%B8%20%D0%B2%D1%8B%D0%B9%D1%82%D0%B8%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BF%D1%80%D0%BE%D1%85%D0%BE%D0%B4%D0%B0%20%D0%B7%D0%B0%20%D0%BB%D0%B8%D1%81%D1%82%D0%BE%D0%B2%D0%BE%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%B9%D1%81%D1%8F%20%D1%83%D0%B7%D0%B5%D0%BB%20%D0%B8%20%D1%81%D1%80%D0%B0%D0%B7%D1%83%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8F%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%BC%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B5%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8F%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%BC%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B5%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20bst.insert%2816%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Как и поиск узла, вставка узла требует $O(\log n)$ времени.

### 3. &nbsp; Удаление узла

Сначала нужно найти в двоичном дереве целевой узел, а затем удалить его. Как и при вставке, после удаления необходимо сохранить свойство двоичного дерева поиска: "левое поддерево < корень < правое поддерево". Поэтому в зависимости от числа дочерних узлов у удаляемого узла, то есть для случаев со степенью 0, 1 и 2, выполняются разные операции удаления.

Как показано на рисунке 7-19, когда степень удаляемого узла равна $0$ , это значит, что узел является листом и может быть удален напрямую.

![Удаление узла в двоичном дереве поиска (степень 0)](binary_search_tree.assets/bst_remove_case1.png){ class="animation-figure" }

<p align="center"> Рисунок 7-19 &nbsp; Удаление узла в двоичном дереве поиска (степень 0) </p>

Как показано на рисунке 7-20, когда степень удаляемого узла равна $1$ , достаточно заменить удаляемый узел его дочерним узлом.

![Удаление узла в двоичном дереве поиска (степень 1)](binary_search_tree.assets/bst_remove_case2.png){ class="animation-figure" }

<p align="center"> Рисунок 7-20 &nbsp; Удаление узла в двоичном дереве поиска (степень 1) </p>

Когда степень удаляемого узла равна $2$ , мы уже не можем удалить его напрямую и должны использовать для замены другой узел. Чтобы сохранить свойство двоичного дерева поиска "левое поддерево $<$ корень $<$ правое поддерево", **этим узлом может быть минимальный узел правого поддерева или максимальный узел левого поддерева**.

Предположим, мы выбираем минимальный узел правого поддерева, то есть следующий узел в симметричном обходе. Тогда процесс удаления выглядит так.

1. Найти следующий узел в "последовательности симметричного обхода" для удаляемого узла и обозначить его как `tmp` .
2. Значением `tmp` перезаписать значение удаляемого узла, а затем рекурсивно удалить узел `tmp` из дерева.

=== "<1>"
    ![Удаление узла в двоичном дереве поиска (степень 2)](binary_search_tree.assets/bst_remove_case3_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_remove_case3_step2](binary_search_tree.assets/bst_remove_case3_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_remove_case3_step3](binary_search_tree.assets/bst_remove_case3_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_remove_case3_step4](binary_search_tree.assets/bst_remove_case3_step4.png){ class="animation-figure" }

<p align="center"> Рисунок 7-21 &nbsp; Удаление узла в двоичном дереве поиска (степень 2) </p>

Операция удаления узла также требует $O(\log n)$ времени, где поиск удаляемого узла стоит $O(\log n)$ , а получение следующего узла симметричного обхода также требует $O(\log n)$ . Пример кода приведен ниже:

=== "Python"

    ```python title="binary_search_tree.py"
    def remove(self, num: int):
        """Удаление узла"""
        # Если дерево пусто, сразу вернуть
        if self._root is None:
            return
        # Искать в цикле и выйти после прохода за листовой узел
        cur, pre = self._root, None
        while cur is not None:
            # Найти узел для удаления и выйти из цикла
            if cur.val == num:
                break
            pre = cur
            # Узел для удаления находится в правом поддереве cur
            if cur.val < num:
                cur = cur.right
            # Узел для удаления находится в левом поддереве cur
            else:
                cur = cur.left
        # Если узел для удаления отсутствует, сразу вернуть
        if cur is None:
            return

        # Число дочерних узлов = 0 или 1
        if cur.left is None or cur.right is None:
            # Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
            child = cur.left or cur.right
            # Удалить узел cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # Если удаляемый узел является корнем, заново назначить корневой узел
                self._root = child
        # Число дочерних узлов = 2
        else:
            # Получить следующий узел после cur в симметричном обходе
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # Рекурсивно удалить узел tmp
            self.remove(tmp.val)
            # Перезаписать cur значением tmp
            cur.val = tmp.val
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* Удаление узла */
    void remove(int num) {
        // Если дерево пусто, сразу вернуть
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != nullptr) {
            // Найти узел для удаления и выйти из цикла
            if (cur->val == num)
                break;
            pre = cur;
            // Узел для удаления находится в правом поддереве cur
            if (cur->val < num)
                cur = cur->right;
            // Узел для удаления находится в левом поддереве cur
            else
                cur = cur->left;
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if (cur == nullptr)
            return;
        // Число дочерних узлов = 0 или 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // Когда число дочерних узлов = 0 / 1, child = nullptr / этот дочерний узел
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // Удалить узел cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // Если удаляемый узел является корнем, заново назначить корневой узел
                root = child;
            }
            // Освободить память
            delete cur;
        }
        // Число дочерних узлов = 2
        else {
            // Получить следующий узел после cur в симметричном обходе
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // Рекурсивно удалить узел tmp
            remove(tmp->val);
            // Перезаписать cur значением tmp
            cur->val = tmpVal;
        }
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* Удаление узла */
    void remove(int num) {
        // Если дерево пусто, сразу вернуть
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Найти узел для удаления и выйти из цикла
            if (cur.val == num)
                break;
            pre = cur;
            // Узел для удаления находится в правом поддереве cur
            if (cur.val < num)
                cur = cur.right;
            // Узел для удаления находится в левом поддереве cur
            else
                cur = cur.left;
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if (cur == null)
            return;
        // Число дочерних узлов = 0 или 1
        if (cur.left == null || cur.right == null) {
            // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // Удалить узел cur
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // Если удаляемый узел является корнем, заново назначить корневой узел
                root = child;
            }
        }
        // Число дочерних узлов = 2
        else {
            // Получить следующий узел после cur в симметричном обходе
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Рекурсивно удалить узел tmp
            remove(tmp.val);
            // Перезаписать cur значением tmp
            cur.val = tmp.val;
        }
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* Удаление узла */
    void Remove(int num) {
        // Если дерево пусто, сразу вернуть
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Найти узел для удаления и выйти из цикла
            if (cur.val == num)
                break;
            pre = cur;
            // Узел для удаления находится в правом поддереве cur
            if (cur.val < num)
                cur = cur.right;
            // Узел для удаления находится в левом поддереве cur
            else
                cur = cur.left;
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if (cur == null)
            return;
        // Число дочерних узлов = 0 или 1
        if (cur.left == null || cur.right == null) {
            // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
            TreeNode? child = cur.left ?? cur.right;
            // Удалить узел cur
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // Если удаляемый узел является корнем, заново назначить корневой узел
                root = child;
            }
        }
        // Число дочерних узлов = 2
        else {
            // Получить следующий узел после cur в симметричном обходе
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Рекурсивно удалить узел tmp
            Remove(tmp.val!.Value);
            // Перезаписать cur значением tmp
            cur.val = tmp.val;
        }
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* Удаление узла */
    func (bst *binarySearchTree) remove(num int) {
        cur := bst.root
        // Если дерево пусто, сразу вернуть
        if cur == nil {
            return
        }
        // Позиция узла, предшествующего удаляемому
        var pre *TreeNode = nil
        // Искать в цикле и выйти после прохода за листовой узел
        for cur != nil {
            if cur.Val == num {
                break
            }
            pre = cur
            if cur.Val.(int) < num {
                // Удаляемый узел находится в правом поддереве
                cur = cur.Right
            } else {
                // Удаляемый узел находится в левом поддереве
                cur = cur.Left
            }
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if cur == nil {
            return
        }
        // Число дочерних узлов равно 0 или 1
        if cur.Left == nil || cur.Right == nil {
            var child *TreeNode = nil
            // Извлечь дочерний узел удаляемого узла
            if cur.Left != nil {
                child = cur.Left
            } else {
                child = cur.Right
            }
            // Удалить узел cur
            if cur != bst.root {
                if pre.Left == cur {
                    pre.Left = child
                } else {
                    pre.Right = child
                }
            } else {
                // Если удаляемый узел является корнем, заново назначить корневой узел
                bst.root = child
            }
            // Число дочерних узлов равно 2
        } else {
            // Получить следующий после cur узел в симметричном обходе для удаляемого узла
            tmp := cur.Right
            for tmp.Left != nil {
                tmp = tmp.Left
            }
            // Рекурсивно удалить узел tmp
            bst.remove(tmp.Val.(int))
            // Перезаписать cur значением tmp
            cur.Val = tmp.Val
        }
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* Удаление узла */
    func remove(num: Int) {
        // Если дерево пусто, сразу вернуть
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // Искать в цикле и выйти после прохода за листовой узел
        while cur != nil {
            // Найти узел для удаления и выйти из цикла
            if cur!.val == num {
                break
            }
            pre = cur
            // Узел для удаления находится в правом поддереве cur
            if cur!.val < num {
                cur = cur?.right
            }
            // Узел для удаления находится в левом поддереве cur
            else {
                cur = cur?.left
            }
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if cur == nil {
            return
        }
        // Число дочерних узлов = 0 или 1
        if cur?.left == nil || cur?.right == nil {
            // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
            let child = cur?.left ?? cur?.right
            // Удалить узел cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // Если удаляемый узел является корнем, заново назначить корневой узел
                root = child
            }
        }
        // Число дочерних узлов = 2
        else {
            // Получить следующий узел после cur в симметричном обходе
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // Рекурсивно удалить узел tmp
            remove(num: tmp!.val)
            // Перезаписать cur значением tmp
            cur?.val = tmp!.val
        }
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* Удаление узла */
    remove(num) {
        // Если дерево пусто, сразу вернуть
        if (this.root === null) return;
        let cur = this.root,
            pre = null;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur !== null) {
            // Найти узел для удаления и выйти из цикла
            if (cur.val === num) break;
            pre = cur;
            // Узел для удаления находится в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Узел для удаления находится в левом поддереве cur
            else cur = cur.left;
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if (cur === null) return;
        // Число дочерних узлов = 0 или 1
        if (cur.left === null || cur.right === null) {
            // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
            const child = cur.left !== null ? cur.left : cur.right;
            // Удалить узел cur
            if (cur !== this.root) {
                if (pre.left === cur) pre.left = child;
                else pre.right = child;
            } else {
                // Если удаляемый узел является корнем, заново назначить корневой узел
                this.root = child;
            }
        }
        // Число дочерних узлов = 2
        else {
            // Получить следующий узел после cur в симметричном обходе
            let tmp = cur.right;
            while (tmp.left !== null) {
                tmp = tmp.left;
            }
            // Рекурсивно удалить узел tmp
            this.remove(tmp.val);
            // Перезаписать cur значением tmp
            cur.val = tmp.val;
        }
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* Удаление узла */
    remove(num: number): void {
        // Если дерево пусто, сразу вернуть
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur !== null) {
            // Найти узел для удаления и выйти из цикла
            if (cur.val === num) break;
            pre = cur;
            // Узел для удаления находится в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Узел для удаления находится в левом поддереве cur
            else cur = cur.left;
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if (cur === null) return;
        // Число дочерних узлов = 0 или 1
        if (cur.left === null || cur.right === null) {
            // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // Удалить узел cur
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // Если удаляемый узел является корнем, заново назначить корневой узел
                this.root = child;
            }
        }
        // Число дочерних узлов = 2
        else {
            // Получить следующий узел после cur в симметричном обходе
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // Рекурсивно удалить узел tmp
            this.remove(tmp!.val);
            // Перезаписать cur значением tmp
            cur.val = tmp!.val;
        }
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* Удаление узла */
    void remove(int _num) {
      // Если дерево пусто, сразу вернуть
      if (_root == null) return;
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // Искать в цикле и выйти после прохода за листовой узел
      while (cur != null) {
        // Найти узел для удаления и выйти из цикла
        if (cur.val == _num) break;
        pre = cur;
        // Узел для удаления находится в правом поддереве cur
        if (cur.val < _num)
          cur = cur.right;
        // Узел для удаления находится в левом поддереве cur
        else
          cur = cur.left;
      }
      // Если удаляемого узла нет, сразу вернуть
      if (cur == null) return;
      // Число дочерних узлов = 0 или 1
      if (cur.left == null || cur.right == null) {
        // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
        TreeNode? child = cur.left ?? cur.right;
        // Удалить узел cur
        if (cur != _root) {
          if (pre!.left == cur)
            pre.left = child;
          else
            pre.right = child;
        } else {
          // Если удаляемый узел является корнем, заново назначить корневой узел
          _root = child;
        }
      } else {
        // Число дочерних узлов = 2
        // Получить следующий узел после cur в симметричном обходе
        TreeNode? tmp = cur.right;
        while (tmp!.left != null) {
          tmp = tmp.left;
        }
        // Рекурсивно удалить узел tmp
        remove(tmp.val);
        // Перезаписать cur значением tmp
        cur.val = tmp.val;
      }
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* Удаление узла */
    pub fn remove(&mut self, num: i32) {
        // Если дерево пусто, сразу вернуть
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Искать в цикле и выйти после прохода за листовой узел
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Найти узел для удаления и выйти из цикла
                Ordering::Equal => break,
                // Узел для удаления находится в правом поддереве cur
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // Узел для удаления находится в левом поддереве cur
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // Число дочерних узлов = 0 или 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // Когда число дочерних узлов = 0 / 1, child = nullptr / этот дочерний узел
                let child = left_child.or(right_child);
                let pre = pre.unwrap();
                // Удалить узел cur
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // Если удаляемый узел является корнем, заново назначить корневой узел
                    self.root = child;
                }
            }
            // Число дочерних узлов = 2
            (Some(_), Some(_)) => {
                // Получить следующий узел после cur в симметричном обходе
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmp_val = tmp.unwrap().borrow().val;
                // Рекурсивно удалить узел tmp
                self.remove(tmp_val);
                // Перезаписать cur значением tmp
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* Удаление узла */
    // Из-за подключения stdio.h здесь нельзя использовать ключевое слово remove
    void removeItem(BinarySearchTree *bst, int num) {
        // Если дерево пусто, сразу вернуть
        if (bst->root == NULL)
            return;
        TreeNode *cur = bst->root, *pre = NULL;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != NULL) {
            // Найти узел для удаления и выйти из цикла
            if (cur->val == num)
                break;
            pre = cur;
            if (cur->val < num) {
                // Удаляемый узел находится в правом поддереве root
                cur = cur->right;
            } else {
                // Удаляемый узел находится в левом поддереве root
                cur = cur->left;
            }
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if (cur == NULL)
            return;
        // Проверить, есть ли дочерние узлы у удаляемого узла
        if (cur->left == NULL || cur->right == NULL) {
            /* Число дочерних узлов = 0 или 1 */
            // Когда число дочерних узлов = 0 / 1, child = nullptr / этот дочерний узел
            TreeNode *child = cur->left != NULL ? cur->left : cur->right;
            // Удалить узел cur
            if (pre->left == cur) {
                pre->left = child;
            } else {
                pre->right = child;
            }
            // Освободить память
            free(cur);
        } else {
            /* Число дочерних узлов = 2 */
            // Получить следующий узел после cur в симметричном обходе
            TreeNode *tmp = cur->right;
            while (tmp->left != NULL) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // Рекурсивно удалить узел tmp
            removeItem(bst, tmp->val);
            // Перезаписать cur значением tmp
            cur->val = tmpVal;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* Удаление узла */
    fun remove(num: Int) {
        // Если дерево пусто, сразу вернуть
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Найти узел для удаления и выйти из цикла
            if (cur._val == num)
                break
            pre = cur
            // Узел для удаления находится в правом поддереве cur
            cur = if (cur._val < num)
                cur.right
            // Узел для удаления находится в левом поддереве cur
            else
                cur.left
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if (cur == null)
            return
        // Число дочерних узлов = 0 или 1
        if (cur.left == null || cur.right == null) {
            // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
            val child = if (cur.left != null)
                cur.left
            else
                cur.right
            // Удалить узел cur
            if (cur != root) {
                if (pre!!.left == cur)
                    pre.left = child
                else
                    pre.right = child
            } else {
                // Если удаляемый узел является корнем, заново назначить корневой узел
                root = child
            }
            // Число дочерних узлов = 2
        } else {
            // Получить следующий узел после cur в симметричном обходе
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // Рекурсивно удалить узел tmp
            remove(tmp._val)
            // Перезаписать cur значением tmp
            cur._val = tmp._val
        }
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
  =begin
  File: binary_search_tree.rb
  Created Time: 2024-04-18
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## Двоичное дерево поиска ###
  class BinarySearchTree
    # ## Конструктор ###
    def initialize
      # Инициализировать пустое дерево
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Поиск узла ###
    def search(num)
      cur = @root

      # Искать в цикле и выйти после прохода за листовой узел
      while !cur.nil?
        # Целевой узел находится в правом поддереве cur
        if cur.val < num
          cur = cur.right
        # Целевой узел находится в левом поддереве cur
        elsif cur.val > num
          cur = cur.left
        # Найти целевой узел и выйти из цикла
        else
          break
        end
      end

      cur
    end

    # ## Вставка узла ###
    def insert(num)
      # Если дерево пусто, инициализировать корневой узел
      if @root.nil?
        @root = TreeNode.new(num)
        return
      end

      # Искать в цикле и выйти после прохода за листовой узел
      cur, pre = @root, nil
      while !cur.nil?
        # Найти повторяющийся узел и сразу вернуть
        return if cur.val == num

        pre = cur
        # Позиция вставки находится в правом поддереве cur
        if cur.val < num
          cur = cur.right
        # Позиция вставки находится в левом поддереве cur
        else
          cur = cur.left
        end
      end

      # Вставка узла
      node = TreeNode.new(num)
      if pre.val < num
        pre.right = node
      else
        pre.left = node
      end
    end

    # ## Удаление узла ###
    def remove(num)
      # Если дерево пусто, сразу вернуть
      return if @root.nil?

      # Искать в цикле и выйти после прохода за листовой узел
      cur, pre = @root, nil
      while !cur.nil?
        # Найти узел для удаления и выйти из цикла
        break if cur.val == num

        pre = cur
        # Узел для удаления находится в правом поддереве cur
        if cur.val < num
          cur = cur.right
        # Узел для удаления находится в левом поддереве cur
        else
          cur = cur.left
        end
      end
      # Если узел для удаления отсутствует, сразу вернуть
      return if cur.nil?

      # Число дочерних узлов = 0 или 1
      if cur.left.nil? || cur.right.nil?
        # Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
        child = cur.left || cur.right
        # Удалить узел cur
        if cur != @root
          if pre.left == cur
            pre.left = child
          else
            pre.right = child
          end
        else
          # Если удаляемый узел является корнем, заново назначить корневой узел
          @root = child
        end
      # Число дочерних узлов = 2
      else
        # Получить следующий узел после cur в симметричном обходе
        tmp = cur.right
        while !tmp.left.nil?
          tmp = tmp.left
        end
        # Рекурсивно удалить узел tmp
        remove(tmp.val)
        # Перезаписать cur значением tmp
        cur.val = tmp.val
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%28cur%2C%20pre%29%20%3D%20%28self._root%2C%20None%29%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%20%20%20%20def%20remove%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%28cur%2C%20pre%29%20%3D%20%28self._root%2C%20None%29%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20if%20cur%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20if%20cur.left%20is%20None%20or%20cur.right%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20child%20%3D%20cur.left%20or%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur%20%21%3D%20self._root%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20if%20pre.left%20%3D%3D%20cur%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20child%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%3A%20TreeNode%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20while%20tmp.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20tmp.left%0A%20%20%20%20%20%20%20%20%20%20%20%20self.remove%28tmp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20cur.val%20%3D%20tmp.val%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%20%20%20%20bst.remove%281%29%0A%20%20%20%20bst.remove%282%29%0A%20%20%20%20bst.remove%284%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%28cur%2C%20pre%29%20%3D%20%28self._root%2C%20None%29%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%20%20%20%20def%20remove%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%28cur%2C%20pre%29%20%3D%20%28self._root%2C%20None%29%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20if%20cur%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20if%20cur.left%20is%20None%20or%20cur.right%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20child%20%3D%20cur.left%20or%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur%20%21%3D%20self._root%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20if%20pre.left%20%3D%3D%20cur%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20child%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%3A%20TreeNode%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20while%20tmp.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20tmp.left%0A%20%20%20%20%20%20%20%20%20%20%20%20self.remove%28tmp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20cur.val%20%3D%20tmp.val%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%20%20%20%20bst.remove%281%29%0A%20%20%20%20bst.remove%282%29%0A%20%20%20%20bst.remove%284%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 4. &nbsp; Упорядоченность симметричного обхода

Как показано на рисунке 7-22, симметричный обход двоичного дерева следует порядку "лево $\rightarrow$ корень $\rightarrow$ право", а двоичное дерево поиска удовлетворяет соотношению "левый дочерний узел $<$ корень $<$ правый дочерний узел".

Это означает, что при симметричном обходе двоичного дерева поиска мы всегда сначала будем посещать следующий минимальный узел, и отсюда получается важное свойство: **последовательность симметричного обхода двоичного дерева поиска является возрастающей**.

Используя это свойство возрастающей последовательности симметричного обхода, мы можем получить отсортированные данные из двоичного дерева поиска всего за $O(n)$ времени, без дополнительной сортировки, что очень эффективно.

![Последовательность симметричного обхода двоичного дерева поиска](binary_search_tree.assets/bst_inorder_traversal.png){ class="animation-figure" }

<p align="center"> Рисунок 7-22 &nbsp; Последовательность симметричного обхода двоичного дерева поиска </p>

## 7.4.2 &nbsp; Эффективность двоичного дерева поиска

Для заданного набора данных можно рассмотреть хранение либо в массиве, либо в двоичном дереве поиска. Из таблицы ниже видно, что временная сложность операций двоичного дерева поиска имеет логарифмический порядок, поэтому его производительность стабильна и высока. Только в сценариях с очень частыми вставками и редкими поисками и удалениями массив может быть эффективнее, чем двоичное дерево поиска.

<p align="center"> Таблица 7-2 &nbsp; Сравнение эффективности массива и дерева поиска </p>

<div class="center-table" markdown>

|          | Неупорядоченный массив | Двоичное дерево поиска |
| -------- | ---------------------- | ---------------------- |
| Поиск элемента | $O(n)$   | $O(\log n)$ |
| Вставка элемента | $O(1)$   | $O(\log n)$ |
| Удаление элемента | $O(n)$   | $O(\log n)$ |

</div>

В идеальном случае двоичное дерево поиска является "сбалансированным", и тогда любой узел можно найти за $\log n$ итераций.

Однако если в двоичное дерево поиска непрерывно вставлять и удалять узлы, оно может выродиться в связный список, как показано на рисунке 7-23. Тогда временная сложность различных операций тоже вырождается до $O(n)$ .

![Деградация двоичного дерева поиска](binary_search_tree.assets/bst_degradation.png){ class="animation-figure" }

<p align="center"> Рисунок 7-23 &nbsp; Деградация двоичного дерева поиска </p>

## 7.4.3 &nbsp; Типичные применения двоичного дерева поиска

- Используется как многоуровневый индекс в системах, обеспечивая эффективный поиск, вставку и удаление.
- Служит базовой структурой данных для некоторых поисковых алгоритмов.
- Применяется для хранения потока данных в отсортированном состоянии.
