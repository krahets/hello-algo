/**
 * File: my_list.ts
 * Created Time: 2022-12-11
 * Author: Justin (xiefahit@gmail.com)
 */

/* Класс списка */
class MyList {
    private arr: Array<number>; // Массив (хранит элементы списка)
    private _capacity: number = 10; // Вместимость списка
    private _size: number = 0; // Длина списка (текущее количество элементов)
    private extendRatio: number = 2; // Коэффициент расширения списка при каждом увеличении

    /* Конструктор */
    constructor() {
        this.arr = new Array(this._capacity);
    }

    /* Получить длину списка (текущее количество элементов) */
    public size(): number {
        return this._size;
    }

    /* Получить вместимость списка */
    public capacity(): number {
        return this._capacity;
    }

    /* Получить доступ к элементу */
    public get(index: number): number {
        // Если индекс выходит за границы, выбросить исключение; далее аналогично
        if (index < 0 || index >= this._size) throw new Error('Индекс вне допустимого диапазона');
        return this.arr[index];
    }

    /* Обновить элемент */
    public set(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('Индекс вне допустимого диапазона');
        this.arr[index] = num;
    }

    /* Добавить элемент в конец */
    public add(num: number): void {
        // Если длина равна вместимости, требуется расширение
        if (this._size === this._capacity) this.extendCapacity();
        // Добавить новый элемент в конец списка
        this.arr[this._size] = num;
        this._size++;
    }

    /* Вставить элемент в середину */
    public insert(index: number, num: number): void {
        if (index < 0 || index >= this._size) throw new Error('Индекс вне допустимого диапазона');
        // Если число элементов превышает вместимость, запустить механизм расширения
        if (this._size === this._capacity) {
            this.extendCapacity();
        }
        // Сдвинуть на одну позицию назад элемент с индексом index и все последующие элементы
        for (let j = this._size - 1; j >= index; j--) {
            this.arr[j + 1] = this.arr[j];
        }
        // Обновить количество элементов
        this.arr[index] = num;
        this._size++;
    }

    /* Удалить элемент */
    public remove(index: number): number {
        if (index < 0 || index >= this._size) throw new Error('Индекс вне допустимого диапазона');
        let num = this.arr[index];
        // Сдвинуть на одну позицию вперед все элементы после индекса index
        for (let j = index; j < this._size - 1; j++) {
            this.arr[j] = this.arr[j + 1];
        }
        // Обновить количество элементов
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
        // ОбновитьВместимость списка
        this._capacity = this.arr.length;
    }

    /* Преобразовать список в массив */
    public toArray(): number[] {
        let size = this.size();
        // Преобразовать только элементы списка в пределах действительной длины
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Driver Code */
/* Инициализировать список */
const nums = new MyList();
/* Добавить элемент в конец */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `список nums = ${nums.toArray()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}`
);

/* Вставить элемент в середину */
nums.insert(3, 6);
console.log(`После вставки числа 6 по индексу 3 получаем nums = ${nums.toArray()}`);

/* Удалить элемент */
nums.remove(3);
console.log(`Удалитьиндекс 3 поэлемент, получаем nums = ${nums.toArray()}`);

/* Получить доступ к элементу */
const num = nums.get(1);
console.log(`обратиться киндекс 1 поэлемент, получаем num = ${num}`);

/* Обновить элемент */
nums.set(1, 0);
console.log(`После обновления элемента по индексу 1 на 0 получаем nums = ${nums.toArray()}`);

/* Проверить механизм расширения */
for (let i = 0; i < 10; i++) {
    // При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
    nums.add(i);
}
console.log(
    `Список nums после расширения = ${nums.toArray()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}`
);

export {};
