# Store API Flutter App

Una aplicación Flutter que consume la **Fake Store API** e implementa Clean Architecture con gestión de estado usando Provider.

## Funcionalidades

La aplicación permite obtener y mostrar en consola:
- **Productos** - Lista completa con detalles (título, precio, descripción, categoría)
- **Categorías** - Todas las categorías disponibles
- **Usuarios** - Lista de usuarios con información básica

## API Endpoints Utilizados

- `GET /products` - Obtiene todos los productos
- `GET /products/categories` - Obtiene todas las categorías  
- `GET /users` - Obtiene todos los usuarios

**Base URL**: `https://fakestoreapi.com`

## Arquitectura

**Clean Architecture** con 3 capas:

- **Presentation**: UI (AppScreen) + State Management (Provider)
- **Domain**: Entidades, Casos de Uso y Repositorios abstractos
- **Data**: Modelos, DataSources y implementación de Repositorios

**Tecnologías**: Flutter, Provider, HTTP, Dartz (Either pattern)
