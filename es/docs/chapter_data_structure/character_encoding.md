# Codificación de caracteres *

En el sistema informático, todos los datos se almacenan en formato binario, y `char` no es una excepción. Para representar caracteres, necesitamos desarrollar un "conjunto de caracteres" que defina un mapeo uno a uno entre cada carácter y los números binarios. Con el conjunto de caracteres, las computadoras pueden convertir números binarios a caracteres consultando la tabla.

## Conjunto de caracteres ASCII

El <u>código ASCII</u> es uno de los primeros conjuntos de caracteres, conocido oficialmente como Código Estándar Americano para el Intercambio de Información. Utiliza 7 dígitos binarios (los 7 bits inferiores de un byte) para representar un carácter, lo que permite un máximo de 128 caracteres diferentes. Como se muestra en la figura a continuación, ASCII incluye letras mayúsculas y minúsculas en inglés, números del 0 al 9, varios signos de puntuación y ciertos caracteres de control (como nueva línea y tabulación).

![Código ASCII](character_encoding.assets/ascii_table.png)

Sin embargo, **ASCII solo puede representar caracteres en inglés**. Con la globalización de las computadoras, se desarrolló un conjunto de caracteres llamado <u>EASCII</u> para representar más idiomas. Se expande de la estructura de 7 bits de ASCII a 8 bits, lo que permite la representación de 256 caracteres.

Globalmente, se han introducido varios conjuntos de caracteres EASCII específicos de cada región. Los primeros 128 caracteres de estos conjuntos son consistentes con ASCII, mientras que los 128 caracteres restantes se definen de manera diferente para adaptarse a los requisitos de diferentes idiomas.

## Conjunto de caracteres GBK

Más tarde, se descubrió que **EASCII aún no podía satisfacer los requisitos de caracteres de muchos idiomas**. Por ejemplo, hay casi cien mil caracteres chinos, con varios miles de uso regular. En 1980, la Administración de Estandarización de China lanzó el conjunto de caracteres <u>GB2312</u>, que incluía 6763 caracteres chinos, satisfaciendo esencialmente las necesidades de procesamiento informático para el idioma chino.

Sin embargo, GB2312 no podía manejar algunos caracteres raros y tradicionales. El conjunto de caracteres <u>GBK</u> expande GB2312 e incluye 21886 caracteres chinos. En el esquema de codificación GBK, los caracteres ASCII se representan con un byte, mientras que los caracteres chinos usan dos bytes.

## Conjunto de caracteres Unicode

Con la rápida evolución de la tecnología informática y una plétora de conjuntos de caracteres y estándares de codificación, surgieron numerosos problemas. Por un lado, estos conjuntos de caracteres generalmente solo definían caracteres para idiomas específicos y no podían funcionar correctamente en entornos multilingües. Por otro lado, la existencia de múltiples estándares de conjuntos de caracteres para el mismo idioma causaba texto ilegible cuando la información se intercambiaba entre computadoras que usaban diferentes estándares de codificación.

Los investigadores de esa época pensaron: **¿Qué pasaría si se desarrollara un conjunto de caracteres completo que abarcara todos los idiomas y símbolos globales? ¿No resolvería esto los problemas asociados con los entornos multilingües y el texto ilegible?** Inspirado por esta idea, nació el extenso conjunto de caracteres, Unicode.

<u>Unicode</u> se conoce como "统一码" (Código Unificado) en chino, teóricamente capaz de albergar más de un millón de caracteres. Su objetivo es incorporar caracteres de todo el mundo en un solo conjunto, proporcionando un conjunto de caracteres universal para procesar y mostrar varios idiomas y reducir los problemas de texto ilegible debido a diferentes estándares de codificación.

Desde su lanzamiento en 1991, Unicode se ha expandido continuamente para incluir nuevos idiomas y caracteres. A partir de septiembre de 2022, Unicode contiene 149.186 caracteres, incluidos caracteres, símbolos e incluso emojis de varios idiomas. En el vasto conjunto de caracteres Unicode, los caracteres de uso común ocupan 2 bytes, mientras que algunos caracteres raros pueden ocupar 3 o incluso 4 bytes.

Unicode es un conjunto de caracteres universal que asigna un número (llamado "punto de código") a cada carácter, **pero no especifica cómo deben almacenarse estos puntos de código de caracteres en un sistema informático**. Uno podría preguntar: ¿Cómo interpreta un sistema los puntos de código Unicode de diferentes longitudes dentro de un texto? Por ejemplo, dado un código de 2 bytes, ¿cómo determina el sistema si representa un solo carácter de 2 bytes o dos caracteres de 1 byte?

**Una solución sencilla a este problema es almacenar todos los caracteres como codificaciones de igual longitud**. Como se muestra en la figura a continuación, cada carácter en "Hello" ocupa 1 byte, mientras que cada carácter en "算法" (algoritmo) ocupa 2 bytes. Podríamos codificar todos los caracteres en "Hello 算法" como 2 bytes rellenando los bits superiores con ceros. Este método permitiría al sistema interpretar un carácter cada 2 bytes, recuperando el contenido de la frase.

![Ejemplo de codificación Unicode](character_encoding.assets/unicode_hello_algo.png)

Sin embargo, como nos ha demostrado ASCII, la codificación en inglés solo requiere 1 byte. Usar el enfoque anterior duplicaría el espacio ocupado por el texto en inglés en comparación con la codificación ASCII, lo que es un desperdicio de espacio de memoria. Por lo tanto, se necesita un método de codificación Unicode más eficiente.

## Codificación UTF-8

Actualmente, UTF-8 se ha convertido en el método de codificación Unicode más utilizado internacionalmente. **Es una codificación de longitud variable**, que utiliza de 1 a 4 bytes para representar un carácter, dependiendo de la complejidad del carácter. Los caracteres ASCII solo necesitan 1 byte, las letras latinas y griegas requieren 2 bytes, los caracteres chinos de uso común necesitan 3 bytes y algunos otros caracteres raros necesitan 4 bytes.

Las reglas de codificación para UTF-8 no son complejas y se pueden dividir en dos casos:

- Para caracteres de 1 byte, establezca el bit más alto en $0$, y los 7 bits restantes en el punto de código Unicode. En particular, los caracteres ASCII ocupan los primeros 128 puntos de código en el conjunto Unicode. Esto significa que **la codificación UTF-8 es compatible con versiones anteriores de ASCII**. Esto implica que UTF-8 se puede usar para analizar texto ASCII antiguo.
- Para caracteres de longitud $n$ bytes (donde $n > 1$), establezca los $n$ bits más altos del primer byte en $1$, y el bit $(n + 1)^{\text{ésimo}}$ en $0$; a partir del segundo byte, establezca los 2 bits más altos de cada byte en $10$; el resto de los bits se utilizan para rellenar el punto de código Unicode.

La figura a continuación muestra la codificación UTF-8 para "Hello算法". Se puede observar que, dado que los $n$ bits más altos se establecen en $1$, el sistema puede determinar la longitud del carácter como $n$ contando el número de bits más altos establecidos en $1$.

Pero, ¿por qué establecer los 2 bits más altos de los bytes restantes en $10$? En realidad, este $10$ sirve como una especie de suma de verificación. Si el sistema comienza a analizar texto desde un byte incorrecto, el $10$ al principio del byte puede ayudar al sistema a detectar rápidamente anomalías.

La razón para usar $10$ como suma de verificación es que, según las reglas de codificación UTF-8, es imposible que los dos bits más altos de un carácter sean $10$. Esto se puede probar por contradicción: Si los dos bits más altos de un carácter son $10$, indica que la longitud del carácter es $1$, correspondiente a ASCII. Sin embargo, el bit más alto de un carácter ASCII debe ser $0$, lo que contradice la suposición.

![Ejemplo de codificación UTF-8](character_encoding.assets/utf-8_hello_algo.png)

Además de UTF-8, otros métodos de codificación comunes incluyen:

- **Codificación UTF-16**: Utiliza 2 o 4 bytes para representar un carácter. Todos los caracteres ASCII y los caracteres no ingleses de uso común se representan con 2 bytes; algunos caracteres requieren 4 bytes. Para caracteres de 2 bytes, la codificación UTF-16 es igual al punto de código Unicode.
- **Codificación UTF-32**: Cada carácter utiliza 4 bytes. Esto significa que UTF-32 ocupa más espacio que UTF-8 y UTF-16, especialmente para textos con una alta proporción de caracteres ASCII.

Desde la perspectiva del espacio de almacenamiento, usar UTF-8 para representar caracteres en inglés es muy eficiente porque solo requiere 1 byte; usar UTF-16 para codificar algunos caracteres no ingleses (como el chino) puede ser más eficiente porque solo requiere 2 bytes, mientras que UTF-8 podría necesitar 3 bytes.

Desde una perspectiva de compatibilidad, UTF-8 es el más versátil, con muchas herramientas y bibliotecas que priorizan UTF-8.

## Codificación de caracteres en lenguajes de programación

Históricamente, muchos lenguajes de programación utilizaban codificaciones de longitud fija como UTF-16 o UTF-32 para procesar cadenas durante la ejecución del programa. Esto permite que las cadenas se manejen como arreglos, ofreciendo varias ventajas:

-   **Acceso aleatorio**: Las cadenas codificadas en UTF-16 se pueden acceder aleatoriamente con facilidad. Para UTF-8, que es una codificación de longitud variable, localizar el carácter $i^{\text{ésimo}}$ requiere recorrer la cadena desde el principio hasta la posición $i^{\text{ésima}}$, lo que lleva un tiempo de $O(n)$.
-   **Conteo de caracteres**: Similar al acceso aleatorio, contar el número de caracteres en una cadena codificada en UTF-16 es una operación de $O(1)$. Sin embargo, contar caracteres en una cadena codificada en UTF-8 requiere recorrer toda la cadena.
-   **Operaciones de cadena**: Muchas operaciones de cadena como dividir, concatenar, insertar y eliminar son más fáciles en cadenas codificadas en UTF-16. Estas operaciones generalmente requieren cálculos adicionales en cadenas codificadas en UTF-8 para garantizar la validez de la codificación UTF-8.

El diseño de esquemas de codificación de caracteres en lenguajes de programación es un tema interesante que involucra varios factores:

- El tipo `String` de Java utiliza la codificación UTF-16, con cada carácter ocupando 2 bytes. Esto se basó en la creencia inicial de que 16 bits eran suficientes para representar todos los caracteres posibles y se demostró que era incorrecto más tarde. A medida que el estándar Unicode se expandió más allá de los 16 bits, los caracteres en Java ahora pueden representarse mediante un par de valores de 16 bits, conocidos como "pares sustitutos".
- JavaScript y TypeScript utilizan la codificación UTF-16 por razones similares a Java. Cuando Netscape introdujo JavaScript por primera vez en 1995, Unicode aún estaba en sus primeras etapas, y la codificación de 16 bits era suficiente para representar todos los caracteres Unicode.
- C# utiliza la codificación UTF-16, en gran parte porque la plataforma .NET, diseñada por Microsoft, y muchas tecnologías de Microsoft, incluido el sistema operativo Windows, utilizan ampliamente la codificación UTF-16.

Debido a la subestimación del recuento de caracteres, estos lenguajes tuvieron que usar "pares sustitutos" para representar caracteres Unicode que excedían los 16 bits. Este enfoque tiene sus inconvenientes: las cadenas que contienen pares sustitutos pueden tener caracteres que ocupan 2 o 4 bytes, perdiendo la ventaja de la codificación de longitud fija. Además, el manejo de pares sustitutos agrega complejidad y dificultad de depuración a la programación.

Para abordar estos desafíos, algunos lenguajes han adoptado estrategias de codificación alternativas:

- El tipo `str` de Python utiliza la codificación Unicode con una representación flexible donde la longitud de almacenamiento de los caracteres depende del punto de código Unicode más grande de la cadena. Si todos los caracteres son ASCII, cada carácter ocupa 1 byte, 2 bytes para caracteres dentro del Plano Multilingüe Básico (BMP) y 4 bytes para caracteres más allá del BMP.
- El tipo `string` de Go utiliza internamente la codificación UTF-8. Go también proporciona el tipo `rune` para representar puntos de código Unicode individuales.
- Los tipos `str` y `String` de Rust utilizan internamente la codificación UTF-8. Rust también ofrece el tipo `char` para puntos de código Unicode individuales.

Es importante tener en cuenta que la discusión anterior se refiere a cómo se almacenan las cadenas en los lenguajes de programación, **lo cual es diferente de cómo se almacenan las cadenas en archivos o se transmiten a través de redes**. Para el almacenamiento de archivos o la transmisión en red, las cadenas suelen codificarse en formato UTF-8 para una compatibilidad y eficiencia de espacio óptimas.
