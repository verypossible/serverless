FROM python:3.7.3

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y \
    groff \
    nodejs

RUN mkdir /root/.aws

RUN pip install \
    awscli \
    pep8 \
    pipenv \
    poetry \
    pytest \
    pytest-cov \
    pytest-mock \
    pytest-watch \
    boto3

ARG SERVERLESS_VERSION
RUN npm install -g \
    serverless@${SERVERLESS_VERSION}

ARG YARN_VERSION
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version ${YARN_VERSION}

RUN mkdir /code
WORKDIR /code
