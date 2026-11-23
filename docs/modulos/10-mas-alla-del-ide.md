# 10. Más allá del IDE

**Duración:** 25 min · **Tipo:** demo del instructor (los alumnos observan)

Tres capacidades que llevan Copilot del editor al flujo de equipo completo.

## 10.0 Resumen de PR con Copilot

Al crear un Pull Request, el botón de Copilot en la descripción genera un resumen de los cambios. Revísalo antes de publicarlo.

## 10.1 Cloud agent: delegar una tarea y recibir un Pull Request

El **cloud agent** trabaja en segundo plano en un entorno remoto, sobre un issue, y entrega un **Pull Request** para que lo revises.

Flujo:

1. Se escribe un **issue claro** (contexto, criterios de aceptación, restricciones).
2. Se asigna a **Copilot** (desde github.com, el IDE o la CLI con `/delegate`).
3. El agente crea una rama, implementa, ejecuta pruebas y abre un PR.
4. Tú revisas y comentas con `@copilot` para pedir ajustes.

> **Costos y tiempos**
>
> Cada tarea consume créditos de IA y puede tardar varios minutos. Para la demo en vivo, **lanza la tarea con anticipación** o usa un PR ya generado.

Un issue vago produce un PR vago: la calidad del issue es la calidad del resultado.

## 10.2 Copilot code review en el PR

Copilot puede revisar un Pull Request y dejar comentarios (a veces con cambios sugeridos aplicables con un clic).

- Se solicita agregando a **Copilot** como revisor del PR.
- Detecta bugs probables, problemas de seguridad y mejoras de estilo.
- **Complementa, no reemplaza**, la revisión humana.
- Respeta las instrucciones del repositorio.
- Sus comentarios son de tipo **Comment** (no aprueba ni bloquea) y los problemas se pueden resolver con **Fix with Copilot**.
- Consume créditos de IA y minutos de GitHub Actions.
- Puede no dejar ningún comentario si no detecta problemas: ten un PR de respaldo con errores deliberados.

Para practicar la revisión de un cambio generado con IA, hay un [ejercicio opcional](../ejercicios/ej-opcional-revision-pr.md) (fuera de la agenda).

## 10.3 MCP: conectar herramientas externas

El **Model Context Protocol** es un estándar abierto para que el agente use herramientas y datos externos (documentación, bases de datos, GitHub, ticketing…).

Demo con el servidor de **Microsoft Learn** (documentación oficial como contexto):

```json
{
  "servers": {
    "microsoft-learn": {
      "type": "http",
      "url": "https://learn.microsoft.com/api/mcp"
    }
  }
}
```

El instructor lo agrega en `.vscode/mcp.json` para la demo.

Las organizaciones pueden restringir MCP con una política. Si no funciona en tu cuenta, revisa esa política.

Seguridad:

- Instala solo servidores de **fuentes que confíes**.
- Revisa qué herramientas expone y qué permisos pide.
- Las acciones con efectos externos requieren confirmación.

## Puntos clave

1. El cloud agent convierte un issue claro en un PR revisable.
2. El code review automatizado es una primera capa, no la última.
3. MCP amplía lo que el agente puede hacer, con el riesgo de confiar en terceros.
