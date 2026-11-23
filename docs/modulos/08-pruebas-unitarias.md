# 8. Pruebas unitarias

**Duración:** 10 min teoría. Se practica en el [Ejercicio 4](../ejercicios/ej4-agent-descuentos.md).

El temario original usa **Jest** (JavaScript). La pista Python usa **pytest** y la pista C# usa **xUnit**, sus equivalentes. Los conceptos son los mismos.

## Generación de pruebas con un prompt

Ya no existe `/tests`. Se piden las pruebas con un prompt con contexto:

1. Adjunta el archivo a probar (Add Context o arrástralo al chat).
2. Pide las pruebas indicando el framework y el estilo.
3. **Lee** las pruebas generadas antes de aceptarlas.

```text
Genera pruebas con Jest para el archivo adjunto. Usa test.each para los casos de frontera
y agrega un caso borde por función. No modifiques el código fuente.
```

Si el equipo repite este prompt, conviértelo en una **skill** (módulo 4) o en una instrucción `.instructions.md` con `applyTo: "**/*.test.js"`.

Revisa que cada prueba:

- Tenga un nombre que describa el comportamiento.
- Verifique un resultado concreto (no solo "no falla").
- No dependa de otras pruebas ni de datos compartidos.

## Ejecutar e iterar hasta tener pruebas en verde

Con el agente Agent:

```text
Genera pruebas para descuentos con el framework del proyecto y ejecútalas.
Si alguna falla, explica si el error está en la prueba o en el código antes de corregir.
```

Ese **"antes de corregir"** es clave: si Copilot modifica la prueba para que pase, pierdes su valor.

```bash
npm test
```

## Depurar un fallo leyendo el error de la terminal

Cuando una prueba falla, adjunta la salida de la terminal al chat (Add Context) y pide: "Explica por qué falla y si el error está en la prueba o en el código. No corrijas todavía."

## Casos borde y cobertura

Pide explícitamente casos borde:

| Categoría | Ejemplos |
|---|---|
| Límites | 0, 1, exactamente el umbral (9 vs. 10 unidades) |
| Inválidos | Negativos, `null`/`None`, tipos incorrectos |
| Fechas | El último día de vigencia, vencido ayer |
| Combinaciones | Dos descuentos que superan el tope |

```bash
npx jest --selectProjects server --coverage --collectCoverageFrom=src/descuentos.js
```

> **Atención**
>
> La cobertura mide líneas ejecutadas, no calidad. Una prueba sin `assert` o `expect` da 100 % de cobertura y no verifica nada.

### Truco de validación: mutación manual

Cambia a propósito un `>=` por `>` en el código. **Si ninguna prueba falla, las pruebas son débiles.**

## Puntos clave

1. Lee las pruebas generadas como si fueran código de producción.
2. Cuando una prueba falla, decide si el bug está en la prueba o en el código.
3. Cobertura alta es necesaria, no suficiente.
