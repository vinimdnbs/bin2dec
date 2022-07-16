require 'sinatra'

get '/' do
  content_type 'text/html'
  send_file File.join(settings.public_folder, 'index.html')
end

post '/convert' do
  content_type 'application/json'
  data = JSON.parse request.body.read
  decimalNumber = data['binaryNumber']
    .reverse
    .split('')
    .each_with_index
    .reduce(0) { |memo, (element, index)| memo + (2 ** index) * element.to_i }
    
  { 'decimalNumber' => decimalNumber }.to_json
end