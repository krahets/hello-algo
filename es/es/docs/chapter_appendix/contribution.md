# Contribución

Debido a las limitaciones del autor, algunas omisiones y errores son inevitables en este libro. Si encuentra errores de ortografía, enlaces rotos, contenido faltante, explicaciones poco claras o estructuras de texto poco claras, por favor, ayúdenme a corregir el texto para proporcionar a los lectores un mejor recurso de aprendizaje.

Los ID de GitHub de todos los [colaboradores](https://github.com/krahets/hello-algo/graphs/contributors) se mostrarán en el repositorio, la web y las versiones en PDF de la página de inicio de este libro para agradecerles sus contribuciones desinteresadas a la comunidad de código abierto.

!!! success "El encanto del código abierto"

    El intervalo entre dos impresiones de un libro en papel suele ser largo, lo que hace que las actualizaciones de contenido sean muy inconvenientes.
    
    En este libro de código abierto, sin embargo, el ciclo de actualización de contenido se acorta a solo unos pocos días o incluso horas.

### Ajuste fino del contenido

Como se muestra en la figura a continuación, hay un "icono de edición" en la esquina superior derecha de cada página. Puede seguir estos pasos para modificar texto o código.

1.  Haga clic en el "icono de edición". Si se le pide que "bifurque este repositorio", acepte hacerlo.
2.  Modifique el contenido del archivo fuente Markdown, verifique la precisión del contenido e intente mantener el formato consistente.
3.  Rellene la descripción de la modificación en la parte inferior de la página, luego haga clic en el botón "Proponer cambio de archivo". Después de que la página se redirija, haga clic en el botón "Crear solicitud de extracción" para iniciar la solicitud de extracción.

![Botón de edición de página](contribution.assets/edit_markdown.png)

Las figuras no se pueden modificar directamente y requieren la creación de un nuevo [Issue](https://github.com/krahets/hello-algo/issues) o un comentario para describir el problema. Volveremos a dibujar y reemplazar las figuras lo antes posible.

### Creación de contenido

Si está interesado en participar en este proyecto de código abierto, incluida la traducción de código a otros lenguajes de programación o la expansión del contenido de los artículos, entonces debe implementarse el siguiente flujo de trabajo de solicitud de extracción.

1.  Inicie sesión en GitHub y bifurque el [repositorio de código](https://github.com/krahets/hello-algo) de este libro a su cuenta personal.
2.  Vaya a la página web de su repositorio bifurcado y use el comando `git clone` para clonar el repositorio en su máquina local.
3.  Cree contenido localmente y realice pruebas completas para verificar la corrección del código.
4.  Confirme los cambios realizados localmente, luego envíelos al repositorio remoto.
5.  Actualice la página web del repositorio y haga clic en el botón "Crear solicitud de extracción" para iniciar la solicitud de extracción.

### Despliegue de Docker

En el directorio raíz `hello-algo`, ejecute el siguiente script de Docker para acceder al proyecto en `http://localhost:8000`:

```shell
docker-compose up -d
```

Use el siguiente comando para eliminar el despliegue:

```shell
docker-compose down
```
