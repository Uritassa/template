FROM python:3.9-slim AS builder

WORKDIR /usr/src/app

COPY ./app .

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]