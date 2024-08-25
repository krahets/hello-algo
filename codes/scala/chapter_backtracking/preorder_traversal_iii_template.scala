import scala.collection.mutable.ListBuffer

/**
 * File: preorder_traversal_iii_template.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-16 11:31
 */

class preorder_traversal_iii_template {
  // 判断当前状态是否为解
  def isSolution(state: List[TreeNode]): Boolean = {
    state.nonEmpty && state.last.value == 7
  }

  // 记录解
  def recordSolution(state: List[TreeNode], res: ListBuffer[List[TreeNode]]): Unit = {
    res += state
  }

  // 判断在当前状态下，该选择是否合法
  def isValid(state: List[TreeNode], choice: TreeNode): Boolean = {
    choice != null && choice.value != 3
  }

  // 更新状态
  def makeChoice(state: ListBuffer[TreeNode], choice: TreeNode): Unit = {
    state += choice
  }

  // 恢复状态
  def undoChoice(state: ListBuffer[TreeNode], choice: TreeNode): Unit = {
    state.remove(state.length - 1)
  }

  // 回溯算法
  def backtrack(state: ListBuffer[TreeNode], choices: List[TreeNode], res: ListBuffer[List[TreeNode]]): Unit = {
    // 检查是否为解
    if (isSolution(state.toList)) {
      // 记录解
      recordSolution(state.toList, res)
    }
    // 遍历所有选择
    choices.foreach { choice =>
      // 剪枝：检查选择是否合法
      if (isValid(state.toList, choice)) {
        // 尝试：做出选择，更新状态
        makeChoice(state, choice)
        // 进行下一轮选择
        backtrack(state, List(choice.left, choice.right).filter(_ != null), res)
        // 回退：撤销选择，恢复到之前的状态
        undoChoice(state, choice)
      }
    }
  }
}
object preorder_traversal_iii_template {
  def main(args: Array[String]): Unit = {
    // 初始化数据
    val list: List[Option[Int]] = List(1, 7, 3, 4, 5, 6, 7).map(Option(_))
    val root: TreeNode = new TreeNode().listToTree(list)

    // 打印初始化的二叉树
    println("\n初始化二叉树")
    new PrintUtil().printTree(root)

    // 初始化前序遍历模板和结果集合
    val res: ListBuffer[List[TreeNode]] = ListBuffer()
    val template = new preorder_traversal_iii_template()

    // 执行回溯算法
    template.backtrack(ListBuffer(), List(root), res)

    // 输出所有根节点到节点 7 的路径，路径中不包含值为 3 的节点
    println("\n输出所有根节点到节点 7 的路径，路径中不包含值为 3 的节点")
    res.foreach { path =>
      val vals = path.map(_.value)
      println(vals)
    }
  }
}
