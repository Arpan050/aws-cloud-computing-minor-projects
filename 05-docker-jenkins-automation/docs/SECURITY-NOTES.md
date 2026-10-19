# Security notes

This project is a local learning lab, not a production Jenkins design.

The original lab used a containerized Jenkins process with root privileges and a mounted host Docker socket. A Jenkins pipeline with this access can exercise broad control over the host Docker engine. Restrict access to the Jenkins UI, do not run untrusted pull-request code through this setup, keep it isolated, and prefer a dedicated/ephemeral build agent or separate builder for safer deployments.

The original coursework report specifies Node.js 18. The portfolio Dockerfile uses Node.js 24 instead; the application is a small built-in-HTTP example and does not need external npm packages.
