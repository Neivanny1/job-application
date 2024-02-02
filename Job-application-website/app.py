from flask import Flask, render_template, jsonify, request
from db import load_jobs_from_db, load_job_from_db, add_application_to_db
app = Flask(__name__)
JOBS = load_jobs_from_db()
job = load_job_from_db(id)
@app.route('/')
def home():
    return render_template('index.html', jobs=JOBS)

@app.route('/job/<id>')
def show_job(id):
    job = load_job_from_db(id)
    if not job:
        return "No Match", 404
    return render_template('jobpage.html', job=job)

@app.route('/api/jobs')
def jobs():
    return jsonify(JOBS)

@app.route('/api/job/<id>')
def show_job_api(id):
    job = load_job_from_db(id)
    return jsonify(job)

@app.route('/job/<id>/apply', methods = ['post'])
def apply_the_job(id):
    data = request.form
    job = load_job_from_db(id)
    add_application_to_db(id, data)
    return render_template('application_submitted.html', application=data, job=job)

@app.route('/api/job/<id>/apply', methods = ['post'])
def apply_the_jobs_api(id):
    job = load_job_from_db(id)
    data = request.form
    return jsonify(data,job)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000, debug=True)