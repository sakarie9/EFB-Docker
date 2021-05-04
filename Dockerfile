FROM python:3.8.9-alpine3.13

COPY requirements.txt /app/
WORKDIR /app
ENV EFB_DATA_PATH /app/config

RUN apk --no-cache --virtual build add sed build-base libffi-dev openssl-dev &&\
    apk --no-cache add jpeg-dev zlib-dev libmagic libwebp-dev ffmpeg cairo git &&\
    pip install -U pip &&\
    pip install -r requirements.txt &&\
    rm -rf ~/.cache &&\
    apk del build
    
CMD ["ehforwarderbot"]
