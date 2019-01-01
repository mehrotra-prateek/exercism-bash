FROM bash:4.4

RUN apk add coreutils bats
RUN apk add ncurses

ARG test_file
ENV testfile=$test_file"_test.sh"

ARG work_dir
ENV workdir=${work_dir}

COPY . /develop

WORKDIR develop/${workdir}

CMD ["sh", "-c", "bats $testfile"]