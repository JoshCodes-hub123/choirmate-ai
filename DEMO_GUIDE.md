# ChoirMate AI — Judge Demo Guide
## Target length: 3-minute presentation + 5-minute demo

This is a suggested run of show. Do not claim a test succeeded unless you have just run it successfully. If live OMR fails, switch transparently to the demo-score learning flow and explain that uploaded-score recognition is a current limitation.

## 3-minute presentation

### 0:00–0:25 — The problem
“Printed sheet music can be intimidating for a beginner. They may want to sing with their choir but struggle to interpret the notes, solfa, and rhythm without someone beside them to explain it.”

### 0:25–0:45 — The idea
“ChoirMate AI aims to turn a score into a guided learning experience: understand the notation, feel the rhythm, and practise one step at a time.”

### 0:45–1:25 — What is different
“This is not just a general-purpose chatbot. The architecture separates optical music recognition from musical explanation. HOMR attempts to read supported printed notation. The open-weight SmolLM2 model receives structured musical facts and explains them in beginner-friendly language. SmolLM2 is not claimed to read images directly.”

### 1:25–2:10 — Prototype
Show the home screen, learning workspace, note/solfa control, note playback, rhythm guidance, and practice controls. Use the actual current application. Do not use a mockup as if it were a working feature.

### 2:10–2:40 — Openness and limitations
“The project is documented in a public repository. We are recording model provenance, licences, setup, and limitations. Recognition depends on score quality, and we show an error instead of inventing notes when recognition fails.”

### 2:40–3:00 — Close
“Our goal is to make music learning more approachable and to make AI useful to people who are learning a skill, not only to people who already understand the technology.”

## 5-minute demo

1. **0:00–0:30 — Open the app.** Explain the intended learner and the main call to action.
2. **0:30–1:30 — Try a real score upload.** Use a clear, straight, high-contrast printed score. If recognition fails, show the actual error; do not claim success.
3. **1:30–2:30 — Show the learning view.** Explain the visual score, note names/solfa, rhythm guidance, and note playback that are actually functional in the current build.
4. **2:30–3:30 — Show practice controls.** Demonstrate step navigation and metronome if they work in the current build.
5. **3:30–4:15 — Explain the open-weight model boundary.** Show code or documentation that demonstrates structured musical data being passed to SmolLM2. If inference is not verified, state that clearly.
6. **4:15–5:00 — Show the public GitHub README.** Point out setup instructions, architecture, model licences, limitations, and testing status.

## If the live upload fails
Say: “This prototype currently has a limitation with this score image. We deliberately surface recognition failures rather than invent notes. I can still demonstrate the learning workflow with a clearly labelled demonstration score, but that is separate from proving image recognition.”

Then continue with the demo-score flow, explicitly identifying it as a demonstration score.

## Before presenting
- Open the public repository in a browser.
- Confirm the default branch contains the actual application source, not only documentation.
- Test the deployed link in a private/incognito window.
- Test one known-good printed score and record the actual result.
- Confirm whether SmolLM2 loads and produces an explanation.
- Do not show API keys, tokens, personal data, or local secrets.
