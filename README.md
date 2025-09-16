# 🛒 FASE2 - Store API Flutter App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-^3.8.1-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-^3.8.1-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## 🔧 Desarrollo

### 🚀 Comandos de Ejecución

```bash
# Ejecutar aplicación y ver salida en consola
flutter run

# Análisis de código (✅ 0 errores, 30 advertencias de print)
flutter analyze

# Tests unitarios (✅ FUNCIONANDO)
flutter test

# Limpieza de proyecto
flutter clean && flutter pub get

# Compilación de producción
flutter build apk --release
```

### 📊 **Estado Actual del Proyecto**
- ✅ **Compilación**: Sin errores críticos
- ✅ **Tests**: 1/1 funcionando - App carga sin errores
- ✅ **Análisis**: Solo advertencias de print (ignorables en desarrollo)
- ✅ **Arquitectura**: Clean Architecture 100% implementada/badge/Provider-^6.1.1-FF6B6B?style=for-the-badge)
---

</div>

## 📖 Descripción del Proyecto

**FASE2** es una **prueba técnica** en Flutter que demuestra habilidades avanzadas en Dart, consumiendo la **Fake Store API** e implementando **Clean Architecture** profesional. Este proyecto evalúa competencias específicas en desarrollo móvil mediante criterios técnicos bien definidos.

### 🔄 **REFACTORIZACIÓN 2025 - CLEAN ARCHITECTURE**

El proyecto ha sido **completamente refactorizado** de Arquitectura Hexagonal a **Clean Architecture estándar**, implementando las mejores prácticas de desarrollo móvil:

- ✅ **Arquitectura Limpia**: Migración completa a Clean Architecture
- ✅ **Entidades de Dominio**: Lógica de negocio pura e independiente  
- ✅ **Separación de Capas**: Dependencias dirigidas hacia el centro
- ✅ **Código Optimizado**: Eliminación de archivos redundantes
- ✅ **Estructura Minimalista**: 24 archivos esenciales organizados eficientemente

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

#### 🎯 **Clean Architecture - Refactorizada 2025**
- ✅ **Capa de Dominio** - Entidades con lógica de negocio pura (Product, Category, User)
- ✅ **Capa de Datos** - Modelos que extienden entidades + implementaciones de Repository
- ✅ **Capa de Presentación** - Providers y Widgets usando entidades del dominio
- ✅ **Capa Core** - Casos de Uso centralizados y utilidades compartidas

#### 🔧 **Mejoras Implementadas**
- ✅ **Seguridad de Tipos** - Tipado explícito con entidades inmutables
- ✅ **Manejo de Errores** - Patrón Either funcional con DomainError
- ✅ **Gestión de Estado** - Provider reactivo con entidades de Clean Architecture
- ✅ **Inyección de Dependencias** - Inyección centralizada actualizada
- ✅ **Optimización de Código** - Eliminación de archivos redundantes (2 archivos eliminados)
- ✅ **Documentación** - Documentación Dart Doc actualizada y comprehensiva

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

### 📋 Responsabilidades por Capa - Clean Architecture

#### 🎨 **Capa de Presentación** 
- **Providers**: Gestión de estado usando **entidades del dominio** (no modelos)
- **Widgets**: Componentes de UI reactivos que consumen entidades
- **Pantalla de App**: Coordinación de estados y navegación

#### 🏛️ **Capa de Dominio** - ❤️ **Corazón de Clean Architecture**
- **Entidades**: Lógica de negocio pura (Product, Category, User)
  - `Product`: Entidad con validaciones y métodos de negocio
  - `Category`: Normalización y validación de nombres
  - `User`: Validación de email y datos de usuario
- **Contratos de Repository**: Interfaces que **solo** usan entidades

#### ⚙️ **Capa Core** - **Nuevo en la Refactorización**
- **Casos de Uso**: Orquestación de entidades y repositorios (StoreUseCases)
- **Manejo de Errores**: DomainError para errores funcionales
- **Inyección de Dependencias**: Configuración centralizada actualizada

#### 💾 **Capa de Datos**
- **Modelos**: Extienden entidades del dominio (compatibilidad automática)
- **Mappers**: Conversión JSON → Modelos → Entidades
- **Implementaciones de Repository**: Convierten Modelos a Entidades antes de retornar
- **Fuentes de Datos**: Servicio API con mappers integrados

### 🔄 Flujo de Datos - Clean Architecture

```
User Action → Provider → Core Use Cases → Domain Repository → Data Implementation
     ↓              ↓         ↓              ↓                    ↓
UI Update ← Entity ← Entity ← Entity ← Model→Entity ← JSON Response
```

#### 🎯 **Ventajas del Nuevo Flujo:**
- **🏛️ Entidades de Dominio**: Datos siempre validados con lógica de negocio
- **🔄 Seguridad de Tipos**: Los Modelos extienden Entidades (compatibilidad automática)  
- **⚡ Rendimiento**: Conversión automática sin sobrecarga
- **🧪 Capacidad de Prueba**: Capa de dominio completamente independiente

---

## 📁 Estructura del Proyecto - Clean Architecture Refactorizada

```
step2/
├── 📋 README.md                           # Documentación actualizada con Clean Architecture
├── 📝 MODIFICACIONES_MAPPER_PATTERN.md   # Log completo de refactorización
├── ⚙️ pubspec.yaml                       # Configuración y dependencias
├── 🎯 analysis_options.yaml              # Reglas de análisis de código
│
├── lib/                                  # 📚 Código fuente principal (24 archivos optimizados)
│   ├── 🎯 main.dart                      # Punto de entrada con Clean Architecture DI
│   │
│   ├── ⚙️ core/                          # 🆕 Capa Core - Use Cases y Utilidades
│   │   ├── dependency_injection.dart     # DI actualizada para Clean Architecture
│   │   ├── usecases/                     # Use Cases centralizados
│   │   │   └── store_use_cases.dart      # Orquesta entidades y repositorios
│   │   ├── error/                        # Manejo de errores funcional
│   │   │   └── failures.dart             # DomainError para Clean Architecture
│   │   └── enum/                         # Estados de aplicación
│   │       └── screen_state_enum.dart    # Estados de carga optimizados
│   │
│   ├── 🏛️ domain/                        # 🆕 Capa de Dominio - Business Logic Puro
│   │   ├── entities/                     # 🆕 Entidades con lógica de negocio
│   │   │   ├── product.dart              # Entity: Product con validaciones
│   │   │   ├── category.dart             # Entity: Category con normalización
│   │   │   └── user.dart                 # Entity: User con validación email
│   │   └── repositories/                 # Contratos que usan SOLO entidades
│   │       └── store_repository.dart     # Interface: Either<DomainError, Entity>
│   │
│   ├── 🎨 presentation/                  # Capa de Presentación - UI Reactiva
│   │   ├── providers/                    # State management con entidades
│   │   │   └── store_provider.dart       # Provider usando Product, Category, User
│   │   ├── widgets/                      # Componentes UI optimizados
│   │   │   ├── loading_widget.dart       # Widget de carga
│   │   │   ├── error_display_widget.dart # Widget de error
│   │   │   ├── store_action_button.dart  # Botón de acción reutilizable
│   │   │   └── action_buttons_widget.dart# Widget de botones principal
│   │   └── app_screen.dart               # Pantalla principal reactiva
│   │
│   └── 💾 data/                          # Capa de Datos - Acceso Externo
│       ├── models/                       # Models que EXTIENDEN entidades
│       │   ├── product_model.dart        # ProductModel extends Product
│       │   ├── category_model.dart       # CategoryModel extends Category  
│       │   └── user_model.dart           # UserModel extends User
│       ├── mappers/                      # Conversión JSON ↔ Models
│       │   ├── product_mapper.dart       # JSON → ProductModel
│       │   ├── category_mapper.dart      # String/JSON → CategoryModel
│       │   ├── user_mapper.dart          # JSON → UserModel
│       │   └── mappers.dart              # Re-export de todos los mappers
│       ├── datasources/                  # Acceso a APIs externas
│       │   └── store_api_service.dart    # HTTP client con mappers integrados
│       └── repositories/                 # Implementaciones que convierten Models→Entities
│           └── store_repository_impl.dart# Implementa StoreRepository
│
├── 🧪 test/                              # Tests unitarios validados
│   └── widget_test.dart                  # Test funcional: ✅ PASSING
├── � android/ | 🍎 ios/ | 🐧 linux/ | 🪟 windows/ | 🌐 web/ | 🍎 macos/
```

### 📊 **Métricas de la Refactorización**

| Aspecto | Antes (Hexagonal) | Después (Clean) | Mejora |
|---------|-------------------|-----------------|--------|
| **Archivos .dart** | 26 archivos | **24 archivos** | ✅ **-2 redundantes** |
| **Capas** | Infraestructura | **Core/Dominio/Datos/Presentación** | ✅ **Estándar** |
| **Entidades** | En Capa de Datos | **Capa de Dominio pura** | ✅ **Lógica de Negocio** |
| **Errores compilación** | 116 → 5 → 0 | **0 errores** | ✅ **100% limpio** |
| **Dependencias** | Circulares | **Unidireccionales** | ✅ **Hacia dominio** |

---

## 🏆 Ventajas de Clean Architecture Implementada

### 🎯 **Beneficios Técnicos Alcanzados**

#### 💎 **1. Separación de Responsabilidades**
- **Dominio**: Lógica de negocio pura sin dependencias externas
- **Datos**: Manejo de persistencia y APIs completamente aislado  
- **Presentación**: UI reactiva que consume entidades validadas
- **Core**: Utilidades transversales centralizadas

#### 🔄 **2. Inversión de Dependencias**
```dart
// ✅ CORRECTO: Dependencias apuntan hacia Dominio
Capa Datos → Capa Dominio ← Capa Presentación
     ↓              ↑              ↑
  Modelos      Entidades   Componentes UI
```

#### 🧪 **3. Capacidad de Prueba Mejorada**
- **Entidades de Dominio**: 100% probables sin mocks
- **Casos de Uso**: Lógica aislada y verificable
- **Contratos de Repository**: Fáciles de simular
- **Presentación**: Componentes UI desacoplados

#### ⚡ **4. Mantenibilidad y Escalabilidad**
- **Cambios de UI**: No afectan lógica de negocio
- **Cambios de API**: Solo afectan Capa de Datos
- **Nuevas funcionalidades**: Agregar entidades sin cambios disruptivos
- **Refactorización**: Capas independientes, cambios localizados

#### 🔒 **5. Seguridad de Tipos y Robustez**
- **Entidades Inmutables**: Datos validados en construcción
- **Patrón Either**: Manejo de errores funcional sin excepciones
- **Seguridad en Tiempo de Compilación**: Errores detectados en desarrollo
- **Lógica de Negocio**: Encapsulada en entidades del dominio

#### 📱 **6. Desarrollo Ágil**
- **Desarrollo Paralelo**: Equipos trabajando en capas independientes
- **Desarrollo con Simulaciones**: Desarrollo de UI sin APIs listas
- **Integración Continua**: Tests unitarios rápidos y confiables
- **Revisión de Código**: Cambios localizados y verificables

### 🔍 **Comparación: Antes vs Después**

| Aspecto | Arquitectura Hexagonal | Clean Architecture ✅ |
|---------|----------------------|---------------------|
| **Complejidad** | Infraestructura compleja | **Capas intuitivas** |
| **Curva de Aprendizaje** | Conceptos avanzados | **Estándar de industria** |
| **Capacidad de Prueba** | Simulación de repositorios | **Entidades de dominio puras** |
| **Escalabilidad** | Puertos y Adaptadores | **Dependencias unidireccionales** |
| **Trabajo en Equipo** | Curva de aprendizaje | **Familiar para móvil/web** |
| **Mantenimiento** | Sobrecarga de infraestructura | **Separación clara** |

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

### 🎨 Convenciones de Código - Clean Architecture

#### 📝 **Convenciones de Nomenclatura**
- **Entidades**: `Product`, `Category`, `User` (lógica de dominio)
- **Modelos**: `ProductModel`, `CategoryModel`, `UserModel` (extienden entidades)
- **Repositorios**: `StoreRepository` (abstracto), `StoreRepositoryImpl` (concreto)
- **Casos de Uso**: `StoreUseCases` (operaciones de negocio centralizadas)
- **Providers**: `StoreProvider` (gestión de estado con entidades)

#### 🏗️ **Patrones de Arquitectura**
- **Entidades de Dominio**: Clases inmutables con lógica de negocio
- **Extensión de Modelos**: `ProductModel extends Product` para compatibilidad automática
- **Patrón Either**: `Either<DomainError, Entity>` para manejo funcional de errores
- **Inyección de Dependencias**: Centralizada en `core/dependency_injection.dart`

#### 📚 **Estándares de Documentación**
- **Triple Slash**: `///` para documentación Dart Doc
- **Comentarios de Arquitectura**: Responsabilidades de capas claramente documentadas
- **Lógica de Negocio**: Métodos de entidades con documentación clara de propósito
- **Manejo de Errores**: Tipos DomainError con mensajes descriptivos

#### 📁 **Organización de Imports**
```dart
// 1. Paquetes Flutter/Dart
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';

// 2. Capa de dominio (entidades, repositorios)  
import 'package:step2/domain/entities/product.dart';
import 'package:step2/domain/repositories/store_repository.dart';

// 3. Otras capas (core, data, presentation)
import 'package:step2/core/usecases/store_use_cases.dart';
```

### 🖥️ Ver Salida en Consola

Al ejecutar `flutter run`, verás en la consola del IDE/terminal:
1. **Carga inicial** con estados de loading
2. **Error handling** si hay problemas de conectividad  
3. **Información completa** de productos, categorías y usuarios formateada

---

## 📋 Log de Refactorización

### 🔄 **MIGRACIÓN HEXAGONAL → CLEAN ARCHITECTURE (Sept 2025)**

#### ✅ **Cambios Implementados:**

1. **🏗️ Restructuración Completa**
   - `infrastructure/` → `core/`, `domain/`, `data/`
   - Creación de Domain Layer con entidades puras
   - Use Cases centralizados en Core Layer

2. **🏛️ Domain Entities Creadas**
   ```dart
   // Entities con business logic
   class Product { /* validations, business methods */ }
   class Category { /* normalization, validation */ }  
   class User { /* email validation, business rules */ }
   ```

3. **🔄 Model Extension Pattern**
   ```dart
   // Compatibility automática
   class ProductModel extends Product { /* serialization */ }
   ```

4. **🧹 Optimización de Código**
   - Eliminados: `enums.dart`, `README.md` vacío
   - Actualizados: 200+ imports a nueva estructura
   - Validados: Tests passing, 0 errores compilación

#### 📊 **Métricas de Migración:**
- **Errores**: 116 → 5 → 0 ✅
- **Archivos**: 26 → 24 (optimización)
- **Tiempo**: Migración completa exitosa
- **Pruebas**: ✅ Mantenidas funcionales

#### 📖 **Documentación Detallada:**
Ver `MODIFICACIONES_MAPPER_PATTERN.md` para el log completo de todos los cambios, decisiones técnicas y implementación paso a paso.

---

## 👨‍💻 Autor

**Marco Andrade** - [@marco4andrade](https://github.com/marco4andrade)

---

