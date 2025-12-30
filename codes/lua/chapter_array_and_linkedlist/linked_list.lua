-- @script linked_list.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local list_node = require("list_node")
local ListNode = list_node.ListNode

--- 在链表的节点 n0 之后插入节点 P
--- @param n0 ListNode 要插入位置的前一个节点
--- @param P ListNode 要插入的节点
local function insert(n0, P)
    local n1 = n0.next
    P.next = n1
    n0.next = P
end

--- 删除链表的节点 n0 之后的首个节点
--- @param n0 ListNode 要删除节点的前一个节点
local function remove(n0)
    -- n0 -> P -> n1
    local P = n0.next
    if not P then
        return
    end
    local n1 = P.next
    n0.next = n1
end

--- 访问链表中索引为 index 的节点
--- @param head ListNode 链表头节点
--- @param index integer 要访问的索引
--- @return ListNode|nil 找到的节点或nil
local function access(head, index)
    for _ = 1, index do
        if not head then
            return nil
        end
        head = head.next
    end
    return head
end

--- 在链表中查找值为 target 的首个节点
--- @param head ListNode 链表头节点
--- @param target integer 要查找的目标值
--- @return number 节点索引，未找到返回-1
local function find(head, target)
    local index = 0
    while head do
        if head.val == target then
            return index
        end
        head = head.next
        index = index + 1
    end
    return -1
end

--- 打印链表
--- @param head ListNode 链表头节点
local function printLinkedList(head)
    local current = head
    local output = {}
    while current do
        table.insert(output, current.val)
        current = current.next
    end
    print(table.concat(output, " -> "))
end

-- Driver Code
local function main()
    -- 初始化链表
    -- 初始化各个节点
    local n0 = ListNode.new(1)
    local n1 = ListNode.new(3)
    local n2 = ListNode.new(2)
    local n3 = ListNode.new(5)
    local n4 = ListNode.new(4)
    -- 构建节点之间的引用
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    print("初始化的链表为")
    printLinkedList(n0)

    -- 插入节点
    local p = ListNode.new(0)
    insert(n0, p)
    print("插入节点后的链表为")
    printLinkedList(n0)

    -- 删除节点
    remove(n0)
    print("删除节点后的链表为")
    printLinkedList(n0)

    -- 访问节点
    local node = access(n0, 3)
    if node then
        print("链表中索引 3 处的节点的值 = " .. node.val)
    else
        print("链表中索引 3 处的节点不存在")
    end

    -- 查找节点
    local index = find(n0, 2)
    print("链表中值为 2 的节点的索引 = " .. index)
end

-- 执行主函数
main()
