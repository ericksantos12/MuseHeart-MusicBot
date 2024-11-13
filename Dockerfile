FROM python:3.12-slim-bullseye

ENV JAVA_HOME=/opt/java/openjdk
COPY --from=eclipse-temurin:17 $JAVA_HOME $JAVA_HOME
ENV PATH="${JAVA_HOME}/bin:${PATH}"

WORKDIR /usr/src/app

COPY . .

RUN apt-get update \
&& apt-get install -y gcc \
&& apt-get install -y git \
&& apt-get clean

RUN pip install setuptools
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "/usr/src/app/main.py"]

EXPOSE 8080
