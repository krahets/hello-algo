-- @script build_tree.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")
local tree_node = require("tree_node")
local TreeNode = tree_node.TreeNode

--- 使用分治法构建二叉树
--- @param preorder table 前序遍历序列
--- @param inorder_map table 中序遍历值到索引的映射
--- @param i integer 当前根节点在前序遍历中的索引
--- @param l integer 当前子树在中序遍历中的左边界
--- @param r integer 当前子树在中序遍历中的右边界
--- @return TreeNode|nil 构建的二叉树根节点
local function dfs(preorder, inorder_map, i, l, r)
    -- 子树区间为空时终止
    if r < l then
        return nil
    end

    -- 初始化根节点
    local root = TreeNode.new(preorder[i])

    -- 查询 m，从而划分左右子树
    local m = inorder_map[preorder[i]]

    -- 子问题：构建左子树
    root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)

    -- 子问题：构建右子树
    root.right = dfs(preorder, inorder_map, i + 1 + (m - l), m + 1, r)

    -- 返回根节点
    return root
end

--- 根据前序遍历和中序遍历构建二叉树
--- @param preorder table 前序遍历序列
--- @param inorder table 中序遍历序列
--- @return TreeNode|nil 构建的二叉树根节点
local function build_tree(preorder, inorder)
    -- 初始化哈希表，存储 inorder 元素到索引的映射
    local inorder_map = {}
    for idx, val in ipairs(inorder) do
        inorder_map[val] = idx
    end

    local root = dfs(preorder, inorder_map, 1, 1, #inorder)
    return root
end

-- Driver Code
local function main()
    local preorder = { 3, 9, 2, 1, 7 }
    local inorder = { 9, 3, 1, 2, 7 }

    print("前序遍历 = [" .. table.concat(preorder, ", ") .. "]")
    print("中序遍历 = [" .. table.concat(inorder, ", ") .. "]")

    local root = build_tree(preorder, inorder)
    print("构建的二叉树为：")
    print_util.print_tree(root, nil, false)
end

-- 执行主函数
main()
