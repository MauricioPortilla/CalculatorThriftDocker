$:.push('gen-rb')

require 'thrift'
require 'calculator_service'
require 'calculator_service_types'

begin
    transport = Thrift::BufferedTransport.new(Thrift::Socket.new("localhost", 5000))
    protocol = Thrift::BinaryProtocol.new(transport)
    client = CalculatorService::Client.new(protocol)

    transport.open()
    request = ""
    puts "Welcome to the Calculator Service!"
    while request != "0"
        puts "Choose an option:"
        puts "1) Sum\n2) Subtract\n3) Multiply\n4) Divide\n0) Exit"
        STDOUT.flush()
        request = STDIN.gets().strip
        num1 = 0
        num2 = 0
        if ["1", "2", "3", "4"].include?(request)
            puts "Enter the first number:"
            STDOUT.flush()
            num1 = Float(STDIN.gets())
            puts "Enter the second number:"
            STDOUT.flush()
            num2 = Float(STDIN.gets())
        end
        case request
            when "1"
                resultObj = client.Sum(num1, num2)
                if resultObj.message != nil
                    puts "Error: #{resultObj.message}"
                else
                    puts "Result: #{resultObj.result}"
                end
            when "2"
                resultObj = client.Subtract(num1, num2)
                if resultObj.message != nil
                    puts "Error: #{resultObj.message}"
                else
                    puts "Result: #{resultObj.result}"
                end
            when "3"
                resultObj = client.Multiply(num1, num2)
                if resultObj.message != nil
                    puts "Error: #{resultObj.message}"
                else
                    puts "Result: #{resultObj.result}"
                end
            when "4"
                resultObj = client.Divide(num1, num2)
                if resultObj.message != nil
                    puts "Error: #{resultObj.message}"
                else
                    puts "Result: #{resultObj.result}"
                end
            else
                break
        end
    end
    transport.close()
rescue Thrift::Exception => exception
    puts "Thrift Exception -> #{exception}"
end
