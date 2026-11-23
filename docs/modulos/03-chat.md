# 3. Chat

**Duración:** 20 min · **Tipo:** teoría + demo

> **Pistas Python y JavaScript**
>
> Los ejemplos de este módulo usan archivos de la pista Python (`src/app.py`, `pytest`). En la pista JavaScript el equivalente es `src/app.js` con Jest y en la pista C# `src/Farmacia.Api/*.cs` con xUnit: consulta las [equivalencias](../pistas.md#equivalencias-de-archivos).

## Chat en panel vs inline chat

| | Chat en panel | Inline chat (`Ctrl+I`) |
|---|---|---|
| Dónde | Barra lateral | Sobre el código |
| Úsalo para | Conversaciones largas, varios archivos, preguntas de diseño | Cambios puntuales en una selección |
| Resultado | Respuesta con bloques de código | Diff directamente en el editor |

## Agentes del chat: Agent, Plan y Ask

El chat funciona con **agentes**. Se elige en el selector del chat.

| Agente | Qué hace | Cuándo usarlo |
|---|---|---|
| **Agent** | Explora el proyecto por su cuenta, edita varios archivos y ejecuta comandos con tu aprobación | Implementar una tarea completa, y también preguntar sobre el código |
| **Plan** | Investiga y propone un plan paso a paso antes de actuar | Cambios medianos o grandes que quieres revisar primero |
| **Ask** | Responde preguntas sin modificar archivos | Entender, explorar y pedir opinión |

Regla práctica: **Plan para decidir, Agent para ejecutar, Ask cuando quieras garantizar que no se toque nada.**

> **¿Y el modo Edit?**
>
> El modo Edit está deprecado desde VS Code 1.110. Quedó oculto por defecto y se retirará en una versión posterior. Su lugar lo ocupa Agent con alcance acotado en el prompt. Los antiguos "chat modes" ahora son agentes personalizados (`.agent.md`).

## Destino de la sesión (harness)

Al abrir una sesión puedes elegir dónde corre: **Copilot** (el harness actual) o **Local** (en desuso, se retirará en febrero de 2027). Lo que ves disponible depende de esa elección. Por ejemplo, los prompt files solo funcionan en Local. Antes del curso, confirma que todos usen el mismo destino.

## Comandos de barra

Escribe `/` en el chat para ver los disponibles. Hoy hay dos grupos:

| Grupo | Ejemplos |
|---|---|
| Integrados | `/compact` (resume la conversación), `/fork` (bifurca la sesión), `/agents`, `/skills`, `/yolo` |
| Para crear personalizaciones | `/create-instruction`, `/create-skill`, `/create-prompt`, `/create-agent`, `/create-hook` |
| Definidos por el equipo | Skills y prompt files del repositorio (módulo 4) |

> **Qué pasó con `/explain`, `/fix`, `/tests` y `/doc`**
>
> Ya no aparecen en las versiones recientes. Se sustituyen con un prompt claro con el archivo o la selección como contexto, o con una skill del equipo. El resultado es más controlable: tú decides el formato y las reglas.

## Selección de modelo

El selector del chat permite elegir el modelo. En general:

- Modelos **rápidos y ligeros** para tareas simples y preguntas.
- Modelos de **razonamiento** para depuración difícil, diseño y planes complejos.
- **Auto** deja que Copilot elija el modelo; uno específico te da control. Los modelos más potentes consumen más créditos.

## Demo del instructor (5 min)

1. Selecciona una función de `src/app.py` → `Ctrl+I` → "agrega validación de precio negativo".
2. Abre el panel → agente Ask → "¿qué endpoints expone esta app?".
3. Repite la misma pregunta con otro modelo y compara.

## Puntos clave

1. Elige el agente según el riesgo de la tarea.
2. Inline para lo puntual, panel para lo amplio.
3. Compara modelos antes de asumir que uno es mejor.
