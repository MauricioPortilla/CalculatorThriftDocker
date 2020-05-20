import sys
sys.path.append("gen-py")
from thrift.transport import TSocket
from thrift.server import TServer
from CalculatorService import CalculatorService
from CalculatorService.ttypes import Result

class CalculatorServiceHandler(CalculatorService.Iface):
    def Sum(self, num1, num2):
        result = Result()
        result.result = num1 + num2;
        return result
    
    def Subtract(self, num1, num2):
        result = Result()
        result.result = num1 - num2;
        return result

    def Multiply(self, num1, num2):
        result = Result()
        result.result = num1 * num2;
        return result

    def Divide(self, num1, num2):
        result = Result()
        if num2 == 0:
            result.message = "Impossible to divide by zero."
        else:
            result.result = num1 / num2;
        return result

if __name__ == "__main__":
    serverTransport = TSocket.TServerSocket(port=5000)
    processor = CalculatorService.Processor(CalculatorServiceHandler())
    server = TServer.TSimpleServer(processor, serverTransport)
    print(">> Starting service...")
    server.serve()
    print(">> Calculator Service Thrift started.")
