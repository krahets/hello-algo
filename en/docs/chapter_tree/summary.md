# Summary

### Key Review

- A binary tree is a non-linear data structure that embodies the divide-and-conquer logic of "one divides into two". Each binary tree node contains a value and two pointers, which respectively point to its left and right child nodes.
- For a certain node in a binary tree, the tree formed by its left (right) child node and all nodes below is called the left (right) subtree of that node.
- Related terminology of binary trees includes root node, leaf node, level, degree, edge, height, and depth.
- The initialization, node insertion, and node removal operations of binary trees are similar to those of linked lists.
- Common types of binary trees include perfect binary trees, complete binary trees, full binary trees, and balanced binary trees. The perfect binary tree is the ideal state, while the linked list is the worst state after degradation.
- A binary tree can be represented using an array by arranging node values and empty slots in level-order traversal sequence, and implementing pointers based on the index mapping relationship between parent and child nodes.
- Level-order traversal of a binary tree is a breadth-first search method, embodying a layer-by-layer traversal approach of "expanding outward circle by circle", typically implemented using a queue.
- Preorder, inorder, and postorder traversals all belong to depth-first search, embodying a traversal approach of "first go to the end, then backtrack and continue", typically implemented using recursion.
- A binary search tree is an efficient data structure for element searching, with search, insertion, and removal operations all having time complexity of $O(\log n)$. When a binary search tree degenerates into a linked list, all time complexities degrade to $O(n)$.
- An AVL tree, also known as a balanced binary search tree, ensures the tree remains balanced after continuous node insertions and removals through rotation operations.
- Rotation operations in AVL trees include right rotation, left rotation, left rotation then right rotation, and right rotation then left rotation. After inserting or removing nodes, AVL trees perform rotation operations from bottom to top to restore the tree to balance.

### Q & A

**Q**: For a binary tree with only one node, are both the height of the tree and the depth of the root node $0$?

Yes, because height and depth are typically defined as "the number of edges passed."

**Q**: The insertion and removal in a binary tree are generally accomplished by a set of operations. What does "a set of operations" refer to here? Does it imply releasing the resources of the child nodes?

Taking the binary search tree as an example, the operation of removing a node needs to be handled in three different scenarios, each requiring multiple steps of node operations.

**Q**: Why does DFS traversal of binary trees have three orders: preorder, inorder, and postorder, and what are their uses?

Similar to forward and reverse traversal of arrays, preorder, inorder, and postorder traversals are three methods of binary tree traversal that allow us to obtain a traversal result in a specific order. For example, in a binary search tree, since nodes satisfy the relationship `left child node value < root node value < right child node value`, we only need to traverse the tree with the priority of "left $\rightarrow$ root $\rightarrow$ right" to obtain an ordered node sequence.

**Q**: In a right rotation operation handling the relationship between unbalanced nodes `node`, `child`, and `grand_child`, doesn't the connection between `node` and its parent node get lost after the right rotation?

We need to view this problem from a recursive perspective. The right rotation operation `right_rotate(root)` passes in the root node of the subtree and eventually returns the root node of the subtree after rotation with `return child`. The connection between the subtree's root node and its parent node is completed after the function returns, which is not within the maintenance scope of the right rotation operation.

**Q**: In C++, functions are divided into `private` and `public` sections. What considerations are there for this? Why are the `height()` function and the `updateHeight()` function placed in `public` and `private`, respectively?

It mainly depends on the method's usage scope. If a method is only used within the class, then it is designed as `private`. For example, calling `updateHeight()` alone by the user makes no sense, as it is only a step in insertion or removal operations. However, `height()` is used to access node height, similar to `vector.size()`, so it is set to `public` for ease of use.

**Q**: How do you build a binary search tree from a set of input data? Is the choice of root node very important?

Yes, the method for building a tree is provided in the `build_tree()` method in the binary search tree code. As for the choice of root node, we typically sort the input data, then select the middle element as the root node, and recursively build the left and right subtrees. This approach maximizes the tree's balance.

**Q**: In Java, do you always have to use the `equals()` method for string comparison?

In Java, for primitive data types, `==` is used to compare whether the values of two variables are equal. For reference types, the working principles of the two symbols are different.

- `==`: Used to compare whether two variables point to the same object, i.e., whether their positions in memory are the same.
- `equals()`: Used to compare whether the values of two objects are equal.

Therefore, if we want to compare values, we should use `equals()`. However, strings initialized via `String a = "hi"; String b = "hi";` are stored in the string constant pool and point to the same object, so `a == b` can also be used to compare the contents of the two strings.

**Q**: Before reaching the bottom level, is the number of nodes in the queue $2^h$ in breadth-first traversal?

Yes, for example, a full binary tree with height $h = 2$ has a total of $n = 7$ nodes, then the bottom level has $4 = 2^h = (n + 1) / 2$ nodes.
