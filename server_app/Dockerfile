FROM ubuntu
RUN mkdir /app
RUN mkdir /thrift
RUN ["/bin/bash", "-c", "apt-get update > /dev/null 2>&1"]
RUN ["/bin/bash", "-c", "apt-get install -y python3-pip > /dev/null 2>&1"]
RUN ["/bin/bash", "-c", "python3 -m pip install six > /dev/null 2>&1"]
RUN ["/bin/bash", "-c", "apt-get install -y thrift-compiler python3-thrift > /dev/null 2>&1"]
WORKDIR /app
EXPOSE 5000
CMD ["/bin/bash", "-c", "thrift --gen py /thrift/CalculatorService.thrift; python3 ./server.py"]
