# Generación de Reportes de Laboratorio JULIA+PANDOC

## Descripción
Este repositorio está constituido por una serie de documentos los cuales en su conjunto forman una plantilla de trabajo para la elaboración de reportes de laboratorio, que podrá ser usado en las diferentes clases ofrecidas por el departamento de física de la Universidad Nacional Autónoma de Honduras. 

Para el uso de plantilla se ha preparado una serie de [videotutoriales]() en los cuales se explica:
- La preparación del ambiente del trabajo (instalación de las herramientas a utilizar en los diferentes sistemas operativos).
- Explicación general de los diversos documentos que constituyen la plantilla. 
- Explicación del uso de  Pandoc para la generación del informe de laboratorio.
- Explicación de Markdown el cual es un lenguaje de marcado ligero (exponiendo los principales comandos a utilizar para dar formato al texto).

A la plantilla poco a poco se irá dotando de características, de modo que se pueda generar un documento profesional para la elaboración de informes. El objetivo final será: el uso del lenguaje de programación Julia junto con Pandoc, de modo que el tratamiento de datos experimentales (cálculos) y gráficos puedan ser incorporados al documento desde un solo documento fuente (un archivo markdown o con extensión 'md').

## Requerimientos
 Para el uso de la plantilla se requiere una adecuada preparación del espacio de trabajo, es decir, la instalación de las siguientes utilidades:
- Pandoc. 
    En esencia es un conversor de documentos entre diferentes formatos. En esta plantilla Pandoc será utilizado para convertir un archivo 'markdown' (con el contenido del informe)  a 'pdf'.
- Pandoc-plot
    Es una librería pensada para ser usada junto con Pandoc, añadiendo gráficos que son realizados con diferentes lenguajes de programación entre ellos Julia.
- Pandoc-crossref
    Es una librería pensada para ser usada junto con Pandoc, posibilitando el enriquecimiento del documento 'markdown' de modo que puedan hacerse referencias entre los diferentes elementos que conforman el documento que se está creando.
- LaTeX
    Es un sistema de composición tipográfica de alta calidad; incluye funcionalidades diseñadas para la producción de documentación técnica y científica,  siendo el estándar para la comunicación y publicación de documentos científicos. Este es usado por LaTeX para la conversión del documento 'markdown' a 'pdf', convirtiendo primeramente a un documento 'LaTeX' para luego generar el 'pdf'. 
- Anaconda
    El constituye un administrador de paquetes, con este administrador serán instalados diferentes utilidades mencionadas anteriormente.

## Pasos para la preparación del ambiente de trabajo
* Instalar de LaTeX, el cual difiere del sistema operativo que se esté usando.
* Instalar Anaconda, el cual es un gestor de paquetes y será usado para la instalación de las utilidades que siguen.
* Instalar Pandoc mediante `conda install -c conda-forge pandoc`
* Instalar Pandoc mediante `conda install -c conda-forge pandoc-plot`
* Instalar Pandoc mediante `conda install -c conda-forge pandoc-crossref`

## Pasos para el uso de la plantilla
* Descargar los documentos de este repositorio al directorio deseado (descomprimir la carpeta, en caso que lo haya decargado como ZIP). 
* Colocar la carpeta 'plantilla_informe' en el directorio de trabajo deseado. Tome en cuenta que la plantilla se constituye por diferentes **archivos ocultos los cuales no deben ser modificados**.
* Modificar el archivo 'test.md' conformando el documento y sustituyendo con la infomación requerida.
* Ejecutar en la consola el siguiente comando `pandoc -d .option.yaml test.md -o test.pdf`, con el directorio de la terminal ubicada en la carpeta 'plantilla_informe'. El documento'.option.yaml' es un archivo de configuración para que Pandoc realice la conversión, este arachivo no debe ser modificado. El documento 'test.md' puede renombrarlo, en dicho caso ese nombre debe ser usado con el comando mostrado; por ejemplo, considere que el archivo 'test.md' fue renombrado como 'primer_informe.md' entonces ahora el comando a usar será  `pandoc -d .option.yaml primer_informe.md -o primer_informe.pdf`.
