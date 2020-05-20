struct Result {
    1: double result;
    2: string message;
}

service CalculatorService {
    Result Sum(1: double num1, 2: double num2)
    Result Subtract(1: double num1, 2: double num2)
    Result Multiply(1: double num1, 2: double num2)
    Result Divide(1: double num1, 2: double num2)
}
