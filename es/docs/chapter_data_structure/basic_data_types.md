# Tipos de datos básicos

Cuando hablamos de datos en computadoras, nos vienen a la mente varias formas como texto, imágenes, videos, voz y modelos 3D. A pesar de sus diferentes formas de organización, todos están compuestos por varios tipos de datos básicos.

**Los tipos de datos básicos son aquellos con los que la CPU puede operar directamente** y se utilizan directamente en los algoritmos, incluyendo principalmente los siguientes.

- Tipos enteros: `byte`, `short`, `int`, `long`.
- Tipos de punto flotante: `float`, `double`, utilizados para representar decimales.
- Tipo de carácter: `char`, utilizado para representar letras, puntuación e incluso emojis en varios idiomas.
- Tipo booleano: `bool`, utilizado para representar decisiones de "sí" o "no".

**Los tipos de datos básicos se almacenan en las computadoras en formato binario**. Un dígito binario es 1 bit. En la mayoría de los sistemas operativos modernos, 1 byte consta de 8 bits.

El rango de valores para los tipos de datos básicos depende del tamaño del espacio que ocupan. A continuación, tomamos Java como ejemplo.

- El tipo entero `byte` ocupa 1 byte = 8 bits y puede representar $2^8$ números.
- El tipo entero `int` ocupa 4 bytes = 32 bits y puede representar $2^{32}$ números.

La siguiente tabla enumera el espacio ocupado, el rango de valores y los valores predeterminados de varios tipos de datos básicos en Java. Si bien no es necesario memorizar esta tabla, se recomienda tener una comprensión general de ella y consultarla cuando sea necesario.

<p align="center"> Tabla <id> &nbsp; Espacio ocupado y rango de valores de los tipos de datos básicos </p>

| Tipo    | Símbolo  | Espacio ocupado | Valor mínimo            | Valor máximo           | Valor predeterminado |
| ------- | -------- | -------------- | ------------------------ | ----------------------- | -------------- |
| Entero  | `byte`   | 1 byte         | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | 0              |
|         | `short`  | 2 bytes        | $-2^{15}$                | $2^{15} - 1$            | 0              |
|         | `int`    | 4 bytes        | $-2^{31}$                | $2^{31} - 1$            | 0              |
|         | `long`   | 8 bytes        | $-2^{63}$                | $2^{63} - 1$            | 0              |
| Flotante | `float`  | 4 bytes        | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0\text{f}$  |
|         | `double` | 8 bytes        | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | 0.0            |
| Carácter | `char`   | 2 bytes        | 0                        | $2^{16} - 1$            | 0              |
| Booleano | `bool`   | 1 byte         | $\text{false}$           | $\text{true}$           | $\text{false}$ |

Tenga en cuenta que la tabla anterior es específica de los tipos de datos básicos de Java. Cada lenguaje de programación tiene sus propias definiciones de tipos de datos, que pueden diferir en el espacio ocupado, los rangos de valores y los valores predeterminados.

- En Python, el tipo entero `int` puede ser de cualquier tamaño, limitado solo por la memoria disponible; el `float` de punto flotante es de doble precisión de 64 bits; no existe el tipo `char`, ya que un solo carácter es en realidad una cadena `str` de longitud 1.
- C y C++ no especifican el tamaño de los tipos de datos básicos, varía con la implementación y la plataforma. La tabla anterior sigue el [modelo de datos](https://en.cppreference.com/w/cpp/language/types#Properties) LP64, utilizado para sistemas operativos Unix de 64 bits, incluidos Linux y macOS.
- El tamaño de `char` en C y C++ es de 1 byte, mientras que en la mayoría de los lenguajes de programación, depende del método de codificación de caracteres específico, como se detalla en el capítulo "Codificación de caracteres".
- Aunque representar un booleano solo requiere 1 bit (0 o 1), generalmente se almacena en la memoria como 1 byte. Esto se debe a que las CPU de las computadoras modernas suelen utilizar 1 byte como la unidad de memoria direccionable más pequeña.

Entonces, ¿cuál es la conexión entre los tipos de datos básicos y las estructuras de datos? Sabemos que las estructuras de datos son formas de organizar y almacenar datos en las computadoras. El enfoque aquí está en la "estructura" más que en los "datos".

Si queremos representar "una fila de números", naturalmente pensamos en usar un arreglo. Esto se debe a que la estructura lineal de un arreglo puede representar la adyacencia y el orden de los números, pero si el contenido almacenado es un entero `int`, un decimal `float` o un carácter `char`, es irrelevante para la "estructura de datos".

En otras palabras, **los tipos de datos básicos proporcionan el "tipo de contenido" de los datos, mientras que las estructuras de datos proporcionan la "forma de organizar" los datos**. Por ejemplo, en el siguiente código, usamos la misma estructura de datos (arreglo) para almacenar y representar diferentes tipos de datos básicos, incluidos `int`, `float`, `char`, `bool`, etc.

=== "Python"

    ```python title=""
    # Usando varios tipos de datos básicos para inicializar arreglos
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # Los caracteres de Python son en realidad cadenas de longitud 1
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Las listas de Python pueden almacenar libremente varios tipos de datos básicos y referencias a objetos
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

