require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end

  get '/square/:number' do
    @num = params[:number].to_i
    "#{@num * @num}"
  end

  get '/say/:number/:phrase' do
    @num = params[:number].to_i
    @phrase = params[:phrase]
    string = ""
    @num.times {string << @phrase}
    string
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    string = ""
    params.each do |k, v|
      string << v
      if k == :word5
        string << "."
      else
        string << " "
      end
    end
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i

    case @operation
    when "add"
      return "#{@num1 + @num2}"
    when "subtract"
      return "#{@num1 - @num2}"
    when "multiply"
      return "#{@num1 * @num2}"
    when "divide"
      return "#{@num1 / @num2}"
    else
      return "Invalid operation specified."
    end
  end
end
