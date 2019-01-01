FROM bash:4.4

RUN apk add coreutils bats
RUN apk add ncurses

ARG key
ENV val=$key
ENV test_file=$key"_test.sh"

WORKDIR /$val

COPY . /$val

CMD ["sh", "-c", "bats $test_file"]