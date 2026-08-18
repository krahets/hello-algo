-- @script: array_hash_map.lua
-- @date 2025-11-12
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local Pair = require("pair")

--- @class ArrayHashMap
--- 基于数组实现的哈希表
--- @field buckets table 桶数组
local ArrayHashMap = {}

---构造方法
---@return ArrayHashMap
function ArrayHashMap:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    -- 初始化数组，包含100个桶
    obj.buckets = {}
    for i = 1, 100 do
        obj.buckets[i] = ""
    end
    return obj
end

--- 哈希函数
--- @param key integer 键
--- @return integer
function ArrayHashMap:hash_func(key)
    local index = key % 100 + 1 -- Lua数组索引从1开始
    return index
end

--- 查询操作
--- @param key integer 键
--- @return string|nil
function ArrayHashMap:get(key)
    local index = self:hash_func(key)
    local pair = self.buckets[index]
    if pair == "" then
        return nil
    end
    return pair.val
end

--- 添加和更新操作
--- @param key integer 键
--- @param val string 值
function ArrayHashMap:put(key, val)
    local pair = Pair:new(key, val)
    local index = self:hash_func(key)
    self.buckets[index] = pair
end

--- 删除操作
--- @param key integer 键
function ArrayHashMap:remove(key)
    local index = self:hash_func(key)
    -- 置为""，代表删除
    self.buckets[index] = ""
end

--- 获取所有键值对
--- @return table
function ArrayHashMap:entry_set()
    local result = {}
    for _, pair in ipairs(self.buckets) do
        if pair ~= "" then
            table.insert(result, pair)
        end
    end
    return result
end

--- 获取所有键
--- @return table
function ArrayHashMap:key_set()
    local result = {}
    for _, pair in ipairs(self.buckets) do
        if pair ~= "" then
            table.insert(result, pair.key)
        end
    end
    return result
end

--- 获取所有值
--- @return table
function ArrayHashMap:value_set()
    local result = {}
    for _, pair in ipairs(self.buckets) do
        if pair ~= "" then
            table.insert(result, pair.val)
        end
    end
    return result
end

--- 打印哈希表
function ArrayHashMap:print()
    for _, pair in ipairs(self.buckets) do
        if pair ~= "" then
            print(pair.key .. " -> " .. pair.val)
        end
    end
end

-- Driver Code
local function main()
    -- 初始化哈希表
    local hmap = ArrayHashMap:new()

    -- 添加操作
    -- 在哈希表中添加键值对 (key, value)
    hmap:put(12836, "小哈")
    hmap:put(15937, "小啰")
    hmap:put(16750, "小算")
    hmap:put(13276, "小法")
    hmap:put(10583, "小鸭")
    print("\n添加完成后，哈希表为\nKey -> Value")
    hmap:print()

    -- 查询操作
    -- 向哈希表中输入键 key ，得到值 value
    local name = hmap:get(15937)
    print("\n输入学号 15937 ，查询到姓名 " .. name)

    -- 删除操作
    -- 在哈希表中删除键值对 (key, value)
    hmap:remove(10583)
    print("\n删除 10583 后，哈希表为\nKey -> Value")
    hmap:print()

    -- 遍历哈希表
    print("\n遍历键值对 Key->Value")
    for _, pair in ipairs(hmap:entry_set()) do
        print(pair.key .. " -> " .. pair.val)
    end

    print("\n单独遍历键 Key")
    for _, key in ipairs(hmap:key_set()) do
        print(key)
    end

    print("\n单独遍历值 Value")
    for _, val in ipairs(hmap:value_set()) do
        print(val)
    end
end

-- 执行主函数
main()
