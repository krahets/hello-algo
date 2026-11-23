/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* 리스트 클래스 */
class MyList {
    private int[] arr;           // 배열(리스트 원소 저장)
    private int arrCapacity = 10;    // 리스트 용량
    private int arrSize = 0;         // 리스트 길이(현재 원소 개수)
    private readonly int extendRatio = 2;  // 리스트의 용량을 확장할 때마다 적용하는 배수

    /* 생성자 */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* 리스트 길이(현재 원소 개수) 반환*/
    public int Size() {
        return arrSize;
    }

    /* 리스트 용량 반환 */
    public int Capacity() {
        return arrCapacity;
    }

    /* 원소 접근 */
    public int Get(int index) {
        // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("인덱스가 범위를 벗어났다");
        return arr[index];
    }

    /* 원소 갱신 */
    public void Set(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("인덱스가 범위를 벗어났다");
        arr[index] = num;
    }

    /* 맨 뒤에 원소 추가 */
    public void Add(int num) {
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // 원소 개수를 갱신한다
        arrSize++;
    }

    /* 중간에 원소 삽입 */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("인덱스가 범위를 벗어났다");
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
        for (int j = arrSize - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 원소 개수를 갱신한다
        arrSize++;
    }

    /* 원소 삭제 */
    public int Remove(int index) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("인덱스가 범위를 벗어났다");
        int num = arr[index];
        // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 원소 개수를 갱신한다
        arrSize--;
        // 삭제한 원소를 반환한다
        return num;
    }

    /* 리스트 용량 확장 */
    public void ExtendCapacity() {
        // 길이가 arrCapacity * extendRatio인 배열을 만들고 기존 배열을 새 배열에 복사
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // 리스트 용량을 갱신한다
        arrCapacity = arr.Length;
    }

    /* 리스트를 배열로 변환 */
    public int[] ToArray() {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        int[] arr = new int[arrSize];
        for (int i = 0; i < arrSize; i++) {
            arr[i] = Get(i);
        }
        return arr;
    }
}

public class my_list {
    [Test]
    public void Test() {
        /* 리스트 초기화 */
        MyList nums = new();
        /* 맨 뒤에 원소 추가 */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("리스트 nums = " + string.Join(",", nums.ToArray()) +
                           " , 용량 = " + nums.Capacity() + " , 길이 = " + nums.Size());

        /* 중간에 원소 삽입 */
        nums.Insert(3, 6);
        Console.WriteLine("인덱스 3에 숫자 6을 삽입한 후 nums = " + string.Join(",", nums.ToArray()));

        /* 원소 삭제 */
        nums.Remove(3);
        Console.WriteLine("인덱스 3의 원소를 삭제한 후 nums = " + string.Join(",", nums.ToArray()));

        /* 원소 접근 */
        int num = nums.Get(1);
        Console.WriteLine("인덱스 1의 원소에 접근하여 얻은 num = " + num);

        /* 원소 갱신 */
        nums.Set(1, 0);
        Console.WriteLine("인덱스 1의 원소를 0으로 갱신한 후 nums = " + string.Join(",", nums.ToArray()));

        /* 용량 확장 동작 테스트 */
        for (int i = 0; i < 10; i++) {
            // i = 5일 때 리스트 길이가 용량을 초과하므로 용량 확장이 수행된다
            nums.Add(i);
        }
        Console.WriteLine("용량을 확장한 후 리스트 nums = " + string.Join(",", nums.ToArray()) +
                           " , 용량 = " + nums.Capacity() + " , 길이 = " + nums.Size());
    }
}
