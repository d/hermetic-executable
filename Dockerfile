FROM gcc AS build
RUN apt-get update -q
RUN apt-get install -y ninja-build cmake
COPY . /src/hello
RUN /src/hello/dev/build.bash

FROM centos:5 AS run
COPY --from=build /src/hello/build/hermetic_hello /hermetic_hello

FROM run AS test
RUN /hermetic_hello

FROM run
