# Use the official Python image from Docker Hub as the base image
FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY ./requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

RUn python manage.py collectstatic --noinput

# Expose port 8000 to allow traffic to the application
EXPOSE 8000

# Define the command to run the application
CMD ["gunicorn", "portfolio.wsgi:application", "--bind", "0.0.0.0:8000"]
