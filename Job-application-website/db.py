from sqlalchemy import create_engine, text
import os

# db_uri.py
def get_db_uri():
    with open('db_uri', 'r') as file:
        return file.read().strip()
db_uri = get_db_uri()

engine = create_engine(db_uri)
                                            
def load_jobs_from_db():
    with engine.connect() as conn:
        # Execute your SQL query
        result = conn.execute(text('SELECT * FROM jobs'))
        # Fetch column names from the result's keys
        column_names = result.keys()
        # Fetch all rows from the result
        rows = result.fetchall()
        # Convert each row to a dictionary
        jobs = [dict(zip(column_names, row)) for row in rows]
        return jobs

def load_job_from_db(id):
    with engine.connect() as conn:
        stmt = text("SELECT * FROM jobs WHERE id = :val").bindparams(val=id)
        result = conn.execute(stmt)
        rows = result.all()
        
        if len(rows) == 0:
            return None
        else:
            return dict(rows[0]._asdict())
def add_application_to_db(job_id, data):
    with engine.connect() as conn:
        query = text("INSERT INTO applications (job_id, full_name, email, linkedin_url, education, work_experience, resume_url) VALUES (:job_id, :full_name, :email, :linkedin_url, :education, :work_experience, :resume_url)")

        conn.execute(query, {
            'job_id': job_id,
            'full_name': data['full_name'],
            'email': data['email'],
            'linkedin_url': data['linkedin_url'],
            'education': data['education'],
            'work_experience': data['work_experience'],
            'resume_url': data['resume_url']
        })
        conn.commit()
