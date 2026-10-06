#!/usr/bin/env bash
set -euo pipefail

cd /workspaces/metier

# Charge les variables locales sans les écrire dans le dépôt.
if [ -f .env ]; then
  set -a
  . ./.env
  set +a
fi

source .venv/bin/activate

python scripts/extraire.py
python scripts/extraire_wttj.py
python scripts/extraire_apec.py
python scripts/resumer.py
