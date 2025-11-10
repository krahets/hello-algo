-- @module print_util
-- @date 2025-11-10
-- @author fisheryv (yue.fisher2025@gdhfi.com)

local print_util = {}

-- 导入依赖
package.path = package.path .. ";codes/lua/modules/?.lua"
local tree_node = require("tree_node")
local list_node = require("list_node")

--- 打印矩阵
--- @param mat table 二维矩阵表
function print_util.print_matrix(mat)
    local s = {}
    for i, arr in ipairs(mat) do
        s[i] = "  " .. table.concat(arr, " ")
    end
    print("[\n" .. table.concat(s, ",\n") .. "\n]")
end

--- 打印链表
--- @param head table 链表头节点
function print_util.print_linked_list(head)
    local arr = list_node.linked_list_to_list(head)
    local str_arr = {}
    for i, v in ipairs(arr) do
        str_arr[i] = tostring(v)
    end
    print(table.concat(str_arr, " -> "))
end

--- @class Trunk
--- 树干类，用于打印二叉树
--- @field prev Trunk|nil 前一个树干
--- @field str string 树干字符串
local Trunk = {}
Trunk.__index = Trunk

--- 构造函数
--- @param prev table|nil 前一个树干
--- @param str string 树干字符串
--- @return Trunk 新树干实例
function Trunk.new(prev, str)
    local obj = {
        prev = prev,
        str = str
    }
    setmetatable(obj, Trunk)
    return obj
end

--- 显示树干
--- @param p table 树干实例
local function show_trunks(p)
    if not p then
        return
    end
    show_trunks(p.prev)
    io.write(p.str)
end

--- 打印二叉树
--- This tree printer is borrowed from TECHIE DELIGHT
--- @see https://www.techiedelight.com/c-program-print-binary-tree/
--- @param root table|nil  二叉树根节点
--- @param prev table|nil  前一个树干
--- @param is_right boolean  是否为右子树
function print_util.print_tree(root, prev, is_right)
    if not root then
        return
    end

    local prev_str = "    "
    local trunk = Trunk.new(prev, prev_str)
    print_util.print_tree(root.right, trunk, true)

    if not prev then
        trunk.str = "———"
    elseif is_right then
        trunk.str = "/———"
        prev_str = "   |"
    else
        trunk.str = "\\———"
        prev.str = prev_str
    end

    show_trunks(trunk)
    print(" " .. tostring(root.val))
    if prev then
        prev.str = prev_str
    end
    trunk.str = "   |"
    print_util.print_tree(root.left, trunk, false)
end

--- 打印字典
--- @param hmap table 字典表
function print_util.print_dict(hmap)
    for key, value in pairs(hmap) do
        print(key, "->", value)
    end
end

--- 打印堆
--- @param heap table 堆数组
function print_util.print_heap(heap)
    print("堆的数组表示：", table.concat(heap, " "))
    print("堆的树状表示：")
    local root = tree_node.list_to_tree(heap)
    print_util.print_tree(root, nil, false)
end

return print_util
