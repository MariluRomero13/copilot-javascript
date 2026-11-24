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

# 1. Archivos que SÍ van al repo de alumnos (lista blanca)
INCLUIR=(
  .devcontainer .vscode .gitignore
  LICENSE SECURITY.md SUPPORT.md
  package.json package-lock.json jest.config.cjs babel.config.cjs vite.config.js index.html
  src test web
  ejercicios docs
)
for item in "${INCLUIR[@]}"; do
  cp -R "$ROOT/$item" "$DEST/$item"
done

# 2. Quitar lo que es solo del instructor
rm -f "$DEST/docs/guia-instructor.md" "$DEST/docs/pistas.md"

# 3. Superponer los archivos pensados para alumnos
cp -R "$ROOT/plantilla-alumnos/." "$DEST/"

# 4. Limpiar referencias a otras pistas y a archivos del instructor
python3 - "$DEST" <<'PY'
import re, sys, pathlib
dest = pathlib.Path(sys.argv[1])
for md in dest.rglob("*.md"):
    s = md.read_text(encoding="utf-8")
    o = s
    # Bloque "Pistas Python y JavaScript" (cita de 3 líneas + línea en blanco)
    s = re.sub(r"> \*\*Pistas Python y JavaScript\*\*\n>\n> [^\n]*\n\n", "", s)
    # Líneas de recursos de otras pistas
    s = "\n".join(l for l in s.split("\n") if "(pista Python)" not in l and "(pista C#)" not in l)
    if s != o:
        md.write_text(s, encoding="utf-8")
PY

# 5. Archivos sin dependencias del instructor: se comprueba que no queden enlaces rotos a ellos
if grep -rn "pistas.md\|guia-instructor" "$DEST/docs" "$DEST/README.md" >/dev/null 2>&1; then
  echo "Aviso: quedan enlaces a archivos del instructor:" >&2
  grep -rn "pistas.md\|guia-instructor" "$DEST/docs" "$DEST/README.md" >&2 || true
fi

if [ "$INIT_GIT" = "--git" ]; then
  git -C "$DEST" init -q -b main
  git -C "$DEST" add -A
  git -C "$DEST" -c user.name="Instructor" -c user.email="instructor@example.com" commit -qm "Repositorio de alumnos"
fi

echo "Repositorio de alumnos generado en: $DEST"
