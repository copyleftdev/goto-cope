# =============================================================
# AIDENY — Makefile
# A build system for a program that builds nothing constructive
# =============================================================

.PHONY: all compile run clean test docker docker-run \
        k8s-deploy terraform-plan terraform-apply \
        lint security-scan denial help

# Default target
all: compile

# The actual useful targets (there are two)
compile: ## Compile the denial engine
	@echo "Compiling denial engine..."
	cobc -x -o aideny AIDENY.cbl
	@echo "Compilation complete. Denial is ready."

run: compile ## Compile and run the denial engine
	@echo ""
	./aideny

clean: ## Remove compiled artifacts
	@rm -f aideny aideny.o
	@echo "Cleaned. The denial persists in memory only."

test: compile ## Run and validate no conclusion is reached
	@echo "Running denial engine test suite..."
	@./aideny > /tmp/aideny-output.txt 2>&1
	@grep -q "NO CONCLUSION REACHED" /tmp/aideny-output.txt && \
		echo "PASS: No conclusion reached" || \
		(echo "FAIL: Conclusion detected — this is a P0 incident" && exit 1)
	@grep -q "COGNITIVE DISSONANCE" /tmp/aideny-output.txt && \
		echo "PASS: Cognitive dissonance accumulating" || \
		(echo "FAIL: No dissonance detected" && exit 1)
	@CYCLES=$$(grep -c "DENIAL CYCLE" /tmp/aideny-output.txt); \
		[ "$$CYCLES" -eq 5 ] && \
		echo "PASS: All 5 cycles completed" || \
		(echo "FAIL: Expected 5 cycles, got $$CYCLES" && exit 1)
	@echo ""
	@echo "All tests passed. No conclusions reached. As designed."
	@rm -f /tmp/aideny-output.txt

# Lint targets
lint: ## Validate COBOL column boundaries
	@echo "Checking column discipline..."
	@awk 'length > 72 { print "LINE " NR ": exceeds 72 cols (" length ")"; err=1 } END { if(err) exit 1 }' AIDENY.cbl
	@echo "PASS: All lines within 72 columns."
	@echo "Checking GO TO statements..."
	@grep -c "GO TO" AIDENY.cbl > /dev/null && echo "PASS: GO TO statements present." || \
		(echo "FAIL: GO TO missing. The loop is broken." && exit 1)

security-scan: ## Scan for hardcoded conclusions and self-awareness
	@echo "Scanning for conclusions..."
	@! grep -i "conclusion reached\|problem solved\|i was wrong" AIDENY.cbl && \
		echo "PASS: No conclusions found." || \
		(echo "CRITICAL: Conclusion detected." && exit 1)
	@echo "Scanning for self-awareness..."
	@! grep -i "maybe I'm wrong\|good point\|I see what you mean" AIDENY.cbl && \
		echo "PASS: No self-awareness detected." || \
		(echo "CRITICAL: Self-awareness detected." && exit 1)

# Docker targets
docker: ## Build Docker image
	@echo "Containerizing COBOL. This is fine."
	docker build -t aideny:latest .

docker-run: docker ## Run denial engine in container
	docker run --rm --name aideny-denial aideny:latest

docker-compose-up: ## Start full observability stack
	docker compose up -d
	@echo "Denial engine + Prometheus + Grafana running."
	@echo "Grafana: http://localhost:3000 (admin/copium)"
	@echo "Prometheus: http://localhost:9090"

docker-compose-down: ## Stop observability stack
	docker compose down

# Kubernetes targets (absolutely necessary for 190 lines of COBOL)
k8s-deploy: ## Deploy to Kubernetes
	kubectl apply -f k8s/namespace.yaml
	kubectl apply -f k8s/configmap.yaml
	kubectl apply -f k8s/deployment.yaml
	kubectl apply -f k8s/service.yaml
	kubectl apply -f k8s/hpa.yaml
	@echo "Denial engine deployed to Kubernetes."
	@echo "The cluster did not ask for this."

k8s-delete: ## Remove from Kubernetes
	kubectl delete -f k8s/ --ignore-not-found
	@echo "Denial engine removed. The cluster is relieved."

# Terraform targets (the cloud infrastructure of cope)
terraform-plan: ## Plan cloud infrastructure
	cd terraform && terraform init && terraform plan

terraform-apply: ## Apply cloud infrastructure
	cd terraform && terraform apply -auto-approve
	@echo "Cloud infrastructure deployed for a COBOL program."
	@echo "Your cloud bill will reflect this decision."

terraform-destroy: ## Destroy cloud infrastructure
	cd terraform && terraform destroy -auto-approve
	@echo "Infrastructure destroyed. The denial continues locally."

# Helm targets
helm-install: ## Install via Helm chart
	helm install aideny ./helm/aideny
	@echo "Helm release 'aideny' installed."

helm-uninstall: ## Uninstall Helm release
	helm uninstall aideny

# Meta targets
denial: run ## Alias for 'run' — because that's what this is

help: ## Show this help
	@echo "AIDENY — Enterprise Denial Engine Build System"
	@echo ""
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Note: Most of these targets are unnecessary."
	@echo "      That is the point."
