using Newtonsoft.Json.Linq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hello_algo.chapter_array_and_linkedlist
{
    class MyList
    {
        private int[] nums;           // 数组（存储列表元素）
        private int capacity = 10;    // 列表容量
        private int size = 0;         // 列表长度（即当前元素数量）
        private int extendRatio = 2;  // 每次列表扩容的倍数

        /* 构造函数 */
        public MyList()
        {
            nums = new int[capacity];
        }

        /* 获取列表长度（即当前元素数量）*/
        public int Size()
        {
            return size;
        }

        /* 获取列表容量 */
        public int Capacity()
        {
            return capacity;
        }

        /* 访问元素 */
        public int get(int index)
        {
            // 索引如果越界则抛出异常，下同
            if (index >= size)
                throw new IndexOutOfRangeException("索引越界");
            return nums[index];
        }

        /* 更新元素 */
        public void set(int index, int num)
        {
            if (index >= size)
                throw new IndexOutOfRangeException("索引越界");
            nums[index] = num;
        }

        /* 尾部添加元素 */
        public void add(int num)
        {
            // 元素数量超出容量时，触发扩容机制
            if (size == Capacity())
                extendCapacity();
            nums[size] = num;
            // 更新元素数量
            size++;
        }

        /* 中间插入元素 */
        public void insert(int index, int num)
        {
            if (index >= size)
                throw new IndexOutOfRangeException("索引越界");
            // 元素数量超出容量时，触发扩容机制
            if (size == Capacity())
                extendCapacity();
            // 将索引 index 以及之后的元素都向后移动一位
            for (int j = size - 1; j >= index; j--)
            {
                nums[j + 1] = nums[j];
            }
            nums[index] = num;
            // 更新元素数量
            size++;
        }

        /* 删除元素 */
        public int remove(int index)
        {
            if (index >= size)
                throw new IndexOutOfRangeException("索引越界");
            int num = nums[index];
            // 将索引 index 之后的元素都向前移动一位
            for (int j = index; j < size - 1; j++)
            {
                nums[j] = nums[j + 1];
            }
            // 更新元素数量
            size--;
            // 返回被删除元素
            return num;
        }

        /* 列表扩容 */
        public void extendCapacity()
        {
            // 新建一个长度为 size 的数组，并将原数组拷贝到新数组
            System.Array.Resize(ref nums, Capacity() * extendRatio);
            // 更新列表容量
            capacity = nums.Length;
        }

        /* 将列表转换为数组 */
        public int[] toArray()
        {
            int size = Size();
            // 仅转换有效长度范围内的列表元素
            int[] nums = new int[size];
            for (int i = 0; i < size; i++)
            {
                nums[i] = get(i);
            }
            return nums;
        }
    }

    public class my_list
    {
        [Test]
        public void Test()
        {
            /* 初始化列表 */
            MyList list = new MyList();
            /* 尾部添加元素 */
            list.add(1);
            list.add(3);
            list.add(2);
            list.add(5);
            list.add(4);
            Console.WriteLine("列表 list = " + string.Join(",", list.toArray()) +
                               " ，容量 = " + list.Capacity() + " ，长度 = " + list.Size());

            /* 中间插入元素 */
            list.insert(3, 6);
            Console.WriteLine("在索引 3 处插入数字 6 ，得到 list = " + string.Join(",", list.toArray()));

            /* 删除元素 */
            list.remove(3);
            Console.WriteLine("删除索引 3 处的元素，得到 list = " + string.Join(",", list.toArray()));

            /* 访问元素 */
            int num = list.get(1);
            Console.WriteLine("访问索引 1 处的元素，得到 num = " + num);

            /* 更新元素 */
            list.set(1, 0);
            Console.WriteLine("将索引 1 处的元素更新为 0 ，得到 list = " + string.Join(",", list.toArray()));

            /* 测试扩容机制 */
            for (int i = 0; i < 10; i++)
            {
                // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
                list.add(i);
            }
            Console.WriteLine("扩容后的列表 list = " + string.Join(",", list.toArray()) +
                               " ，容量 = " + list.Capacity() + " ，长度 = " + list.Size());
        }
    }
}
