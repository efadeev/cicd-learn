FROM python:3.9.0-alpine
RUN pip install flask
WORKDIR /usr/bin
COPY hello.py  .
ENTRYPOINT [ "python" ]
CMD [ "hello.py" ]