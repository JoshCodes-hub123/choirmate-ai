# ChoirMate AI
### Understand the notes. Feel the rhythm. Sing with confidence.

ChoirMate AI is an open-source music-learning companion designed to make printed sheet music less intimidating for beginner singers and choir members. It aims to turn a score into a guided learning experience: understand the notation, learn the solfa, notice the rhythm, and practise a melody step by step.

**OPEN//BUILD 2026 theme: “AI belongs to everyone.”**

> **Prototype status:** The project has a React/Vite interface and a planned open-weight analysis pipeline using HOMR for optical music recognition (OMR) and SmolLM2-360M-Instruct-GGUF for beginner-friendly explanations. The latest development report says the TypeScript check and production build passed and that invalid-image errors are handled honestly. A successful end-to-end test on a real score image, including actual SmolLM2 inference and results in the UI, still needs to be confirmed. Please read the known limitations before evaluating.

## The problem

Learning to sing from sheet music can be difficult when a learner does not yet understand staff positions, note names, solfa syllables, note durations, time signatures, or how a written melody should be practised. Beginners often need someone to explain the score in small, approachable steps. Access to that guidance is not always available at the moment they practise.

## Our approach

ChoirMate AI is designed to bridge the gap between seeing a printed score and knowing how to practise it.

1. **Upload a score** — the learner provides a clear image of printed sheet music.
2. **Recognise the notation** — HOMR (Optical Music Recognition) attempts to convert supported printed notation into structured musical notation, such as MusicXML.
3. **Prepare musical facts** — the application extracts note and rhythm information for the learning interface.
4. **Explain with an open-weight model** — SmolLM2-360M-Instruct-GGUF receives structured musical information and generates beginner-friendly guidance. SmolLM2 is not an image-recognition model; it does not directly read the uploaded image.
5. **Practise interactively** — the intended experience includes a visual score, note names/solfa, rhythm guidance, pitch playback, and step-by-step practice controls.

The application must report recognition uncertainty instead of inventing notes or silently replacing an uploaded score with an unrelated sample.

## Current prototype experience

The existing interface has been developed with:
- A focused home screen and “Learn a new score” entry point.
- An image upload flow for PNG/JPG/JPEG score images.
- Learning-result views intended to present notation and beginner-friendly explanations.
- Note-name/solfa display controls and note playback.
- Practice controls including step-by-step navigation and a metronome.
- Demonstration scores for exploring the learning/practice UI independently of image recognition.
- MusicXML and ChoirMate JSON export controls, as reported by the latest development update.

These are implementation-reported features, not a claim that every path has passed independent end-to-end testing.

## Open-weight AI and architecture

    Printed score image
           |
           v
    Input validation and image preparation
           |
           v
    HOMR — optical music recognition
           |
           v
    MusicXML / structured notes and rhythm
           |
           v
    Deterministic music-data preparation
           |
           v
    SmolLM2-360M-Instruct-GGUF via llama-cpp-python
           |
           v
    Beginner-friendly learning explanation
           |
           v
    ChoirMate AI React/Vite learning and practice UI

### Models and licences

| Component | Role | Licence / note |
|---|---|---|
| SmolLM2-360M-Instruct-GGUF | Open-weight text generation for explanations from structured musical data | Apache-2.0 is reported for the underlying SmolLM2 model; verify the exact GGUF repository/model card before redistribution. |
| HOMR | Optical music recognition for supported printed scores | The project is reported as GPL-3.0; review its licence and dependency terms before redistribution or deployment. |
| llama-cpp-python | Local inference runtime for GGUF models | Check the installed version and its licence in the environment used for the submission. |
| FastAPI | Python service layer, if used by the checked-out implementation | Confirm exact version and service startup configuration in the source tree. |
| React, Vite, TypeScript | User interface and TypeScript server | Versions and scripts should be taken from the committed package manifests. |

The design separates image recognition from language generation: HOMR attempts to read notation; deterministic parsing prepares structured data; SmolLM2 explains that data. This separation makes it easier to inspect the model input, test individual stages, and communicate uncertainty.

## Setup and reproduction

The complete source code and manifests must be present in this repository for these steps to be reproducible. The commands below are a starting point; use the exact scripts and dependency files committed with the application.

Requirements:
- Node.js compatible with the committed package.json.
- Python 3.10 or 3.11 if required by the selected HOMR version.
- Sufficient disk space and memory for the recognition dependencies and GGUF model weights.
- Internet access for the initial dependency/model download, unless weights are already available locally.

Typical setup:

    git clone https://github.com/JoshCodes-hub123/choirmate-ai.git
    cd choirmate-ai
    npm install

If the committed project includes python/requirements.txt:

    python -m venv .venv
    # Linux/macOS:
    source .venv/bin/activate
    # Windows PowerShell:
    # .venv\Scripts\Activate.ps1
    python -m pip install --upgrade pip
    pip install -r python/requirements.txt

Then inspect package.json and the Python service documentation for the exact model download and startup commands before running the app. Do not assume that a health endpoint alone proves the model weights loaded or that inference works.

## Testing and verification

Latest development report:
- TypeScript check (npm run lint, reported as tsc --noEmit): passed.
- Production build (npm run build): passed.
- GET /api/health: reported the intended HOMR and SmolLM2 architecture.
- Invalid-image diagnostic: returned a recognition error rather than fabricated notes.

Still requiring confirmation:
- HOMR correctly recognises a known-good, real printed score image.
- The recognized notes/rhythm are parsed correctly.
- SmolLM2 model weights load and a real inference completes.
- The full upload → HOMR → structured music → SmolLM2 → UI path succeeds.
- Exported MusicXML opens correctly in notation software.
- A clean clone can reproduce the application using only the README instructions.

A suitable end-to-end test should use a known-good, clearly printed score and verify the recognised note sequence against the source image. Never mark an unrun test as passing.

## Known limitations

- OMR accuracy depends on image quality, staff-line clarity, score layout, and the notation supported by the recognition model. Blurry, skewed, shadowed, handwritten, or unusual scores may fail.
- Recognition output must be checked; a model can miss or misread notes and rhythms.
- SmolLM2 is a small text model. It explains supplied musical facts but should not be treated as a music-theory authority or an image-reading model.
- Solfa depends on musical context such as key, tonal centre, and accidentals. If the system cannot infer this reliably, it should communicate uncertainty.
- A failed recognition must not be replaced with invented notes or a demo score without clearly telling the learner.
- ChoirMate AI does not claim to evaluate a user's singing through a microphone unless such a feature is implemented and tested.

## Responsible AI and transparency

ChoirMate AI is an educational aid, not a substitute for a qualified music teacher. Learners should be able to inspect the score and correct mistakes. The interface should distinguish recognised information from AI-generated explanations and surface uncertainty when recognition is incomplete.

## Open-source practices and acknowledgements

- Optical music recognition: https://github.com/liebharc/homr
- Open-weight text model: https://huggingface.co/bartowski/SmolLM2-360M-Instruct-GGUF
- The project began from the AI App Starter (https://github.com/victorjayeoba/ai-app-starter) and has been adapted for the ChoirMate AI music-learning use case. Preserve upstream licence notices and document substantial reuse accurately.
- AI coding assistants were used during development. The team is responsible for reviewing generated code, understanding the architecture, testing claims, and documenting remaining limitations.

## Project information

- Project: ChoirMate AI
- Tagline: **Understand the notes. Feel the rhythm. Sing with confidence.**
- Challenge: OPEN//BUILD 2026 — “AI belongs to everyone.”
- Repository: https://github.com/JoshCodes-hub123/choirmate-ai

**Submission note:** Before presenting this repository as a runnable application, ensure the actual frontend/backend source code, dependency manifests, and required non-secret configuration files are committed. Never commit API keys, personal tokens, or private credentials.
