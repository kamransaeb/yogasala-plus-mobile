---
name: repository-naming
description: >-
  Name feature data adapters as XRepositoryImpl, not *Service. Use when adding
  repositories, wrapping third-party SDKs (RevenueCat, etc.), or reviewing
  data-layer naming in YogaSala Plus mobile.
---

# Repository naming

## Rule

| Layer | Name | Path |
|-------|------|------|
| Domain port | `XRepository` | `domain/repositories/` |
| Data adapter | `XRepositoryImpl` | `data/repositories/` |

Register with `@LazySingleton(as: XRepository)`.

## Examples

```dart
// ✅ GOOD — API-backed
@LazySingleton(as: EntitlementsRepository)
class EntitlementsRepositoryImpl implements EntitlementsRepository { ... }

// ✅ GOOD — third-party SDK still a repository impl
@LazySingleton(as: PurchasesRepository)
class PurchasesRepositoryImpl implements PurchasesRepository { ... }

// ❌ BAD
class RevenueCatPurchasesService implements PurchasesRepository { ... }
```

## Why not Service?

`*Service` in this app means shared infra (e.g. `LoggerService`), not feature ports.
A RevenueCat (or any SDK) wrapper is still the data implementation of a domain
`Repository` — keep the `*RepositoryImpl` name so DI and folder layout stay consistent.

## Checklist

- [ ] Interface in `domain/repositories/`
- [ ] Class named `XRepositoryImpl` under `data/repositories/`
- [ ] No new `data/services/` feature adapters
- [ ] `@LazySingleton(as: XRepository)`
