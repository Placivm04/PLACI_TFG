======================================================================
Trabajo Fin de Grado
======================================================================

Titulo:
Análisis del rendimiento y consumo de modelos de IA para detección de
intrusiones

Autor:
Placido Velasco Munoz

Titulacion:
Grado en Ingenieria Informatica - Mencion en Computacion

Universidad:
Universidad de Malaga, ETSI Informatica

Tutores:
Dr. Rodrigo Roman Castro
Dr. Francisco Jose Jaime Rodriguez

======================================================================
Descripcion del proyecto
======================================================================

Este Trabajo Fin de Grado estudia el uso de modelos de inteligencia
artificial y aprendizaje automatico en sistemas de deteccion de
intrusiones (IDS). El objetivo principal es comparar distintos modelos no
solo por su rendimiento predictivo, sino tambien por su coste
computacional, teniendo en cuenta metricas como el uso de CPU, la latencia
de inferencia y el consumo de memoria.

El trabajo parte del analisis de conjuntos de datos realistas y utilizados
en investigacion de ciberseguridad. A partir de ellos se entrenan y evaluan
modelos de distintas familias, incluyendo ensembles de arboles, SVM,
perceptrones multicapa y redes convolucionales 1-D. Para mejorar la
configuracion de los modelos se emplea Optuna, con especial interes en la
busqueda de compromisos entre precision y eficiencia mediante optimizacion
multiobjetivo y frontera de Pareto.

Ademas del rendimiento en condiciones normales, el proyecto analiza la
robustez de los modelos frente a ataques de evasion adversaria, como FGSM
y PGD. Con ello se busca estudiar como se degrada el comportamiento de los
modelos cuando reciben muestras modificadas para intentar evadir la
deteccion.

======================================================================
Palabras clave
======================================================================

- Sistemas de deteccion de intrusiones (IDS)
- Aprendizaje automatico
- Internet de las Cosas (IoT)
- Ataques adversarios
- Eficiencia computacional
- Frontera de Pareto

======================================================================
Estructura principal
======================================================================

main.tex
  Documento principal de la memoria.

sections/Desarrollo/
  Capitulos relacionados con la metodologia, configuracion de modelos,
  optimizacion de hiperparametros, resultados y ataques de evasion.

sections/Estudio_del_arte/
  Revision de modelos, tecnicas y conjuntos de datos utilizados.

sections/Conclusiones/
  Agradecimientos, conclusiones y lineas futuras.

sections/Referencias/references.bib
  Bibliografia utilizada por la memoria.

images/
  Figuras, graficas y recursos visuales incluidos en el documento.

template/
  Plantilla LaTeX de la UMA empleada para portada, estilo y formato.

======================================================================
Notas
======================================================================

La memoria está redactada en castellano e incluye resumen y palabras clave
en castellano e inglés. El objetivo del repositorio es conservar el código
fuente LaTeX, las secciones de la memoria, las referencias y las imágenes
necesarias para reproducir el documento final.