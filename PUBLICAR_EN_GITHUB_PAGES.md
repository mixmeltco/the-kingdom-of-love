# Publicar el videojuego con GitHub Pages

Repositorio: https://github.com/mixmeltco/the-kingdom-of-love

## Subir el proyecto V5 completo
1. Descarga y descomprime el ZIP Auralia V5.
2. Instala Git for Windows: https://git-scm.com/download/win.
3. Abre PowerShell en la carpeta raíz donde está `index.html`.
4. Ejecuta:
   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   .\SUBIR_A_GITHUB.ps1
   ```
5. Pulsa Enter para aceptar el repositorio predeterminado `https://github.com/mixmeltco/the-kingdom-of-love.git`.
6. Completa la autenticación GitHub en el navegador si Git Credential Manager la solicita.

El script clona el repositorio existente, copia el proyecto completo y hace push a `main`. Esto conserva el primer commit y evita un error de historial no relacionado.

## Activar GitHub Pages
Después de subir el proyecto completo:
1. Abre https://github.com/mixmeltco/the-kingdom-of-love/settings/pages.
2. Selecciona **Build and deployment → Source → GitHub Actions**.
3. Abre Actions y espera a que el flujo de publicación termine correctamente.

No actives Pages antes de que el videojuego completo esté subido: el repositorio inicial solo contiene documentación y el workflow.

## Configurar la URL pública
Cuando GitHub Pages muestre la dirección, normalmente `https://mixmeltco.github.io/the-kingdom-of-love/`, en la carpeta local descomprimida ejecuta:
```powershell
node .\tools\set-github-pages-url.cjs "https://mixmeltco.github.io/the-kingdom-of-love/"
.\SUBIR_A_GITHUB.ps1
```
El segundo comando vuelve a copiar y subir los cambios de configuración para que la URL canónica y la vista previa social de WhatsApp sean correctas.

## Comprobación y guardado
Abre la URL publicada en una ventana privada y después en un teléfono. El progreso queda guardado localmente en el navegador de cada dispositivo y no se sincroniza automáticamente entre teléfono y computador.
