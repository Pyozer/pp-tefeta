FROM google/dart

WORKDIR /app

ADD pubspec.* ./
RUN pub get
ADD . ./
RUN pub get --offline

RUN mkdir -p build && dart2native bin/main.dart -o build/app

ENTRYPOINT ["./build/app"]