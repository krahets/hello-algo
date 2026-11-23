require 'open3'

start_time = Time.now
ruby_code_dir = File.dirname(__FILE__)
files = Dir.glob("#{ruby_code_dir}/chapter_*/*.rb")

errors = []

files.each do |file|
  stdout, stderr, status = Open3.capture3("ruby #{file}")
  errors << stderr unless status.success?
end

puts "\x1b[34m파일 #{files.count}개를 테스트했다\x1b[m"

unless errors.empty?
  puts "\x1b[33m파일 #{errors.length}개에서 예외가 발생했다\x1b[m"
  raise errors.join("\n\n")
else
  puts "\x1b[32m통과\x1b[m"
end

puts "테스트 완료까지 걸린 시간: #{((Time.now - start_time) * 1000).round} ms"
