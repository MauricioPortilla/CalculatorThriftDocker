FROM ubuntu
RUN mkdir /app
RUN mkdir /thrift
RUN ["/bin/bash", "-c", "apt-get update > /dev/null 2>&1"]
RUN ["/bin/bash", "-c", "apt-get install -y thrift-compiler ruby-thrift > /dev/null 2>&1"]
RUN ["/bin/bash", "-c", "apt-get install -y ruby ruby-dev > /dev/null 2>&1"]
WORKDIR /app
EXPOSE 5000
CMD ["/bin/bash", "-c", "thrift --gen rb /thrift/CalculatorService.thrift; ruby ./client.rb"]
