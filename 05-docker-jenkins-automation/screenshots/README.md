# Screenshot evidence

These images were extracted from the submitted Docker + Jenkins coursework PDF and are included as supporting evidence.

| File | What it shows | Notes |
|---|---|---|
| `pipeline-flow.png` | GitHub -> Jenkins -> Docker build -> running app flow | Diagram from the report. |
| `docker-ps-before-fix-source-strip.png` | Docker state before the Jenkins Docker-access fix | The original report contains only a narrow strip; replace with a fresh full screenshot if available. |
| `github-repository.png` | GitHub repository files (`app.js`, `Dockerfile`, `Jenkinsfile`) | Source-control evidence. |
| `jenkins-pipeline-configuration.png` | Pipeline job configuration pointing to GitHub | Verify repository URL remains current if reusing it. |
| `jenkins-job-build-history.png` | Jenkins job page and build history | This is not a substitute for a full Console Output screenshot. |
| `docker-ps-after-build.png` | Demo container running and port 3000 mapped | Terminal evidence. |
| `app-running-localhost-3000.png` | App response in browser | Shows `Hello from Jenkins + Docker automation!`. |

For stronger evidence, capture a fresh screenshot from Jenkins Console Output showing Checkout, Build Docker Image, and Run Container all successful. Do not include credentials, tokens, passwords, Jenkins initial-admin secrets, or other secrets in screenshots.
