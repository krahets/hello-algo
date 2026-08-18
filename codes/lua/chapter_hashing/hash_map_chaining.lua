-- @script: hash_map_chaining.lua
-- @date 2025-11-12
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local Pair = require("pair")

--- @class HashMapChaining
--- 链式地址哈希表
--- @field size integer 键值对数量
--- @field capacity integer 哈希表容量
--- @field load_thres number 触发扩容的负载因子阈值
--- @field extend_ratio integer 扩容倍数
local HashMapChaining = {}
HashMapChaining.__index = HashMapChaining

--- 构造方法
--- @return HashMapChaining
function HashMapChaining.new()
    local obj = {}
    setmetatable(obj, HashMapChaining)
    obj.size = 0               -- 键值对数量
    obj.capacity = 4           -- 哈希表容量
    obj.load_thres = 2.0 / 3.0 -- 触发扩容的负载因子阈值
    obj.extend_ratio = 2       -- 扩容倍数
    obj.buckets = {}           -- 桶数组

    -- 初始化桶数组
    for i = 1, obj.capacity do
        obj.buckets[i] = ""
    end

    return obj
end

--- 哈希函数
--- @param key integer 键
--- @return integer
function HashMapChaining:hash_func(key)
    return key % self.capacity + 1 -- Lua 数组索引从1开始
end

--- 负载因子
--- @return number
function HashMapChaining:load_factor()
    return self.size / self.capacity
end

--- 查询操作
--- @param key integer 键
--- @return string|nil
function HashMapChaining:get(key)
    local index = self:hash_func(key)
    local bucket = self.buckets[index]

    -- 遍历桶，若找到 key ，则返回对应 val
    for _, pair in ipairs(bucket) do
        if pair.key == key then
            return pair.val
        end
    end

    -- 若未找到 key ，则返回 nil
    return nil
end

--- 添加操作
--- @param key integer 键
--- @param val string 值
function HashMapChaining:put(key, val)
    -- 当负载因子超过阈值时，执行扩容
    if self:load_factor() > self.load_thres then
        self:extend()
    end

    local index = self:hash_func(key)
    local bucket = self.buckets[index]

    -- 遍历桶，若遇到指定 key ，则更新对应 val 并返回
    for _, pair in ipairs(bucket) do
        if pair.key == key then
            pair.val = val
            return
        end
    end

    -- 若无该 key ，则将键值对添加至尾部
    local pair = Pair:new(key, val)
    table.insert(bucket, pair)
    self.size = self.size + 1
end

--- 删除操作
--- @param key integer 键
function HashMapChaining:remove(key)
    local index = self:hash_func(key)
    local bucket = self.buckets[index]

    -- 遍历桶，从中删除键值对
    for i, pair in ipairs(bucket) do
        if pair.key == key then
            table.remove(bucket, i)
            self.size = self.size - 1
            break
        end
    end
end

--- 扩容哈希表
function HashMapChaining:extend()
    -- 暂存原哈希表
    local old_buckets = self.buckets

    -- 初始化扩容后的新哈希表
    self.capacity = self.capacity * self.extend_ratio
    self.buckets = {}
    for i = 1, self.capacity do
        self.buckets[i] = ""
    end
    self.size = 0

    -- 将键值对从原哈希表搬运至新哈希表
    for _, bucket in ipairs(old_buckets) do
        for _, pair in ipairs(bucket) do
            self:put(pair.key, pair.val)
        end
    end
end

--- 打印哈希表
function HashMapChaining:print()
    for _, bucket in ipairs(self.buckets) do
        local res = {}
        for _, pair in ipairs(bucket) do
            table.insert(res, tostring(pair.key) .. " -> " .. pair.val)
        end
        print("[" .. table.concat(res, ", ") .. "]")
    end
end

-- Driver Code
local function main()
    -- 初始化哈希表
    local hashmap = HashMapChaining.new()

    -- 添加操作
    -- 在哈希表中添加键值对 (key, value)
    hashmap:put(12836, "小哈")
    hashmap:put(15937, "小啰")
    hashmap:put(16750, "小算")
    hashmap:put(13276, "小法")
    hashmap:put(10583, "小鸭")
    print("\n添加完成后，哈希表为\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap:print()

    -- 查询操作
    -- 向哈希表中输入键 key ，得到值 value
    local name = hashmap:get(13276)
    print("\n输入学号 13276 ，查询到姓名 " .. name)

    -- 删除操作
    -- 在哈希表中删除键值对 (key, value)
    hashmap:remove(12836)
    print("\n删除 12836 后，哈希表为\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap:print()
end

-- 执行主函数
main()
