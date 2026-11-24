# Guía del instructor

Cómo conducir el curso de 1 día con los ejercicios de este repositorio. La [agenda](agenda.md) define los tiempos; aquí está **qué decir, qué demostrar y qué suele fallar** en cada bloque.

## Antes del día del curso (checklist)

- [ ] Todos los alumnos usan la **misma versión de VS Code** y el **mismo destino de sesión** (harness Copilot). Revisa que aparezca el selector de agentes (Agent, Plan, Ask).
- [ ] Abre un chat nuevo y verifica qué comandos de barra aparecen (`/`). Si `/explain`, `/fix`, `/tests` o `/doc` te salen, ignóralos igual: el curso enseña el método con prompts y skills.
- [ ] Prueba el flujo de instrucciones en tu entorno: `.github/copilot-instructions.md` + *Chat: Open Customizations* + chat nuevo + *References*.
- [ ] Revisa en `github.com/settings/copilot` el plan y el medidor de créditos de la audiencia.
- [ ] Prepara con anticipación: un issue asignado al cloud agent (tarda minutos y consume créditos) y un PR de respaldo con errores deliberados para el code review (puede no dejar comentarios).
- [ ] Confirma que `npm install` y `npm test` funcionan en Codespaces.
- [ ] Verifica que las funciones dicen "datos ficticios": nadie pega datos reales de pacientes.

## Filosofía de cada bloque

Cada módulo sigue el mismo ritmo: **1) concepto en 3 minutos, 2) demo en vivo del instructor, 3) ejercicio**. Evita las diapositivas largas: los alumnos aprenden mirando fallar y corregir a Copilot.

## Bloque 1: Fundamentos (20 min)

- **Mensaje central:** Copilot acelera pero no reemplaza tu criterio.
- **Demostrar:** el medidor de créditos en vivo; qué consume (chat, agentes, code review) y qué no (completions y NES).
- **Decir claro:** los planes individuales entrenan con tus datos por defecto salvo opt-out; Business y Enterprise no. La exclusión de contenido es solo de organizaciones y puede no aplicar en los agentes del IDE.
- **Error común:** afirmar cifras de cuotas de memoria. Usa la página oficial el día del curso.

## Bloque 2: Autocompletado, Ejercicio 1 (100 min)

- **Demo (5 min):** escribe un comentario y deja que aparezca el ghost text. Muestra aceptar (`Tab`), descartar (`Esc`), alternar sugerencias y aceptar palabra por palabra (`Ctrl+→`).
- **Tramo A, B y C:** son aislados. Pide a los alumnos que anoten cuándo la sugerencia fue buena y cuándo mala.
- **NES (tramo C):** muestra una edición que se propaga a otras líneas. Menciona que se puede ajustar la eagerness.
- **Cierre de 50 min (`inventario.js`):** dales el enunciado y circula. Intervén solo para el teclado: en teclados en español algunos atajos chocan y hay que reasignarlos.
- **Mensaje de cierre:** una sugerencia que no puedes explicar no se acepta.

## Bloque 3: Chat (20 min)

- **Demo (5 min):** inline chat (`Ctrl+I`) para un cambio puntual; panel para una pregunta amplia.
- **Explicar los agentes:** Agent hace todo, Plan decide antes de actuar, Ask no toca archivos. Aclara que **Edit está deprecado** y que los comandos clásicos cambiaron.
- **Cómo hablar de los comandos viejos:** no digas "se eliminaron". Di que **evolucionaron**: antes eran atajos fijos (`/explain`, `/tests`), ahora el equipo define los suyos como skills y tú escribes prompts con contexto. Más control, resultado más consistente.
- **Harness:** si alguien no ve algo que ve el resto, empieza por el destino de la sesión.
- **Modelos:** compara Auto contra un modelo específico en vivo y muestra el impacto en créditos.

## Bloque 4: Contextualización (25 min)

El más importante del día. Es donde los alumnos entienden por qué Copilot a veces "no hace caso".

1. **Contexto:** muestra Add Context y arrastrar una carpeta desde el Explorador. Aclara que `#` puede no aparecer y que Agent explora solo.
2. **Instrucciones:** crea `copilot-instructions.md` con la regla "Empieza con *Hola equipo*", abre un chat **nuevo** y muestra *References*. Es la prueba más clara de que se cargó.
3. **Guía, no garantía:** pide algo que choque con la regla y muestra que a veces no la cumple. La regla debe ser concreta: si quieres JSDoc, escribe "JSDoc obligatorio en cada función".
4. **Skills frente a prompt files:** crea una skill con `/create-skill`. Explica que los prompt files solo existen en el harness Local.

## Bloque 5: Prompting (10 min)

Usa la anatomía contexto, intención, restricciones, ejemplo. Enseña el antipatrón con el prompt vago "hazme validaciones" que luego usan en el Ejercicio 2, parte 3.

## Ejercicio 2 (30 min)

- **Parte 1 (8 min):** la mayor trampa es pedir JSDoc de forma implícita. Si no aparece, se debe pedir explícitamente.
- **Parte 2 (10 min):** los alumnos que crean el archivo y no abren un chat nuevo creen que no funciona. Recuérdales verificar con *Open Customizations* y *References*.
- **Parte 3 (12 min):** que guarden el prompt vago, el mejorado y la iteración. Es lo que se comenta al final.
- **Plan B:** si la skill no se reconoce, revisa el harness y la ruta `.github/skills/<nombre>/SKILL.md`.

## Bloque 6 y Ejercicio 3 (40 min)

- **Teoría (10 min):** panorama con Ask, detalle por selección y mapa de dependencias. Después, el reporte de bug con esperado, obtenido y reproducción.
- **Regla:** primero la causa, después la corrección.
- **Pista del ejercicio:** los 3 bugs no detienen el programa, producen números equivocados. Que calculen a mano el total de `Marta`.
- **Trampa a comentar al final:** el "arreglo" que convierte `NaN` en `0` y esconde el problema.

## Bloque 7, 8 y Ejercicio 4 (95 min)

- **Demo (8 min):** plan para `stock_minimo`, ajusta, ejecuta, recorre diffs, rechaza un cambio y restaura un checkpoint.
- **Seguridad:** no actives la aprobación automática (`/yolo`). Lee cada comando.
- **Alcance:** nombra los archivos permitidos y prohíbe el resto. Si se desvía, detén la sesión y reformula.
- **Pruebas:** ya no hay `/tests`. Adjunta `descuentos.js` y pide Jest con `test.each`. Enfatiza "explica si el fallo está en la prueba o en el código **antes** de corregir".
- **Mutación manual:** cambiar `>=` por `>` es la mejor forma de mostrar que la cobertura no es calidad.
- **Sesión larga:** si el chat pierde el hilo, `/compact`.

## Bloque 9 y Ejercicio 5 (35 min)

Mockup a componente React. Requiere un modelo con visión. Comenta que la primera versión rara vez es la final: se itera con el mockup como referencia.

## Bloque 10: más allá del IDE (25 min, demo)

1. **Resumen de PR** con el botón de Copilot.
2. **Cloud agent:** muestra el issue asignado y el PR ya generado (no esperes en vivo).
3. **Code review:** añade a Copilot como revisor. Si no deja comentarios, usa el PR de respaldo. Muestra **Fix with Copilot**.
4. **MCP:** demo con Microsoft Learn y menciona que la organización puede restringirlo.
5. **Costos:** code review consume créditos y minutos de Actions.

## Cierre (10 min)

Tres ideas para llevarse:

1. Da contexto y reglas concretas: Copilot es una guía, no una garantía.
2. Plan antes de ejecutar, y lee siempre los diffs y comandos.
3. Tú eres el autor: si no puedes explicarlo, no lo aceptes.

Cierra con los recursos (`docs/recursos.md`) y recuerda las reglas de datos ficticios.

## Guía paso a paso de los ejercicios

Para el guion de cada ejercicio (pasos, señales de alerta y los bugs del Ejercicio 3), consulta la [guía de ejercicios](guia-instructor-ejercicios.md).
