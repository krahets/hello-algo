require 'open3'

start_time = Time.now
ruby_code_dir = File.dirname(__FILE__)
files = Dir.glob("#{ruby_code_dir}/chapter_*/*.rb")

errors = []

files.each do |file|
  stdout, stderr, status = Open3.capture3("ruby #{file}")
  errors << stderr unless status.success?
end

puts "\x1b[34m#{files.count} 個のファイルをテストしました\x1b[m"

unless errors.empty?
  puts "\x1b[33m#{errors.length} 個のファイルで例外が見つかりました\x1b[m"
  raise errors.join("\n\n")
else
  puts "\x1b[32m合格\x1b[m"
end

puts "#{((Time.now - start_time) * 1000).round} ms でテストが終了しました"
