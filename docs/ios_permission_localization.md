# iOS camera & photo library permission localization

System permission dialogs (camera / gallery) are **not** localized by Flutter `easy_localization`. iOS reads copy from `Info.plist` and a localized String Catalog.

This app uses:

| File | Role |
|------|------|
| `ios/Runner/Info.plist` | English fallback keys (required by App Store) |
| `ios/Runner/InfoPlist.xcstrings` | EN + TR strings (Xcode String Catalog) |

Dialog language follows the **device language**, not the in-app TR/EN toggle.

---

## Keys used for profile photo

| Key | Info.plist / Xcode name | When needed |
|-----|-------------------------|-------------|
| `NSCameraUsageDescription` | Privacy – Camera Usage Description | Taking a photo |
| `NSPhotoLibraryUsageDescription` | Privacy – Photo Library Usage Description | Picking from gallery |

Optional (only if the app **saves** images into Photos):

| Key | When needed |
|-----|-------------|
| `NSPhotoLibraryAddUsageDescription` | Write/add to the library |
| `NSMicrophoneUsageDescription` | Recording video with audio |

---

## Recommended copy

### English

| Key | Value |
|-----|--------|
| `NSCameraUsageDescription` | YogaSala+ needs camera access so you can take a profile photo. |
| `NSPhotoLibraryUsageDescription` | YogaSala+ needs photo library access so you can choose a profile photo. |

### Turkish

| Key | Value |
|-----|--------|
| `NSCameraUsageDescription` | YogaSala+, profil fotoğrafı çekebilmeniz için kameraya erişim ister. |
| `NSPhotoLibraryUsageDescription` | YogaSala+, profil fotoğrafı seçebilmeniz için fotoğraf kitaplığına erişim ister. |

---

## How to add / update via Xcode (String Catalog)

### 1. Add Turkish to the project (once)

1. Open **`ios/Runner.xcworkspace`** (not only `.xcodeproj`).
2. Select the blue **Runner** project → **Info** tab (project level).
3. Under **Localizations**, click **+** → add **Turkish** if missing.

### 2. Ensure English keys exist in `Info.plist`

1. Select the **Runner** target → **Info**.
2. Under **Custom iOS Target Properties**, add (if missing):
   - Privacy – Camera Usage Description  
   - Privacy – Photo Library Usage Description  
3. Paste the English strings from the table above.

This writes the keys into `ios/Runner/Info.plist`.

### 3. Create or open `InfoPlist.xcstrings`

**Preferred (modern Xcode):**

1. **File → New → File…** → **String Catalog**.
2. Name it exactly **`InfoPlist`** (creates `InfoPlist.xcstrings`).
3. Save under **`ios/Runner/`**, target **Runner** checked.

If the file already exists, open `ios/Runner/InfoPlist.xcstrings` in Xcode.

> Xcode may label classic `.strings` files as “legacy”. Prefer the String Catalog named `InfoPlist`.

### 4. Add keys and translations

1. Open `InfoPlist.xcstrings`.
2. Click **+** and add:
   - `NSCameraUsageDescription`
   - `NSPhotoLibraryUsageDescription`
3. Fill **English** and **Turkish** columns (add Turkish via the language control if needed).
4. **Comment** column is optional (dev notes only; not shown to users).
5. Mark translations as translated (green check) when done. English as source may show an empty status — that is normal if the value cell is filled.

### 5. Target membership

Select `InfoPlist.xcstrings` → File inspector → **Target Membership** → **Runner** checked.

### 6. Verify

1. Clean build / reinstall the app (iOS caches permission dialog text after the first grant/deny).
2. Reset permissions if needed: **Settings → YogaSala+ →** toggle Camera / Photos, or delete the app.
3. Set the device language to English, then Turkish, and confirm the dialogs match the tables above.

---

## Legacy alternative: `InfoPlist.strings`

If you cannot use a String Catalog:

1. **File → New → File… → Strings File** named **`InfoPlist.strings`**.
2. Localize it (File inspector → **Localize…**) for **en** and **tr**.
3. In each file:

```strings
"NSCameraUsageDescription" = "…";
"NSPhotoLibraryUsageDescription" = "…";
```

Keep the same English keys in `Info.plist` as fallback.

---

## Android note

Android permission rationale / Play policy copy is separate (`AndroidManifest.xml` + in-app strings). This document covers **iOS only**.

---

## Related app code

Profile photo flow that triggers these prompts:

- `lib/features/onboarding/presentation/pages/onboarding_profile_photo/`
- `image_picker` package
