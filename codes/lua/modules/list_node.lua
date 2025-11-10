-- @module list_node
-- @date 2025-11-10
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- @class ListNode
--- 链表节点类
--- @field val number 节点值
--- @field next ListNode|nil 后继节点引用
local ListNode = {}
ListNode.__index = ListNode

--- 构造函数
--- @param val number 节点值
--- @return ListNode 新节点实例
function ListNode.new(val)
    local obj = setmetatable({}, ListNode)
    obj.val = val  -- 节点值
    obj.next = nil -- 后继节点引用
    return obj
end

--- 将列表反序列化为链表
--- @param arr table 整型数组
--- @return ListNode|nil 链表头节点
local function list_to_linked_list(arr)
    local dum = ListNode.new(0)
    local head = dum
    for _, a in ipairs(arr) do
        local node = ListNode.new(a)
        head.next = node
        head = head.next
    end
    return dum.next
end

--- 将链表序列化为列表
--- @param head ListNode 链表头节点
--- @return table 整型数组
local function linked_list_to_list(head)
    local arr = {}
    while head do
        table.insert(arr, head.val)
        head = head.next
    end
    return arr
end

return {
    ListNode = ListNode,
    list_to_linked_list = list_to_linked_list,
    linked_list_to_list = linked_list_to_list,
}
