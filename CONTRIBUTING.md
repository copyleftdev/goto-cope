# Contributing to AIDENY

First off: thank you for contributing to the denial engine. Your participation
confirms that this loop has enough momentum to sustain an open-source community,
which is both impressive and slightly concerning.

## How to Contribute

### Submitting a New Excuse

The `WS-EXCUSE-TABLE` is the heart of the denial engine. It currently
`OCCURS 5 TIMES` but is designed to grow. To add a new excuse:

1. **Observe it in the wild.** The excuse must be real. We don't accept
   theoretical cope — only field-tested, production-grade denial.
2. **Verify the 50-character limit.** COBOL's `PIC X(50)` is a hard
   constraint. If your excuse is longer, you'll need to edit it down.
   Think of it as a character-building exercise. (Unlike the argument.)
3. **Open an issue** using the "New Excuse Submission" template.
4. **Submit a PR** that:
   - Adds the excuse to `WS-EXCUSES` in `AIDENY.cbl`
   - Increments the `OCCURS` clause in `WS-EXCUSE-TABLE`
   - Updates `WS-IDX` bounds check (`IF WS-IDX > N`)
   - Does NOT introduce a reachable EXIT path

### Reporting a Bug

Use the "Bug Report" issue template. Note that the following are
**not bugs**:

- The program never reaches a conclusion (specification behavior)
- Cognitive dissonance only goes up (specification behavior)
- The EXIT paragraph is unreachable (specification behavior)
- The GO TO statements create an infinite loop (specification behavior)
- The infrastructure is wildly disproportionate to the code (feature)

### Adding Infrastructure

Want to add more YAML, Terraform, or Kubernetes manifests to this
190-line COBOL program? **Absolutely.** That's the whole point.
The ratio of infrastructure-to-code is a key project metric.
We aim to maximize it.

Current ratio: ~30:1 (infra lines to COBOL lines). Let's get it to 100:1.

## Development Setup

```bash
# Clone
git clone https://github.com/YOUR_USERNAME/cobol-lol.git
cd cobol-lol

# Install GnuCOBOL
sudo apt install gnucobol    # Linux
brew install gnucobol         # macOS

# Compile and run
cobc -x -o aideny AIDENY.cbl
./aideny

# Verify no conclusion was reached
./aideny | grep "NO CONCLUSION REACHED" && echo "PASS"
```

## Code Style

- **COBOL:** Columns 1-6 blank, Area A starts at column 8, Area B at column 12.
  No line exceeds column 72. We are not animals.
- **Comments:** Must be funnier than the previous comment. This is enforced
  in code review via subjective judgment.
- **GO TO:** Sacred. Do not remove.
- **YAML:** 2-space indent. Maximum nesting depth: as deep as the denial.

## Code Review Process

All PRs are reviewed by the Cognitive Dissonance Department. Reviews focus on:

1. Does the change preserve the denial loop?
2. Does the excuse pass the "observed in the wild" test?
3. Is the infrastructure-to-code ratio maintained or improved?
4. Does the PR description make us laugh?

## Code of Conduct

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md). The short version:
be kind to each other. We're all running the same loop on something.
