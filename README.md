# DevSecOps CI/CD Pipeline for DVWA

## Project Overview

This project demonstrates an automated **DevSecOps CI/CD pipeline** that sets up the **Damn Vulnerable Web Application (DVWA)** environment, runs container vulnerability scans with **Trivy**, and performs dynamic web application security testing using **OWASP ZAP**. The pipeline is implemented as a **GitHub Actions workflow**.

DVWA is intentionally insecure, making it ideal for security testing and demonstrating vulnerability detection in a CI/CD context.

---

## Features

- Automatically builds and runs DVWA using Docker Compose
- Scans the DVWA Docker image with Trivy to detect container-level vulnerabilities
- Performs OWASP ZAP baseline scan against the running DVWA instance to find web app vulnerabilities
- Generates a detailed HTML report from ZAP and uploads it as a GitHub Actions artifact for easy review
- Sends Slack notifications on:
  - Success (no vulnerabilities found)
  - Warnings (vulnerabilities detected)
  - Failure (pipeline errors)

---

## Technologies Used

- [DVWA](http://www.dvwa.co.uk/) — Vulnerable web app for testing security tools
- [Docker Compose](https://docs.docker.com/compose/) — Orchestration of containers for DVWA environment
- [Trivy](https://github.com/aquasecurity/trivy) — Container vulnerability scanner
- [OWASP ZAP](https://www.zaproxy.org/) — Dynamic web application security scanner
- [GitHub Actions](https://github.com/features/actions) — CI/CD automation platform
- Slack webhook for notifications

---

## How It Works

1. **Start DVWA:** The pipeline spins up the DVWA containers using Docker Compose.
2. **Wait for readiness:** It waits for the app to be fully accessible.
3. **Trivy scan:** Runs a vulnerability scan on the DVWA Docker image.
4. **OWASP ZAP scan:** Executes a baseline dynamic scan on DVWA and generates an HTML report.
5. **Upload report:** The ZAP report is uploaded as a GitHub artifact.
6. **Teardown:** Shuts down DVWA containers.
7. **Notifications:** Sends Slack alerts based on scan results and pipeline status.

---

## Usage

1. Clone this repository.
2. Configure your Slack webhook URL in your GitHub repository secrets under the name `SLACK_WEBHOOK_URL`.
3. Push changes to the `main` branch or create a pull request to trigger the pipeline.
4. After the pipeline runs, check the **Actions** tab in GitHub:
   - Download the ZAP report artifact (`zap-report.zip`) to review detected vulnerabilities.
   - Monitor Slack for notifications about pipeline results.

---

## Notes

- Since DVWA is intentionally insecure, the pipeline is expected to detect vulnerabilities during the ZAP scan.
- The pipeline considers exit code `2` from ZAP as a warning that vulnerabilities were found.
- The Trivy scan checks for container image vulnerabilities and outputs results to the Actions log.

---

## Future Improvements

- Add automated remediation suggestions for detected vulnerabilities.
- Integrate additional security scanners (e.g., Snyk, Bandit).
- Extend scanning to include infrastructure-as-code (IaC) configurations.
- Enhance reporting with email notifications or dashboards.

