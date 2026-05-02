# UIFV - UI Front para Cuidado y Seguimiento de Plantaciones

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-Mobile-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-2.7+-0175C2?logo=dart&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-Local%20Storage-003B57?logo=sqlite&logoColor=white)
![Google Maps](https://img.shields.io/badge/Google%20Maps-Location-4285F4?logo=google-maps&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

**Aplicación móvil para el seguimiento, cuidado y gestión de plantaciones agrícolas con geolocalización, actividades programadas y registro local.**

</div>

---

## 📋 Descripción

UIFV es una interfaz de usuario frontend desarrollada en **Flutter** para una aplicación de cuidado y seguimiento de plantaciones. Permite a los agricultores y entusiastas de la jardinería seleccionar productos agrícolas (como girasol, fresa, etc.), visualizar su ubicación en un mapa, consultar actividades de cuidado específicas (regar, sembrar, solear) y llevar un historial local de las acciones realizadas en cada cultivo.

El proyecto combina visualización en mapas con Google Maps, persistencia local mediante SQLite, geolocalización en tiempo real y una interfaz atractiva con animaciones y gráficos vectoriales.

---

## 🚀 Características Principales

| Módulo | Descripción |
|--------|-------------|
| **🗺️ Mapa de Plantaciones** | Visualización de la ubicación actual del usuario y las plantaciones mediante **Google Maps Flutter**, con geocodificación inversa para obtener el estado/provincia. |
| **🌱 Selección de Productos** | Catálogo de productos agrícolas (girasol, fresa, etc.) con imágenes en caché, descripciones detalladas y beneficios de cada cultivo. |
| **📅 Actividades de Cuidado** | Lista de actividades específicas por producto (regar, sembrar, solear, formar gallinero, recolectar) con guías paso a paso y contenido multimedia. |
| **📝 Registro de Actividades (Log)** | Historial de actividades completadas almacenado localmente en **SQLite**, permitiendo el seguimiento del progreso diario y semanal. |
| **💾 Base de Datos Local** | Persistencia de actividades del usuario con **SQFlite**, incluyendo identificador de actividad, producto asociado y fecha de realización. |
| **📍 Geolocalización en Tiempo Real** | Obtención de coordenadas GPS actuales y conversión a dirección legible mediante geocodificación. |
| **🎨 Animaciones y SVG** | Splash screen animado con **Rive**, iconos vectoriales SVG para las actividades y transiciones suaves entre pantallas. |
| **📤 Exportación CSV** | Capacidad de exportar datos de actividades a formato CSV para análisis externos. |
| **🔗 Compartir** | Integración con funciones nativas de compartir contenido del cultivo. |

---

## 🛠️ Stack Tecnológico

| Tecnología | Uso |
|------------|-----|
| **Flutter** | Framework UI multiplataforma (Android / iOS) |
| **Dart** | Lenguaje de programación |
| **SQFlite** | Base de datos SQLite local para registro de actividades |
| **Google Maps Flutter** | Mapas interactivos con marcadores y posición actual |
| **Geocoder** | Geocodificación inversa (coordenadas → dirección) |
| **GPS** | Obtención de coordenadas GPS del dispositivo |
| **Rive Splash Screen** | Animación de entrada a la aplicación |
| **Flutter SVG Provider** | Renderizado de iconos vectoriales SVG para actividades |
| **Cached Network Image** | Carga y caché de imágenes de productos desde la red |
| **Lazy Load ScrollView** | Carga progresiva de contenido en listas largas |
| **CSV** | Exportación de datos de actividades a CSV |
| **Path Provider** | Acceso a directorios del sistema de archivos |
| **Share** | Compartir contenido mediante apps nativas |
| **Intl** | Formateo de fechas y números |

---

## 📁 Estructura del Proyecto

```
lib/
├── main.dart                          # Punto de entrada de la aplicación
├── databases/
│   ├── nameDb.dart                    # Configuración y nombres de la base de datos
│   └── UserActivities.dart            # Modelo y provider de actividades del usuario (SQLite)
├── pages/
│   ├── splashPage.dart                # Pantalla de bienvenida con animación Rive
│   ├── loginPage.dart                 # Pantalla de inicio de sesión
│   ├── selectProductPage.dart         # Catálogo de productos agrícolas disponibles
│   ├── viewProductPage.dart           # Detalle del producto seleccionado
│   ├── activitiesPage.dart            # Lista de actividades de cuidado por producto
│   ├── activityProductPage.dart       # Detalle de una actividad específica
│   ├── logActivityPage.dart           # Historial de actividades completadas
│   ├── mapaPage.dart                  # Mapa con ubicación de la plantación
│   ├── girasolSembrarPage.dart        # Guía paso a paso: sembrar girasol
│   ├── girasolRegarPage.dart          # Guía paso a paso: regar girasol
│   ├── girasolSolearPage.dart         # Guía paso a paso: solear girasol
│   ├── loadingPage.dart               # Pantalla de carga
│   ├── upPage.dart                    # Página de actualización/subida
│   └── testPage.dart                  # Página de pruebas y desarrollo
├── values/
│   ├── colors.dart                    # Paleta de colores de la aplicación
│   ├── const.dart                     # Constantes globales
│   └── productsOfWeek.dart            # Productos destacados/semanales
├── utils/
│   ├── fix.dart                       # Utilidades y helpers generales
│   └── ux_methods.dart                # Métodos de experiencia de usuario (status bar, etc.)
└── widgets/
    ├── custom_large_button.dart       # Botón principal reutilizable
    ├── custom_or_divider.dart         # Separador visual "O"
    ├── description_item.dart          # Componente de descripción de producto
    ├── divine_card.dart               # Tarjeta decorativa para contenido
    ├── log_activity_card.dart         # Tarjeta de actividad en el historial
    ├── navigation_button.dart         # Botón de navegación inferior
    ├── network_login_row.dart         # Fila de opciones de login social
    ├── password_input.dart            # Campo de contraseña estilizado
    ├── product_item_maps.dart         # Marcador/item de producto en el mapa
    ├── product_week_card.dart         # Tarjeta de producto de la semana
    └── products_divider.dart          # Separador entre secciones de productos
```

---

## 📦 Instalación y Ejecución

### Requisitos Previos

- Flutter SDK compatible con Dart `>=2.7.0 <3.0.0`
- Dart SDK
- Android Studio / VS Code
- API Key de Google Maps (para Android y iOS)
- Dispositivo físico con GPS (para pruebas de geolocalización)

### Pasos

```bash
# 1. Clonar el repositorio
git clone https://github.com/ebravo-dev/uifv.git
cd uifv

# 2. Instalar dependencias
flutter pub get

# 3. Configurar Google Maps API Key
# Android: Agrega tu API key en android/app/src/main/AndroidManifest.xml
# iOS: Agrega tu API key en ios/Runner/AppDelegate.swift

# 4. Ejecutar la aplicación
flutter run
```

---

## 🌱 Flujo de Uso

1. **Splash Screen:** Animación de bienvenida con el logo de la aplicación.
2. **Inicio de Sesión:** Acceso al sistema (o navegación directa al mapa en modo demo).
3. **Mapa:** Visualiza tu ubicación actual y las zonas de plantación cercanas.
4. **Seleccionar Producto:** Elige un cultivo de tu interés (girasol, fresa, etc.) del catálogo.
5. **Ver Actividades:** Consulta las actividades recomendadas para ese producto (sembrar, regar, solear, mantener).
6. **Completar Actividad:** Sigue la guía paso a paso con imágenes e instrucciones.
7. **Historial:** Revisa el log de actividades completadas, filtrado por producto y fecha.
8. **Exportar:** Genera un archivo CSV con tu historial para análisis externo.

---

## 🗺️ Roadmap

- [ ] Sincronización de datos con backend en la nube (Firebase / REST API)
- [ ] Notificaciones push para recordatorios de actividades diarias
- [ ] Clima integrado en el mapa para planificación de riego y siembra
- [ ] Galería de fotos por plantación (evidencia de crecimiento)
- [ ] Estadísticas y gráficas de progreso del cultivo
- [ ] Comunidad de agricultores (foro/chat)
- [ ] Modo offline completo con sincronización diferida
- [ ] Soporte para más cultivos y regiones geográficas
- [ ] Reconocimiento de enfermedades en plantas mediante cámara + IA

---

## 🤝 Contribución

¡Las contribuciones son bienvenidas! Si tienes ideas para mejorar el seguimiento de plantaciones o quieres agregar nuevos cultivos:

1. Haz un **Fork** del repositorio
2. Crea una rama (`git checkout -b feature/nueva-funcionalidad`)
3. Haz commit de tus cambios (`git commit -m 'Agrega nueva funcionalidad'`)
4. Sube la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un **Pull Request**

---

## 📄 Licencia

Este proyecto está bajo la licencia **MIT**. Consulta el archivo [`LICENSE`](LICENSE) para más detalles.

---

## 👥 Contacto

**Eder J. Bravo** - [@ebravo-dev](https://github.com/ebravo-dev) - [ederjgb94@gmail.com](mailto:ederjgb94@gmail.com)

---

<div align="center">

**⭐ Si esta app te ayuda a cuidar tus plantaciones, ¡dale una estrella! ⭐**

</div>
