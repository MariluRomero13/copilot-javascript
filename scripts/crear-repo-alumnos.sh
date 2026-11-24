#!/usr/bin/env bash
# Genera el repositorio de alumnos a partir de este repositorio maestro.
# Uso: scripts/crear-repo-alumnos.sh <carpeta-destino> [--git]
#   --git   inicializa un repositorio git en el destino con un commit inicial.
set -euo pipefail

DEST="${1:?Indica la carpeta de destino, por ejemplo: scripts/crear-repo-alumnos.sh ../copilot-curso-alumnos --git}"
INIT_GIT="${2:-}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ -e "$DEST" ] && [ -n "$(ls -A "$DEST" 2>/dev/null)" ]; then
  echo "La carpeta $DEST ya existe y no está vacía." >&2; exit 1
fi
mkdir -p "$DEST"

# 1. Archivos que SÍ van al repo de alumnos (lista blanca). La carpeta docs/ es del instructor y NO se copia.
INCLUIR=(
  .devcontainer .vscode .gitignore
  LICENSE SECURITY.md SUPPORT.md
  package.json package-lock.json jest.config.cjs babel.config.cjs vite.config.js index.html
  src test web
  ejercicios
)
for item in "${INCLUIR[@]}"; do
  cp -R "$ROOT/$item" "$DEST/$item"
done

# 2. Superponer los archivos pensados para alumnos (README y Ejercicio 0)
cp -R "$ROOT/plantilla-alumnos/." "$DEST/"

# 3. Cada enunciado (docs/ejercicios/X.md) pasa a ser el README.md de su carpeta de ejercicio
python3 - "$ROOT" "$DEST" <<'PY'
import re, sys, pathlib, shutil
root, dest = map(pathlib.Path, sys.argv[1:3])
carpetas = ["ej1-autocompletado", "ej2-chat-contexto-prompting", "ej3-codigo-legacy",
            "ej4-agent-descuentos", "ej5-imagen-a-codigo", "ej-opcional-revision-pr"]
for c in carpetas:
    s = (root / "docs" / "ejercicios" / f"{c}.md").read_text(encoding="utf-8")
    # Los módulos son material del instructor: se deja el nombre sin enlace
    s = re.sub(r"\[([^\]]+)\]\((?:\.\./)+modulos/[^)]+\)", r"\1", s)
    s = s.replace("](../assets/mockup-catalogo.png)", "](mockup-catalogo.png)")
    carpeta = dest / "ejercicios" / c
    carpeta.mkdir(parents=True, exist_ok=True)
    (carpeta / "README.md").write_text(s, encoding="utf-8")
# La referencia a docs/ del código de partida apunta ahora al README de la carpeta
inv = dest / "ejercicios/ej1-autocompletado/inventario.js"
t = inv.read_text(encoding="utf-8").replace("docs/ejercicios/ej1-autocompletado.md", "ejercicios/ej1-autocompletado/README.md")
inv.write_text(t, encoding="utf-8")
PY

# 4. Comprobar que no queda nada del instructor ni enlaces a docs/
if grep -rnE "docs/|guia-instructor|pistas\.md|\.\./modulos" "$DEST" --include=*.md --include=*.js --exclude-dir=node_modules --exclude-dir=.git >/dev/null 2>&1; then
  echo "Aviso: quedan referencias a docs/ o al instructor:" >&2
  grep -rnE "docs/|guia-instructor|pistas\.md|\.\./modulos" "$DEST" --include=*.md --include=*.js --exclude-dir=node_modules --exclude-dir=.git >&2 || true
fi

if [ "$INIT_GIT" = "--git" ]; then
  git -C "$DEST" init -q -b main
  git -C "$DEST" add -A
  git -C "$DEST" -c user.name="Instructor" -c user.email="instructor@example.com" commit -qm "Repositorio de alumnos"
fi

echo "Repositorio de alumnos generado en: $DEST"
