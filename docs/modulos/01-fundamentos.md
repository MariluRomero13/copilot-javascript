# 1. Fundamentos

**Duración:** 20 min · **Tipo:** teoría

## Qué es GitHub Copilot y dónde vive

Copilot es un asistente de IA para desarrollo. No es una sola herramienta, sino varias superficies:

| Superficie | Para qué se usa |
|---|---|
| **IDE** (VS Code, Visual Studio, JetBrains…) | Autocompletado, chat, modo Agent. Es donde pasaremos el día |
| **github.com** | Chat web, asignar issues al cloud agent, code review en pull requests |
| **CLI** (`copilot`, `gh copilot`) | Preguntas y tareas desde la terminal |

## Planes, créditos de IA y qué los consume

Los planes (Free, Pro, Pro+, Max, Business y Enterprise) cambian en límites y modelos disponibles. Desde junio de 2026 el uso se mide en **créditos de IA** de GitHub (1 crédito = 0.01 USD). **Las cifras exactas cambian con frecuencia: verifícalas en la [página oficial de planes](https://github.com/features/copilot/plans) el día del curso.**

La idea importante es distinguir qué consume qué:

| Uso | Consumo |
|---|---|
| Sugerencias inline (completions) y Next Edit Suggestions | No consumen créditos |
| Chat y agentes en el IDE | Consumen créditos; los modelos más potentes consumen más |
| Cloud agent | Consume créditos por tarea |
| Code review de Copilot en PR | Consume créditos y minutos de GitHub Actions |

Cuando se agotan los créditos no hay un modelo de respaldo: el chat y los agentes dejan de responder hasta que se renueven o se compren más. Las sugerencias inline siguen funcionando.

> **Para el instructor**
>
> Muestra en vivo el medidor de uso en github.com/settings/copilot y comenta con la audiencia qué plan tienen.

## Privacidad, uso responsable y validación humana

- **Qué se envía:** el código y el contexto que Copilot necesita para responder.
- **Entrenamiento según el plan:** en los planes individuales (Free, Pro y Pro+) los datos de interacción se usan para entrenar modelos por defecto desde el 24 de abril de 2026, salvo que lo desactives en la configuración. Business y Enterprise quedan excluidos.
- **Exclusión de contenido:** solo existe en Business y Enterprise, y puede no aplicarse en los agentes del chat del IDE. Verifica la política vigente antes de afirmar que un archivo está protegido.
- **No compartas** secretos, credenciales, datos personales ni código de clientes sin autorización.
- **En el sector salud,** extrema la precaución: nunca pegues datos de pacientes, recetas, folios reales ni información de clientes. Usa siempre datos ficticios en ejemplos y pruebas.
- **Filtro de coincidencias con código público:** puede activarse en la configuración de la cuenta u organización.
- **Tú eres el autor.** Todo código sugerido debe revisarse, ejecutarse y probarse antes de aceptarse.

### Regla de oro del curso

> Si no puedes explicar lo que hace una sugerencia, no la aceptes.

## Puntos clave

1. Copilot acelera, pero no reemplaza la revisión humana.
2. Inline, chat y agente son herramientas distintas para tareas distintas.
3. Conocer lo que consume créditos y la política de datos de tu plan evita sorpresas.
