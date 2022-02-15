FROM python:3.10
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN pip install poetry

COPY poetry.lock pyproject.toml /app/

WORKDIR /app
RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction

COPY . /app
CMD ["python", "manage.py", "runserver", "0.0.0.0:3000"]

