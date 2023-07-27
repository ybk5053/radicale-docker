FROM python:3-alpine

RUN pip install radicale
RUN apk add apache2-utils

VOLUME [ "/radicale/collections" ]

EXPOSE 5232

ENV USER=user1
ENV PASS=1234

CMD htpasswd -cbB /radicale/users $USER $PASS && python -m radicale --storage-filesystem-folder=/radicale/collections --server-hosts=0.0.0.0:5232 --server-ssl=False --auth-type=htpasswd --auth-htpasswd-filename=/radicale/users --auth-htpasswd-encryption=bcrypt