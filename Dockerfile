FROM sameersbn/gitlab-ci-multi-runner:1.1.4-5
MAINTAINER mps299792458@gmail.com

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential cmake \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/google/googletest.git \
 && mkdir -p googletest/googletest/build

WORKDIR googletest/googletest/build

RUN cmake -DBUILD_SHARED_LIBS=ON .. \
 && make \
 && cp libgtest.so libgtest_main.so /usr/lib \
 && cp -r ../include/gtest /usr/include/

WORKDIR "${GITLAB_CI_MULTI_RUNNER_HOME_DIR}"

ENV RUNNER_DESCRIPTION=c/c++
ENV RUNNER_EXECUTOR=shell
ENV RUNNER_TAG_LIST="c, c++"
ENV RUNNER_LIMIT=1

ENV RUNNER_TOKEN=
ENV CI_SERVER_URL=
