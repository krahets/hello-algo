-- @classmod tree_node
-- @date 2025-11-10
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- @class TreeNode
--- 二叉树节点类
--- @field val number 节点值
--- @field height number 节点高度
--- @field left TreeNode|nil 左子节点引用
--- @field right TreeNode|nil 右子节点引用
local TreeNode = {}
TreeNode.__index = TreeNode

--- 构造函数
--- @param val number 节点值
--- @return TreeNode 新节点实例
function TreeNode.new(val)
    local obj = {}
    setmetatable(obj, TreeNode)
    obj.val = val or 0 -- 节点值
    obj.height = 0     -- 节点高度
    obj.left = nil     -- 左子节点引用
    obj.right = nil    -- 右子节点引用
    return obj
end

-- 序列化编码规则请参考：
-- https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
-- 二叉树的数组表示：
-- [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
-- 二叉树的链表表示：
--             /——— 15
--         /——— 7
--     /——— 3
--    |    \——— 6
--    |        \——— 12
-- ——— 1
--     \——— 2
--        |    /——— 9
--         \——— 4
--             \——— 8

--- 将列表反序列化为二叉树：递归
--- @param arr table 输入数组
--- @param i integer 当前索引（从1开始）
--- @return TreeNode|nil 二叉树根节点
local function list_to_tree_dfs(arr, i)
    -- 如果索引超出数组长度，或者对应的元素为nil|math.huge，则返回nil
    if i < 1 or i > #arr or arr[i] == nil or arr[i] == math.huge then
        return nil
    end
    -- 构建当前节点
    local root = TreeNode.new(arr[i])
    -- 递归构建左右子树
    root.left = list_to_tree_dfs(arr, 2 * i)
    root.right = list_to_tree_dfs(arr, 2 * i + 1)
    return root
end

--- 将列表反序列化为二叉树
--- @param arr table 输入数组
--- @return TreeNode|nil 二叉树根节点
local function list_to_tree(arr)
    return list_to_tree_dfs(arr, 1)
end

--- 将二叉树序列化为列表：递归
--- @param root TreeNode 二叉树根节点
--- @param i integer 当前索引
--- @param res table 结果数组
local function tree_to_list_dfs(root, i, res)
    if root == nil then
        return
    end
    if i > #res then
        for j = #res + 1, i do
            res[j] = nil
        end
    end
    res[i] = root.val
    tree_to_list_dfs(root.left, 2 * i, res)
    tree_to_list_dfs(root.right, 2 * i + 1, res)
end

--- 将二叉树序列化为列表
--- @param root TreeNode 二叉树根节点
--- @return table 序列化后的数组
local function tree_to_list(root)
    local res = {}
    tree_to_list_dfs(root, 1, res)
    return res
end

return {
    TreeNode = TreeNode,
    list_to_tree = list_to_tree,
    tree_to_list = tree_to_list,
}
