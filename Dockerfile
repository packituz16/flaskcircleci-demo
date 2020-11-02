FROM python:3.7-slim-buster

RUN mkdir /app
WORKDIR /app
COPY Pipfile .
COPY Pipfile.lock .
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
RUN pip install pipenv==2018.11.26
RUN pipenv install --dev --system --deploy
COPY . .
EXPOSE 5000
CMD ["flask", "run"]