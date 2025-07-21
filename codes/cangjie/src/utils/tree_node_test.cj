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
    arr.add(1)
    arr.add(2)
    arr.add(None)
    arr.add(4)
    arr.add(5)
    arr.add(6)
    
    let tree = TreeNode.listToTree(arr)
    PrintUtil.printTree(tree)
}
