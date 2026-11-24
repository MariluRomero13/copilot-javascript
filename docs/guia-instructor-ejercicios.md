# Guía del instructor: ejercicios paso a paso

Cada ejercicio sigue el mismo ritmo de cinco pasos, y esta guía te da el guion de cada uno con las diapositivas y los archivos del repo de alumnos. Complementa a la [guía por bloques](guia-instructor.md).

## Cómo usar esta guía

1. **Presenta** el ejercicio con su diapositiva (2 min): objetivo, tiempo y qué se entrega.
2. **Demuestra** en vivo lo mínimo necesario (3 a 5 min).
3. **Que arranquen.** Les indicas el `README.md` de su carpeta en `ejercicios/`.
4. **Circula** con las señales de alerta de cada ejercicio.
5. **Cierra** (3 min) con la pregunta final, para que cada alumno diga qué hizo Copilot que no esperaba.

| Ejercicio | Diapositivas | Carpeta de alumnos | Tiempo |
| --- | --- | --- | --- |
| 0. Verificar el entorno | Antes del curso | `ejercicios/ej0-verificar-entorno/` | 10 min |
| 1. Autocompletado | 18, 19 y 20 | `ejercicios/ej1-autocompletado/` | 30 + 50 min |
| 2. Chat, instrucciones y skill | 29 a 32 | `ejercicios/ej2-chat-contexto-prompting/` y `.github/` | 30 min |
| 3. Código legacy | 33 y 34 | `ejercicios/ej3-codigo-legacy/` | 30 min |
| 4. Descuentos con el agente | 35 a 39 | `src/` | 55 min |
| 5. Mockup a React | 40 y 41 | `web/` | 30 min |
| Opcional: revisar un PR | 44 | `ejercicios/ej-opcional-revision-pr/` | 20 min |

**Regla para todos:** commit al terminar cada ejercicio (`git add -A && git commit -m "Ejercicio N"`) y trabajar en la rama `main` de su propia copia, nunca en el repo del instructor.

## Ejercicio 0: verificar el entorno (10 min)

El objetivo es descubrir los problemas de entorno antes del autocompletado, porque después todos van a ritmos distintos. Idealmente se hace antes del curso; si no, es lo primero del día.

**Antes de empezar:** confirma que la plantilla es pública o que todos tienen acceso, y que cada alumno ya tiene su copia (*Use this template*).

1. Pide que abran su copia en Codespaces (o en VS Code local).
2. Que ejecuten `npm install` y `npm test`. Deben ver **3 pruebas pasando**.
3. Que ejecuten `npm start` y abran `http://localhost:5000/products`. Después `Ctrl+C`.
4. **Comprobación de Copilot,** en este orden:
    - Escribir un comentario en un archivo y ver el texto gris (ghost text).
    - Abrir el chat (`Ctrl+Alt+I`) y confirmar que ven el selector de agentes (Agent, Plan, Ask).
    - Ejecutar *Chat: Open Customizations* desde la paleta (`Ctrl+Shift+P`).
5. Primer commit de control: `git commit --allow-empty -m "Entorno verificado"`.

**Señales de alerta**

- Node.js menor a 20 o instalación sin terminar: el alumno no pasará `npm test`.
- No ven el selector de agentes: versión antigua de VS Code o distinto destino de sesión. Pide que actualicen o revisa el selector del chat.
- Licencia inactiva: se nota porque no hay ghost text ni respuesta en el chat.

**Cierre:** pide que levanten la mano quienes **no** terminaron los cinco pasos y resuélvelo antes de seguir.

## Ejercicio 1: autocompletado (30 + 50 min)

**Diapositivas:** 18 (tres técnicas), 19 (cuatro teclas) y 20 (el ejercicio). **Regla del ejercicio:** nada de chat, solo autocompletado, comentarios y NES.

**Antes de empezar (5 min)**

1. Muestra las cuatro teclas de la diapositiva 19: `Tab`, `Esc`, `Alt + ]` y `Ctrl + Der.` En teclados en español `Alt + ]` suele chocar, así que pide que lo reasignen si no responde.
2. Abre `tramoA_ghostText.js` y haz una demo: borra el cuerpo de una función y deja que Copilot la complete.

**Tramo A: ghost text (10 min)** · `tramoA_ghostText.js`

1. Que borren el cuerpo de cada función y escriban solo la firma.
2. Que practiquen aceptar, descartar, alternar y aceptar palabra por palabra.
3. En `esEmailValido`, que prueben `a@b`, `a@@b.com` y un correo vacío. La idea es que una sugerencia puede verse bien y estar mal.
4. Entregable: las 4 funciones y una nota con **una sugerencia que rechazaron** y por qué.

**Tramo B: por comentarios (10 min)** · `tramoB_comentarios.js`

1. Bajo cada comentario escriben la firma y dejan que Copilot complete.
2. Si no es lo esperado, **mejoran el comentario, no el código.**
3. Prueban con `PRODUCTOS` en `node -i`. Entregable: 4 funciones y cuántos comentarios reescribieron.

**Tramo C: Next Edit Suggestions (10 min)** · `tramoC_nes.js`

1. Confirman que `github.copilot.nextEditSuggestions.enabled` está activo.
2. En `crearProducto` cambian `nombre` por `nombreComercial` y siguen las sugerencias con `Tab`, revisando cada una.
3. Ojo con la desestructuración `({ nombre })` y con los accesos `p.nombre`. Al final buscan con `Ctrl+F` si quedó alguna referencia a `nombre`.

**Ejercicio completo: inventario (50 min)** · `inventario.js`

1. Escriben un comentario JSDoc de la clase y construyen `Inventario` con `agregar`, `eliminar`, `buscar`, `stockBajo`, `proximosACaducar` y `reporte`, exportada con `module.exports = { Inventario }`.
2. Validan con `npm run test:ej -- ej1`. Deben pasar las 8 pruebas de `inventario.test.js`, que **no se modifican.**
3. Criterios: JSDoc en todos los métodos, sin chat y capaces de explicar cada línea.
4. Para quien termina antes: `actualizarStock(sku, delta)` sin permitir stock negativo, con dos pruebas escritas a mano.

**Señales de alerta**

- Alguien abre el chat: recuérdales la regla, porque el objetivo es sentir cómo el contexto mejora el ghost text.
- `proximosACaducar` con fechas: es el método más delicado: incluye productos ya caducados y el orden de urgencia, así que conviene revisarlo con las pruebas.
- Aceptan todo con `Tab` sin leer: haz que expliquen en voz alta una función elegida al azar.

**Cierre (3 min):** ¿qué sugerencia rechazaron y qué les hizo dudar de ella?

## Ejercicio 2: chat, instrucciones y skill (30 min)

**Antes de este ejercicio** das los módulos de chat, contexto y prompting con las diapositivas 21 a 31. **Para este ejercicio:** diapositiva 32. Archivos: `ejercicios/ej2-chat-contexto-prompting/utilidades.js` y `src/app.js`.

**Demo previa (5 min, dentro del bloque 4)**

1. Crea `.github/copilot-instructions.md` con la regla "Empieza cada respuesta con *Hola equipo*".
2. Abre un chat **nuevo**, ejecuta *Chat: Open Customizations* y muestra que la regla aparece. Haz una pregunta y revisa *References* en la respuesta.
3. Borra la regla de prueba. Esa verificación es lo que ellos repetirán con sus reglas reales.

**Parte 1: chat, comandos y modelos (8 min)** · `utilidades.js` tiene cuatro funciones `f1` a `f4` con nombres crípticos y `var`.

1. `f1` con inline chat (`Ctrl+I`): renombrar con nombres descriptivos, usar `const` y `let` y agregar JSDoc.
2. `f2` con inline chat: pedir JSDoc en español con parámetros, retorno y un ejemplo. Si no aparece, la instrucción debe ser explícita.
3. `f3`: pedir que explique la función. El promedio móvil falla en los últimos elementos: que **pidan la causa antes de aceptar el arreglo.**
4. Con el agente **Ask**, la misma pregunta con dos modelos (uno específico y **Auto**) y anotar cuál respondió mejor y por qué.

**Parte 2: contexto e instrucciones (10 min)**

1. Adjuntan `src/app.js` (Add Context o arrastrando) y preguntan qué validaciones faltan en `POST /products`.
2. Crean `.github/copilot-instructions.md` con **al menos 4 reglas verificables** (por ejemplo `const` y `let` en vez de `var`, JSDoc obligatorio en cada función, nombres en español, validar la entrada).
3. **Verifican que se cargó:** *Open Customizations*, chat nuevo, *References*.
4. Crean una skill con `/create-skill`, o a mano en `.github/skills/revisar-endpoint/SKILL.md`, que revise un endpoint y devuelva una tabla de problemas, y la ejecutan con `/revisar-endpoint`.

**Parte 3: mejora un prompt (12 min)**

1. Ejecutan "hazme validaciones" tal cual con Ask y guardan la respuesta.
2. Lo reescriben con contexto, intención, restricciones y ejemplo (diapositivas 29 y 30) y comparan.
3. La respuesta casi sirve: **iteran** con un mensaje de seguimiento preciso, sin empezar de cero.
4. Guardan el prompt vago, el mejorado y el mensaje de iteración.

**Señales de alerta**

- "Mi regla no funciona": casi siempre abrieron el mismo chat de antes. Debe ser un chat nuevo.
- El JSDoc no aparece aunque esté el archivo: la regla no lo pide de forma explícita.
- La skill no se reconoce: revisa el destino de la sesión y la ruta `.github/skills/<nombre>/SKILL.md`. Los prompt files solo funcionan en el harness Local.
- Reglas vagas como "escribe buen código": pídeles que las vuelvan verificables.

**Cierre (3 min):** muestra la diapositiva 26 ("guía, no garantía") y pregunta qué regla no se cumplió y cómo la reescribieron.

## Ejercicio 3: rescatar el script legacy (30 min)

**Diapositivas:** 33 (cómo entender código ajeno) y 34 (el ejercicio). Carpeta: `ejercicios/ej3-codigo-legacy/`. Se ejecuta con `node reporte_ventas.js ventas.csv` y debe mostrar el top 3 de vendedores, el ticket promedio por sucursal y el total.

**Teoría previa (10 min):** panorama con Ask, detalle por selección, mapa de dependencias y el reporte de bug (esperado, obtenido, reproducción). Regla: **primero la causa, después la corrección.**

**Solo para el instructor: los 3 bugs.** Ninguno detiene el programa.

| # | Bug | Cómo se ve | Cómo lo detectan |
| --- | --- | --- | --- |
| 1 | El ciclo usa `i < r.length - 1` y **omite la última venta** | Luis suma 3398 y debería sumar 5196. El total muestra 34113 y debería ser 35911 | Calcular a mano los totales por vendedor y el total general |
| 2 | El orden compara los totales como **texto**, no como números | Marta (17841) no aparece en el top 3, aunque es la primera. El top correcto es Marta, Ana (9475) y Luis (5196) | Calcular a mano el total de Marta |
| 3 | `Occidente` no tiene ventas y el promedio divide `0 / 0` | Imprime `NaN` en el ticket de Occidente | Leer la salida: aparece `NaN` |

**Parte 1: entender (10 min), sin leer el código antes**

1. Con el agente Ask: "Resume qué hace este script, sus entradas y sus salidas."
2. Seleccionan la función `f` y piden que la explique por bloques.
3. Piden nombres descriptivos para `f`, `d`, `r`, `t`, `g`, `s`, `k`.
4. Con el agente Agent (o adjuntando `ventas.csv`): "¿Qué columnas del CSV usa el script y en qué posición?"
5. Entregable: un párrafo de 3 a 5 líneas con **sus palabras.**

**Parte 2: diagnosticar y corregir (15 min)**

1. Ejecutan el script y revisan la salida: ¿algo parece raro?
2. Por cada problema, escriben el reporte de bug (esperado, obtenido, reproducción).
3. Piden a Copilot **la causa** antes de la corrección y aplican el arreglo.
4. **Verifican ejecutando otra vez** y calculando a mano el total de `Marta`.

**Parte 3: dejarlo mejor (5 min):** refactor con nombres descriptivos, funciones pequeñas y `const`/`let`, sin cambiar el resultado.

**Criterios:** los números coinciden con el cálculo manual, no aparecen `NaN` ni `Infinity`, y por cada bug anotaron qué fallaba, por qué y cómo lo detectaron.

**Señales de alerta**

- Un "arreglo" que convierte `NaN` en `0`: esconde el problema en vez de resolverlo. Es el ejemplo ideal para el cierre.
- Corrigen el bug 3 y creen que terminaron: el 1 y el 2 solo se ven calculando a mano.
- Aceptan el refactor sin comparar la salida con la versión corregida.

**Cierre (3 min):** ¿qué bug fue el más difícil de detectar y hubo algún arreglo de Copilot que ocultaba el problema?

## Ejercicio 4: descuentos con el agente y pruebas (55 min)

**Diapositivas:** 35 (agent mode), 36 (limitar alcance), 37 (pruebas en verde), 38 (cobertura) y 39 (el ejercicio). Proyecto: `src/`, la API Express de la farmacia. El módulo de teoría dura 20 min de agent mode y 10 de pruebas.

**Demo previa (8 min):** pide al agente Plan "agrega el campo `stock_minimo` a los productos y un endpoint `GET /products/bajo-stock`". Ajusta el plan, ejecútalo con Agent, recorre los diffs, rechaza un cambio y restaura un checkpoint. Deja claro que **no se activa la aprobación automática.**

**Reglas de negocio (se las das tal cual):** volumen 5 a 9 piezas = 5 %, 10 o más = 10 %. Cupones `SALUD10` (10 %) y `ADULTOMAYOR15` (15 %), sin distinguir mayúsculas. Cupón vencido o inexistente = `400`. Volumen y cupón se suman con **tope total de 20 %**. Si algún producto requiere receta, el pedido necesita `receta` (folio no vacío) o `400`. `cantidad` debe ser un entero mayor que cero. La respuesta incluye `subtotal`, `descuento`, `porcentaje_descuento` y `total`.

**Restricciones:** la lógica va en un `src/descuentos.js` nuevo; solo se modifican `src/app.js`, `src/descuentos.js` y archivos de pruebas; no se tocan los endpoints de `/products` ni se agregan dependencias.

**Parte 1: planear (10 min)**

1. Hacen un `git commit` (o una rama) como punto de retorno.
2. Con el agente **Plan** pegan las reglas y las restricciones.
3. Leen el plan y **ajustan al menos una cosa** (por ejemplo, la estructura de datos de los cupones).
4. **No ejecutan todavía.**

**Parte 2: ejecutar con control (20 min)**

1. Pasan al agente **Agent** y ejecutan el plan, sin aprobación automática.
2. Leen **cada comando de terminal** antes de aprobarlo.
3. Revisan los diffs por archivo y practican **Undo** en al menos un cambio que no les guste.
4. Prueban un **checkpoint**: restauran uno y vuelven a avanzar. Si la sesión se alarga, `/compact`.
5. Verifican con `git status` que **solo** se tocaron los archivos permitidos.
6. Prueban a mano con `npm start` en una terminal y `curl -X POST localhost:5000/orders` en otra.

**Parte 3: pruebas en verde (25 min)**

1. Adjuntan `src/descuentos.js` y piden pruebas con Jest, y con supertest para `POST /orders` en `src/tests/`. Indican el estilo en el prompt (`test.each`, un caso borde por función).
2. Piden que las ejecute **y que explique si el fallo está en la prueba o en el código antes de corregir.**
3. Piden casos borde: 4 vs. 5 y 9 vs. 10 piezas, el tope de 20 %, receta faltante o inválida, cantidad negativa, cupón vencido y subtotal cero.
4. Miden cobertura con `npx jest --selectProjects server --coverage --collectCoverageFrom=src/descuentos.js`.
5. **Mutación manual:** cambian un `>=` por `>` en `descuentos.js`. Si ninguna prueba falla, las pruebas son débiles. Revierten el cambio.

**Criterios:** `npm test` en verde, cobertura de `descuentos.js` mayor o igual a 85 %, `git status` solo con los archivos permitidos, la mutación hizo fallar al menos una prueba, y cupón vencido, cantidad negativa y receta sin folio devuelven `400`.

**Señales de alerta**

- El agente instala paquetes o edita `/products`: viola las restricciones. Que lo rechacen y acoten el prompt.
- El agente modifica la **prueba** para que pase en vez de corregir el código.
- Alguien salta el plan y ejecuta de inmediato: pregunta qué habría pasado con un plan revisado.
- Alumnos sin commit previo no pueden deshacer: enséñales `git restore`.

**Cierre (3 min):** reflexión de 3 líneas: ¿qué hizo el agente que no pidieron, qué corrigieron y qué harían distinto en el prompt?

## Ejercicio 5: del mockup a React (30 min + 5 de teoría)

**Diapositivas:** 40 (del mockup al componente) y 41 (el ejercicio). Archivos: `ejercicios/ej5-imagen-a-codigo/mockup-catalogo.png` y `web/`. Necesitan un **modelo con visión**; compruébalo antes, porque no todos los modelos leen imágenes.

**Requisitos del componente:** `web/Catalogo.jsx` renderizado desde `App.jsx`; tarjetas cargadas con `fetch` dentro de `useEffect` desde `GET /products`; etiqueta **"Requiere receta"** como en el mockup; filtro de categoría con `?categoria=`; búsqueda por nombre; solo React y CSS propio, sin librerías de componentes ni de estilos.

**Antes de empezar (2 min):** muestra cómo adjuntar la imagen (Add Context o arrastrarla al chat) y cómo levantar todo en **dos terminales**: `npm start` (API, puerto 5000) y `npm run dev` (Vite, puerto 5173).

**Parte 1: primera versión (10 min)**

1. Seleccionan un modelo con visión y adjuntan `mockup-catalogo.png`.
2. Con el agente Agent escriben un prompt con **contexto, intención y restricciones**: crear `web/Catalogo.jsx` (y su CSS) y usarlo desde `web/App.jsx`.
3. Revisan los diffs y abren `http://localhost:5173`.

**Parte 2: comparar e iterar (15 min)**

1. Ponen el mockup junto a su página y **anotan 3 diferencias visuales concretas** (color del botón, espaciado, tamaño de la etiqueta).
2. Iteran **dos veces** con mensajes precisos: una corrección visual ("las tarjetas deben tener 3 columnas en escritorio") y una mejora que no se ve en el mockup (estado vacío, estado de error o diseño responsivo).

**Parte 3: revisión (5 min)**

- ¿Pinta con JSX o usa `dangerouslySetInnerHTML`? (riesgo de XSS)
- ¿El `useEffect` limpia la petición si el componente se desmonta o el filtro cambia?
- ¿Funciona con teclado, y el buscador y el selector tienen etiqueta accesible?
- ¿Maneja el error si la API falla?
- Si sobra tiempo: una prueba con React Testing Library que simule `fetch`.

**Criterios:** el catálogo muestra los 6 productos con nombre, categoría y precio; el filtro y la búsqueda funcionan; anotaron 3 diferencias y corrigieron al menos 2; hay estado vacío, de error o diseño responsivo; identificaron al menos 1 problema de calidad; `npm test` sigue en verde.

**Señales de alerta**

- Usan un modelo sin visión y el resultado no se parece al mockup.
- Solo levantaron Vite y la API no está corriendo, así que el catálogo sale vacío.
- Aceptan la primera versión sin comparar contra el mockup.
- Añaden una librería de estilos o de componentes: viola la restricción.

**Cierre (3 min):** ¿qué problema de calidad encontraron en el código generado y no se veía en la pantalla?

## Demo del bloque 10 y ejercicio opcional

**Diapositivas:** 42 (cloud agent), 43 (code review y MCP) y 44 (ejercicio opcional). Es una **demo del instructor** de 25 minutos: los alumnos observan.

**Preparación (antes del día del curso)**

1. Redacta un issue claro (contexto, criterios de aceptación, restricciones) y asígnalo a Copilot con anticipación. La tarea tarda varios minutos y consume créditos.
2. Prepara un PR de respaldo con errores deliberados para el code review, porque Copilot puede no dejar ningún comentario.
3. Agrega `.vscode/mcp.json` con el servidor de Microsoft Learn y comprueba que conecta en tu cuenta (una política de la organización puede bloquear MCP).

**Guion de la demo**

1. **Resumen de PR:** crea un PR y usa el botón de Copilot en la descripción. Revísalo antes de publicarlo.
2. **Cloud agent:** muestra el issue asignado y el PR que ya generó (no esperes en vivo). Pide un ajuste con `@copilot`.
3. **Code review:** agrega a Copilot como revisor. Muestra que sus comentarios son de tipo *Comment*, la opción **Fix with Copilot** y que consume créditos y minutos de Actions. Si no deja comentarios, pasa al PR de respaldo.
4. **MCP:** conecta Microsoft Learn y haz una pregunta que use la documentación. Recuerda instalar solo servidores de fuentes de confianza.

**Ejercicio opcional: revisar un PR (20 min, fuera de la agenda)** · `ejercicios/ej-opcional-revision-pr/`

1. Leen `DESCRIPCION_DEL_PR.md` y el código de `ajusteStock.js`, **sin corregir nada** en las partes 1 y 2.
2. Ejecutan `npm run test:ej -- ej-opcional` y prueban la app con `node ejercicios/ej-opcional-revision-pr/demoApp.js` (puerto 5001).
3. Anotan cada hallazgo con qué, dónde, gravedad y cómo lo comprobaron.
4. Piden una revisión a Copilot **después** de anotar los suyos y comparan en una tabla (qué encontró cada uno, falsos positivos, qué verificaron ejecutando).
5. Deciden: aprobar, aprobar con cambios o pedir cambios, con un comentario de 3 a 5 líneas.

**Cuándo usarlo:** para quien termine un ejercicio antes o como tarea posterior. Si vas justo de tiempo, omítelo sin problema.

**Cierre del día (diapositivas 45 y 46):** tres ideas para llevarse (revisa, acota, itera), la regla de oro (si no puedes explicar lo que hace una sugerencia, no la aceptes) y recordar que su copia del repo queda con su propio historial de commits.
