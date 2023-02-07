package chapter_stack_and_queue;

import java.util.Arrays;

class ArrayDeque {
    private final int[] nums; // 用于存储双向队列元素的数组
    private int front; // 队首指针，指向队首元素
    private int rear; // 队尾指针，指向队尾元素
    private int queSize; // 双向队列长度

    public ArrayDeque(int capacity) {
        this.nums = new int[capacity];
        front = rear = 0;
        queSize = 0;
    }

    /* 获取双向队列的容量 */
    public int capacity() {
        return nums.length;
    }

    /* 获取双向队列的长度 */
    public int size() {
        return queSize;
    }

    /* 判断双向队列是否为空 */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* 队首入队 */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("双向队列已满");
            return;
        }

        queSize++;
        // 队首指针先向队首移动一位，越过队首后，通过取余操作返回到队尾
        front = (front - 1 + capacity()) % capacity();
        // 队首前添加num，这里与从队尾进行操作的方法需要区分：队尾操作是先添加num，再进行指针移动，如果都是先移动、再添加则会产生值覆盖的情况
        nums[front] = num;
    }

    /* 队尾入队 */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("双向队列已满");
            return;
        }

        queSize++;
        // 队尾入队先在队尾添加num
        nums[rear] = num;
        // 队尾指针再向队尾移动一位，越过尾部则返回队首
        rear = (rear + 1) % capacity();
    }

    /* 队首出队 */
    public Integer pollFirst() {
        int num = peekFirst();

        // 队首元素出队，队首指针需要向队尾移动一位，越过尾部返回队首
        front = (front + 1) % capacity();
        queSize--;

        return num;
    }

    /* 队尾出队 */
    public Integer pollLast() {
        int num = peekLast();

        // 队尾元素出队，队尾指针需要向队首移动一位，越过队首返回队尾
        rear = (rear - 1 + capacity()) % capacity();
        queSize--;

        return num;
    }

    /* 访问队首元素 */
    public Integer peekFirst() {
        return isEmpty() ? null : nums[front];
    }

    /* 访问队尾元素 */
    public Integer peekLast() {
        // 队尾指针所在的位置是队尾元素的后一位，取值时需要取队尾指针前一位，越过队首则返回队尾
        return isEmpty() ? null : nums[(rear - 1 + capacity()) % capacity()];
    }

    /* 打印双向队列 */
    public void print() {
        if (isEmpty()) {
            System.out.println("[ ]");
            return;
        }

        // 仅转换有效长度范围内的列表元素
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % capacity()];
        }
        System.out.println(Arrays.toString(res));
    }
}

public class array_deque {
    public static void main(String[] args) {
        /* 初始化双向队列 */
        ArrayDeque deque = new ArrayDeque(5);
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.print("双向队列 deque = ");
        deque.print();

        /* 访问元素 */
        int peekFirst = deque.peekFirst();
        System.out.println("队首元素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("队尾元素 peekLast = " + peekLast);

        /* 元素入队 */
        deque.pushLast(4);
        System.out.print("元素 4 队尾入队后 deque = ");
        deque.print();
        deque.pushFirst(1);
        System.out.print("元素 1 队首入队后 deque = ");
        deque.print();

        /* 元素出队 */
        int pollLast = deque.pollLast();
        System.out.print("队尾出队元素 = " + pollLast + "，队尾出队后 deque = ");
        deque.print();
        int pollFirst = deque.pollFirst();
        System.out.print("队首出队元素 = " + pollFirst + "，队首出队后 deque = ");
        deque.print();

        /* 获取双向队列的长度 */
        int size = deque.size();
        System.out.println("双向队列长度 size = " + size);

        /* 判断双向队列是否为空 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("双向队列是否为空 = " + isEmpty);
    }
}
