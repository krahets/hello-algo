# Summary

### Key review

- A binary tree is a non-linear data structure that reflects the "divide and conquer" logic of splitting one into two. Each binary tree node contains a value and two pointers, which point to its left and right child nodes, respectively.
- For a node in a binary tree, the tree formed by its left (right) child node and all nodes under it is called the node's left (right) subtree.
- Related terminology of binary trees includes root node, leaf node, level, degree, edge, height, and depth, among others.
- The operations of initializing a binary tree, inserting nodes, and removing nodes are similar to those of linked list operations.
- Common types of binary trees include perfect binary trees, complete binary trees, full binary trees, and balanced binary trees. The perfect binary tree represents the ideal state, while the linked list is the worst state after degradation.
- A binary tree can be represented using an array by arranging the node values and empty slots in a level-order traversal sequence and implementing pointers based on the index mapping relationship between parent nodes and child nodes.
- The level-order traversal of a binary tree is a breadth-first search method, which reflects a layer-by-layer traversal manner of "expanding circle by circle." It is usually implemented using a queue.
- Pre-order, in-order, and post-order traversals are all depth-first search methods, reflecting the traversal manner of "going to the end first, then backtracking to continue." They are usually implemented using recursion.
- A binary search tree is an efficient data structure for element searching, with the time complexity of search, insert, and remove operations all being $O(\log n)$. When a binary search tree degrades into a linked list, these time complexities deteriorate to $O(n)$.
- An AVL tree, also known as a balanced binary search tree, ensures that the tree remains balanced after continuous node insertions and removals through rotation operations.
- Rotation operations in an AVL tree include right rotation, left rotation, right-then-left rotation, and left-then-right rotation. After inserting or removing nodes, an AVL tree performs rotation operations from bottom to top to rebalance the tree.

### Q & A

**Q**: For a binary tree with only one node, are both the height of the tree and the depth of the root node $0$?

Yes, because height and depth are typically defined as "the number of edges passed."

**Q**: The insertion and removal in a binary tree are generally completed by a set of operations. What does "a set of operations" refer to here? Can it be understood as the release of resources of the child nodes?

Taking the binary search tree as an example, the operation of removing a node needs to be handled in three different scenarios, each requiring multiple steps of node operations.

**Q**: Why are there three sequences: pre-order, in-order, and post-order for DFS traversal of a binary tree, and what are their uses?

Similar to sequential and reverse traversal of arrays, pre-order, in-order, and post-order traversals are three methods of traversing a binary tree, allowing us to obtain a traversal result in a specific order. For example, in a binary search tree, since the node sizes satisfy `left child node value < root node value < right child node value`, we can obtain an ordered node sequence by traversing the tree in the "left → root → right" priority.

**Q**: In a right rotation operation that deals with the relationship between the imbalance nodes `node`, `child`, `grand_child`, isn't the connection between `node` and its parent node and the original link of `node` lost after the right rotation?

We need to view this problem from a recursive perspective. The `right_rotate(root)` operation passes the root node of the subtree and eventually returns the root node of the rotated subtree with `return child`. The connection between the subtree's root node and its parent node is established after this function returns, which is outside the scope of the right rotation operation's maintenance.

**Q**: In C++, functions are divided into `private` and `public` sections. What considerations are there for this? Why are the `height()` function and the `updateHeight()` function placed in `public` and `private`, respectively?

It depends on the scope of the method's use. If a method is only used within the class, then it is designed to be `private`. For example, it makes no sense for users to call `updateHeight()` on their own, as it is just a step in the insertion or removal operations. However, `height()` is for accessing node height, similar to `vector.size()`, thus it is set to `public` for use.

**Q**: How do you build a binary search tree from a set of input data? Is the choice of root node very important?

Yes, the method for building the tree is provided in the `build_tree()` method in the binary search tree code. As for the choice of the root node, we usually sort the input data and then select the middle element as the root node, recursively building the left and right subtrees. This approach maximizes the balance of the tree.

**Q**: In Java, do you always have to use the `equals()` method for string comparison?

In Java, for primitive data types, `==` is used to compare whether the values of two variables are equal. For reference types, the working principles of the two symbols are different.

- `==`: Used to compare whether two variables point to the same object, i.e., whether their positions in memory are the same.
- `equals()`: Used to compare whether the values of two objects are equal.

Therefore, to compare values, we should use `equals()`. However, strings initialized with `String a = "hi"; String b = "hi";` are stored in the string constant pool and point to the same object, so `a == b` can also be used to compare the contents of two strings.

**Q**: Before reaching the bottom level, is the number of nodes in the queue $2^h$ in breadth-first traversal?

Yes, for example, a full binary tree with height $h = 2$ has a total of $n = 7$ nodes, then the bottom level has $4 = 2^h = (n + 1) / 2$ nodes.
