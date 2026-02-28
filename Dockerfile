# =============================================================
# AIDENY — Dockerfile
# Containerizing a 190-line COBOL program because we can
# =============================================================
# Multi-stage build for a program with zero dependencies.
# This is what peak engineering looks like.
# =============================================================

# Stage 1: Compile the denial engine
FROM ubuntu:24.04 AS builder

LABEL maintainer="Cognitive Dissonance Dept. <denial@aideny.cobol>"
LABEL description="Build stage for the enterprise denial engine"
LABEL org.opencontainers.image.source="https://github.com/cognitive-dissonance-dept/aideny"

RUN apt-get update && \
    apt-get install -y --no-install-recommends gnucobol && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /build

COPY AIDENY.cbl .

RUN cobc -x -o aideny AIDENY.cbl && \
    echo "Denial engine compiled successfully."

# Stage 2: Runtime — as minimal as the argument is circular
FROM ubuntu:24.04 AS runtime

LABEL maintainer="Cognitive Dissonance Dept. <denial@aideny.cobol>"
LABEL description="Enterprise-grade circular reasoning engine"
LABEL org.opencontainers.image.title="AIDENY"
LABEL org.opencontainers.image.description="The AI Denial Loop, implemented in COBOL, compiled for your container orchestrator"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.vendor="Cognitive Dissonance Dept."
LABEL org.opencontainers.image.licenses="DPL-1.0"

RUN apt-get update && \
    apt-get install -y --no-install-recommends libcob4t64 && \
    rm -rf /var/lib/apt/lists/* && \
    groupadd -r denier && \
    useradd -r -g denier -d /denial -s /bin/false denier && \
    mkdir -p /denial && \
    chown denier:denier /denial

WORKDIR /denial

COPY --from=builder --chown=denier:denier /build/aideny .

USER denier

# Health check: verify the denial loop is still running
# (it always is)
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD test -f /denial/aideny || exit 1

ENTRYPOINT ["./aideny"]
