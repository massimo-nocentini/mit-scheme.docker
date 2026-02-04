

FROM --platform=$BUILDPLATFORM alpine:latest

RUN apk add wget clang make build-base git readline-dev

WORKDIR /home

COPY mit-scheme-12.1.tar.gz .

RUN tar xf mit-scheme-12.1.tar.gz \
	&& cd mit-scheme-12.1/src \
	&& CC=clang ./configure --disable-native-code \
	&& make \
	&& make install \
	&& cd ../.. && rm -rf mit-scheme*

ENTRYPOINT ["mit-scheme"]
