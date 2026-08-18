-- @script binary_tree_dfs.lua
-- @date 2025-11-13
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")
local tree_node = require("tree_node")
local list_to_tree = tree_node.list_to_tree

-- 全局结果表，用于存储遍历结果
local res = {}

--- 前序遍历
--- @param root TreeNode | nil 树的根节点
local function pre_order(root)
    if root == nil then
        return
    end
    -- 访问优先级：根节点 -> 左子树 -> 右子树
    table.insert(res, root.val)
    pre_order(root.left)
    pre_order(root.right)
end

--- 中序遍历
--- @param root TreeNode | nil 树的根节点
local function in_order(root)
    if root == nil then
        return
    end
    -- 访问优先级：左子树 -> 根节点 -> 右子树
    in_order(root.left)
    table.insert(res, root.val)
    in_order(root.right)
end

--- 后序遍历
--- @param root TreeNode | nil 树的根节点
local function post_order(root)
    if root == nil then
        return
    end
    -- 访问优先级：左子树 -> 右子树 -> 根节点
    post_order(root.left)
    post_order(root.right)
    table.insert(res, root.val)
end

-- Driver Code
local function main()
    -- 初始化二叉树
    -- 这里借助了一个从数组直接生成二叉树的函数
    local root = list_to_tree({ 1, 2, 3, 4, 5, 6, 7 })
    print("\n初始化二叉树\n")
    print_util.print_tree(root, nil, false)

    -- 前序遍历
    res = {}
    pre_order(root)
    print("\n前序遍历的节点打印序列 = [" .. table.concat(res, ", ") .. "]")

    -- 中序遍历
    res = {}
    in_order(root)
    print("\n中序遍历的节点打印序列 = [" .. table.concat(res, ", ") .. "]")

    -- 后序遍历
    res = {}
    post_order(root)
    print("\n后序遍历的节点打印序列 = [" .. table.concat(res, ", ") .. "]")
end

-- 执行主函数
main()
