# Ejercicio 2: Configura tu copiloto y mejora un prompt (JavaScript)

**Módulos:** [3. Chat](../modulos/03-chat.md), [4. Contextualización](../modulos/04-contextualizacion.md), [5. Prompting](../modulos/05-prompting.md) · **Tiempo:** 30 min
**Archivos:** `ejercicios/ej2-chat-contexto-prompting/utilidades.js` y `src/app.js`

## Parte 1: chat, comandos y modelos (8 min)

Abre `utilidades.js`. Tiene cuatro funciones con nombres crípticos (`f1` a `f4`) y `var` por todos lados.

1. Selecciona `f1` y usa **inline chat** (`Ctrl+I`): "renombra la función y las variables con nombres descriptivos, usa `const`/`let` y agrega JSDoc".
2. Selecciona `f2` y pide en inline chat: "agrega JSDoc en español: parámetros, retorno y un ejemplo". Si el comentario no aparece, la instrucción debe ser explícita.
3. Selecciona `f3` y pide: "explica qué hace esta función". Después pide que corrija el bug: el promedio móvil falla en los últimos elementos. Antes de aceptar el arreglo, **pide la causa**.
4. Con el agente **Ask** pregunta lo mismo con dos modelos distintos (uno específico y **Auto**) y compara.

**Anota:** qué modelo respondió mejor y por qué.

## Parte 2: contexto e instrucciones del proyecto (10 min)

1. Adjunta `src/app.js` (Add Context o arrástralo al chat) y pregunta: "¿Qué validaciones faltan en `POST /products`?"
2. Crea `.github/copilot-instructions.md` con **al menos 4 reglas verificables**. Ejemplo de temas: `const`/`let` en vez de `var`, JSDoc, idioma y estilo de nombres, validación de entrada.
3. **Verifica que se cargó:** ejecuta *Chat: Open Customizations*, abre un chat nuevo y revisa *References* en la respuesta.
4. Crea una skill con `/create-skill` (o a mano en `.github/skills/revisar-endpoint/SKILL.md`) que revise un endpoint seleccionado y devuelva una tabla de problemas.
5. Selecciona un endpoint y ejecútala con `/revisar-endpoint`.

## Parte 3: mejora un prompt (12 min)

Prompt vago de partida:

```text
hazme validaciones
```

1. Ejecútalo tal cual con el agente **Ask** y guarda la respuesta.
2. Reescríbelo con **contexto, intención, restricciones y ejemplo** (módulo 5).
3. Ejecútalo y compara.
4. La respuesta casi sirve, pero no del todo: **itera** con un mensaje de seguimiento preciso (no empieces de cero).

## Criterios de aceptación

- [ ] `utilidades.js` tiene nombres descriptivos, `const`/`let` y JSDoc.
- [ ] El bug de `f3` está corregido y puedes explicar su causa.
- [ ] `copilot-instructions.md` tiene reglas **verificables** (no "escribe buen código"). Si pides JSDoc, la regla debe decirlo.
- [ ] La skill funciona al invocarla con `/`.
- [ ] Las instrucciones se reflejan en una respuesta nueva **sin que las repitas** en el mensaje.
- [ ] Guardaste el prompt vago, el mejorado y tu mensaje de iteración.

## Para quien termine antes

Crea una segunda skill, `generar-pruebas`, con el estándar de pruebas del equipo (Jest, `test.each`, un caso borde por función). O un `.instructions.md` con `applyTo: "**/*.test.js"`.
