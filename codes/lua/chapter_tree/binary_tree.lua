-- @script binary_tree.lua
-- @date 2025-11-13
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")
local tree_node = require("tree_node")
local TreeNode = tree_node.TreeNode

-- Driver Code
local function main()
    -- 初始化二叉树
    -- 初始化节点
    local n1 = TreeNode.new(1)
    local n2 = TreeNode.new(2)
    local n3 = TreeNode.new(3)
    local n4 = TreeNode.new(4)
    local n5 = TreeNode.new(5)

    -- 构建节点之间的引用（指针）
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5

    print("\n初始化二叉树\n")
    print_util.print_tree(n1, nil, false)

    -- 插入与删除节点
    local P = TreeNode.new(0)
    -- 在 n1 -> n2 中间插入节点 P
    n1.left = P
    P.left = n2
    print("\n插入节点 P 后\n")
    print_util.print_tree(n1, nil, false)

    -- 删除节点
    n1.left = n2
    print("\n删除节点 P 后\n")
    print_util.print_tree(n1, nil, false)
end

-- 执行主函数
main()
