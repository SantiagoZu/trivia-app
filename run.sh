#!/usr/bin/env bash
# Ejecuta la app en el navegador (puerto 8080). En la terminal: r = recargar, q = salir.
export PATH="$PATH:$HOME/flutter/bin"
flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0
