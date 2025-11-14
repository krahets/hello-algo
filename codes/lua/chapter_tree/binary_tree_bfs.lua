-- @script binary_tree_bfs.lua
-- @date 2025-11-13
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")
local tree_node = require("tree_node")
local list_to_tree = tree_node.list_to_tree

--- 层序遍历二叉树
--- @param root TreeNode|nil 二叉树的根节点
--- @return table
local function level_order(root)
    if not root then
        return {}
    end

    -- 初始化队列，加入根节点
    local queue = { root }
    -- 初始化一个列表，用于保存遍历序列
    local res = {}

    while #queue > 0 do
        -- 队列出队
        local node = table.remove(queue, 1)
        -- 保存节点值
        table.insert(res, node.val)

        -- 左子节点入队
        if node.left then
            table.insert(queue, node.left)
        end

        -- 右子节点入队
        if node.right then
            table.insert(queue, node.right)
        end
    end

    return res
end

-- Driver Code
local function main()
    -- 初始化二叉树
    -- 这里借助了一个从数组直接生成二叉树的函数
    local root = list_to_tree({ 1, 2, 3, 4, 5, 6, 7 })
    print("\n初始化二叉树\n")
    print_util.print_tree(root, nil, false)

    -- 层序遍历
    local res = level_order(root)
    print("\n层序遍历的节点打印序列 = [" .. table.concat(res, ", ") .. "]\n")
end

-- 执行主函数
main()
