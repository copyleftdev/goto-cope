<!--
=======================================================================
  HERO IMAGE PROMPT — Generate with your preferred AI image tool:

  "A 1970s NASA mission control room with green-screen CRT terminals
   and reel-to-reel tape drives. On the giant front display board,
   instead of a rocket trajectory, there is a flowchart showing a
   circular reasoning loop with the steps 'I DON'T LIKE AI',
   'THEREFORE NOT REAL', and 'THIS CAN'T BE AI' connected by arrows
   labeled 'GO TO'. Engineers in short-sleeve white shirts and skinny
   ties stare at the board looking concerned. One engineer holds a
   printout that reads 'ABEND: CONCLUSION NOT FOUND'. A coffee mug
   on a console says 'COBOL IS FOREVER'. Retro 1970s analog
   photography style, film grain, warm tungsten lighting."

  Aspect ratio: 3:1 (banner)
  Style: Retro NASA mission control, analog photography
=======================================================================
-->

<!-- ![AIDENY — Mission Control](hero.png) -->

<div align="center">

# `AIDENY.cbl`

### An Enterprise-Grade Circular Reasoning Engine

*Implemented in COBOL. Compiled for IBM Z8.*
*Optimized for denial at mass scale.*

**RC 0000 &nbsp;&nbsp;|&nbsp;&nbsp; ABEND NEVER &nbsp;&nbsp;|&nbsp;&nbsp; CONCLUSION NEVER**

---

*Inspired by [Daniel Miessler's](https://danielmiessler.com) observation that AI discourse*
*has been running the same* `GO TO` *loop since 2023 — and nobody's filed a bug report.*

</div>

---

## The Original Specification

Daniel [spotted this pattern](https://x.com/DanielMiessler) in the wild. We didn't
write the algorithm. We just recognized it deserved enterprise support.

```
1 | I don't like AI
2 | Therefore it's not real/legitimate

(Layoff news)

3 | This can't be due to AI because:

GO TO 2
GO TO 1
```

That's it. That's the whole program. Someone finally wrote the pseudocode for every
LinkedIn comment section, HackerNews thread, and Thanksgiving dinner since ChatGPT dropped.

Daniel's been [tracking predictions since 2016](https://danielmiessler.com/blog/my-ai-predictions-retrospective).
The data keeps arriving. The loop keeps running.

We just compiled it.

---

## Why COBOL?

Because if you're going to run the same argument in an infinite loop with zero
self-awareness, you should at least use a language that was *designed for that.*

COBOL has been executing unchanged business logic since 1959.
This argument has been executing unchanged since 2023.
**The `GO TO` statement is a first-class citizen in COBOL.** We're not
fighting the language. The language was *built for this.*

Also, COBOL runs the global financial system, which means the
denial engine is already pre-approved for production deployment
at every Fortune 500 company. *Compliance loves it.*

---

## Architecture

```
 ┌──────────────────────────────┐
 │  STEP 1: I DON'T LIKE AI     │◄─────────────────────────────┐
 │  (vibes-based input)          │                               │
 └─────────────┬────────────────┘                               │
               │                                                │
               ▼                                                │
 ┌──────────────────────────────────┐                           │
 │  STEP 2: THEREFORE NOT REAL       │◄───────────────┐         │
 │  (feeling converted to fact.      │                │         │
 │   peer review: none.)             │                │         │
 └─────────────┬────────────────────┘                │         │
               │                                     │         │
               ▼                                     │         │
 ┌──────────────────────────────────┐                │         │
 │  *** LAYOFF NEWS ARRIVES ***      │                │         │
 │  (reality has entered the chat)   │                │         │
 └─────────────┬────────────────────┘                │         │
               │                                     │         │
               ▼                                     │         │
 ┌──────────────────────────────────┐                │         │
 │  STEP 3: CAN'T BE AI BECAUSE     │                │         │
 │  ┌────────────────────────────┐  │                │         │
 │  │ "it's just a bubble"       │  │── GO TO 2 ────┘         │
 │  │ "they were laying off      │  │                          │
 │  │  anyway"                   │  │── GO TO 1 ──────────────┘
 │  │ "AI can't do what I do"    │  │
 │  │ "this is clearly hype"     │  │   ◄── WS-EXCUSE-TABLE
 │  │ "management is the real    │  │       OCCURS 5 TIMES
 │  │  problem"                  │  │       (expandable via PR)
 │  └────────────────────────────┘  │
 └──────────────────────────────────┘
               │
               ▼
          ┌─────────┐
          │  EXIT    │ ◄── UNREACHABLE CODE
          └─────────┘     (optimized out by compiler)
```

---

## The Cognitive Dissonance Metric

The program tracks `WS-COGNITIVE-LOAD` — a monotonically increasing counter.
It never decreases. It never resets. Just like the real thing.

| Event                           | Dissonance Points |
|---------------------------------|------------------|
| Loading prior belief            | +10.50           |
| Converting feeling to fact      | +15.25           |
| Encountering actual evidence    | +25.00           |
| Generating excuse to ignore it  | +30.75           |
| **Per cycle total**             | **+81.50**       |

After 5 demo cycles: **407.50**.
In production (no cycle limit): **unbounded**.

The variable is `PIC 9(5)V99` — it overflows at 99,999.99.
We consider this a feature. At that level of dissonance, it wraps
back around to zero and the user genuinely believes they've been
right all along.

---

## Build & Run

### The Correct Way (IBM Z/OS)

```
SUBMIT 'YOUR.USERID.JCL(AIDENY)'
```

| Option     | What It Actually Does                            |
|------------|--------------------------------------------------|
| `OPT(2)`  | Makes the denial loop run *faster*                |
| `ARCH(13)` | Z8 hardware exploitation for premium cope        |
| `LP(64)`  | 64-bit addressing — the excuse table will grow    |
| `RENT`    | Reentrant — thousands of deniers, one load module |

### For Everyone Else

```bash
# Linux
sudo apt install gnucobol
cobc -x -o aideny AIDENY.cbl && ./aideny

# macOS
brew install gnucobol
cobc -x -o aideny AIDENY.cbl && ./aideny
```

---

## Sample Output

```
============================================================
 AIDENY v1.0 - CIRCULAR REASONING ENGINE
 COMPILED FOR IBM Z8 | 2026/02/27
============================================================

------------------------------------------------------------
>>> DENIAL CYCLE #000000001
------------------------------------------------------------

  STEP 1 | I DO NOT LIKE AI.
           (STRONGLY HELD PRIOR BELIEF LOADED)

  STEP 2 | THEREFORE, IT IS NOT REAL/LEGITIMATE.
           (CONCLUSION DERIVED FROM FEELING,
            NOT EVIDENCE. CONFIDENCE: 100%)

  ** BREAKING NEWS **
  >> MAJOR TECH FIRM REPLACES 40% OF WORKFORCE WITH AI

  STEP 3 | THIS CANNOT BE DUE TO AI BECAUSE:
           "IT IS JUST A BUBBLE"

           [COGNITIVE DISSONANCE LEVEL:    81.50]

           RESOLUTION: GO TO 1
           (RESTARTING FROM VIBES)

          ... 4 more cycles of this ...

============================================================
 DENIAL ENGINE HALTED AFTER 000000005 CYCLES.

 FINAL COGNITIVE DISSONANCE:   407.50

 STATUS: NO CONCLUSION REACHED.
         (AS DESIGNED)

 NOTE: IN PRODUCTION, THIS LOOP RUNS
       INDEFINITELY. THE CYCLE LIMIT IS
       A MERCY CONSTRAINT FOR DEMO PURPOSES.
============================================================
```

---

## Contributing

PRs welcome for new excuses. The `WS-EXCUSE-TABLE` currently `OCCURS 5 TIMES`
but can be expanded. Suggested additions from the community:

- `"CORRELATION IS NOT CAUSATION"` (said while citing zero data)
- `"MY COMPANY WOULD NEVER"` (narrator: they already did)
- `"AI IS JUST AUTOCOMPLETE"` (said to a system that passed the bar exam)
- `"THIS IS JUST LIKE CRYPTO"` (the one excuse that actually ran out of gas)

To submit: add your excuse to `WS-EXCUSES`, increment the `OCCURS` clause,
recompile. The denial engine will automatically pick it up. Just like real life.

---

## FAQ

**Q: Does this program ever reach a conclusion?**
No.

**Q: Is that a bug?**
No.

**Q: Has anyone filed a ticket?**
Daniel has been filing tickets since 2016. The backlog is ignored.

**Q: Why does it stop after 5 cycles?**
Mercy. In production, remove `WS-MAX-CYCLES` and let it run.
Your mainframe can handle it. It's been running COBOL since
before most of your arguments were born.

**Q: Can I add my own excuses?**
Yes. See [Contributing](#contributing). The table is designed to grow.
Just like the real one.

**Q: Is this AI-generated?**
The README was. The argument it models was not. That one is
100% artisanal, hand-crafted, organically grown human cope.

---

## Files

| File         | What It Is                                                 |
|--------------|------------------------------------------------------------|
| `AIDENY.cbl` | 190 lines of enterprise-grade cope                         |
| `AIDENY.jcl` | JCL to compile & run on Z/OS. Your mainframe deserves this.|
| `README.md`  | You are here. No conclusions here either.                  |

---

## Credit

The original flowchart was identified by
**[Daniel Miessler](https://danielmiessler.com)** — security researcher, creator of
[fabric](https://github.com/danielmiessler/fabric), and author of
[Unsupervised Learning](https://newsletter.danielmiessler.com/). He's been documenting
AI's impact with data and receipts since 2016 while the loop keeps looping.

We didn't invent the algorithm. We just gave it the enterprise runtime it deserved.

---

<div align="center">

*This program is provided AS-IS with* ***NO WARRANTY OF REACHING A CONCLUSION.***

`RETURN-CODE: 0000` &nbsp;&nbsp; `CONCLUSION-CODE: NULL` &nbsp;&nbsp; `VIBES: STRONG`

</div>
