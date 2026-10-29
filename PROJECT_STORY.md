# ChoirMate AI — Project Story
## OPEN//BUILD 2026 | “AI belongs to everyone.”

### One-sentence pitch
ChoirMate AI is an open-source music-learning companion that aims to help beginner singers turn printed sheet music into understandable notes, solfa, rhythm guidance, and a practical rehearsal path.

### The problem we are solving
A printed score can feel like a wall of symbols to someone who is still learning music notation. A beginner may see staff lines, note heads, rests, key signatures, and time signatures without knowing where to start. In a choir, that can make independent rehearsal difficult: the learner needs a patient explanation of what the score says and how to practise it.

The barrier is not always lack of interest or willingness to learn. It can be the gap between written musical notation and an explanation that a beginner can act on.

### Our idea
ChoirMate AI is designed to make the first steps less intimidating. Instead of presenting a learner with a score and leaving them to interpret it alone, it aims to guide them through a sequence:

1. Start with a printed score image.
2. Use optical music recognition to attempt to identify the notation.
3. organise recognised notes and rhythm into structured musical information.
4. Use an open-weight language model to explain those musical facts in beginner-friendly language.
5. Support practice with a visual score, note names and solfa, playback, and step-by-step rehearsal controls.

The product principle is simple: make the next useful step clear, and be honest when the system is unsure.

### Why this fits “AI belongs to everyone”
AI should not only help people who already know how to write prompts or operate complex creative software. It can also support learners who need a concept explained in simpler language and broken into manageable steps.

ChoirMate AI applies AI to a specific learning barrier: understanding printed music. The intended experience is approachable and practice-oriented rather than a generic chatbot.

### What makes the technical approach meaningful
The project separates two different jobs:

- **HOMR** attempts optical music recognition: turning supported printed notation into machine-readable musical information.
- **SmolLM2-360M-Instruct-GGUF**, run through a compatible local inference runtime, is intended to explain structured musical information in beginner-friendly language.

SmolLM2 is not being described as a vision model. It does not directly inspect the uploaded image in this architecture. The recogniser and the language model have distinct roles. This makes the system easier to reason about and gives the team a clear place to inspect and correct errors.

### What we have built so far
The project has a designed React/Vite interface and learning-oriented interactions, including a sheet upload flow, learning and practice views, solfa/note display, note playback, a metronome, demonstration scores, and score-export controls as reported by the development environment.

The latest development report states that the TypeScript check and production build passed and that invalid-image input returns an honest diagnostic rather than fabricated notes. Those checks are useful, but they are not the same as proving that a real score can be recognised and explained end to end.

### Current status and honesty about limitations
At the time of this submission documentation:
- The project architecture is intended to use HOMR for recognition and SmolLM2 for text explanations.
- A clean end-to-end test on a known-good printed score, including actual SmolLM2 inference and successful display in the UI, still needs to be independently confirmed.
- Image quality and supported notation can affect recognition.
- Incorrect recognition could lead to incorrect explanations; outputs should be checked and uncertain results should be shown as uncertain.
- A demonstration score can showcase the learning interface, but must not be presented as proof that an uploaded image was successfully recognised.

We prefer an honest prototype report over claims that have not been tested.

### What we want to improve next
1. Verify and improve the real image-to-notation-to-explanation path with known-good score fixtures.
2. Make recognition confidence and correction workflows more useful to learners.
3. Improve support for key signatures, accidentals, rests, voices, and more varied printed score layouts.
4. Expand accessibility and beginner-friendly rehearsal guidance.
5. Make installation and evaluation reproducible on a clean machine.

### Open source and AI assistance
The project began from an AI app starter and has been adapted for this music-learning use case. The repository should retain upstream licence notices and acknowledge reused code. AI coding assistants were used during development; the project team remains responsible for reviewing generated code, testing it, understanding the implementation, and documenting limitations. See README.md for the current architecture and reproducibility notes.

### Project identity
**ChoirMate AI**  
*Understand the notes. Feel the rhythm. Sing with confidence.*

Repository: https://github.com/JoshCodes-hub123/choirmate-ai
