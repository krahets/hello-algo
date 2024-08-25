

/**
 * File: binary_search_tree.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-13 15:38
 */

/* 二叉搜索树 */
class binary_search_tree {
  private var root: TreeNode = null

  /* 获取二叉树根节点 */
  def getRoot(): TreeNode = root

  /* 查找节点 */
  def search(value: Int): TreeNode = {
    var current: TreeNode = root
    // 循环查找，越过叶节点后跳出
    var flag = false
    while (current != null && !flag) {
      // 目标节点在 current 的右子树中
      if (value > current.value) {
        current = current.right
      }
      // 目标节点在 current 的左子树中
      else if (value < current.value) {
        current = current.left
      }
      // 找到目标节点，跳出循环
      else {
        flag = true
      }
    }
    current
  }

  /* 插入节点 */
  def insert(value: Int): Unit = {
    // 若树为空，则初始化根节点
    if (root == null) {
      root = new TreeNode(value)
      return
    }
    var cur: TreeNode = root
    var pre: TreeNode = null
    // 循环查找，越过叶节点后跳出
    while (cur != null) {
      // 找到重复节点，直接返回
      if (value == cur.value) {
        return
      }
      pre = cur
      // 插入位置在 cur 的右子树中
      if (value > cur.value) {
        cur = cur.right
      }
      // 插入位置在 cur 的左子树中
      else {
        cur = cur.left
      }
    }
    // 插入节点
    val node: TreeNode = new TreeNode(value)
    if (value > pre.value) {
      pre.right = node
    }
    else {
      pre.left = node
    }
  }

  /* 删除节点 */
  def remove(num: Int): Unit = {
    // 若树为空，直接提前返回
    if (root == null) return
    var pre: TreeNode = null
    var cur: TreeNode = root
    var flag = false
    // 循环查找，
    while (cur != null && cur.value != num) {
      pre = cur
      // 待删除节点在 cur 的右子树中
      if (num > cur.value) {
        cur = cur.right
      }
      // 待删除节点在 cur 的左子树中
      else {
        cur = cur.left
      }
    }
    // 若无待删除节点，则直接返回
    if (cur == null) return

    // 子节点数量 = 0 or 1
    if (cur.left == null || cur.right == null) {
      // 当子节点数量 = 0 / 1 时， child = null / 该子节点
      val child: TreeNode = if (cur.left != null) cur.left else cur.right
      // 删除节点 cur
      if (cur != root) {
        if (pre.left == cur) {
          pre.left = child
        } else {
          pre.right = child
        }
      } else {
        // 若删除节点为根节点，则重新指定根节点
        root = child
      }
    } else { // 子节点数量 = 2

      // 获取中序遍历中 cur 的下一个节点
      var tmp: TreeNode = cur.right
      while (tmp.left != null) {
        tmp = tmp.left
      }
      // 递归删除节点 tmp
      remove(tmp.value)
      // 用 tmp 覆盖 cur
      cur.value = tmp.value
    }

  }
}

object binary_search_tree {
  def main(args: Array[String]): Unit = {
    /* 初始化二叉搜索树 */
    val bst = new binary_search_tree()
    val nums = Array(8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15)
    for(num <- nums) {
      bst.insert(num)
    }
    println("\n初始化的二叉树为\n")
    val printUtil = new PrintUtil()
    printUtil.printTree(bst.getRoot())

    /* 查找节点 */
    val node = bst.search(7)
    println("\n查找到的节点对象为 " + node + "，节点值 = " + node.value)

    /* 插入节点 *//* 插入节点 */
    bst.insert(16)
    println("\n插入节点 16 后，二叉树为\n")
    printUtil.printTree(bst.getRoot())

    /* 删除节点 *//* 删除节点 */
    bst.remove(1)
    println("\n删除节点 1 后，二叉树为\n")
    printUtil.printTree(bst.getRoot())
    bst.remove(2)
    println("\n删除节点 2 后，二叉树为\n")
    printUtil.printTree(bst.getRoot())
    bst.remove(4)
    println("\n删除节点 4 后，二叉树为\n")
    printUtil.printTree(bst.getRoot())

  }
}
