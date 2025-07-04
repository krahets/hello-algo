# Pautas de contribución para la traducción

Estamos trabajando en la traducción de "Hello Algo" a varios idiomas con el siguiente enfoque:

1. **Traducción con IA**: Realizar una primera pasada de traducciones utilizando modelos de lenguaje grandes.
2. **Optimización humana**: Refinar manualmente los resultados generados por la máquina para garantizar la autenticidad y la precisión.
3. **Revisión de pull requests**: La traducción optimizada será revisada por los revisores a través del flujo de trabajo de pull requests de GitHub.
4. Repetir los pasos `2.` y `3.` para futuras mejoras.

<img width="650" alt="translation_pipeline" src="https://github.com/user-attachments/assets/201930ef-723e-4179-b670-e5a084a8211e">

## Únase a nosotros

Buscamos colaboradores que cumplan con los siguientes criterios.

- **Conocimientos técnicos**: Sólida base en ciencias de la computación, particularmente en estructuras de datos y algoritmos.
- **Habilidades lingüísticas**: Dominio nativo del idioma de destino con un nivel profesional de inglés, o hablante nativo de inglés.
- **Tiempo disponible**: Dedicación a contribuir a proyectos de código abierto con la voluntad de participar en esfuerzos de traducción a largo plazo.

Es decir, nuestros colaboradores son científicos de la computación, ingenieros y estudiantes de diferentes orígenes lingüísticos, y sus objetivos tienen diferentes puntos de enfoque:

- **Hablantes nativos del idioma de origen con un nivel de inglés profesional**: Garantizar la precisión y la coherencia de la traducción entre las versiones de origen y de destino.
- **Hablantes nativos del idioma de destino**: Mejorar la autenticidad y la fluidez del contenido del idioma de destino para que fluya de forma natural y sea atractivo.

> [!note]
> Si está interesado en unirse a nosotros, no dude en ponerse en contacto conmigo a través de krahetx@gmail.com o WeChat `krahets-jyd`.

## Proceso de traducción

> [!important]
> Antes de empezar, asegúrese de que se siente cómodo con el flujo de trabajo de los pull requests de GitHub y de que ha leído las "Normas de traducción" y el "Pseudocódigo para la traducción" que aparecen a continuación.

1. **Asignación de tareas**: Autoasígnese una tarea en el espacio de trabajo de Notion.
2. **Traducción**: Optimice la traducción en su PC local, consultando la sección "Pseudocódigo de traducción" más abajo para obtener más detalles.
3. **Revisión por pares**: Revise cuidadosamente sus cambios antes de enviar un Pull Request (PR). El PR se fusionará en la rama principal después de la aprobación de dos revisores.

## Normas de traducción

> [!tip]
> **La "Precisión" y la "Autenticidad" son gestionadas principalmente por hablantes nativos del idioma de origen y hablantes nativos del idioma de destino, respectivamente.**
>
> En algunos casos, "Precisión (coherencia)" y "Autenticidad" representan una compensación, en la que la optimización de un aspecto podría afectar significativamente al otro. En tales casos, por favor, deje un comentario en el pull request para su discusión.

**Precisión**:

- Mantener la coherencia en la terminología en todas las traducciones consultando la sección [Terminología](https://www.hello-algo.com/chapter_appendix/terminology/) del apéndice.
- Priorizar la precisión técnica y mantener el tono y el estilo de la versión original.
- Tener siempre en cuenta el contenido y el contexto de la versión original para garantizar que las modificaciones sean precisas y completas.

**Autenticidad**:

- Las traducciones deben fluir con naturalidad y fluidez, respetando las convenciones de expresión del idioma de destino.
- Considerar siempre el contexto del contenido para armonizar el artículo.
- Ser consciente de las diferencias culturales entre los idiomas. 
- Si la frase optimizada pudiera alterar el significado original, por favor, añada un comentario para su discusión.

**Formato**:

- Las figuras y las tablas se numerarán automáticamente durante el despliegue, por lo que NO las numere manualmente.
- Cada PR debe cubrir al menos un documento completo para garantizar tamaños de revisión manejables, excepto para las correcciones de errores.

**Revisión**:

- Durante la revisión, priorice la evaluación de los cambios, consultando el contexto circundante según sea necesario.
- Aprender de las perspectivas de los demás puede conducir a mejores traducciones y a resultados más cohesivos.

## Pseudocódigo de traducción

El siguiente pseudocódigo modela los pasos de un proceso de traducción típico.

```python
def optimize_translation(markdown_texts, lang_skill):
    """Optimizar la traducción"""
    for sentence in markdown_texts:
        """La precisión es gestionada principalmente por hablantes nativos del idioma de origen"""
        if lang_skill is "Hablante nativo del idioma de origen + nivel de inglés profesional":
            if is_accurate_translation(sentence):
                continue
            # Optimizar la precisión
            result = refine_accuracy(sentence)

        """
        La autenticidad es gestionada principalmente por hablantes nativos del idioma de destino
        y secundariamente por hablantes nativos del idioma de origen
        """
        if is_authentic_translation(sentence):
            continue
        # Optimizar la autenticidad
        result = refine_authenticity(sentence)
        # Añadir comentarios en el PR si puede romper la coherencia
        if break_consistency(result):
            add_comment(description)

    pull_request = submit_pull_request(markdown_texts)
    # El PR se fusionará después de ser aprobado por >= 2 revisores
    while count_approvals(pull_request) < 2:
          continue
    merge(pull_request)
```

El siguiente pseudocódigo es para los revisores:

```python
def review_pull_requests(pull_request, lang_skill):
    """Revisar el PR"""
    # Recorrer todos los cambios en el PR
    while is_anything_left_to_review(pull_request):
        change = get_next_change(pull_request)

        """La precisión es gestionada principalmente por hablantes nativos del idioma de origen"""
        if lang_skill is "Hablante nativo del idioma de origen + nivel de inglés profesional":
            # Comprobar la precisión (coherencia) entre las versiones de origen y de destino
            if is_accurate_translation(change):
                continue
            # Optimizar la precisión (coherencia)
            result = refine_accuracy(change)
            # Añadir comentarios en el PR
            add_comment(result)

        """
        La autenticidad es gestionada principalmente por hablantes nativos del idioma de destino
        y secundariamente por hablantes nativos del idioma de origen
        """
        if is_authentic_translation(change):
            continue
        # Optimizar la autenticidad si no es una traducción auténtica
        result = refine_authenticity(change)
        # Añadir comentarios en el PR
        add_comment(result)

    approve(pull_request)
```