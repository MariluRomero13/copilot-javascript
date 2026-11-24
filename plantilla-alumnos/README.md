# GitHub Copilot: Fundamentos (alumnos)

Repositorio de trabajo del curso de un día. Aquí harás los ejercicios del curso con **Express, React (Vite) y Jest**, sobre un caso ficticio: **Farmacia Demo**.

> **Datos ficticios.** No pegues en el chat código, datos ni credenciales de clientes, ni datos de pacientes, recetas o folios reales.

## Cómo empezar

1. Pulsa **Use this template → Create a new repository** (déjalo en privado) para tener tu propia copia.
2. En tu copia, abre **Code → Codespaces → Create codespace on main**. El entorno queda listo solo.
   - Si prefieres trabajar en local, clona tu copia, instala Node.js 20 o superior y ejecuta `npm install`.
3. Sigue el [Ejercicio 0](docs/ejercicios/ej0-verificar-entorno.md) para comprobar que todo funciona.

## Cómo trabajar los ejercicios

Cada ejercicio tiene su enunciado en `docs/ejercicios/` y, cuando hace falta, archivos de partida en `ejercicios/`.

- **Trabajas siempre en la rama `main` de tu copia.**
- **Haz un commit al terminar cada ejercicio** (`git add -A && git commit -m "Ejercicio 1"`). Sirve de punto de retorno y te permite ver con `git diff` qué cambió Copilot.
- Lo que **creas tú desde cero** con Copilot: `inventario.js` (Ej. 1), `.github/copilot-instructions.md` y tu skill (Ej. 2), `src/descuentos.js` y sus pruebas (Ej. 4) y `web/Catalogo.jsx` (Ej. 5).

| Ejercicio | Qué haces | Carpeta o archivos |
|---|---|---|
| [0](docs/ejercicios/ej0-verificar-entorno.md) | Verificar el entorno | Todo el proyecto |
| [1](docs/ejercicios/ej1-autocompletado.md) | Autocompletado | `ejercicios/ej1-autocompletado/` |
| [2](docs/ejercicios/ej2-chat-contexto-prompting.md) | Chat, instrucciones y skill | `ejercicios/ej2-chat-contexto-prompting/` y `.github/` |
| [3](docs/ejercicios/ej3-codigo-legacy.md) | Rescatar un script legacy | `ejercicios/ej3-codigo-legacy/` |
| [4](docs/ejercicios/ej4-agent-descuentos.md) | Descuentos con el agente y pruebas | `src/` |
| [5](docs/ejercicios/ej5-imagen-a-codigo.md) | Del mockup a React | `web/` |

Opcional: [Revisa el Pull Request](docs/ejercicios/ej-opcional-revision-pr.md).

## Comandos útiles

```bash
npm test                  # pruebas de la API y de React
npm start                 # API en http://localhost:5000
npm run dev               # interfaz en http://localhost:5173
npm run test:ej -- ej1    # pruebas de un ejercicio concreto
```

## Material de consulta

- [Agenda del día](docs/agenda.md)
- [Módulos del curso](docs/index.md)
- [Recursos](docs/recursos.md)

## Licencia

MIT. Consulta [LICENSE](LICENSE).
