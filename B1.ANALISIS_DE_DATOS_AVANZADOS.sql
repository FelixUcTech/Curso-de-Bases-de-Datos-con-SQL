-- Proceso inicial de trabajo con datos

-- EL PRIMER PROCESO Y MÁS TRADICIONAL DE USO Y ANÁLISIS DE DATOS SE LLAMA:
    -- BUSINESS INTELLIGENCE (BI)
        -- BI es un conjunto de tecnologías y herramientas que permiten analizar datos y tomar decisiones basadas en la información obtenida.
        -- Este proceso generalmente se basa en ETL (Extract, Transform, Load: Extracción, Transformación y Carga de datos), para mover la información donde el cliente la necesite.
        -- Las tareas comunes incluyen la visualización de datos, análisis de promedios, costos, facturación, etc.
        
-- OTRO PROCESO IMPORTANTE ES EL BIG DATA
    -- Aquí se analiza un volumen de datos mucho mayor, con procesos de limpieza de datos más complejos y transformaciones de alto nivel.
    -- Las reglas de negocio suelen ser más complejas debido a la cantidad y variedad de las fuentes de datos.
    -- Las fuentes de datos pueden provenir de diversas ubicaciones (IoT, redes sociales, bases de datos estructuradas, etc.).
    -- El Big Data se caracteriza por las 5 V: 
        -- Volumen: Gran cantidad de datos.
        -- Velocidad: La rapidez con la que se generan los datos.
        -- Variedad: Diferentes tipos de datos (estructurados, no estructurados, semiestructurados).
        -- Veracidad: La calidad y precisión de los datos.
        -- Valor: El valor que se puede obtener de los datos.

-- OTRO PROCESO: LA CIENCIA DE DATOS
    -- La ciencia de datos busca patrones en la información, con el objetivo de proporcionar insights útiles a los altos cargos de la organización.
    -- Se enfoca en mejorar el rendimiento del producto o servicio.
    
-- MACHINE LEARNING (ML)
    -- El Machine Learning genera modelos predictivos y de recomendación a partir de los datos.
    -- Por ejemplo, cuando un usuario habla sobre un tema en una aplicación, ML puede empezar a mostrar información relevante sobre ese tema.
    -- Este proceso facilita muchas cosas a nivel de industria y negocios.
    -- El Machine Learning tiene múltiples aplicaciones en la optimización de procesos y toma de decisiones.

-- DEEP LEARNING
    -- Es una subcategoría del Machine Learning que utiliza redes neuronales profundas para el aprendizaje y predicción de patrones complejos en los datos.
    
-- INTELIGENCIA ARTIFICIAL (IA)
    -- Se refiere al uso de algoritmos y modelos avanzados para realizar tareas que normalmente requieren inteligencia humana, como reconocimiento de voz, visión por computadora, entre otros.

-- NOTA: 
-- Es importante tener un ciclo de procesamiento de datos bien definido. Existen diferentes tipos de arquitecturas para manejar este ciclo:

    -- On-premise:
        -- Infraestructura local, dentro de las instalaciones de la empresa.
        -- Componentes comunes:
            -- Analysis Services: Análisis de datos.
            -- Reporting Services: Servicios de generación de reportes.
            -- Integration Services: Integración y transformación de datos (ETL).
            -- Power BI: Herramienta de visualización de datos.

    -- Cloud:
        -- Infraestructura en la nube.
        -- Ejemplos de plataformas:
            -- Google Cloud Platform (GCP).
            -- Amazon Web Services (AWS).
            -- Microsoft Azure.
            
    -- Arquitecturas híbridas:
        -- Combinación de infraestructura on-premise y en la nube.

-- EJEMPLO DE UN PROCESO DE DATOS:
-- 1. Extraer los datos en el Data Lake.
-- 2. Utilizar una herramienta como Databricks para la transformación de la información.
-- 3. Realizar el proceso de carga (ETL) utilizando herramientas como SixMags.
-- 4. Complementar con visualización de datos usando Power BI o una herramienta similar.

-- Este mismo enfoque se puede aplicar donde sea necesario, siempre que se cuente con información valiosa para desarrollar los puntos mencionados.
-- No olvides corregir cualquier error que encuentres en tipografía y terminología, según las necesidades de tu proyecto.

-- VISUALIZACIÓN DE DATOS
-- La visualización de datos es fundamental para interpretar de manera eficiente la información almacenada en las bases de datos.
-- Permite hacer conexiones directas a las fuentes de datos para que las visualizaciones se actualicen automáticamente a medida que los datos cambian.
-- Esto es especialmente importante cuando trabajamos con Data Flows o flujos de datos, ya que facilita el monitoreo en tiempo real de los cambios en la información.

-- Algunas herramientas de visualización de datos populares incluyen:
-- 1. Power BI: Permite crear dashboards interactivos que se conectan a diversas fuentes de datos (SQL Server, MySQL, etc.).
-- 2. Tableau: Conocido por su capacidad para generar gráficos avanzados y análisis de grandes volúmenes de datos.
-- 3. Grafana: Utilizada para la visualización de métricas, especialmente en entornos de monitoreo y observabilidad.

-- En el desarrollo de estas visualizaciones, es clave:
-- 1. Establecer **conexiones directas** que permitan la actualización automática de los datos en los reportes.
-- 2. Mantener actualizadas las bases de datos a través de flujos de trabajo optimizados (Data Flows), garantizando que la información que llega a la visualización sea precisa y oportuna.
-- 3. Integrar estas visualizaciones dentro de un proceso continuo de análisis de datos, apoyado por un control de versiones con Git.

-- Ejemplo de flujo de trabajo integrado:
-- 1. Los datos se almacenan y transforman en una base de datos SQL.
-- 2. Los cambios y actualizaciones a los scripts SQL son gestionados con Git, manteniendo un control de versiones preciso.
-- 3. Las visualizaciones de los datos se conectan directamente a la base de datos, actualizando en tiempo real los dashboards para la toma de decisiones.

-- Todo esto contribuye a un sistema integrado de análisis y visualización de datos, donde SQL se usa para gestionar la información, Git para controlar versiones y la visualización para facilitar la interpretación de los resultados.
