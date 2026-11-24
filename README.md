# THE KINGDOM OF LOVE — AURALIA
## La canción de dos luces · ANDRÉS & VANNESA

Videojuego web 2D de aventuras con estética retro de 16 bits, exploración, combate y una mecánica original de resonancia.

### El reino
En Auralia, cinco regiones mantenían su armonía gracias a la Campana del Alba. El Afinador del Silencio quebró su cristal en cinco fragmentos. ANDRÉS y VANNESA recorren el reino para recuperar las notas y devolver la música a sus habitantes.

### Cinco regiones · quince capítulos
1. Valle de las Campanas
2. Bosque de las Luciérnagas
3. Mar de Vidrio
4. Cumbres del Invierno Azul
5. Ciudad del Eclipse

Cada región contiene tres capítulos y culmina con un guardián.

### Protagonistas
- **ANDRÉS:** combate cercano y fuerza.
- **VANNESA:** magia y agilidad.
- Ambos pueden completar la aventura y activar resonadores.

### Controles
**Teclado:** A/D o flechas para moverse; Espacio/W/Flecha arriba para saltar; Shift para correr; F para habilidad; E para resonancia; Escape para pausar.

**Móvil:** controles táctiles en pantalla. Se recomienda orientación horizontal.

### Ejecutar localmente
Requiere Git (para publicar) y Python (para servidor local):
```powershell
python -m http.server 8000
```
Abre http://localhost:8000. Phaser 3 se carga desde un CDN en la primera visita. El Service Worker intenta conservar los recursos para visitas posteriores.

### Publicar
El repositorio usa GitHub Pages mediante GitHub Actions. El workflow está en `.github/workflows/pages.yml`. Cada push a `main` despliega el sitio. En GitHub, selecciona **Settings → Pages → Build and deployment → Source: GitHub Actions**.

Para subir el proyecto V5 completo desde la carpeta descomprimida de su ZIP, ejecuta:
```powershell
.\SUBIR_A_GITHUB.ps1
```
El script clona este repositorio, copia el proyecto encima de la versión inicial, crea un commit y hace push. Git for Windows y autenticación de GitHub (Git Credential Manager) son necesarios.

### Personalización
Edita `src/config.js` para cambiar nombres, dedicatoria, carta final, recuerdos secretos y créditos. Los recuerdos están vacíos por defecto.

### Estado de calidad
La estructura y sintaxis se pueden validar con `node tools/validate_project.cjs`. La validación estática no sustituye el recorrido manual de los quince capítulos ni pruebas en teléfonos físicos. Consulta `QA_REPORT.md` y `BIBLIA_DE_DISENO_AURALIA.md` dentro del paquete de proyecto para conocer el alcance y los pendientes.
