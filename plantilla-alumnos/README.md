# GitHub Copilot: Fundamentos (alumnos)

Repositorio de trabajo del curso de un día. Aquí harás los ejercicios con **Express, React (Vite) y Jest**, sobre un caso ficticio: **Farmacia Demo**.

> **Datos ficticios.** No pegues en el chat código, datos ni credenciales de clientes, ni datos de pacientes, recetas o folios reales.

## Antes del curso

- [ ] Cuenta de GitHub y licencia activa de Copilot (verifica en [github.com/settings/copilot](https://github.com/settings/copilot)).
- [ ] Pulsa **Use this template → Create a new repository** (déjalo en privado) para tener tu propia copia.
- [ ] Abre tu copia en **Codespaces** (*Code → Codespaces → Create codespace on main*). El entorno queda listo solo.
  - En local necesitas VS Code estable, las extensiones GitHub Copilot y Copilot Chat, Git y Node.js 20 o superior.
- [ ] Haz el [Ejercicio 0](ejercicios/ej0-verificar-entorno/README.md).

## Cómo trabajar los ejercicios

El **instructor te indicará cuándo abrir cada ejercicio**. Cada uno tiene su carpeta en `ejercicios/` con un `README.md` que es su enunciado.

- **Trabajas siempre en la rama `main` de tu copia.**
- **Haz un commit al terminar cada ejercicio** (`git add -A && git commit -m "Ejercicio 1"`). Sirve de punto de retorno y te permite ver con `git diff` qué cambió Copilot.
- Lo que **creas tú desde cero** con Copilot: `inventario.js` (Ej. 1), `.github/copilot-instructions.md` y tu skill (Ej. 2), `src/descuentos.js` y sus pruebas (Ej. 4) y `web/Catalogo.jsx` (Ej. 5).

| Ejercicio | Qué haces | Enunciado |
|---|---|---|
| 0 | Verificar el entorno | [ejercicios/ej0-verificar-entorno](ejercicios/ej0-verificar-entorno/README.md) |
| 1 | Autocompletado | [ejercicios/ej1-autocompletado](ejercicios/ej1-autocompletado/README.md) |
| 2 | Chat, instrucciones y skill | [ejercicios/ej2-chat-contexto-prompting](ejercicios/ej2-chat-contexto-prompting/README.md) |
| 3 | Rescatar un script legacy | [ejercicios/ej3-codigo-legacy](ejercicios/ej3-codigo-legacy/README.md) |
| 4 | Descuentos con el agente y pruebas | [ejercicios/ej4-agent-descuentos](ejercicios/ej4-agent-descuentos/README.md) |
| 5 | Del mockup a React | [ejercicios/ej5-imagen-a-codigo](ejercicios/ej5-imagen-a-codigo/README.md) |
| Opcional | Revisa el Pull Request | [ejercicios/ej-opcional-revision-pr](ejercicios/ej-opcional-revision-pr/README.md) |

## Comandos útiles

```bash
npm test                  # pruebas de la API y de React
npm start                 # API en http://localhost:5000
npm run dev               # interfaz en http://localhost:5173
npm run test:ej -- ej1    # pruebas de un ejercicio concreto
```

## Licencia

MIT. Consulta [LICENSE](LICENSE).
