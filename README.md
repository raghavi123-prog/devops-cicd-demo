# Flask CI/CD Pipeline on Google Cloud

This project sets up an automated CI/CD pipeline for a simple Flask web application using GitHub, Docker, and Google Cloud Platform (GCP).

Whenever code is pushed to the `main` branch, the pipeline automatically runs tests, builds a Docker image, stores it in Google Artifact Registry, and deploys the updated app to Google Cloud Run.

---

## Architecture Flow

1. **Code Push:** A developer pushes code changes to GitHub (`main` branch).
2. **Automated Trigger:** Google Cloud Build detects the push via a GitHub trigger.
3. **Automated Testing (CI):** The pipeline runs unit tests using `pytest` to make sure everything works.
4. **Docker Build:** The application is packaged into a Docker container tagged with the Git commit hash.
5. **Image Storage:** The Docker image is pushed to **Google Artifact Registry**.
6. **Live Deployment (CD):** The container is deployed to **Google Cloud Run**, making the changes live instantly with zero downtime.

---

## Tech Stack & Tools

* **Backend:** Python, Flask
* **Testing:** Pytest
* **Container:** Docker
* **Pipeline / CI:** Google Cloud Build
* **Container Registry:** Google Artifact Registry
* **Hosting / CD:** Google Cloud Run
* **Access Control:** Google Cloud IAM

---

## Project Structure

* `app.py` - Flask web application code and routes.
* `test_app.py` - Automated unit tests checking endpoint responses.
* `Dockerfile` - Instructions to build the lightweight Python container.
* `requirements.txt` - Python package dependencies (Flask, pytest).
* `cloudbuild.yaml` - Pipeline configuration defining test, build, push, and deploy steps.

---

## How to Run Locally

### 1. Clone the repository
```bash
git clone [https://github.com/raghavi123-prog/devops-cicd-demo.git](https://github.com/raghavi123-prog/devops-cicd-demo.git)
cd devops-cicd-demo
### install dependencies

pip install -r requirements.txt
pytest test_app.py
### Start the flask application
python app.py

####Open your browser and navigate to http://localhost:5000
