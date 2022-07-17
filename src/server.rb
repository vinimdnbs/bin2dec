require 'sinatra'

get '/' do
  content_type 'text/html'

  send_file File.join(settings.public_folder, 'index.html')
end

post '/convert' do
  content_type 'application/json'
  data = JSON.parse request.body.read

  { 'decimalNumber' => bin2dec(data['binaryNumber']) }.to_json
end

def bin2dec(binaryNumber)
  binaryNumber
    .reverse
    .split('')
    .each_with_index
    .reduce(0) { |memo, (element, index)| memo + (2 ** index) * element.to_i }
end