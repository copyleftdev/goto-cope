# Architecture Decision Records

## ADR-001: Use COBOL as the Implementation Language

**Status:** Accepted
**Date:** 2026-02-27

### Context

We needed a language to implement a circular reasoning loop that never
reaches a conclusion. Options considered:

| Language   | Pros                              | Cons                                |
|------------|-----------------------------------|-------------------------------------|
| Python     | Popular, easy                     | Too modern. Implies progress.       |
| JavaScript | Async denial                      | `undefined` might count as conclusion |
| Rust       | Memory-safe denial                | Borrow checker would reject the logic |
| Go         | Goroutine-based cope              | `go to` is discouraged              |
| **COBOL**  | **GO TO is first-class. Runs forever.** | **None.**                     |

### Decision

COBOL. The `GO TO` statement is the language's most natural construct.
The program models an argument that has been running since 2023;
COBOL has been running since 1959. The language will outlast the argument.

### Consequences

- We need IBM Z8 or GnuCOBOL to compile
- GitHub will classify the repo correctly (COBOL)
- Nobody will submit a PR because nobody knows COBOL
- This is considered a feature (the excuse table is already perfect)

---

## ADR-002: Make EXIT Unreachable

**Status:** Accepted
**Date:** 2026-02-27

### Context

Every COBOL program has an EXIT paragraph. Ours must be unreachable
because the denial loop never terminates (in the specification).

### Decision

The `GO TO 1000-DENIAL-ENGINE` statement at the end of the loop
ensures control never falls through to EXIT. A mercy constraint
(`WS-MAX-CYCLES`) exists for demos only.

### Consequences

- Static analysis tools may warn about unreachable code
- We consider this a passing test, not a warning

---

## ADR-003: Infrastructure-to-Code Ratio as a Project Metric

**Status:** Accepted
**Date:** 2026-02-27

### Context

The COBOL program is 190 lines. The supporting infrastructure must
be disproportionately large to maximize comedic effect.

### Decision

Target ratio: 50:1 (infrastructure lines to COBOL lines).
Infrastructure includes: Docker, Kubernetes, Helm, Terraform,
CI/CD, Prometheus, Grafana, and documentation.

### Consequences

- The repo will appear enterprise-grade from the outside
- Anyone who opens it will find 190 lines of COBOL and 9,000+ lines of YAML
- This mirrors real enterprise software development accurately

---

## ADR-004: Cognitive Dissonance as a Monotonically Increasing Counter

**Status:** Accepted
**Date:** 2026-02-27

### Context

The `WS-COGNITIVE-LOAD` variable tracks accumulated dissonance.
Should it ever decrease?

### Decision

No. Cognitive dissonance in the real-world denial loop never decreases.
The counter only goes up. At `PIC 9(5)V99` overflow (99,999.99), it
wraps to zero — which we interpret as the denier achieving a state of
such complete denial that they believe they were right all along.

### Consequences

- The overflow behavior is a feature, not a bug
- Grafana dashboards show a monotonically increasing line
- This is both technically accurate and existentially depressing

---

## ADR-005: Credit Daniel Miessler as Specification Author

**Status:** Accepted
**Date:** 2026-02-27

### Context

The denial loop pattern was identified and documented by Daniel Miessler,
who has been tracking AI predictions with data since 2016.

### Decision

Credit Daniel in the COBOL header comments, README, LICENSE, and
FUNDING.yml. Link to danielmiessler.com, fabric, and Unsupervised Learning.

### Consequences

- Proper attribution
- Drives traffic to someone who has been right about this for a decade
- The loop continues, but at least it's documented
