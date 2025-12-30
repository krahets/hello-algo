-- @script preorder_traversal_i_compact.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")
local tree_node = require("tree_node")
local list_to_tree = tree_node.list_to_tree

--- 前序遍历：例题一
--- @param root TreeNode|nil 根节点
--- @param res table 存储结果的表
local function pre_order(root, res)
    if not root then
        return
    end

    -- 如果节点值为7，则记录到结果表中
    if root.val == 7 then
        table.insert(res, root)
    end

    pre_order(root.left, res)
    pre_order(root.right, res)
end

-- Driver Code
local function main()
    -- 通过列表构建二叉树
    local root = list_to_tree({ 1, 7, 3, 4, 5, 6, 7 })
    print("\n初始化二叉树")
    print_util.print_tree(root, nil, false)

    -- 前序遍历查找值为7的节点
    local res = {}
    pre_order(root, res)

    print("\n输出所有值为 7 的节点")
    local vals = {}
    for _, node in ipairs(res) do
        table.insert(vals, node.val)
    end
    print("[" .. table.concat(vals, ", ") .. "]")
end

-- 执行主函数
main()
