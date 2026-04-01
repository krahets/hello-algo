-- @script array_binary_tree.lua
-- @date 2025-11-14
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")
local tree_node = require("tree_node")
local list_to_tree = tree_node.list_to_tree

--- @class ArrayBinaryTree
--- 数组表示下的二叉树类
--- @field _tree number[] 二叉树的数组表示
local ArrayBinaryTree = {}

--- 构造方法
--- @param arr number[] 二叉树数组表示
--- @return ArrayBinaryTree
function ArrayBinaryTree:new(arr)
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    obj._tree = {}
    for i, v in ipairs(arr) do
        obj._tree[i] = v
    end
    return obj
end

---列表容量
---@return integer
function ArrayBinaryTree:size()
    return #self._tree
end

--- 获取索引为 i 节点的值
--- @param i integer 节点索引
--- @return number 节点值，若索引越界则返回 math.huge
function ArrayBinaryTree:val(i)
    -- 若索引越界，则返回 math.huge ，代表空位
    if i < 1 or i > self:size() then
        return math.huge
    end
    return self._tree[i]
end

--- 获取索引为 i 节点的左子节点的索引
--- @param i integer 节点索引
--- @return integer
function ArrayBinaryTree:left(i)
    return 2 * i
end

--- 获取索引为 i 节点的右子节点的索引
--- @param i integer 节点索引
--- @return integer
function ArrayBinaryTree:right(i)
    return 2 * i + 1
end

--- 获取索引为 i 节点的父节点的索引
--- @param i integer 节点索引
--- @return integer
function ArrayBinaryTree:parent(i)
    return math.floor(i / 2)
end

--- 层序遍历
--- @return number[]
function ArrayBinaryTree:level_order()
    local res = {}
    -- 直接遍历数组
    for i = 1, self:size() do
        if self:val(i) ~= math.huge then
            table.insert(res, self:val(i))
        end
    end
    return res
end

--- 深度优先遍历
--- @param i integer 当前节点索引
--- @param order string 遍历顺序："pre"|"in"|"post"
--- @param res table 结果数组
function ArrayBinaryTree:_dfs(i, order, res)
    if self:val(i) == math.huge then
        return
    end
    -- 前序遍历
    if order == "pre" then
        table.insert(res, self:val(i))
    end
    self:_dfs(self:left(i), order, res)
    -- 中序遍历
    if order == "in" then
        table.insert(res, self:val(i))
    end
    self:_dfs(self:right(i), order, res)
    -- 后序遍历
    if order == "post" then
        table.insert(res, self:val(i))
    end
end

--- 前序遍历
--- @return table
function ArrayBinaryTree:pre_order()
    local res = {}
    self:_dfs(1, "pre", res)
    return res
end

--- 中序遍历
--- @return table
function ArrayBinaryTree:in_order()
    local res = {}
    self:_dfs(1, "in", res)
    return res
end

--- 后序遍历
--- @return table
function ArrayBinaryTree:post_order()
    local res = {}
    self:_dfs(1, "post", res)
    return res
end

-- Driver Code
local function main()
    -- 初始化二叉树
    -- 注意：Lua中数组索引从1开始，用 math.huge 表示空位
    local arr = { 1, 2, 3, 4, math.huge, 6, 7, 8, 9, math.huge, math.huge, 12, math.huge, math.huge, 15 }
    local root = list_to_tree(arr)

    print("\n初始化二叉树\n")
    print("二叉树的数组表示：")
    print(string.format("[%s]", table.concat(arr, ", ")))
    print("二叉树的链表表示：")
    print_util.print_tree(root, nil, false)

    -- 数组表示下的二叉树类
    local abt = ArrayBinaryTree:new(arr)

    -- 访问节点
    local i = 2 -- Lua索引从1开始，对应原Python代码中的索引1
    local l, r, p = abt:left(i), abt:right(i), abt:parent(i)
    print(string.format("\n当前节点的索引为 %d ，值为 %s", i, tostring(abt:val(i))))
    print(string.format("其左子节点的索引为 %d ，值为 %s", l, tostring(abt:val(l))))
    print(string.format("其右子节点的索引为 %d ，值为 %s", r, tostring(abt:val(r))))
    print(string.format("其父节点的索引为 %d ，值为 %s", p, tostring(abt:val(p))))

    -- 遍历树
    local res = abt:level_order()
    print("\n层序遍历为：[" .. table.concat(res, ", ") .. "]")
    res = abt:pre_order()
    print("前序遍历为：[" .. table.concat(res, ", ") .. "]")
    res = abt:in_order()
    print("中序遍历为：[" .. table.concat(res, ", ") .. "]")
    res = abt:post_order()
    print("后序遍历为：[" .. table.concat(res, ", ") .. "]")
end

-- 运行主函数
main()
