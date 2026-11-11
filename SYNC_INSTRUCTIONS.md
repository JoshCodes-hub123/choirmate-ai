# MeyVu safe GitHub synchronisation

This folder contains the latest uploaded AI Studio project plus the Dockerfile prepared for cloud deployment. It excludes Python bytecode caches.

## Upload to the existing integration branch

On Windows PowerShell, in an empty working directory:

```powershell
git clone https://github.com/JoshCodes-hub123/choirmate-ai.git
cd choirmate-ai
git fetch origin
git switch meyvu/integration-audit-2026-11
```

Copy the **contents** of this extracted package into the `choirmate-ai` folder, replacing matching files. Do not delete unrelated files. Then run:

```powershell
git status --short
npm ci
npm run lint
npm run build
python -m compileall -q python choirmate_camber.py
git add -A
git commit -m "Integrate latest MeyVu AI Studio project and Docker deployment"
git push origin meyvu/integration-audit-2026-11
```

Do **not** merge to `main` until GitHub Actions and a complete upload/recognition/audio test pass. Never commit `.env` files or API keys. If `npm ci` or build fails, stop and share the error before committing.
