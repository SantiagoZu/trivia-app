#!/usr/bin/env bash
# Instala Flutter (canal estable) y prepara el proyecto. Se ejecuta una sola vez al crear el Codespace.
set -e
sudo apt-get update -y && sudo apt-get install -y --no-install-recommends unzip xz-utils zip
if [ ! -d "$HOME/flutter" ]; then
  git clone --depth 1 -b stable https://github.com/flutter/flutter.git "$HOME/flutter"
fi
export PATH="$PATH:$HOME/flutter/bin"
grep -q 'flutter/bin' ~/.bashrc || echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
flutter config --no-analytics
flutter config --enable-web
# Genera las carpetas de plataforma (web y android) sin tocar el código de lib/
flutter create . --platforms=web,android --project-name trivia_app
flutter pub get
echo "Listo. Ejecuta: ./run.sh"
