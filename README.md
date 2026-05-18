# XRO Music — Update Feed

This repo hosts the update manifest for XRO Music.

## How to release an update

1. Build and sign the new APK
2. Create a GitHub Release and upload the APK
3. Update `update.json`:
   - Bump `version_code` (must be higher than the previous value)
   - Update `version_name`
   - Write the `changelog` (supports `\n` for line breaks)
   - Set `download_url` to the direct APK link from the release

The app checks this file on every launch and shows a dialog if `version_code` is higher than the installed version.

## update.json format

```json
{
  "version_code": 2,
  "version_name": "1.1",
  "changelog": "What's new:\n\n• Feature 1\n• Bug fix",
  "download_url": "https://github.com/xason0/xromusic-updates/releases/download/v1.1/xromusic.apk"
}
```
