# THE KINGDOM OF LOVE — AURALIA
## La canción de dos luces · ANDRÉS & VANNESA

**El repositorio ya está inicializado.** Para cargar el juego completo (código, imágenes, PWA y documentación) falta ejecutar una sola vez el script incluido en el paquete V5.

### Subida inicial del videojuego
1. Descarga y descomprime [Auralia V5](https://github.com/mixmeltco/the-kingdom-of-love) (paquete entregado en la conversación).
2. Instala Git for Windows si aún no está instalado: https://git-scm.com/download/win.
3. Abre PowerShell en la carpeta descomprimida que contiene `index.html`.
4. Ejecuta:
   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   .\SUBIR_A_GITHUB.ps1
   ```
5. Pulsa Enter para aceptar el repositorio predeterminado `https://github.com/mixmeltco/the-kingdom-of-love.git` y completa la autenticación de GitHub si se solicita.

El script clona el repositorio existente, copia el proyecto completo y hace push a `main`, conservando el historial actual.

### Publicación web
El workflow automático está en `.github/workflows/pages.yml`. **Después de subir el proyecto completo**, abre Settings → Pages → Build and deployment → Source y selecciona **GitHub Actions**. Luego revisa la pestaña Actions.

Guía detallada: [PUBLICAR_EN_GITHUB_PAGES.md](PUBLICAR_EN_GITHUB_PAGES.md).

### Concepto del juego
En Auralia, cinco regiones se mantenían en armonía gracias a la Campana del Alba. El Afinador del Silencio quebró su cristal en cinco fragmentos. ANDRÉS y VANNESA recorren el reino para recuperar las notas y devolver la música.

Regiones: Valle de las Campanas · Bosque de las Luciérnagas · Mar de Vidrio · Cumbres del Invierno Azul · Ciudad del Eclipse.

**Importante:** hasta completar la subida inicial, este repositorio todavía no contiene el juego desplegable. El workflow no publicará el videojuego hasta que `index.html`, `src/` y `assets/` estén cargados.
