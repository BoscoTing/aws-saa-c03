FROM python:3.8

# Set the working directory
RUN mkdir /app
WORKDIR /app

# Copy the Python script to the container
COPY app/square.py /app

# Run the Python script when the container starts
CMD ["python", "-u", "square.py"]