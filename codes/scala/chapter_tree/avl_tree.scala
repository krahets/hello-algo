

/**
 * File: avl_tree.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-13 16:20
 */


/* AVL 树 */
class avl_tree {
  var root: TreeNode = null // 根节点

  /* 获取节点高度 */
  def height(node: TreeNode): Int = {
    if (node == null) return -1
    node.height
  }

  /* 更新节点高度 */
  def updateHeight(node: TreeNode): Unit = {
    // 节点高度等于最高子树高度 + 1
    node.height = Math.max(height(node.left), height(node.right)) + 1
  }

  /* 获取平衡因子 */
  def balanceFactor(node: TreeNode): Int = {
    if (node == null) return 0
    height(node.left) - height(node.right)
  }

  /* 右旋操作 */
  def rightRotate(node: TreeNode): TreeNode = {
    val child: TreeNode = node.left
    val newLeftChild: TreeNode = child.right
    // 以 child 为原点，将 node 向右旋转
    child.right = node
    node.left = newLeftChild
    // 更新高度
    updateHeight(node)
    updateHeight(child)
    // 返回旋转后子树的根节点
    child
  }

  /* 左旋操作 */
  def leftRotate(node: TreeNode): TreeNode = {
    val child: TreeNode = node.right
    val newRightChild:TreeNode = child.left
    // 以 child 为原点，将 node 向左旋转
    child.left = node
    node.right = newRightChild
    // 更新高度
    updateHeight(node)
    updateHeight(child)
    // 返回旋转后子树的根节点
    child
  }

  /* 执行旋转操作，使该子树重新恢复平衡 */
  def rotate(node: TreeNode): TreeNode = {
    // 获取节点 node 的平衡因子
    val factor: Int = balanceFactor(node)

    // 左偏树
    if(factor > 1){
      if (balanceFactor(node.left) >= 0) {
        // 右旋
        return rightRotate(node)
      } else {
        // 先左旋，再右旋
        node.left = leftRotate(node.left)
        return rightRotate(node)
      }
    }
    // 右偏树
    if(factor < -1){
      if (balanceFactor(node.right) <= 0) {
        // 左旋
        return leftRotate(node)
      } else {
        // 先右旋，再左旋
        node.right = rightRotate(node.right)
        return leftRotate(node)
      }
    }
    // 平衡树，无须旋转，直接返回
    node
  }

  def insertHelper(node: TreeNode, value: Int): TreeNode = {
    var tmp: TreeNode = node

    if (tmp == null) return new TreeNode(value)
    /* 1. 查找插入位置并插入节点 */
    if (value < tmp.value) {
      tmp.left = insertHelper(tmp.left, value)
    } else if (value > tmp.value) {
      tmp.right = insertHelper(tmp.right, value)
    } else {
      return tmp // 重复节点不插入，直接返回

    }
    /* 2. 更新高度 */
    updateHeight(tmp)
    /* 3. 执行旋转操作，使该子树重新恢复平衡 */
    tmp = rotate(tmp)
    // 返回子树的根节点
    tmp
  }

  /* 插入节点 */
  def insert(value: Int): Unit = {
    root = insertHelper(root, value)
  }

  /* 递归删除节点（辅助方法） */
  def removeHelper(node: TreeNode, value: Int): TreeNode = {
    var tmp: TreeNode = node

    if (tmp == null) {
      return null
    }
    /* 1. 查找节点并删除 */
    if (value < tmp.value) {
      tmp.left = removeHelper(tmp.left, value)
    } else if (value > tmp.value) {
      tmp.right = removeHelper(tmp.right, value)
    }else{
      if(tmp.left == null || tmp.right == null){
        var child: TreeNode = if(tmp.left != null) tmp.left else tmp.right
        // 子节点数量 = 0 ，直接删除 node 并返回
        if (child == null) {
          return null
        }else{ // 子节点数量 = 1 ，直接删除 node
          tmp = child
        }
      }else{
        // 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
        var successor: TreeNode = tmp.right
        while(successor.left != null) {
          successor = successor.left
        }
        tmp.right = removeHelper(tmp.right, successor.value)
        tmp.value = successor.value
      }
    }

    // 更新节点高度
    updateHeight(tmp)
    // 执行旋转操作，使该子树重新恢复平衡
    tmp = rotate(tmp)
    tmp
  }

  /* 删除节点 */
  def remove(value: Int): Unit = {
    root = removeHelper(root, value)
  }

  /* 查找节点 */
  def search(value: Int): TreeNode = {
    var cur: TreeNode = root
    while (cur!= null && cur.value!= value) {
      // 目标节点在 cur 的右子树中
      if (value > cur.value) {
        cur = cur.right
      }else {
        // 目标节点在 cur 的左子树中
        cur = cur.left
      }
    }
    cur

  }

  /* 测试插入 */
  def testInsert(tree: avl_tree, value: Int): Unit = {
    tree.insert(value)
    println("\n插入节点 " + value + " 后，AVL 树为")
    new PrintUtil().printTree(tree.root)
  }

  /* 测试删除 */
  def testRemove(tree: avl_tree, value: Int): Unit = {
    tree.remove(value)
    println("\n删除节点 " + value + " 后，AVL 树为")
    new PrintUtil().printTree(tree.root)

  }
}




object avl_tree{


  def main(args: Array[String]): Unit = {
    /* 初始化空 AVL 树 */
    val avlTree: avl_tree = new avl_tree()
    /* 插入节点 */
    // 请关注插入节点后，AVL 树是如何保持平衡的
    avlTree.testInsert(avlTree, 1)
    avlTree.testInsert(avlTree, 2)
    avlTree.testInsert(avlTree, 3)
    avlTree.testInsert(avlTree, 4)
    avlTree.testInsert(avlTree, 5)
    avlTree.testInsert(avlTree, 8)
    avlTree.testInsert(avlTree, 7)
    avlTree.testInsert(avlTree, 9)
    avlTree.testInsert(avlTree, 10)
    avlTree.testInsert(avlTree, 6)

    /* 插入重复节点 */
    avlTree.testInsert(avlTree, 7)

    /* 删除节点 */
    // 请关注删除节点后，AVL 树是如何保持平衡的
    avlTree.testRemove(avlTree, 8) // 删除度为 0 的节点

    avlTree.testRemove(avlTree, 5) // 删除度为 1 的节点

    avlTree.testRemove(avlTree, 4) // 删除度为 2 的节点


    /* 查询节点 *//* 查询节点 */
    val node = avlTree.search(7)
    println("\n查找到的节点对象为 " + node + "，节点值 = " + node.value)

  }
}

