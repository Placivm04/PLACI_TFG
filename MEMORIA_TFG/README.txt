======================================================================
UMA – ETSI Informática
======================================================================

Gracias por usar mi plantilla para tu Trabajo Fin de Grado. Agradezco prfundamente la colaboración del Dr. Carlos Manuel Rossi Jiménez y el 
Dr. David Bueno Vallejo. 

Si tienes cualquier comentario para mejorarla, o quieres hacerlo tú mism@, 
puedes ponerte en contacto conmigo en mpascual@uma.es, o crear un pull 
request en https://github.com/MarioPasc/UMA-TFG-ETSI-Templates 

El proyecto puede tardar bastante en compilar por primera vez, es normal. 
Una vez se hagan varias compilaciones, la caché de Overleaf se llenará y
cargará más rápido. 

Por favor, **lee con detenimiento el resto de este fichero**, contiene información importante. 

NOTA: En octubre de 2025 overleaf redujo la duración de compilación del plan gratis. Si estás teniendo problemas para compilar el proyecto, porque tu TFG sea demasiado largo, ponte en contacto con tu tutor, es posible que tenga el plan premium de Overleaf, y, al crear un documento con el plan premium, y compartirlo contigo, tendrás acceso al tiempo de compilación del plan premium. 

======================================================================
Estructura de la memoria (Art. III.2 del Reglamento de TFG)
======================================================================
La memoria podrá elaborarse en castellano o en ingles, y contendrá obligatoriamente las siguientes partes:
- Portada.
- Resumen y palabras claves.
    - Resumen del TFG: con una extensión entre 150 y 300 palabras, en castellano e inglés.
    - Lista de entre 3 y 5 palabras clave (para catalogación bibliográfica), en castellano e inglés.
- Cuerpo del TFG: parte principal de la memoria (extensión recomendada entre 30 y 50 páginas) con sus apartados en función de la modalidad, pero que incluirá como mínimo los siguientes capítulos: 
    1. Introducción (incluyendo la motivación y objetivos del TFG, así como la estructura del resto de capítulos de la memoria).
    2. Estudio del arte o tecnologías a utilizar (esta parte puede incluirse como una sección del capítulo de Introducción o como un capítulo independiente).
    3. Metodología de trabajo empleada en el TFG (esta parte también puede incluirse como una sección del capítulo de Introducción o como un capítulo independiente).
    4. Capítulos donde se estructure las fases del desarrollo, así como pruebas y resultados (si procede). 
    5. Conclusiones y Líneas Futuras. En caso de redactarse la memoria en inglés, las conclusiones y líneas futuras deben redactarse también en castellano.
- Bibliografía.
- Apéndices: información complementaria que no tenga cabida en el cuerpo del TFG, tales como listados, descripciones detalladas, manuales de usuario y programador, etc. 
- Contraportada.

Fuente: https://www.uma.es/etsi-informatica/info/72589/tfg-memoria-y-defensa/

======================================================================
Consideraciones para generar la portada correctamente
======================================================================

Por favor, explora los ficheros de ejemplo adjuntos en examples/

1. ¿Tienes tutor y cotutor?: main.tex está ya listo para manejar este caso, dado que suele ser el más común. Sin embargo, tienes un ejemplo de cómo generar las portadas en examples/tutor_cotutor.tex
2. ¿Tienes solo un tutor?: Accede a examples/tutor.tex, reemplaza en main.tex la sección correspondiente desde el inicio del fichero hasta la sección "Abstract" por el contenido de examples/tutor.tex de esa misma selección.
3. ¿Tienes dos tutores?: Accede a examples/tutor_tutor.tex, reemplaza en main.tex la sección correspondiente desde el inicio del fichero hasta la sección "Abstract" por el contenido de examples/tutor_tutor.tex de esa misma selección.
4. ¿Tienes un tutor y un colaborador externo?: Accede a examples/tutor_colaborador.tex, reemplaza en main.tex la sección correspondiente desde el inicio del fichero hasta la sección "Abstract" por el contenido de examples/tutor_colaborador.tex de esa misma selección.

======================================================================
Modo Impresión / Encuadernar
======================================================================
Para generar una versión de tu TFG que sea amigable con la encuadernación, simplemente tienes que modificar esta línea de tu main.tex:

CAMBIA: \usepackage{template/sty_files/template-TFGenglish-uma}
POR: \usepackage[encuadernar]{template/sty_files/template-TFGenglish-uma}

======================================================================
Esta plantilla no hubiera sido posible sin la colaboración constante 
del Dr. Carlos Rossi y el Dr. David Bueno Vallejo. 

Si encuentras alguna errata, o consideras algún frente de mejora, 
recuerda que puedes mandar tus comentarios a:

Mario Pascual González 
Mail: <mpascual@uma.es>
Página Personal: <https://mariopasc.github.io/>
======================================================================