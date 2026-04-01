-- @script preorder_traversal_iii_compact.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")
local tree_node = require("tree_node")
local list_to_tree = tree_node.list_to_tree

--- 前序遍历：例题三
--- @param root TreeNode|nil 当前遍历的节点
--- @param path table 当前路径
--- @param res table 存储所有符合条件的路径
local function pre_order(root, path, res)
    -- 剪枝：遇到空节点或值为3的节点则返回
    if not root or root.val == 3 then
        return
    end

    -- 尝试：将当前节点加入路径
    table.insert(path, root)

    -- 记录解：如果当前节点值为7，则记录当前路径
    if root.val == 7 then
        -- 创建路径的副本
        local path_copy = {}
        for _, node in ipairs(path) do
            table.insert(path_copy, node)
        end
        table.insert(res, path_copy)
    end

    -- 递归遍历左右子树
    pre_order(root.left, path, res)
    pre_order(root.right, path, res)

    -- 回退：从路径中移除当前节点
    table.remove(path)
end

-- Driver Code
local function main()
    -- 构建二叉树
    local root = list_to_tree({ 1, 7, 3, 4, 5, 6, 7 })
    print("\n初始化二叉树")
    print_util.print_tree(root, nil, false)

    -- 前序遍历查找路径
    local path = {}
    local res = {}
    pre_order(root, path, res)

    print("\n输出所有根节点到节点 7 的路径，路径中不包含值为 3 的节点")
    for _, path_nodes in ipairs(res) do
        local path_vals = {}
        for _, node in ipairs(path_nodes) do
            table.insert(path_vals, node.val)
        end
        print("[" .. table.concat(path_vals, ", ") .. "]")
    end
end

-- 执行主函数
main()
