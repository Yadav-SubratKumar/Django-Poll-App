# Using a Light weight image for the django application
FROM python:3.11-slim

# Setting up the working directory
WORKDIR /app

# Env varaible to prevent creation of bytecode 
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Copying all files and installation of requirements.txt
COPY . .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Command to migrate the database (sqlite)
RUN python manage.py migrate

# Port exposion to allow the connection from the internet
EXPOSE 8000

# Command to run the django appplication using Gunicorn
CMD ["gunicorn", "pollme.wsgi:application", "--bind", "0.0.0.0:8000"]
