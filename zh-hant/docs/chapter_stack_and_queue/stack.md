---
comments: true
---

# 5.1 &nbsp; 堆疊

<u>堆疊（stack）</u>是一種遵循先進後出原則的線性資料結構。

想像桌上有一疊盤子，每次只能移動一個。想拿到底下的盤子，就得先把上面的盤子一個個移開。將盤子換成整數、字元或物件等各種類型的元素，就得到了堆疊這種資料結構。

如圖 5-1 所示，元素疊起來的最上方稱為「堆疊頂端」，最下方稱為「堆疊底端」。在頂端加入元素稱為「推入」，移除頂端元素則稱為「彈出」。

![堆疊的先進後出原則](stack.assets/stack_operations.svg){ class="animation-figure" }

<p align="center"> 圖 5-1 &nbsp; 堆疊的先進後出原則 </p>

## 5.1.1 &nbsp; 堆疊的常用操作

表 5-1 列出堆疊的常用操作。方法名稱依程式語言而異，這裡以常見的 `push()`、`pop()` 和 `peek()` 為例。

<p align="center"> 表 5-1 &nbsp; 堆疊的操作效率 </p>

<div class="center-table" markdown>

| 方法     | 說明                   | 時間複雜度 |
| -------- | ---------------------- | ---------- |
| `push()` | 推入元素（加到堆疊頂端） | $O(1)$     |
| `pop()`  | 彈出堆疊頂端的元素           | $O(1)$     |
| `peek()` | 讀取堆疊頂端的元素           | $O(1)$     |

</div>

通常可以直接使用程式語言內建的堆疊類別。有些語言沒有專用的堆疊類別，這時可以把該語言提供的陣列或鏈結串列當作堆疊使用，在程式中只採用與堆疊有關的操作。

=== "Python"

    ```python title="stack.py"
    # 初始化堆疊
    # Python 沒有內建堆疊類別，可以用 list 當作堆疊
    stack: list[int] = []

    # 將元素推入堆疊
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    # 讀取堆疊頂端的元素
    peek: int = stack[-1]

    # 從堆疊彈出元素
    pop: int = stack.pop()

    # 取得堆疊長度
    size: int = len(stack)

    # 判斷堆疊是否為空
    is_empty: bool = len(stack) == 0
    ```

=== "C++"

    ```cpp title="stack.cpp"
    /* 初始化堆疊 */
    stack<int> stack;

    /* 將元素推入堆疊 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* 讀取堆疊頂端的元素 */
    int top = stack.top();

    /* 移除堆疊頂端的元素 */
    stack.pop(); // 沒有回傳值

    /* 取得堆疊長度 */
    int size = stack.size();

    /* 判斷堆疊是否為空 */
    bool empty = stack.empty();
    ```

=== "Java"

    ```java title="stack.java"
    /* 初始化堆疊 */
    Stack<Integer> stack = new Stack<>();

    /* 將元素推入堆疊 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* 讀取堆疊頂端的元素 */
    int peek = stack.peek();

    /* 從堆疊彈出元素 */
    int pop = stack.pop();

    /* 取得堆疊長度 */
    int size = stack.size();

    /* 判斷堆疊是否為空 */
    boolean isEmpty = stack.isEmpty();
    ```

=== "C#"

    ```csharp title="stack.cs"
    /* 初始化堆疊 */
    Stack<int> stack = new();

    /* 將元素推入堆疊 */
    stack.Push(1);
    stack.Push(3);
    stack.Push(2);
    stack.Push(5);
    stack.Push(4);

    /* 讀取堆疊頂端的元素 */
    int peek = stack.Peek();

    /* 從堆疊彈出元素 */
    int pop = stack.Pop();

    /* 取得堆疊長度 */
    int size = stack.Count;

    /* 判斷堆疊是否為空 */
    bool isEmpty = stack.Count == 0;
    ```

=== "Go"

    ```go title="stack_test.go"
    /* 初始化堆疊 */
    // 在 Go 中，建議用切片（slice）當作堆疊
    var stack []int

    /* 將元素推入堆疊 */
    stack = append(stack, 1)
    stack = append(stack, 3)
    stack = append(stack, 2)
    stack = append(stack, 5)
    stack = append(stack, 4)

    /* 讀取堆疊頂端的元素 */
    peek := stack[len(stack)-1]

    /* 從堆疊彈出元素 */
    pop := stack[len(stack)-1]
    stack = stack[:len(stack)-1]

    /* 取得堆疊長度 */
    size := len(stack)

    /* 判斷堆疊是否為空 */
    isEmpty := len(stack) == 0
    ```

=== "Swift"

    ```swift title="stack.swift"
    /* 初始化堆疊 */
    // Swift 沒有內建堆疊類別，可以用 Array 當作堆疊
    var stack: [Int] = []

    /* 將元素推入堆疊 */
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    /* 讀取堆疊頂端的元素 */
    let peek = stack.last!

    /* 從堆疊彈出元素 */
    let pop = stack.removeLast()

    /* 取得堆疊長度 */
    let size = stack.count

    /* 判斷堆疊是否為空 */
    let isEmpty = stack.isEmpty
    ```

=== "JS"

    ```javascript title="stack.js"
    /* 初始化堆疊 */
    // JavaScript 沒有內建堆疊類別，可以用 Array 當作堆疊
    const stack = [];

    /* 將元素推入堆疊 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* 讀取堆疊頂端的元素 */
    const peek = stack[stack.length - 1];

    /* 從堆疊彈出元素 */
    const pop = stack.pop();

    /* 取得堆疊長度 */
    const size = stack.length;

    /* 判斷堆疊是否為空 */
    const isEmpty = stack.length === 0;
    ```

=== "TS"

    ```typescript title="stack.ts"
    /* 初始化堆疊 */
    // TypeScript 沒有內建堆疊類別，可以用 Array 當作堆疊
    const stack: number[] = [];

    /* 將元素推入堆疊 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* 讀取堆疊頂端的元素 */
    const peek = stack[stack.length - 1];

    /* 從堆疊彈出元素 */
    const pop = stack.pop();

    /* 取得堆疊長度 */
    const size = stack.length;

    /* 判斷堆疊是否為空 */
    const isEmpty = stack.length === 0;
    ```

=== "Dart"

    ```dart title="stack.dart"
    /* 初始化堆疊 */
    // Dart 沒有內建堆疊類別，可以用 List 當作堆疊
    final List<int> stack = [];

    /* 將元素推入堆疊 */
    stack.add(1);
    stack.add(3);
    stack.add(2);
    stack.add(5);
    stack.add(4);

    /* 讀取堆疊頂端的元素 */
    final int peek = stack.last;

    /* 從堆疊彈出元素 */
    final int pop = stack.removeLast();

    /* 取得堆疊長度 */
    final int size = stack.length;

    /* 判斷堆疊是否為空 */
    final bool isEmpty = stack.isEmpty;
    ```

=== "Rust"

    ```rust title="stack.rs"
    // 初始化堆疊
    // 在 Rust 中，建議用 Vec 當作堆疊
    let mut stack: Vec<i32> = Vec::new();

    // 將元素推入堆疊
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    // 讀取堆疊頂端的元素
    let peek = stack.last().unwrap();

    // 從堆疊彈出元素
    let pop = stack.pop().unwrap();

    // 取得堆疊長度
    let size = stack.len();

    // 判斷堆疊是否為空
    let is_empty = stack.is_empty();
    ```

=== "C"

    ```c title="stack.c"
    // C 沒有內建堆疊
    ```

=== "Kotlin"

    ```kotlin title="stack.kt"
    /* 初始化堆疊 */
    val stack = Stack<Int>()

    /* 將元素推入堆疊 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)

    /* 讀取堆疊頂端的元素 */
    val peek = stack.peek()

    /* 從堆疊彈出元素 */
    val pop = stack.pop()

    /* 取得堆疊長度 */
    val size = stack.size

    /* 判斷堆疊是否為空 */
    val isEmpty = stack.isEmpty()
    ```

=== "Ruby"

    ```ruby title="stack.rb"
    # 初始化堆疊
    # Ruby 沒有內建堆疊類別，可以用 Array 當作堆疊
    stack = []

    # 將元素推入堆疊
    stack << 1
    stack << 3
    stack << 2
    stack << 5
    stack << 4

    # 讀取堆疊頂端的元素
    peek = stack.last

    # 從堆疊彈出元素
    pop = stack.pop

    # 取得堆疊長度
    size = stack.length

    # 判斷堆疊是否為空
    is_empty = stack.empty?
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%A0%86%E7%96%8A%0A%20%20%20%20%23%20Python%20%E6%B2%92%E6%9C%89%E5%85%A7%E5%BB%BA%E7%9A%84%E5%A0%86%E7%96%8A%E9%A1%9E%E5%88%A5%EF%BC%8C%E5%8F%AF%E4%BB%A5%E6%8A%8A%20list%20%E7%95%B6%E4%BD%9C%E5%A0%86%E7%96%8A%E4%BD%BF%E7%94%A8%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E6%8E%A8%E5%85%A5%E5%A0%86%E7%96%8A%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%BE%9E%E5%A0%86%E7%96%8A%E5%BD%88%E5%87%BA%E5%85%83%E7%B4%A0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E5%85%83%E7%B4%A0%E5%BE%8C%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E5%A0%86%E7%96%8A%E7%9A%84%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=2&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%A0%86%E7%96%8A%0A%20%20%20%20%23%20Python%20%E6%B2%92%E6%9C%89%E5%85%A7%E5%BB%BA%E7%9A%84%E5%A0%86%E7%96%8A%E9%A1%9E%E5%88%A5%EF%BC%8C%E5%8F%AF%E4%BB%A5%E6%8A%8A%20list%20%E7%95%B6%E4%BD%9C%E5%A0%86%E7%96%8A%E4%BD%BF%E7%94%A8%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E6%8E%A8%E5%85%A5%E5%A0%86%E7%96%8A%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%BE%9E%E5%A0%86%E7%96%8A%E5%BD%88%E5%87%BA%E5%85%83%E7%B4%A0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E5%85%83%E7%B4%A0%E5%BE%8C%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E5%A0%86%E7%96%8A%E7%9A%84%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=2&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 5.1.2 &nbsp; 堆疊的實作

為了進一步瞭解堆疊的運作方式，我們來試著實作一個堆疊類別。

堆疊遵循先進後出的原則，因此只能在頂端加入或刪除元素。陣列和鏈結串列則可以在任意位置加入或刪除元素，**因此可以把堆疊看成操作受限的陣列或鏈結串列**。換句話說，只要隱藏陣列或鏈結串列中與堆疊無關的操作，對外提供的操作就能符合堆疊的特性。

### 1. &nbsp; 以鏈結串列實作

用鏈結串列實作堆疊時，可以將頭節點當作堆疊頂端，將尾節點當作堆疊底端。

如圖 5-2 所示，推入元素時，只需在串列前端插入節點，這種做法稱為「頭插法」。彈出元素時，只需刪除串列的頭節點。

=== "<1>"
    ![以鏈結串列實作堆疊的推入與彈出](stack.assets/linkedlist_stack_step1.svg){ class="animation-figure" }

=== "<2>"
    ![linkedlist_stack_push](stack.assets/linkedlist_stack_step2_push.svg){ class="animation-figure" }

=== "<3>"
    ![linkedlist_stack_pop](stack.assets/linkedlist_stack_step3_pop.svg){ class="animation-figure" }

<p align="center"> 圖 5-2 &nbsp; 以鏈結串列實作堆疊的推入與彈出 </p>

以下是用鏈結串列實作堆疊的範例程式碼：

=== "Python"

    ```python title="linkedlist_stack.py"
    class LinkedListStack:
        """以鏈結串列實作堆疊"""

        def __init__(self):
            """初始化方法"""
            self._peek: ListNode | None = None
            self._size: int = 0

        def size(self) -> int:
            """取得堆疊長度"""
            return self._size

        def is_empty(self) -> bool:
            """判斷堆疊是否為空"""
            return self._size == 0

        def push(self, val: int):
            """推入堆疊"""
            node = ListNode(val)
            node.next = self._peek
            self._peek = node
            self._size += 1

        def pop(self) -> int:
            """彈出堆疊頂端的元素"""
            num = self.peek()
            self._peek = self._peek.next
            self._size -= 1
            return num

        def peek(self) -> int:
            """讀取堆疊頂端的元素"""
            if self.is_empty():
                raise IndexError("堆疊為空")
            return self._peek.val

        def to_list(self) -> list[int]:
            """轉成串列以便輸出"""
            arr = []
            node = self._peek
            while node:
                arr.append(node.val)
                node = node.next
            arr.reverse()
            return arr
    ```

=== "C++"

    ```cpp title="linkedlist_stack.cpp"
    /* 以鏈結串列實作堆疊 */
    class LinkedListStack {
      private:
        ListNode *stackTop; // 以首節點作為堆疊頂端
        int stkSize;        // 堆疊長度

      public:
        LinkedListStack() {
            stackTop = nullptr;
            stkSize = 0;
        }

        ~LinkedListStack() {
            // 走訪鏈結串列，逐一刪除節點並釋放記憶體
            freeMemoryLinkedList(stackTop);
        }

        /* 取得堆疊長度 */
        int size() {
            return stkSize;
        }

        /* 判斷堆疊是否為空 */
        bool isEmpty() {
            return size() == 0;
        }

        /* 推入堆疊 */
        void push(int num) {
            ListNode *node = new ListNode(num);
            node->next = stackTop;
            stackTop = node;
            stkSize++;
        }

        /* 彈出堆疊頂端的元素 */
        int pop() {
            int num = top();
            ListNode *tmp = stackTop;
            stackTop = stackTop->next;
            // 釋放已移除節點的記憶體
            delete tmp;
            stkSize--;
            return num;
        }

        /* 讀取堆疊頂端的元素 */
        int top() {
            if (isEmpty())
                throw out_of_range("堆疊為空");
            return stackTop->val;
        }

        /* 將鏈結串列轉成 vector 並回傳 */
        vector<int> toVector() {
            ListNode *node = stackTop;
            vector<int> res(size());
            for (int i = res.size() - 1; i >= 0; i--) {
                res[i] = node->val;
                node = node->next;
            }
            return res;
        }
    };
    ```

=== "Java"

    ```java title="linkedlist_stack.java"
    /* 以鏈結串列實作堆疊 */
    class LinkedListStack {
        private ListNode stackPeek; // 以首節點作為堆疊頂端
        private int stkSize = 0; // 堆疊長度

        public LinkedListStack() {
            stackPeek = null;
        }

        /* 取得堆疊長度 */
        public int size() {
            return stkSize;
        }

        /* 判斷堆疊是否為空 */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* 推入堆疊 */
        public void push(int num) {
            ListNode node = new ListNode(num);
            node.next = stackPeek;
            stackPeek = node;
            stkSize++;
        }

        /* 彈出堆疊頂端的元素 */
        public int pop() {
            int num = peek();
            stackPeek = stackPeek.next;
            stkSize--;
            return num;
        }

        /* 讀取堆疊頂端的元素 */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stackPeek.val;
        }

        /* 將鏈結串列轉成陣列並回傳 */
        public int[] toArray() {
            ListNode node = stackPeek;
            int[] res = new int[size()];
            for (int i = res.length - 1; i >= 0; i--) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="linkedlist_stack.cs"
    /* 以鏈結串列實作堆疊 */
    class LinkedListStack {
        ListNode? stackPeek;  // 以首節點作為堆疊頂端
        int stkSize = 0;   // 堆疊長度

        public LinkedListStack() {
            stackPeek = null;
        }

        /* 取得堆疊長度 */
        public int Size() {
            return stkSize;
        }

        /* 判斷堆疊是否為空 */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* 推入堆疊 */
        public void Push(int num) {
            ListNode node = new(num) {
                next = stackPeek
            };
            stackPeek = node;
            stkSize++;
        }

        /* 彈出堆疊頂端的元素 */
        public int Pop() {
            int num = Peek();
            stackPeek = stackPeek!.next;
            stkSize--;
            return num;
        }

        /* 讀取堆疊頂端的元素 */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return stackPeek!.val;
        }

        /* 將鏈結串列轉成陣列並回傳 */
        public int[] ToArray() {
            if (stackPeek == null)
                return [];

            ListNode? node = stackPeek;
            int[] res = new int[Size()];
            for (int i = res.Length - 1; i >= 0; i--) {
                res[i] = node!.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="linkedlist_stack.go"
    /* 以鏈結串列實作堆疊 */
    type linkedListStack struct {
        // 使用標準函式庫的 list 套件實作堆疊
        data *list.List
    }

    /* 初始化堆疊 */
    func newLinkedListStack() *linkedListStack {
        return &linkedListStack{
            data: list.New(),
        }
    }

    /* 推入堆疊 */
    func (s *linkedListStack) push(value int) {
        s.data.PushBack(value)
    }

    /* 彈出堆疊頂端的元素 */
    func (s *linkedListStack) pop() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        s.data.Remove(e)
        return e.Value
    }

    /* 讀取堆疊頂端的元素 */
    func (s *linkedListStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        return e.Value
    }

    /* 取得堆疊長度 */
    func (s *linkedListStack) size() int {
        return s.data.Len()
    }

    /* 判斷堆疊是否為空 */
    func (s *linkedListStack) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* 回傳 list.List 的指標以便輸出 */
    func (s *linkedListStack) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_stack.swift"
    /* 以鏈結串列實作堆疊 */
    class LinkedListStack {
        private var _peek: ListNode? // 以首節點作為堆疊頂端
        private var _size: Int // 堆疊長度

        init() {
            _size = 0
        }

        /* 取得堆疊長度 */
        func size() -> Int {
            _size
        }

        /* 判斷堆疊是否為空 */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* 推入堆疊 */
        func push(num: Int) {
            let node = ListNode(x: num)
            node.next = _peek
            _peek = node
            _size += 1
        }

        /* 彈出堆疊頂端的元素 */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            _peek = _peek?.next
            _size -= 1
            return num
        }

        /* 讀取堆疊頂端的元素 */
        func peek() -> Int {
            if isEmpty() {
                fatalError("堆疊為空")
            }
            return _peek!.val
        }

        /* 將鏈結串列轉成陣列並回傳 */
        func toArray() -> [Int] {
            var node = _peek
            var res = Array(repeating: 0, count: size())
            for i in res.indices.reversed() {
                res[i] = node!.val
                node = node?.next
            }
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="linkedlist_stack.js"
    /* 以鏈結串列實作堆疊 */
    class LinkedListStack {
        #stackPeek; // 以首節點作為堆疊頂端
        #stkSize = 0; // 堆疊長度

        constructor() {
            this.#stackPeek = null;
        }

        /* 取得堆疊長度 */
        get size() {
            return this.#stkSize;
        }

        /* 判斷堆疊是否為空 */
        isEmpty() {
            return this.size === 0;
        }

        /* 推入堆疊 */
        push(num) {
            const node = new ListNode(num);
            node.next = this.#stackPeek;
            this.#stackPeek = node;
            this.#stkSize++;
        }

        /* 彈出堆疊頂端的元素 */
        pop() {
            const num = this.peek();
            this.#stackPeek = this.#stackPeek.next;
            this.#stkSize--;
            return num;
        }

        /* 讀取堆疊頂端的元素 */
        peek() {
            if (!this.#stackPeek) throw new Error('堆疊為空');
            return this.#stackPeek.val;
        }

        /* 將鏈結串列轉成陣列並回傳 */
        toArray() {
            let node = this.#stackPeek;
            const res = new Array(this.size);
            for (let i = res.length - 1; i >= 0; i--) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="linkedlist_stack.ts"
    /* 以鏈結串列實作堆疊 */
    class LinkedListStack {
        private stackPeek: ListNode | null; // 以首節點作為堆疊頂端
        private stkSize: number = 0; // 堆疊長度

        constructor() {
            this.stackPeek = null;
        }

        /* 取得堆疊長度 */
        get size(): number {
            return this.stkSize;
        }

        /* 判斷堆疊是否為空 */
        isEmpty(): boolean {
            return this.size === 0;
        }

        /* 推入堆疊 */
        push(num: number): void {
            const node = new ListNode(num);
            node.next = this.stackPeek;
            this.stackPeek = node;
            this.stkSize++;
        }

        /* 彈出堆疊頂端的元素 */
        pop(): number {
            const num = this.peek();
            if (!this.stackPeek) throw new Error('堆疊為空');
            this.stackPeek = this.stackPeek.next;
            this.stkSize--;
            return num;
        }

        /* 讀取堆疊頂端的元素 */
        peek(): number {
            if (!this.stackPeek) throw new Error('堆疊為空');
            return this.stackPeek.val;
        }

        /* 將鏈結串列轉成陣列並回傳 */
        toArray(): number[] {
            let node = this.stackPeek;
            const res = new Array<number>(this.size);
            for (let i = res.length - 1; i >= 0; i--) {
                res[i] = node!.val;
                node = node!.next;
            }
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="linkedlist_stack.dart"
    /* 以鏈結串列類別實作堆疊 */
    class LinkedListStack {
      ListNode? _stackPeek; // 以首節點作為堆疊頂端
      int _stkSize = 0; // 堆疊長度

      LinkedListStack() {
        _stackPeek = null;
      }

      /* 取得堆疊長度 */
      int size() {
        return _stkSize;
      }

      /* 判斷堆疊是否為空 */
      bool isEmpty() {
        return _stkSize == 0;
      }

      /* 推入堆疊 */
      void push(int _num) {
        final ListNode node = ListNode(_num);
        node.next = _stackPeek;
        _stackPeek = node;
        _stkSize++;
      }

      /* 彈出堆疊頂端的元素 */
      int pop() {
        final int _num = peek();
        _stackPeek = _stackPeek!.next;
        _stkSize--;
        return _num;
      }

      /* 讀取堆疊頂端的元素 */
      int peek() {
        if (_stackPeek == null) {
          throw Exception("堆疊為空");
        }
        return _stackPeek!.val;
      }

      /* 將鏈結串列轉成 List 並回傳 */
      List<int> toList() {
        ListNode? node = _stackPeek;
        List<int> list = [];
        while (node != null) {
          list.add(node.val);
          node = node.next;
        }
        list = list.reversed.toList();
        return list;
      }
    }
    ```

=== "Rust"

    ```rust title="linkedlist_stack.rs"
    /* 以鏈結串列實作堆疊 */
    #[allow(dead_code)]
    pub struct LinkedListStack<T> {
        stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // 以首節點作為堆疊頂端
        stk_size: usize,                              // 堆疊長度
    }

    impl<T: Copy> LinkedListStack<T> {
        pub fn new() -> Self {
            Self {
                stack_peek: None,
                stk_size: 0,
            }
        }

        /* 取得堆疊長度 */
        pub fn size(&self) -> usize {
            return self.stk_size;
        }

        /* 判斷堆疊是否為空 */
        pub fn is_empty(&self) -> bool {
            return self.size() == 0;
        }

        /* 推入堆疊 */
        pub fn push(&mut self, num: T) {
            let node = ListNode::new(num);
            node.borrow_mut().next = self.stack_peek.take();
            self.stack_peek = Some(node);
            self.stk_size += 1;
        }

        /* 彈出堆疊頂端的元素 */
        pub fn pop(&mut self) -> Option<T> {
            self.stack_peek.take().map(|old_head| {
                self.stack_peek = old_head.borrow_mut().next.take();
                self.stk_size -= 1;

                old_head.borrow().val
            })
        }

        /* 取得堆疊頂端節點的參照 */
        pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.stack_peek.as_ref()
        }

        /* 將鏈結串列轉成 Vec 並回傳 */
        pub fn to_array(&self) -> Vec<T> {
            fn _to_array<T: Sized + Copy>(head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
                if let Some(node) = head {
                    let mut nums = _to_array(node.borrow().next.as_ref());
                    nums.push(node.borrow().val);
                    return nums;
                }
                return Vec::new();
            }

            _to_array(self.peek())
        }
    }
    ```

=== "C"

    ```c title="linkedlist_stack.c"
    /* 以鏈結串列實作堆疊 */
    typedef struct {
        ListNode *top; // 以首節點作為堆疊頂端
        int size;      // 堆疊長度
    } LinkedListStack;

    /* 建立堆疊 */
    LinkedListStack *newLinkedListStack() {
        LinkedListStack *s = malloc(sizeof(LinkedListStack));
        s->top = NULL;
        s->size = 0;
        return s;
    }

    /* 釋放堆疊的記憶體 */
    void delLinkedListStack(LinkedListStack *s) {
        while (s->top) {
            ListNode *n = s->top->next;
            free(s->top);
            s->top = n;
        }
        free(s);
    }

    /* 取得堆疊長度 */
    int size(LinkedListStack *s) {
        return s->size;
    }

    /* 判斷堆疊是否為空 */
    bool isEmpty(LinkedListStack *s) {
        return size(s) == 0;
    }

    /* 推入堆疊 */
    void push(LinkedListStack *s, int num) {
        ListNode *node = (ListNode *)malloc(sizeof(ListNode));
        node->next = s->top; // 將新節點的 next 指標設為原本的堆疊頂端
        node->val = num;     // 將 num 存入新節點的資料欄位
        s->top = node;       // 更新堆疊頂端
        s->size++;           // 更新堆疊的元素個數
    }

    /* 讀取堆疊頂端的元素 */
    int peek(LinkedListStack *s) {
        if (s->size == 0) {
            printf("堆疊為空\n");
            return INT_MAX;
        }
        return s->top->val;
    }

    /* 彈出堆疊頂端的元素 */
    int pop(LinkedListStack *s) {
        int val = peek(s);
        ListNode *tmp = s->top;
        s->top = s->top->next;
        // 釋放已移除節點的記憶體
        free(tmp);
        s->size--;
        return val;
    }
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_stack.kt"
    /* 以鏈結串列實作堆疊 */
    class LinkedListStack(
        private var stackPeek: ListNode? = null, // 以首節點作為堆疊頂端
        private var stkSize: Int = 0 // 堆疊長度
    ) {

        /* 取得堆疊長度 */
        fun size(): Int {
            return stkSize
        }

        /* 判斷堆疊是否為空 */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* 推入堆疊 */
        fun push(num: Int) {
            val node = ListNode(num)
            node.next = stackPeek
            stackPeek = node
            stkSize++
        }

        /* 彈出堆疊頂端的元素 */
        fun pop(): Int? {
            val num = peek()
            stackPeek = stackPeek?.next
            stkSize--
            return num
        }

        /* 讀取堆疊頂端的元素 */
        fun peek(): Int? {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stackPeek?._val
        }

        /* 將鏈結串列轉成陣列並回傳 */
        fun toArray(): IntArray {
            var node = stackPeek
            val res = IntArray(size())
            for (i in res.size - 1 downTo 0) {
                res[i] = node?._val!!
                node = node.next
            }
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="linkedlist_stack.rb"
    ### 以鏈結串列實作堆疊 ###
    class LinkedListStack
      attr_reader :size

      ### 初始化方法 ###
      def initialize
        @size = 0
      end

      ### 判斷堆疊是否為空 ###
      def is_empty?
        @peek.nil?
      end

      ### 推入堆疊 ###
      def push(val)
        node = ListNode.new(val)
        node.next = @peek
        @peek = node
        @size += 1
      end

      ### 彈出堆疊頂端的元素 ###
      def pop
        num = peek
        @peek = @peek.next
        @size -= 1
        num
      end

      ### 讀取堆疊頂端的元素 ###
      def peek
        raise IndexError, '堆疊為空' if is_empty?

        @peek.val
      end

      ### 將鏈結串列轉成 Array 並回傳 ###
      def to_array
        arr = []
        node = @peek
        while node
          arr << node.val
          node = node.next
        end
        arr.reverse
      end
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%E7%9A%84%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%8C%87%E5%90%91%E4%B8%8B%E4%B8%80%E5%80%8B%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%0A%0Aclass%20LinkedListStack%3A%0A%20%20%20%20%22%22%22%E4%BB%A5%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%E5%AF%A6%E4%BD%9C%E5%A0%86%E7%96%8A%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%9D%E5%A7%8B%E5%8C%96%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self._peek%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A4%E6%96%B7%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%22%22%22%0A%20%20%20%20%20%20%20%20return%20not%20self._peek%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8E%A8%E5%85%A5%E5%A0%86%E7%96%8A%22%22%22%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28val%29%0A%20%20%20%20%20%20%20%20node.next%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BD%88%E5%87%BA%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20self._peek.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%AE%80%E5%8F%96%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E5%A0%86%E7%96%8A%E7%82%BA%E7%A9%BA%22%29%0A%20%20%20%20%20%20%20%20return%20self._peek.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%BD%89%E6%88%90%E4%B8%B2%E5%88%97%E4%BB%A5%E4%BE%BF%E8%BC%B8%E5%87%BA%22%22%22%0A%20%20%20%20%20%20%20%20arr%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20node%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20while%20node%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20arr.append%28node.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20node%20%3D%20node.next%0A%20%20%20%20%20%20%20%20arr.reverse%28%29%0A%20%20%20%20%20%20%20%20return%20arr%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%A0%86%E7%96%8A%0A%20%20%20%20stack%20%3D%20LinkedListStack%28%29%0A%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E6%8E%A8%E5%85%A5%E5%A0%86%E7%96%8A%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%BE%9E%E5%A0%86%E7%96%8A%E5%BD%88%E5%87%BA%E5%85%83%E7%B4%A0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E5%BE%8C%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%E7%9A%84%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%8C%87%E5%90%91%E4%B8%8B%E4%B8%80%E5%80%8B%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%0A%0Aclass%20LinkedListStack%3A%0A%20%20%20%20%22%22%22%E4%BB%A5%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%E5%AF%A6%E4%BD%9C%E5%A0%86%E7%96%8A%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%9D%E5%A7%8B%E5%8C%96%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self._peek%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A4%E6%96%B7%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%22%22%22%0A%20%20%20%20%20%20%20%20return%20not%20self._peek%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8E%A8%E5%85%A5%E5%A0%86%E7%96%8A%22%22%22%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28val%29%0A%20%20%20%20%20%20%20%20node.next%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BD%88%E5%87%BA%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20self._peek.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%AE%80%E5%8F%96%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E5%A0%86%E7%96%8A%E7%82%BA%E7%A9%BA%22%29%0A%20%20%20%20%20%20%20%20return%20self._peek.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%BD%89%E6%88%90%E4%B8%B2%E5%88%97%E4%BB%A5%E4%BE%BF%E8%BC%B8%E5%87%BA%22%22%22%0A%20%20%20%20%20%20%20%20arr%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20node%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20while%20node%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20arr.append%28node.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20node%20%3D%20node.next%0A%20%20%20%20%20%20%20%20arr.reverse%28%29%0A%20%20%20%20%20%20%20%20return%20arr%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%A0%86%E7%96%8A%0A%20%20%20%20stack%20%3D%20LinkedListStack%28%29%0A%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E6%8E%A8%E5%85%A5%E5%A0%86%E7%96%8A%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%BE%9E%E5%A0%86%E7%96%8A%E5%BD%88%E5%87%BA%E5%85%83%E7%B4%A0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E5%BE%8C%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 2. &nbsp; 以陣列實作

用陣列實作堆疊時，可以將陣列尾端當作堆疊頂端。如圖 5-3 所示，推入與彈出分別是在陣列尾端加入與刪除元素，時間複雜度都是 $O(1)$。

=== "<1>"
    ![以陣列實作堆疊的推入與彈出](stack.assets/array_stack_step1.svg){ class="animation-figure" }

=== "<2>"
    ![array_stack_push](stack.assets/array_stack_step2_push.svg){ class="animation-figure" }

=== "<3>"
    ![array_stack_pop](stack.assets/array_stack_step3_pop.svg){ class="animation-figure" }

<p align="center"> 圖 5-3 &nbsp; 以陣列實作堆疊的推入與彈出 </p>

由於推入的元素可能持續增加，可以使用動態陣列，省去自行處理陣列容量擴充的工作。範例程式碼如下：

=== "Python"

    ```python title="array_stack.py"
    class ArrayStack:
        """以陣列實作堆疊"""

        def __init__(self):
            """初始化方法"""
            self._stack: list[int] = []

        def size(self) -> int:
            """取得堆疊長度"""
            return len(self._stack)

        def is_empty(self) -> bool:
            """判斷堆疊是否為空"""
            return self.size() == 0

        def push(self, item: int):
            """推入堆疊"""
            self._stack.append(item)

        def pop(self) -> int:
            """彈出堆疊頂端的元素"""
            if self.is_empty():
                raise IndexError("堆疊為空")
            return self._stack.pop()

        def peek(self) -> int:
            """讀取堆疊頂端的元素"""
            if self.is_empty():
                raise IndexError("堆疊為空")
            return self._stack[-1]

        def to_list(self) -> list[int]:
            """回傳串列以便輸出"""
            return self._stack
    ```

=== "C++"

    ```cpp title="array_stack.cpp"
    /* 以陣列實作堆疊 */
    class ArrayStack {
      private:
        vector<int> stack;

      public:
        /* 取得堆疊長度 */
        int size() {
            return stack.size();
        }

        /* 判斷堆疊是否為空 */
        bool isEmpty() {
            return stack.size() == 0;
        }

        /* 推入堆疊 */
        void push(int num) {
            stack.push_back(num);
        }

        /* 彈出堆疊頂端的元素 */
        int pop() {
            int num = top();
            stack.pop_back();
            return num;
        }

        /* 讀取堆疊頂端的元素 */
        int top() {
            if (isEmpty())
                throw out_of_range("堆疊為空");
            return stack.back();
        }

        /* 回傳 vector */
        vector<int> toVector() {
            return stack;
        }
    };
    ```

=== "Java"

    ```java title="array_stack.java"
    /* 以陣列實作堆疊 */
    class ArrayStack {
        private ArrayList<Integer> stack;

        public ArrayStack() {
            // 初始化串列（動態陣列）
            stack = new ArrayList<>();
        }

        /* 取得堆疊長度 */
        public int size() {
            return stack.size();
        }

        /* 判斷堆疊是否為空 */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* 推入堆疊 */
        public void push(int num) {
            stack.add(num);
        }

        /* 彈出堆疊頂端的元素 */
        public int pop() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stack.remove(size() - 1);
        }

        /* 讀取堆疊頂端的元素 */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stack.get(size() - 1);
        }

        /* 將串列轉成陣列並回傳 */
        public Object[] toArray() {
            return stack.toArray();
        }
    }
    ```

=== "C#"

    ```csharp title="array_stack.cs"
    /* 以陣列實作堆疊 */
    class ArrayStack {
        List<int> stack;
        public ArrayStack() {
            // 初始化串列（動態陣列）
            stack = [];
        }

        /* 取得堆疊長度 */
        public int Size() {
            return stack.Count;
        }

        /* 判斷堆疊是否為空 */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* 推入堆疊 */
        public void Push(int num) {
            stack.Add(num);
        }

        /* 彈出堆疊頂端的元素 */
        public int Pop() {
            if (IsEmpty())
                throw new Exception();
            var val = Peek();
            stack.RemoveAt(Size() - 1);
            return val;
        }

        /* 讀取堆疊頂端的元素 */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return stack[Size() - 1];
        }

        /* 將串列轉成陣列並回傳 */
        public int[] ToArray() {
            return [.. stack];
        }
    }
    ```

=== "Go"

    ```go title="array_stack.go"
    /* 以陣列實作堆疊 */
    type arrayStack struct {
        data []int // 資料
    }

    /* 初始化堆疊 */
    func newArrayStack() *arrayStack {
        return &arrayStack{
            // 將堆疊長度設為 0，容量設為 16
            data: make([]int, 0, 16),
        }
    }

    /* 堆疊長度 */
    func (s *arrayStack) size() int {
        return len(s.data)
    }

    /* 堆疊是否為空 */
    func (s *arrayStack) isEmpty() bool {
        return s.size() == 0
    }

    /* 推入堆疊 */
    func (s *arrayStack) push(v int) {
        // 切片會自動擴充容量
        s.data = append(s.data, v)
    }

    /* 彈出堆疊頂端的元素 */
    func (s *arrayStack) pop() any {
        val := s.peek()
        s.data = s.data[:len(s.data)-1]
        return val
    }

    /* 讀取堆疊頂端的元素 */
    func (s *arrayStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        val := s.data[len(s.data)-1]
        return val
    }

    /* 回傳切片以便輸出 */
    func (s *arrayStack) toSlice() []int {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="array_stack.swift"
    /* 以陣列實作堆疊 */
    class ArrayStack {
        private var stack: [Int]

        init() {
            // 初始化動態陣列
            stack = []
        }

        /* 取得堆疊長度 */
        func size() -> Int {
            stack.count
        }

        /* 判斷堆疊是否為空 */
        func isEmpty() -> Bool {
            stack.isEmpty
        }

        /* 推入堆疊 */
        func push(num: Int) {
            stack.append(num)
        }

        /* 彈出堆疊頂端的元素 */
        @discardableResult
        func pop() -> Int {
            if isEmpty() {
                fatalError("堆疊為空")
            }
            return stack.removeLast()
        }

        /* 讀取堆疊頂端的元素 */
        func peek() -> Int {
            if isEmpty() {
                fatalError("堆疊為空")
            }
            return stack.last!
        }

        /* 以陣列形式回傳堆疊內容 */
        func toArray() -> [Int] {
            stack
        }
    }
    ```

=== "JS"

    ```javascript title="array_stack.js"
    /* 以陣列實作堆疊 */
    class ArrayStack {
        #stack;
        constructor() {
            this.#stack = [];
        }

        /* 取得堆疊長度 */
        get size() {
            return this.#stack.length;
        }

        /* 判斷堆疊是否為空 */
        isEmpty() {
            return this.#stack.length === 0;
        }

        /* 推入堆疊 */
        push(num) {
            this.#stack.push(num);
        }

        /* 彈出堆疊頂端的元素 */
        pop() {
            if (this.isEmpty()) throw new Error('堆疊為空');
            return this.#stack.pop();
        }

        /* 讀取堆疊頂端的元素 */
        top() {
            if (this.isEmpty()) throw new Error('堆疊為空');
            return this.#stack[this.#stack.length - 1];
        }

        /* 回傳陣列 */
        toArray() {
            return this.#stack;
        }
    }
    ```

=== "TS"

    ```typescript title="array_stack.ts"
    /* 以陣列實作堆疊 */
    class ArrayStack {
        private stack: number[];
        constructor() {
            this.stack = [];
        }

        /* 取得堆疊長度 */
        get size(): number {
            return this.stack.length;
        }

        /* 判斷堆疊是否為空 */
        isEmpty(): boolean {
            return this.stack.length === 0;
        }

        /* 推入堆疊 */
        push(num: number): void {
            this.stack.push(num);
        }

        /* 彈出堆疊頂端的元素 */
        pop(): number | undefined {
            if (this.isEmpty()) throw new Error('堆疊為空');
            return this.stack.pop();
        }

        /* 讀取堆疊頂端的元素 */
        top(): number | undefined {
            if (this.isEmpty()) throw new Error('堆疊為空');
            return this.stack[this.stack.length - 1];
        }

        /* 回傳陣列 */
        toArray() {
            return this.stack;
        }
    }
    ```

=== "Dart"

    ```dart title="array_stack.dart"
    /* 以陣列實作堆疊 */
    class ArrayStack {
      late List<int> _stack;
      ArrayStack() {
        _stack = [];
      }

      /* 取得堆疊長度 */
      int size() {
        return _stack.length;
      }

      /* 判斷堆疊是否為空 */
      bool isEmpty() {
        return _stack.isEmpty;
      }

      /* 推入堆疊 */
      void push(int _num) {
        _stack.add(_num);
      }

      /* 彈出堆疊頂端的元素 */
      int pop() {
        if (isEmpty()) {
          throw Exception("堆疊為空");
        }
        return _stack.removeLast();
      }

      /* 讀取堆疊頂端的元素 */
      int peek() {
        if (isEmpty()) {
          throw Exception("堆疊為空");
        }
        return _stack.last;
      }

      /* 以 List 形式回傳堆疊內容 */
      List<int> toArray() => _stack;
    }
    ```

=== "Rust"

    ```rust title="array_stack.rs"
    /* 以陣列實作堆疊 */
    struct ArrayStack<T> {
        stack: Vec<T>,
    }

    impl<T> ArrayStack<T> {
        /* 初始化堆疊 */
        fn new() -> ArrayStack<T> {
            ArrayStack::<T> {
                stack: Vec::<T>::new(),
            }
        }

        /* 取得堆疊長度 */
        fn size(&self) -> usize {
            self.stack.len()
        }

        /* 判斷堆疊是否為空 */
        fn is_empty(&self) -> bool {
            self.size() == 0
        }

        /* 推入堆疊 */
        fn push(&mut self, num: T) {
            self.stack.push(num);
        }

        /* 彈出堆疊頂端的元素 */
        fn pop(&mut self) -> Option<T> {
            self.stack.pop()
        }

        /* 取得堆疊頂端元素的參照 */
        fn peek(&self) -> Option<&T> {
            if self.is_empty() {
                panic!("堆疊為空")
            };
            self.stack.last()
        }

        /* 回傳 Vec 的參照（&Vec） */
        fn to_array(&self) -> &Vec<T> {
            &self.stack
        }
    }
    ```

=== "C"

    ```c title="array_stack.c"
    /* 以陣列實作堆疊 */
    typedef struct {
        int *data;
        int size;
    } ArrayStack;

    /* 建立堆疊 */
    ArrayStack *newArrayStack() {
        ArrayStack *stack = malloc(sizeof(ArrayStack));
        // 一開始就配置較大的容量，以免之後需要擴充
        stack->data = malloc(sizeof(int) * MAX_SIZE);
        stack->size = 0;
        return stack;
    }

    /* 釋放堆疊的記憶體 */
    void delArrayStack(ArrayStack *stack) {
        free(stack->data);
        free(stack);
    }

    /* 取得堆疊長度 */
    int size(ArrayStack *stack) {
        return stack->size;
    }

    /* 判斷堆疊是否為空 */
    bool isEmpty(ArrayStack *stack) {
        return stack->size == 0;
    }

    /* 推入堆疊 */
    void push(ArrayStack *stack, int num) {
        if (stack->size == MAX_SIZE) {
            printf("堆疊已滿\n");
            return;
        }
        stack->data[stack->size] = num;
        stack->size++;
    }

    /* 讀取堆疊頂端的元素 */
    int peek(ArrayStack *stack) {
        if (stack->size == 0) {
            printf("堆疊為空\n");
            return INT_MAX;
        }
        return stack->data[stack->size - 1];
    }

    /* 彈出堆疊頂端的元素 */
    int pop(ArrayStack *stack) {
        int val = peek(stack);
        stack->size--;
        return val;
    }
    ```

=== "Kotlin"

    ```kotlin title="array_stack.kt"
    /* 以陣列實作堆疊 */
    class ArrayStack {
        // 初始化串列（動態陣列）
        private val stack = mutableListOf<Int>()

        /* 取得堆疊長度 */
        fun size(): Int {
            return stack.size
        }

        /* 判斷堆疊是否為空 */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* 推入堆疊 */
        fun push(num: Int) {
            stack.add(num)
        }

        /* 彈出堆疊頂端的元素 */
        fun pop(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stack.removeAt(size() - 1)
        }

        /* 讀取堆疊頂端的元素 */
        fun peek(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stack[size() - 1]
        }

        /* 將串列轉成陣列並回傳 */
        fun toArray(): Array<Any> {
            return stack.toTypedArray()
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_stack.rb"
    ### 以陣列實作堆疊 ###
    class ArrayStack
      ### 初始化方法 ###
      def initialize
        @stack = []
      end

      ### 取得堆疊長度 ###
      def size
        @stack.length
      end

      ### 判斷堆疊是否為空 ###
      def is_empty?
        @stack.empty?
      end

      ### 推入堆疊 ###
      def push(item)
        @stack << item
      end

      ### 彈出堆疊頂端的元素 ###
      def pop
        raise IndexError, '堆疊為空' if is_empty?

        @stack.pop
      end

      ### 讀取堆疊頂端的元素 ###
      def peek
        raise IndexError, '堆疊為空' if is_empty?

        @stack.last
      end

      ### 回傳陣列以便輸出 ###
      def to_array
        @stack
      end
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=class%20ArrayStack%3A%0A%20%20%20%20%22%22%22%E4%BB%A5%E9%99%A3%E5%88%97%E5%AF%A6%E4%BD%9C%E5%A0%86%E7%96%8A%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%9D%E5%A7%8B%E5%8C%96%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self._stack%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._stack%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A4%E6%96%B7%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%20%3D%3D%20%5B%5D%0A%0A%20%20%20%20def%20push%28self,%20item%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8E%A8%E5%85%A5%E5%A0%86%E7%96%8A%22%22%22%0A%20%20%20%20%20%20%20%20self._stack.append%28item%29%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BD%88%E5%87%BA%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E5%A0%86%E7%96%8A%E7%82%BA%E7%A9%BA%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack.pop%28%29%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%AE%80%E5%8F%96%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E5%A0%86%E7%96%8A%E7%82%BA%E7%A9%BA%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack%5B-1%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9B%9E%E5%82%B3%E4%B8%B2%E5%88%97%E4%BB%A5%E4%BE%BF%E8%BC%B8%E5%87%BA%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%A0%86%E7%96%8A%0A%20%20%20%20stack%20%3D%20ArrayStack%28%29%0A%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E6%8E%A8%E5%85%A5%E5%A0%86%E7%96%8A%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%BE%9E%E5%A0%86%E7%96%8A%E5%BD%88%E5%87%BA%E5%85%83%E7%B4%A0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E5%BE%8C%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ArrayStack%3A%0A%20%20%20%20%22%22%22%E4%BB%A5%E9%99%A3%E5%88%97%E5%AF%A6%E4%BD%9C%E5%A0%86%E7%96%8A%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%9D%E5%A7%8B%E5%8C%96%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self._stack%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._stack%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A4%E6%96%B7%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%20%3D%3D%20%5B%5D%0A%0A%20%20%20%20def%20push%28self,%20item%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8E%A8%E5%85%A5%E5%A0%86%E7%96%8A%22%22%22%0A%20%20%20%20%20%20%20%20self._stack.append%28item%29%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BD%88%E5%87%BA%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E5%A0%86%E7%96%8A%E7%82%BA%E7%A9%BA%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack.pop%28%29%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%AE%80%E5%8F%96%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E5%A0%86%E7%96%8A%E7%82%BA%E7%A9%BA%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack%5B-1%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%9B%9E%E5%82%B3%E4%B8%B2%E5%88%97%E4%BB%A5%E4%BE%BF%E8%BC%B8%E5%87%BA%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%A0%86%E7%96%8A%0A%20%20%20%20stack%20%3D%20ArrayStack%28%29%0A%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E6%8E%A8%E5%85%A5%E5%A0%86%E7%96%8A%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%BE%9E%E5%A0%86%E7%96%8A%E5%BD%88%E5%87%BA%E5%85%83%E7%B4%A0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E5%BE%8C%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 5.1.3 &nbsp; 兩種實作方式的比較

**支援的操作**

兩種實作都支援堆疊定義中的各項操作。陣列額外支援隨機存取，但這超出堆疊的定義範圍，因此通常用不到。

**時間效率**

以陣列實作時，推入和彈出都在預先配置好的連續記憶體空間中進行，記憶體存取具有良好的區域性，有利於利用快取，因此效率較高。不過，如果推入元素時超出陣列容量，就必須擴充容量，使這一次推入的時間複雜度變為 $O(n)$。

以鏈結串列實作時，擴充串列很有彈性，不會遇到陣列擴充容量時效率下降的問題。不過，推入元素時需要初始化節點物件並修改指標，因此效率相對較低。如果要推入的元素本身就是節點物件，就能省去初始化的步驟，提高效率。

綜合以上比較，如果推入和彈出的元素屬於基本資料型別，例如 `int` 或 `double`，就能得到以下結論。

- 以陣列實作的堆疊在擴充容量時效率會下降，但因為不常需要擴充，所以平均效率較高。
- 以鏈結串列實作的堆疊，執行效率較為穩定。

**空間效率**

初始化動態陣列時，系統會為它配置「初始容量」，這個容量可能超過實際需求。之後擴充容量時，通常會按固定倍數（例如 2 倍）擴充，新容量也可能超過實際需求。因此，**以陣列實作的堆疊可能會浪費部分空間**。

不過，鏈結串列的節點需要額外儲存指標，**因此每個節點占用的空間相對較大**。

由此可見，哪一種實作較省記憶體，仍要視實際情況而定。

## 5.1.4 &nbsp; 堆疊的常見應用

- **瀏覽器的上一頁與下一頁、軟體的復原與重做**。每當我們開啟新網頁，瀏覽器就會將前一個網頁推入堆疊，這樣一來，按下「上一頁」就能回到前一頁。這個動作實際上就是從堆疊彈出網頁。要同時支援上一頁和下一頁，則需要搭配使用兩個堆疊。
- **程式的記憶體管理**。每次呼叫函式，系統都會在堆疊頂端加入一個堆疊框架，用來記錄這次函式呼叫的執行狀態。在遞迴函式中，逐層呼叫時會不斷推入堆疊框架，逐層回溯時則會依序彈出。
