require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  redirect '/start'
end


get '/start' do
  @status = 0
  word_count = Word.all.count
  word = Word.find(rand(1..word_count))
  word.populate
  @word = word
  @word_id = word.id()
  @display = @word.partial_word.split("").join(" ")
  erb :index
end

post '/:status' do
  @word_id = params.fetch("word_id").to_i
  @word = Word.find(@word_id)
  original_partial_word = @word.partial_word
  @status = params.fetch("status").to_i
  letter_input = params.fetch("letter_input")
  @word.vanna_white(letter_input)
  if original_partial_word == @word.partial_word
    @status += 1
    if @status == 4
      redirect '/dead'
    end
  end
  @display = @word.partial_word.split("").join(" ")
  if @word.name == @word.partial_word
    redirect "/win"
  end
  erb :index
end

get '/win' do
  erb :win
end

get '/dead' do
  erb :dead
end
