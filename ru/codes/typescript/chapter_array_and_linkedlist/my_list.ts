/**
 * File: my_list.ts
 * Created Time: 2022-12-11
 * Author: Justin (xiefahit@gmail.com)
 */

/* Класс списка */
class MyList {
    private arr: Array<number>; // Массив (для хранения элементов списка)
    private _capacity: number = 10; // Вместимость списка
    private _size: number = 0; // Длина списка (текущее число элементов)
    private extendRatio: number = 2; // Коэффициент увеличения списка при каждом расширении

    /* Конструктор */
    constructor() {
        this.arr = new Array(this._capacity);
    }

    /* Получить длину списка (текущее число элементов) */
    public size(): number {
        return this._size;
    }

    /* Получить вместимость списка */
    public capacity(): number {
        return this._capacity;
    }

    /* Доступ к элементу */
    public get(index: number): number {
        // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
        if (index < 0 || index >= this._size) throw new Error('индекс выходит за границы');
        return this.arr[index];
    }

    /* Обновление элемента */
    public set(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('индекс выходит за границы');
        this.arr[index] = num;
    }

    /* Добавление элемента в конец */
    public add(num: number): void {
        // Если длина равна вместимости, требуется расширение
        if (this._size === this._capacity) this.extendCapacity();
        // Добавить новый элемент в конец списка
        this.arr[this._size] = num;
        this._size++;
    }

    /* Вставка элемента в середину */
    public insert(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('индекс выходит за границы');
        // При превышении вместимости по числу элементов запускается расширение
        if (this._size === this._capacity) {
            this.extendCapacity();
        }
        // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        for (let j = this._size - 1; j >= index; j--) {
            this.arr[j + 1] = this.arr[j];
        }
        // Обновить число элементов
        this.arr[index] = num;
        this._size++;
    }

    /* Удаление элемента */
    public remove(index: number): number {
        if (index < 0 || index >= this._size) throw new Error('индекс выходит за границы');
        let num = this.arr[index];
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (let j = index; j < this._size - 1; j++) {
            this.arr[j] = this.arr[j + 1];
        }
        // Обновить число элементов
        this._size--;
        // Вернуть удаленный элемент
        return num;
    }

    /* Расширение списка */
    public extendCapacity(): void {
        // Создать новый массив длиной size и скопировать в него исходный массив
        this.arr = this.arr.concat(
            new Array(this.capacity() * (this.extendRatio - 1))
        );
        // Обновить вместимость списка
        this._capacity = this.arr.length;
    }

    /* Преобразовать список в массив */
    public toArray(): number[] {
        let size = this.size();
        // Преобразовывать только элементы списка в пределах фактической длины
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Driver Code */
/* Инициализация списка */
const nums = new MyList();
/* Добавление элемента в конец */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `Список nums = ${nums.toArray()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}`
);

/* Вставка элемента в середину */
nums.insert(3, 6);
console.log(`После вставки числа 6 по индексу 3 nums = ${nums.toArray()}`);

/* Удаление элемента */
nums.remove(3);
console.log(`После удаления элемента по индексу 3 nums = ${nums.toArray()}`);

/* Доступ к элементу */
const num = nums.get(1);
console.log(`Элемент по индексу 1: num = ${num}`);

/* Обновление элемента */
nums.set(1, 0);
console.log(`После обновления элемента по индексу 1 до 0 nums = ${nums.toArray()}`);

/* Проверка механизма расширения */
for (let i = 0; i < 10; i++) {
    // При i = 5 длина списка превысит его вместимость, и в этот момент сработает механизм расширения
    nums.add(i);
}
console.log(
    `Список nums после увеличения вместимости = ${nums.toArray()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}`
);

export {};
