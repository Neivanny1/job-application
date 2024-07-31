
-- sets up database with right permissions
CREATE DATABASE IF NOT EXISTS my_api;
CREATE USER IF NOT EXISTS 'mwakazi'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON `my_api`.* TO 'mwakazi'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'mwakazi'@'localhost';
FLUSH PRIVILEGES;
-- creates jobs table in database
CREATE TABLE IF NOT EXISTS jobs (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(120) NOT NULL,
  location VARCHAR(120) NOT NULL,
  salary INT,
  currency VARCHAR(10),
  responsibilities VARCHAR(2000),
  requirements VARCHAR(2000),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

-- inserts job entries in the jobs tables
INSERT INTO jobs (title, location, salary, currency, responsibilities, requirements)
VALUES
('Cybersecurity Analyst', 'Nairobi', 80000, 'USD', 'Protecting systems from cyber threats.', "Bachelor's degree in Cybersecurity, CISSP certification."),
('Data Scientist', 'Mombasa', 90000, 'USD', 'Analyzing and interpreting complex data sets.', "Master's degree in Data Science, proficiency in Python and machine learning."),
('Software Engineer', 'Kisumu', 75000, 'USD', 'Developing and maintaining software applications.', "Bachelor's degree in Computer Science, proficiency in Java and SQL."),
('Network Security Engineer', 'Nairobi', 85000, 'USD', 'Securing and optimizing network infrastructure.', 'CCNA certification, experience with firewall configurations.'),
('Machine Learning Engineer', 'Eldoret', 95000, 'USD', 'Designing and implementing machine learning models.', 'Ph.D. in Computer Science, expertise in TensorFlow and PyTorch.'),
('Full Stack Developer', 'Nairobi', 80000, 'USD', 'Building end-to-end web applications.', 'Experience with front-end and back-end technologies like React and Node.js.'),
('IT Security Specialist', 'Nakuru', 88000, 'USD', 'Ensuring the security of information systems.', 'Certified Information Systems Security Professional (CISSP).'),
('Big Data Analyst', 'Mombasa', 92000, 'USD', 'Processing and analyzing large datasets.', 'Experience with Hadoop and Spark, strong SQL skills.'),
('DevOps Engineer', 'Nairobi', 85000, 'USD', 'Implementing and managing continuous integration and delivery.', 'Experience with Docker, Jenkins, and Kubernetes.'),
('Software Architect', 'Nairobi', 100000, 'USD', 'Designing and overseeing the implementation of software solutions.', 'Proven experience as a Software Architect, strong analytical skills');


-- creates application tables in database
CREATE TABLE IF NOT EXISTS applications (
  id INT NOT NULL AUTO_INCREMENT,
  job_id INT NOT NULL,
  full_name VARCHAR(250) NOT NULL,
  email VARCHAR(250) NOT NULL,
  linkedin_url VARCHAR(500),
  education VARCHAR(2000),
  work_experience VARCHAR(2000),
  resume_url VARCHAR(500),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);