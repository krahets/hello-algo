# Summary

### Highlights

- A binary tree is a non-linear data structure that embodies the logic of divide and conquer. Each binary tree node contains a value and two pointers to its left-child node and right-child node.
- For a node in a binary tree, its left (right) child node and the tree formed below it are called the left (right) child tree of that node.
- Terms related to binary trees include root node, leaf node, level, degree, edge, height and depth.
- Initialization, node insertion and node deletion operations for binary trees are performed in a similar way to linked list operations.
- The common types of binary trees are perfect binary tree, complete binary tree, full binary tree and balanced binary tree. A perfect binary tree is the most desirable state, while a linked list is the worst state after degradation.
- A binary tree can be represented as an array by arranging the node values and empty spaces in a level-order traversal order and implementing pointers based on the index mapping relationship between parent nodes and child nodes.
- Binary tree level-order traversal is a breadth-first search method, which reflects the "circle by circle outward" hierarchical traversal, usually through the queue to realize.
- Pre-order, middle-order, and back-order traversals are all depth-first searches, which embody the "go to the end, and then go back to continue" back traversal method, usually using recursion to achieve.
- A binary search tree is an efficient element-finding data structure with $O(\log n)$ time complexity for find, insert and delete operations. When the binary search tree degenerates into a linked list, the time complexity of each operation deteriorates to $O(n)$ .
- An AVL tree, also known as a balanced binary search tree, ensures that the tree remains balanced after constant insertion and deletion of nodes by means of a rotation operation.
- The rotation operations of AVL tree include right rotation, left rotation, right rotation then left rotation, and left rotation then right rotation. After a node is inserted or deleted, the AVL tree performs a rotation operation from the bottom to the top to rebalance the tree.

### Q & A

!!! question "For a binary tree with only one node, is the height of the tree and the depth of the root node both $0$?"

    Yes, because height and depth are usually defined as "the number of edges traveled".

!!! Question "Insertion and deletion in a binary tree are generally accomplished by a set of operations, what is meant by "a set of operations" here? What does "one set of operations" mean? Can it be interpreted as the resource release of a child node of a resource?"

    Taking a binary search tree as an example, node deletion operations are handled in three cases, each of which requires multiple steps of node operations.

!!! question "Why does DFS traverse a binary tree in first, middle and last order, and what is the use of each?"

    DFS traversal in the first, middle and last order is similar to the order of accessing an array, and it is the basic method of traversing a binary tree. Using these three traversal methods, we can get the result of traversal in a specific order. For example, in a binary search tree, since the node size satisfies `left-child node value < root node value < right-child node value`, we can obtain an ordered sequence of nodes by traversing the tree according to the priority of `left -> root -> right`.

!!! question "The right-rotation operation deals with the relationship between the out-of-balance nodes `node`, `child`, and `grand_child`, so doesn't the connection between the parent node of `node` and the original connection of `node` need to be maintained? Wouldn't it be broken after the right-rotation operation?"

    We need to look at this from a recursion perspective. The right-rotate operation `right_rotate(root)` is passed in the root node of the subtree, and eventually `return child` returns the root node of the subtree after the rotation. The connection between the root node of the subtree and its parent node is done after the function returns, and is not part of the maintenance of the right-rotate operation.

!!! question "In C++, functions are divided into `private` and `public`, is there any consideration for this? Why did you put the `height()` function and the `updateHeight()` function in `public` and `private` respectively?"

    It mainly depends on the scope of use of the method, if the method is only used inside the class, then it is designed as `private`. For example, it makes no sense for the user to call `updateHeight()` alone, it is just a step in the insertion and deletion operations. `height()` accesses the height of a node, similar to `vector.size()`, so it is set to `public` for ease of use.

!!! Question "How to construct a binary search tree from a set of input data, please? Is the choice of root node important?"

    Yes, the method for building the tree is given in the `build_tree()` method in the binary search tree code. As for the selection of the root node, we usually sort the input data, then use the midpoint element as the root node, and then recursively build the left and right subtrees. Doing so maximizes the balance of the tree.

!!! question "In Java, is the `equals()` method always used for string comparison?"

    In Java, for basic data types, `==` is used to compare whether the values of two variables are equal. For reference types, the two notations work differently.

    - `==` : Used to compare two variables to see if they point to the same object, i.e. if they are at the same location in memory.
    - `equals()`: Used to compare whether the values of two objects are equal.

    So if we want to compare values, we would normally use `equals()` . However, the strings initialized by `String a = "hi"; String b = "hi";` are stored in a pool of string constants that point to the same object, so it is also possible to compare the contents of the two strings with `a == b`.

!!! question "Is the number of nodes in the queue $2^h$ before breadth-first traversal to the bottom level?"

    Yes, for example, a full binary tree of height $h = 2$ with a total number of nodes $n = 7$ , then the number of nodes at the bottom level $4 = 2^h = (n + 1) / 2$ .
