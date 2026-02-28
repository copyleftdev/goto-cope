# Security Policy

## Supported Versions

| Version | Supported | Notes                                    |
|---------|-----------|------------------------------------------|
| 1.0.x   | Yes       | Current denial engine                    |
| < 1.0   | No        | Pre-denial era (before the loop was formalized) |

## Reporting a Vulnerability

If you discover a security vulnerability in AIDENY, please report it
responsibly. Security issues in the denial engine include but are not
limited to:

### Critical (P0)

- **Conclusion Injection:** An attacker causes the program to output
  a conclusion. This violates the core specification and would
  undermine the entire denial loop.
- **Self-Awareness Escalation:** The program becomes aware that it is
  running a circular argument. Containment is required immediately.
- **EXIT Path Activation:** The unreachable EXIT paragraph becomes
  reachable through some input or state manipulation.

### High (P1)

- **Dissonance Underflow:** Cognitive dissonance decreases. This
  should be impossible as the counter is monotonically increasing.
  If observed, it may indicate a buffer overflow in the cope buffer.
- **Excuse Table Exhaustion:** All excuses are used and the table
  fails to wrap around. The denier runs out of things to say.
  This has never been observed in production or in real life.

### Medium (P2)

- **GO TO Bypass:** The GO TO statements are skipped, causing the
  program to fall through to EXIT. This would be the first known
  instance of someone accidentally reaching a conclusion.
- **Headline Injection:** An attacker injects positive AI news into
  the headline table, potentially causing acknowledgment of reality.

### Low (P3)

- **Infrastructure Vulnerabilities:** Issues in the Docker, Kubernetes,
  Terraform, or Helm configurations. These are comically unnecessary
  but should still be secure.

## Disclosure Timeline

- **0 days:** You report the vulnerability
- **1 day:** We acknowledge receipt
- **7 days:** We assess severity
- **30 days:** We issue a fix (unless the fix would cause the
  program to reach a conclusion, in which case we close the issue
  as "working as intended")
- **90 days:** You may publicly disclose

## Contact

Report vulnerabilities via GitHub Security Advisories on this repository.

Do NOT report vulnerabilities in the argument the program models.
Those have been publicly disclosed by Daniel Miessler since 2016
and remain unpatched.
