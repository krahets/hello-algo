-- @script my_list.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- @class MyList
--- 列表类（动态数组实现）
--- @field _capacity integer 列表容量
--- @field _arr table 列表数组
--- @field _size integer 列表长度（当前元素数量）
--- @field _extend_ratio integer 每次列表扩容的倍数
local MyList = {}
MyList.__index = MyList

--- 构造方法
--- @return MyList 新列表实例
function MyList:new()
    local obj = {}
    setmetatable(obj, {
        __index = self
    })

    -- 列表容量
    obj._capacity = 10
    -- 数组（存储列表元素）
    obj._arr = {}
    for i = 1, obj._capacity do
        obj._arr[i] = 0
    end
    -- 列表长度（当前元素数量）
    obj._size = 0
    -- 每次列表扩容的倍数
    obj._extend_ratio = 2

    return obj
end

--- 获取列表长度（当前元素数量）
--- @return integer
function MyList:size()
    return self._size
end

--- 获取列表容量
--- @return integer
function MyList:capacity()
    return self._capacity
end

--- 访问元素
--- @param index integer
--- @return integer
function MyList:get(index)
    -- 索引如果越界，则抛出异常，下同
    if index < 0 or index >= self._size then
        error("索引越界")
    end
    return self._arr[index + 1] -- Lua 数组索引从1开始
end

--- 更新元素
--- @param num integer
--- @param index integer
function MyList:set(num, index)
    if index < 0 or index >= self._size then
        error("索引越界")
    end
    self._arr[index + 1] = num -- Lua 数组索引从1开始
end

--- 在尾部添加元素
--- @param num integer
function MyList:add(num)
    -- 元素数量超出容量时，触发扩容机制
    if self:size() == self:capacity() then
        self:extend_capacity()
    end
    self._arr[self._size + 1] = num
    self._size = self._size + 1
end

--- 在中间插入元素
--- @param num integer
--- @param index integer
function MyList:insert(num, index)
    if index < 0 or index >= self._size then
        error("索引越界")
    end
    -- 元素数量超出容量时，触发扩容机制
    if self._size == self:capacity() then
        self:extend_capacity()
    end
    -- 将索引 index 以及之后的元素都向后移动一位
    for j = self._size, index + 1, -1 do -- Lua 数组索引从1开始
        self._arr[j + 1] = self._arr[j]
    end
    self._arr[index + 1] = num -- Lua 数组索引从1开始
    -- 更新元素数量
    self._size = self._size + 1
end

--- 删除元素
--- @param index integer
--- @return integer
function MyList:remove(index)
    if index < 0 or index >= self._size then
        error("索引越界")
    end
    local num = self._arr[index + 1]     -- Lua 数组索引从1开始
    -- 将索引 index 之后的元素都向前移动一位
    for j = index + 1, self._size - 1 do -- Lua 数组索引从1开始
        self._arr[j] = self._arr[j + 1]
    end
    -- 更新元素数量
    self._size = self._size - 1
    -- 返回被删除的元素
    return num
end

--- 列表扩容
function MyList:extend_capacity()
    -- 新建一个长度为原数组 _extend_ratio 倍的新数组，并将原数组复制到新数组
    local new_capacity = self:capacity() * self._extend_ratio
    local new_arr = {}

    -- 复制原数组元素
    for i = 1, self:capacity() do
        new_arr[i] = self._arr[i]
    end
    -- 填充新增容量为0
    for i = self:capacity() + 1, new_capacity do
        new_arr[i] = 0
    end

    self._arr = new_arr
    -- 更新列表容量
    self._capacity = new_capacity
end

--- 返回有效长度的列表
--- @return table
function MyList:to_array()
    local result = {}
    for i = 1, self._size do
        result[i] = self._arr[i]
    end
    return result
end

-- Driver Code
local function main()
    -- 初始化列表
    local nums = MyList:new()
    -- 在尾部添加元素
    nums:add(1)
    nums:add(3)
    nums:add(2)
    nums:add(5)
    nums:add(4)
    print(string.format("列表 nums = [%s] ，容量 = %d ，长度 = %d", table.concat(nums:to_array(), ", "),
        nums:capacity(), nums:size()))

    -- 在中间插入元素
    nums:insert(6, 3)
    print("在索引 3 处插入数字 6 ，得到 nums = [" .. table.concat(nums:to_array(), ", ") .. "]")

    -- 删除元素
    nums:remove(3)
    print("删除索引 3 处的元素，得到 nums = [" .. table.concat(nums:to_array(), ", ") .. "]")

    -- 访问元素
    local num = nums:get(1)
    print("访问索引 1 处的元素，得到 num = " .. num)

    -- 更新元素
    nums:set(0, 1)
    print("将索引 1 处的元素更新为 0 ，得到 nums = [" .. table.concat(nums:to_array(), ", ") .. "]")

    -- 测试扩容机制
    for i = 0, 9 do
        -- 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        nums:add(i)
    end
    print(string.format("扩容后的列表 [%s] ，容量 = %d ，长度 = %d", table.concat(nums:to_array(), ", "),
        nums:capacity(), nums:size()))
end

-- 执行主函数
main()
