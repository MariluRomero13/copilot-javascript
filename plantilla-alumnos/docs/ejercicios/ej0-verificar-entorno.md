# Ejercicio 0: verifica tu entorno

**Tiempo:** 10 minutos · **Cuándo:** antes de empezar el autocompletado (idealmente, antes del curso)

## Pasos

1. Abre tu copia del repositorio en **Codespaces** o en VS Code.
2. En la terminal:

```bash
npm install
npm test
```

   Deben pasar las pruebas de la API y de React.

3. Arranca la API y comprueba que responde:

```bash
npm start
```

   Abre `http://localhost:5000/products` (o usa `curl`). Detén el servidor con `Ctrl+C`.

4. **Comprueba Copilot:**
   - [ ] En un archivo de código escribe un comentario y comprueba que aparece texto gris (ghost text).
   - [ ] Abre el chat (`Ctrl+Alt+I`) y comprueba que ves el **selector de agentes** (Agent, Plan, Ask).
   - [ ] Ejecuta *Chat: Open Customizations* en la paleta de comandos (`Ctrl+Shift+P`) y comprueba que se abre.
   - [ ] Revisa en `github.com/settings/copilot` que tu licencia está activa.

5. Haz tu primer commit de control:

```bash
git status
git commit --allow-empty -m "Entorno verificado"
```

## Si algo falla

Avisa al instructor antes de continuar. Los problemas más comunes son la versión de Node.js (necesitas 20 o superior), una licencia de Copilot inactiva o una versión antigua de VS Code.
