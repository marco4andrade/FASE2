# 🛒 FASE2 - Store API Flutter App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-^3.8.1-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-^3.8.1-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Clean Architecture](https://img.shields.io/badge/Clean-Architecture-00D4AA?style=for-the-badge)
![Provider](https://img.shields.io/badge/Provider-^6.1.1-FF6B6B?style=for-the-badge)
---

</div>

## 📖 Descripción del Proyecto

**FASE2** es una **prueba técnica** en Flutter que demuestra habilidades avanzadas en Dart, consumiendo la **Fake Store API** e implementando **Clean Architecture** profesional. Este proyecto evalúa competencias específicas en desarrollo móvil mediante criterios técnicos bien definidos.

### 🎯 Objetivo de la Prueba Técnica

El objetivo de esta prueba técnica es **evaluar habilidades en Dart**, incluyendo:
- **📡 Lectura de API externa** - Consumo eficiente de endpoints REST
- **🏗️ Creación de modelos de datos** - Diseño adecuado y representación coherente  
- **🔄 Manipulación de datos** - Transformación y procesamiento de información
- **🖥️ Impresión en consola** - Presentación legible y organizada de datos



## ✨ Características

### 🔥 Funcionalidades Principales
- 📦 **Gestión de Productos** - Carga y procesamiento de catálogo desde API
- 🏷️ **Categorías Dinámicas** - Obtención y organización de categorías
- 👥 **Gestión de Usuarios** - Procesamiento de información de usuarios
- 🔄 **Estados de Carga** - Manejo de estados asíncronos con Provider
- ❌ **Manejo de Errores** - Error handling robusto con Either pattern
- 🖥️ **Impresión en Consola** ⭐ - **Criterio de evaluación principal**

### 🖥️ **Implementación de Salida en Consola**

La aplicación implementa **múltiples formatos de impresión** para demostrar manipulación efectiva de datos:

#### 📊 **Formatos de Salida Disponibles:**
- **🎯 General**: Vista resumida de todos los datos
- **📦 Productos Detallado**: Información completa por producto
- **🏷️ Categorías Numeradas**: Lista organizada y legible
- **👥 Usuarios Estructurados**: Datos de usuario formateados

### 🏆 Características Técnicas
- ✅ **Clean Architecture** - Separación de capas Domain/Data/Presentation
- ✅ **Type Safety** - Tipado explícito y validaciones robustas
- ✅ **Error Handling** - Either pattern para manejo funcional de errores
- ✅ **State Management** - Provider con notificaciones reactivas
- ✅ **Dependency Injection** - Inyección de dependencias centralizada
- ✅ **Code Documentation** - Documentación Dart Doc comprehensiva
- ✅ **Naming Conventions** - Nomenclatura descriptiva y auto-explicativa

---

## 🚀 Instalación Rápida

### 📋 Requisitos Técnicos

| Requisito | Versión Recomendada | Obligatorio |
|-----------|-------------------|-------------|
| **Flutter SDK** | `^3.8.1` | ✅ |
| **Dart SDK** | `^3.8.1` | ✅ |
| **Android Studio / VS Code** | Última versión | ✅ |
| **Git** | `^2.0` | ✅ |
| **Conexión a Internet** | Estable | ✅ |

### 🔧 Instalación Paso a Paso

```bash
# 1. Clonar el repositorio
git clone https://github.com/marco4andrade/FASE2.git
cd FASE2

# 2. Verificar instalación de Flutter
flutter doctor

# 3. Instalar dependencias
flutter pub get

# 4. Ejecutar la aplicación
flutter run
```

### 🌐 Verificación de API
La aplicación consume **Fake Store API**:
```bash
curl https://fakestoreapi.com/products/1
```

---

## 📦 Dependencias Principales

### 🛠️ Dependencias de Producción

| Dependencia | Versión | Propósito |
|------------|---------|-----------|
| [`http`](https://pub.dev/packages/http) | `^1.1.0` | Cliente HTTP para consumo de APIs REST |
| [`provider`](https://pub.dev/packages/provider) | `^6.1.1` | Gestión de estado reactiva y dependency injection |
| [`dartz`](https://pub.dev/packages/dartz) | `^0.10.1` | Programación funcional - Either pattern para errores |
| [`meta`](https://pub.dev/packages/meta) | `^1.9.1` | Anotaciones para immutable classes y metadata |
| [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) | `^1.0.8` | Iconos iOS para compatibilidad multiplataforma |

### 🧪 Dependencias de Desarrollo

| Dependencia | Versión | Propósito |
|------------|---------|-----------|
| [`flutter_test`](https://docs.flutter.dev/testing) | SDK | Framework de testing integrado |
| [`flutter_lints`](https://pub.dev/packages/flutter_lints) | `^5.0.0` | Reglas de linting para código consistente |

---

### 📋 Responsabilidades por Capa

#### 🎨 **Presentation Layer**
- **Widgets**: Componentes de UI reutilizables y responsivos
- **Providers**: Gestión de estado con notificaciones reactivas  
- **Screens**: Pantallas principales de la aplicación

#### 🏛️ **Domain Layer**
- **Entities**: Modelos de negocio inmutables y tipados
- **Use Cases**: Lógica de negocio encapsulada y testeable
- **Repository Contracts**: Interfaces para acceso a datos

#### 💾 **Data Layer**
- **Models**: Transformación de datos JSON a objetos Dart
- **Data Sources**: Acceso a APIs externas con error handling
- **Repository Implementations**: Implementación concreta de contratos

### 🔄 Flujo de Datos

```
User Action → Provider → Use Case → Repository → Data Source → API
     ↓
UI Update ← State Change ← Business Logic ← Data Transform ← HTTP Response
```

---

## 📁 Estructura del Proyecto

```
step2/
├── 📋 README.md                    # Documentación principal del proyecto
├── 📝 CHANGELOG.md                 # Registro detallado de cambios
├── ⚙️ pubspec.yaml                 # Configuración y dependencias
├── 🎯 analysis_options.yaml        # Reglas de análisis de código
│
├── lib/                           # 📚 Código fuente principal
│   ├── 🎯 main.dart               # Punto de entrada de la aplicación
│   │
│   ├── 🎨 presentation/           # Capa de Presentación
│   │   ├── providers/             # Gestores de estado
│   │   │   └── store_provider.dart
│   │   ├── widgets/               # Componentes UI reutilizables
│   │   │   ├── loading_widget.dart
│   │   │   ├── error_widget.dart
│   │   │   └── data_display_widget.dart
│   │   └── app_screen.dart        # Pantalla principal
│   │
│   ├── 🏛️ domain/                 # Capa de Dominio
│   │   ├── entities/              # Entidades de negocio
│   │   │   ├── product_entity.dart
│   │   │   ├── category_entity.dart
│   │   │   └── user_entity.dart
│   │   ├── repositories/          # Contratos de repositorios
│   │   │   └── store_repository.dart
│   │   └── usecases/              # Casos de uso
│   │       └── store_use_cases.dart
│   │
│   ├── 💾 data/                   # Capa de Datos
│   │   ├── models/                # Modelos de datos
│   │   │   ├── product_model.dart
│   │   │   ├── category_model.dart
│   │   │   └── user_model.dart
│   │   ├── datasources/           # Fuentes de datos
│   │   │   └── store_remote_data_source.dart
│   │   └── repositories/          # Implementaciones
│   │       └── store_repository_impl.dart
│   │
│   └── ⚙️ core/                   # Configuración central
│       ├── dependency_injection.dart  # Inyector de dependencias
│       ├── error/                 # Manejo de errores
│       │   └── failures.dart
│       └── usecases/              # Casos de uso base
│           └── usecase.dart
│
├── 🧪 test/                       # Tests unitarios y de integración
├── 🤖 android/                    # Configuración Android
├── 🍎 ios/                        # Configuración iOS
├── 🐧 linux/                      # Configuración Linux
├── 🪟 windows/                    # Configuración Windows
├── 🌐 web/                        # Configuración Web
└── 🍎 macos/                      # Configuración macOS
```

---

## 🖥️ Ejemplos de Salida en Consola

### 📊 **Formato General** - Vista Resumida
```
== FASE 2 - Store API ==

--- Productos ---
Fjallraven - Foldsack No. 1 Backpack | $109.95
Your perfect pack for everyday use and walks in the forest...
Categoría: men's clothing
---

--- Categorías ---
electronics
jewelery
men's clothing
women's clothing

--- Usuarios ---
ID: 1 | johnd | john@gmail.com
ID: 2 | mor_2314 | morrison@gmail.com
```

### 📦 **Formato Detallado de Productos**
```
== PRODUCTOS ==
ID: 1
Título: Fjallraven - Foldsack No. 1 Backpack
Descripción: Your perfect pack for everyday use and walks in the forest...
Precio: $109.95
Categoría: men's clothing
Imagen: https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg
---
Total de productos: 20
```

### 🏷️ **Formato de Categorías Numeradas**
```
== CATEGORÍAS ==
1. ELECTRONICS
2. JEWELERY  
3. MEN'S CLOTHING
4. WOMEN'S CLOTHING
Total de categorías: 4
```

### 👥 **Formato de Usuarios Estructurados**
```
== USUARIOS ==
ID: 1
Username: johnd
Email: john@gmail.com
---
ID: 2
Username: mor_2314
Email: morrison@gmail.com
---
Total de usuarios: 10
```

---

## 🌐 API Endpoints

### 🔗 Fake Store API Integration

| Endpoint | Método | Descripción | Modelo |
|----------|--------|-------------|---------|
| `/products` | GET | Lista completa de productos | `ProductModel[]` |
| `/products/categories` | GET | Categorías disponibles | `CategoryModel[]` |
| `/users` | GET | Usuarios del sistema | `UserModel[]` |

**Base URL**: `https://fakestoreapi.com`

### 📊 Ejemplo de Respuesta

```json
{
  "id": 1,
  "title": "Fjallraven - Foldsack No. 1 Backpack",
  "price": 109.95,
  "description": "Your perfect pack for everyday use...",
  "category": "men's clothing",
  "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
}
```

---

---

## �🔧 Desarrollo

### 🚀 Comandos de Ejecución

```bash
# Ejecutar aplicación y ver salida en consola
flutter run

# Análisis de código
flutter analyze

# Tests (si implementados)
flutter test
```

### 🎨 Convenciones de Código

- **Naming**: PascalCase para clases, camelCase para variables/métodos
- **Files**: snake_case para nombres de archivo
- **Documentation**: Triple slash (///) para documentación Dart Doc
- **Imports**: Ordenados alfabéticamente con separación por grupos
- **Error Handling**: Either pattern para operaciones que pueden fallar

### 🖥️ Ver Salida en Consola

Al ejecutar `flutter run`, verás en la consola del IDE/terminal:
1. **Carga inicial** con estados de loading
2. **Error handling** si hay problemas de conectividad
3. **Información completa** de productos, categorías y usuarios


## 👨‍💻 Autor

**Marco Andrade** - [@marco4andrade](https://github.com/marco4andrade)

---

