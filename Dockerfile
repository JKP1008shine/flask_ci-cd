FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install pytest
RUN pip install pytest

COPY . .

CMD ["python", "app.py"]

