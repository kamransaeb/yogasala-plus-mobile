---
name: app-button
description: >-
  Use enterprise_ui's AppButton for every button in the app instead of
  FilledButton, ElevatedButton, OutlinedButton, TextButton or IconButton. Use
  when adding or editing any button, CTA, retry / subscribe / join action,
  dialog action, or icon button in YogaSala Plus mobile.
---

# AppButton

Always use `AppButton` from `package:enterprise_ui/enterprise_ui.dart`. Never
use Material buttons (`FilledButton`, `ElevatedButton`, `OutlinedButton`,
`TextButton`, `IconButton`) directly in features or `core/widgets`.

## Pick a variant

| Need | `variant` |
|------|-----------|
| Primary CTA (subscribe, join, next, retry) | `AppButtonVariant.filled` (default) |
| Secondary action | `AppButtonVariant.tonal` or `.outlined` |
| Low-emphasis / inline link-style | `AppButtonVariant.text` |
| Destructive (delete, sign out) | `AppButtonVariant.danger` |
| Icon only, no padding / splash | `AppButtonVariant.icon` |
| Circular icon with border | `AppButtonVariant.roundIcon` |

Sizes: `AppButtonSize.small` / `.medium` (default) / `.large`. Full width:
`expanded: true`.

## Examples

```dart
// Primary CTA
AppButton(
  label: 'subscribe'.tr(),
  onPressed: onSubscribe,
);

// Full-width bottom action
AppButton(
  expanded: true,
  size: AppButtonSize.large,
  label: 'next'.tr(),
  onPressed: () => context.read<QuizBloc>().add(const QuizEvent.nextRequested()),
);

// Secondary / destructive
AppButton(variant: AppButtonVariant.outlined, label: 'cancel'.tr(), onPressed: onCancel);
AppButton(variant: AppButtonVariant.danger, label: 'logout'.tr(), onPressed: onLogout);

// Icon only
AppButton(variant: AppButtonVariant.icon, icon: Icons.close, onPressed: onClose);
```

- Icon variants: pass the glyph as `iconWidget` (e.g. `const Icon(Icons.chevron_left)` or
  `SvgIcon(...)`) and a `padding` (e.g. `EdgeInsets.all(AppDimensions.p8)`) so the tap target
  isn't just the glyph. `AppButton` has no `tooltip`; wrap in
  `Tooltip(message: '...'.tr(), child: AppButton(...))` when the old button had one.
- `label` is always localized (`'key'.tr()`); `AppButton` has no default text.
- Disabled = `onPressed: null` (theme handles disabled colors).
- Prefer theme styling; only pass `labelStyle` / `boxColor` / `borderColor`
  when the design needs it (e.g. selected/unselected toggle tabs).

## Busy / loading state

`AppButton` has no spinner slot. Follow `_LoginButton` in `login_form.dart`:
while the action runs, **replace** the button with an `AppLoadingIndicator`.

```dart
if (busy) {
  return const AppLoadingIndicator(size: AppLoadingSize.small);
}
return AppButton(label: 'subscribe'.tr(), onPressed: onSubscribe);
```

Inside a `Column` use `if (busy) const Center(child: AppLoadingIndicator(...))
else AppButton(...)`. Never fall back to a Material button just to put a
`CircularProgressIndicator` inside it.

## Checklist

- [ ] No `FilledButton(` / `ElevatedButton(` / `OutlinedButton(` / `TextButton(` / `IconButton(` in `lib/features` or `lib/core/widgets`
- [ ] Label from `.tr()`
- [ ] Variant matches emphasis (filled for the one primary action per screen)
- [ ] Disabled via `onPressed: null`, not custom colors
