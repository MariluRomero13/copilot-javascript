# 4. Contextualización

**Duración:** 20 min · **Tipo:** teoría + demo

> **Pistas Python y JavaScript**
>
> Los ejemplos de este módulo usan archivos de la pista Python (`src/app.py`, `pytest`). En la pista JavaScript el equivalente es `src/app.js` con Jest y en la pista C# `src/Farmacia.Api/*.cs` con xUnit: consulta las [equivalencias](../pistas.md#equivalencias-de-archivos).

Copilot responde con lo que ve. Controlar el contexto es la forma más barata de mejorar los resultados.

## Agregar contexto desde el chat

La forma más fiable es la interfaz:

- **Add Context** (el botón con el clip en el chat): archivos, símbolos, imágenes, resultados de terminal.
- **Arrastrar y soltar** archivos o carpetas desde el Explorador al chat. Para una carpeta completa es la forma que mejor funciona.
- **Menciones con `#`** (por ejemplo `#file`, `#codebase`): siguen documentadas, pero pueden no aparecer en todas las versiones o destinos. Úsalas si te salen en el selector.

> **Cuidado con `#codebase`**
>
> Busca en el proyecto, pero no adjunta todo. En el agente **Agent**, Copilot explora el repositorio por su cuenta, así que muchas veces no necesitas adjuntar nada.

- Las imágenes (mockups, capturas de errores, diagramas) requieren un modelo con visión.
- Menos contexto y más relevante supera a mucho contexto desordenado.

## Instrucciones del repositorio

Archivo `.github/copilot-instructions.md` (o `AGENTS.md` en la raíz): reglas que Copilot aplica **a las conversaciones del proyecto**.

Buenas instrucciones son:

- **Cortas y concretas** (qué stack, qué estilo, qué evitar).
- **Verificables** ("JSDoc obligatorio en cada función", no "escribe buen código"). Si no pides algo explícitamente, no esperes que ocurra.
- Sobre el proyecto, no sobre temas generales.

> **Son una guía, no una garantía**
>
> Copilot puede ignorar una regla, sobre todo si choca con el prompt. Verifica siempre el resultado.

### Cómo verificar que se cargaron

1. Ejecuta **Chat: Open Customizations** (paleta de comandos) y revisa la pestaña de Instrucciones.
2. Abre un **chat nuevo** (los cambios no se aplican a una conversación ya iniciada).
3. Haz una pregunta y revisa **References** en la respuesta: debe aparecer el archivo.
4. Prueba rápida: agrega la regla "Empieza cada respuesta con *Hola equipo*" y confirma que la sigue. Luego bórrala.

### Instrucciones por patrón de archivos

Los archivos `.github/instructions/*.instructions.md` con `applyTo` solo aplican a ciertos archivos:

```markdown
---
applyTo: "**/*.test.js"
---
Usa test.each para casos de frontera y un caso borde por función.
```

## Skills y prompt files

Para tareas repetibles hay dos opciones:

| | Skill (`SKILL.md`) | Prompt file (`.prompt.md`) |
|---|---|---|
| Dónde | `.github/skills/<nombre>/SKILL.md` | `.github/prompts/<nombre>.prompt.md` |
| Cómo se usa | `/nombre` o Copilot la carga cuando la considera relevante | Solo `/nombre`, de forma manual |
| Disponibilidad | Recomendada, funciona con el harness Copilot | Solo harness **Local** (en desuso) |

Si ya tienes prompt files, migra a skills. Se pueden generar desde el chat con `/create-skill` y `/create-instruction`.

```markdown
---
name: revisar-endpoint
description: Revisa un endpoint Express y lista problemas de validación, seguridad y pruebas faltantes.
---
Revisa el endpoint indicado por el usuario y devuelve una tabla con
problema, gravedad y cómo reproducirlo.
```

## Demo del instructor (5 min)

1. Haz una pregunta sin contexto y otra con el archivo adjunto (Add Context): compara.
2. Crea `.github/copilot-instructions.md` con una regla ("JSDoc en español en cada función"), verifica que se carga y vuelve a pedir una función.
3. Crea una skill con `/create-skill` y ejecútala con `/`.

## Puntos clave

1. El contexto correcto mejora más que un prompt largo.
2. Las instrucciones del proyecto evitan repetir reglas en cada mensaje.
3. Las skills convierten buenas prácticas en comandos del equipo. Las instrucciones guían, pero hay que verificar.
