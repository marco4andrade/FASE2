# Arquitectura y Flujo de la Aplicación Flutter Store

## 📋 Resumen General

Esta aplicación Flutter implementa una arquitectura Clean Architecture que consume la **Fake Store API** para mostrar productos, categorías y usuarios. La aplicación utiliza el patrón de gestión de estado **Provider** y sigue los principios de separación de responsabilidades.

## 🏗️ Arquitectura Clean Architecture

La aplicación sigue la arquitectura de 3 capas:

```
📁 lib/
├── 📁 core/                    # Configuración y utilidades centrales
├── 📁 data/                    # Capa de datos (API, modelos)
├── 📁 domain/                  # Capa de dominio (entidades, casos de uso)
└── 📁 presentation/            # Capa de presentación (UI, providers)
```

## 🔄 Flujo de Datos

1. **Usuario** presiona un botón en la interfaz
2. **Provider** ejecuta un caso de uso (UseCase)
3. **UseCase** llama al repositorio
4. **Repositorio** obtiene datos del DataSource
5. **DataSource** hace petición HTTP a la API
6. Los datos regresan transformados hasta la UI

```
UI → Provider → UseCase → Repository → DataSource → API
                                                      ↓
UI ← Provider ← UseCase ← Repository ← DataSource ← Response
```

## 📂 Estructura Detallada y Explicación de Archivos

### 🎯 Core (`lib/core/`)

#### `dependency_injection.dart`
- **Propósito**: Configuración del sistema de inyección de dependencias
- **Qué hace**: 
  - Crea instancias de todas las dependencias de la aplicación
  - Configura los providers de Provider/ChangeNotifier
  - Establece la cadena de dependencias: DataSource → Repository → UseCases → Provider
- **Patrón**: Dependency Injection Container

#### `error/failure.dart`
- **Propósito**: Define tipos de errores del dominio
- **Clases**:
  - `Failure`: Clase abstracta base para errores
  - `ServerFailure`: Errores del servidor
  - `NetworkFailure`: Errores de red
- **Beneficio**: Tipado seguro de errores

#### `usecases/usecase.dart`
- **Propósito**: Interface común para todos los casos de uso
- **Patrón**: Template Method
- **Características**:
  - Retorna `Either<Failure, Type>` (functional programming)
  - Maneja errores de forma consistente
  - `NoParams`: Para casos de uso sin parámetros

### 🎨 Presentation (`lib/presentation/`)

#### `app_screen.dart`
- **Propósito**: Pantalla principal de la aplicación
- **Características**:
  - Consume `StoreProvider` usando `Consumer<StoreProvider>`
  - Muestra 3 botones para cargar diferentes tipos de datos
  - Maneja estados: loading, error, success
  - UI responsiva con indicadores visuales
- **Estados visuales**:
  - Loading: CircularProgressIndicator
  - Error: Ícono de error + mensaje + botón limpiar
  - Éxito: Datos impresos en consola

#### `providers/store_provider.dart`
- **Propósito**: Gestión de estado de la aplicación
- **Patrón**: State Management con Provider
- **Estados**: `initial`, `loading`, `loaded`, `error`
- **Métodos principales**:
  - `loadProducts()`: Carga productos y limpia otros datos
  - `loadCategories()`: Carga categorías y limpia otros datos
  - `loadUsers()`: Carga usuarios y limpia otros datos
  - `printXToConsole()`: Métodos para imprimir datos formateados
- **Características**:
  - Extends `ChangeNotifier`
  - Manejo de errores con `Either<Failure, Data>`
  - Estados mutuamente excluyentes (solo un tipo de dato a la vez)

### 🏢 Domain (`lib/domain/`)

#### `entities/`
Representan los objetos de negocio puros, sin dependencias externas:

**`product.dart`**
- **Propósito**: Entidad de producto del dominio
- **Campos**: id, title, description, price, category, image
- **Características**: Inmutable (`@immutable`)

**`category.dart`**
- **Propósito**: Entidad de categoría del dominio
- **Campos**: name
- **Simplicidad**: Solo contiene el nombre de la categoría

**`user.dart`**
- **Propósito**: Entidad de usuario del dominio
- **Campos**: id, email, username
- **Características**: Datos básicos del usuario

#### `repositories/store_repository.dart`
- **Propósito**: Contrato abstracto para acceso a datos
- **Patrón**: Repository Pattern
- **Métodos**:
  - `getProducts()`: Obtener lista de productos
  - `getAllCategories()`: Obtener categorías
  - `getUsers()`: Obtener usuarios
- **Retorno**: `Future<Either<Failure, List<Entity>>>`

#### `usecases/`
Implementan la lógica de negocio específica:

**`get_products.dart`**
- **Propósito**: Caso de uso para obtener productos
- **Implementa**: `UseCase<List<Product>, NoParams>`
- **Lógica**: Delega al repositorio

**`get_categories.dart`**
- **Propósito**: Caso de uso para obtener categorías
- **Patrón**: Similar a GetProducts

**`get_users.dart`**
- **Propósito**: Caso de uso para obtener usuarios
- **Patrón**: Similar a GetProducts

### 💾 Data (`lib/data/`)

#### `datasources/remote_datasource.dart`
- **Propósito**: Acceso a la API externa (Fake Store API)
- **URL Base**: `https://fakestoreapi.com`
- **Endpoints**:
  - `/products` - Lista de productos
  - `/products/categories` - Lista de categorías
  - `/users` - Lista de usuarios
- **Tecnología**: HTTP package para peticiones
- **Manejo de errores**: Throws Exception en caso de error

#### `models/`
Extienden las entidades del dominio y añaden serialización:

**`product_model.dart`**
- **Propósito**: Modelo de datos para productos con serialización JSON
- **Extiende**: `Product` entity
- **Método**: `fromJson()` para deserialización
- **Transformación**: Convierte tipos (num → double)

**`category_model.dart`**
- **Propósito**: Modelo para categorías
- **Particularidad**: La API devuelve strings directamente
- **Método**: `fromJson(String name)` simple

**`user_model.dart`**
- **Propósito**: Modelo para usuarios con deserialización
- **Campos**: Mapea JSON a entidad User

#### `repositories/store_repository_impl.dart`
- **Propósito**: Implementación concreta del repositorio
- **Patrón**: Repository Implementation
- **Responsabilidades**:
  - Coordina con RemoteDataSource
  - Maneja excepciones y las convierte a Failures
  - Transforma models a entities
- **Try-Catch**: Convierte excepciones en `Either<Failure, Data>`

### 🚀 Main (`lib/main.dart`)
- **Propósito**: Punto de entrada de la aplicación
- **Configuración**:
  - Configura MultiProvider con DependencyInjection
  - Inicializa MaterialApp
  - Define tema y título
  - Establece AppScreen como home

## 📱 Funcionalidades de la App

### Botones de Acción

1. **Imprimir Productos en Consola**
   - Color: Azul
   - Ícono: shopping_cart
   - Carga productos de la API y los muestra en consola

2. **Imprimir Categorías en Consola**
   - Color: Naranja  
   - Ícono: category
   - Carga categorías y las muestra numeradas

3. **Imprimir Usuarios en Consola**
   - Color: Verde
   - Ícono: people
   - Carga usuarios y muestra información básica

### Estados de la Aplicación

- **Inicial**: App lista para usar
- **Cargando**: Muestra CircularProgressIndicator
- **Datos Cargados**: Imprime información en consola
- **Error**: Muestra mensaje de error con opción de limpiar

## 🛠️ Tecnologías y Dependencias

### Dependencias Principales (`pubspec.yaml`)

- **flutter**: Framework principal
- **http**: Cliente HTTP para API calls
- **dartz**: Programación funcional (Either, Option)
- **meta**: Anotaciones (@immutable)
- **provider**: Gestión de estado
- **cupertino_icons**: Íconos iOS-style

## 🔄 Patrones de Diseño Utilizados

1. **Clean Architecture**: Separación en capas
2. **Repository Pattern**: Abstracción de acceso a datos
3. **Use Case Pattern**: Encapsulación de lógica de negocio
4. **Provider Pattern**: Gestión de estado reactiva
5. **Dependency Injection**: Inyección de dependencias
6. **Factory Pattern**: En los métodos fromJson()
7. **Either Pattern**: Manejo funcional de errores

## 🎯 Beneficios de esta Arquitectura

1. **Testabilidad**: Cada capa puede probarse independientemente
2. **Mantenibilidad**: Código organizado y separado por responsabilidades
3. **Escalabilidad**: Fácil añadir nuevas funcionalidades
4. **Flexibilidad**: Intercambiable implementaciones (ej: API → Local DB)
5. **Reutilización**: Use cases y entities reutilizables
6. **Manejo de Errores**: Tipado seguro y consistente

## 🔍 Flujo Específico de Ejemplo

### Cuando el usuario presiona "Imprimir Productos":

1. **AppScreen**: Detecta tap en botón
2. **StoreProvider**: Ejecuta `loadProducts()`
3. **StoreProvider**: Cambia estado a `loading`, notifica UI
4. **StoreProvider**: Llama `_getProducts(NoParams())`
5. **GetProducts**: Ejecuta `repository.getProducts()`
6. **StoreRepositoryImpl**: Llama `remoteDataSource.fetchProducts()`
7. **RemoteDataSource**: Hace HTTP GET a `/products`
8. **RemoteDataSource**: Deserializa JSON a `List<ProductModel>`
9. **StoreRepositoryImpl**: Convierte models a entities, retorna `Right(products)`
10. **StoreProvider**: Recibe productos, cambia estado a `loaded`
11. **StoreProvider**: Llama `printProductsToConsole()`
12. **UI**: Se actualiza automáticamente por `notifyListeners()`

Este flujo demuestra la separación clara de responsabilidades y el flujo unidireccional de datos que caracteriza a Clean Architecture.

## 📝 Conclusión

Esta aplicación es un excelente ejemplo de implementación de Clean Architecture en Flutter, demostrando cómo estructurar una aplicación escalable y mantenible que consume APIs externas de manera robusta y eficiente.
