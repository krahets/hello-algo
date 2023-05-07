/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 列表类简易实现 */
class MyList {
  private:
    int *nums;             // 数组（存储列表元素）
    int numsCapacity = 10; // 列表容量
    int numsSize = 0;      // 列表长度（即当前元素数量）
    int extendRatio = 2;   // 每次列表扩容的倍数

  public:
    /* 构造方法 */
    MyList() {
        nums = new int[numsCapacity];
    }

    /* 析构方法 */
    ~MyList() {
        delete[] nums;
    }

    /* 获取列表长度（即当前元素数量）*/
    int size() {
        return numsSize;
    }

    /* 获取列表容量 */
    int capacity() {
        return numsCapacity;
    }

    /* 访问元素 */
    int get(int index) {
        // 索引如果越界则抛出异常，下同
        if (index < 0 || index >= size())
            throw out_of_range("索引越界");
        return nums[index];
    }

    /* 更新元素 */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("索引越界");
        nums[index] = num;
    }

    /* 尾部添加元素 */
    void add(int num) {
        // 元素数量超出容量时，触发扩容机制
        if (size() == capacity())
            extendCapacity();
        nums[size()] = num;
        // 更新元素数量
        numsSize++;
    }

    /* 中间插入元素 */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("索引越界");
        // 元素数量超出容量时，触发扩容机制
        if (size() == capacity())
            extendCapacity();
        // 索引 i 以及之后的元素都向后移动一位
        for (int j = size() - 1; j >= index; j--) {
            nums[j + 1] = nums[j];
        }
        nums[index] = num;
        // 更新元素数量
        numsSize++;
    }

    /* 删除元素 */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("索引越界");
        int num = nums[index];
        // 索引 i 之后的元素都向前移动一位
        for (int j = index; j < size() - 1; j++) {
            nums[j] = nums[j + 1];
        }
        // 更新元素数量
        numsSize--;
        // 返回被删除元素
        return num;
    }

    /* 列表扩容 */
    void extendCapacity() {
        // 新建一个长度为 size * extendRatio 的数组，并将原数组拷贝到新数组
        int newCapacity = capacity() * extendRatio;
        int *tmp = nums;
        nums = new int[newCapacity];
        // 将原数组中的所有元素复制到新数组
        for (int i = 0; i < size(); i++) {
            nums[i] = tmp[i];
        }
        // 释放内存
        delete[] tmp;
        numsCapacity = newCapacity;
    }

    /* 将列表转换为 Vector 用于打印 */
    vector<int> toVector() {
        // 仅转换有效长度范围内的列表元素
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = nums[i];
        }
        return vec;
    }
};

/* Driver Code */
int main() {
    /* 初始化列表 */
    MyList *list = new MyList();
    /* 尾部添加元素 */
    list->add(1);
    list->add(3);
    list->add(2);
    list->add(5);
    list->add(4);
    cout << "列表 list = ";
    vector<int> vec = list->toVector();
    printVector(vec);
    cout << "容量 = " << list->capacity() << " ，长度 = " << list->size() << endl;

    /* 中间插入元素 */
    list->insert(3, 6);
    cout << "在索引 3 处插入数字 6 ，得到 list = ";
    vec = list->toVector();
    printVector(vec);

    /* 删除元素 */
    list->remove(3);
    cout << "删除索引 3 处的元素，得到 list = ";
    vec = list->toVector();
    printVector(vec);

    /* 访问元素 */
    int num = list->get(1);
    cout << "访问索引 1 处的元素，得到 num = " << num << endl;

    /* 更新元素 */
    list->set(1, 0);
    cout << "将索引 1 处的元素更新为 0 ，得到 list = ";
    vec = list->toVector();
    printVector(vec);

    /* 测试扩容机制 */
    for (int i = 0; i < 10; i++) {
        // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        list->add(i);
    }
    cout << "扩容后的列表 list = ";
    vec = list->toVector();
    printVector(vec);
    cout << "容量 = " << list->capacity() << " ，长度 = " << list->size() << endl;

    // 释放内存
    delete list;

    return 0;
}
