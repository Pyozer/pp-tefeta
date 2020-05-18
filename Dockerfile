FROM google/dart

WORKDIR /app

ADD pubspec.* ./
RUN pub get
ADD . ./
RUN pub get --offline

RUN dart2native bin/main.dart -o bin/app

ENTRYPOINT ["./bin/app"]