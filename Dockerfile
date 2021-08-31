# Pull a base image
FROM python:3.8-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

## install psycopg2 dependencies
#RUN apk update \
#    && apk add postgresql-dev gcc python3-dev musl-dev

# Create a working directory for the django project
WORKDIR /code

# Copy requirements to the container
COPY requirements.txt /code/

# install dependencies
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the project files into the working directory
COPY . /code/

# Open a port on the container
EXPOSE 8000
