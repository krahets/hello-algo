/**
 * File: tree_node_test.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.utils

import std.unittest.testmacro.*
import std.unittest.*
import std.collection.ArrayList

@Test
public func testTreeNode() {
    let arr = ArrayList<?Int64>(7)
    arr.append(1)
    arr.append(2)
    arr.append(3)
    arr.append(4)
    arr.append(5)

    let tree = TreeNode.listToTree(arr)
    PrintUtil.printTree(tree)
}
