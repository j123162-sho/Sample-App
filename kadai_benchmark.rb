require 'benchmark'

# 1. 測定用のハッシュを用意する
number_hash = { 1 => "value" }
string_hash = { "key" => "value" }
symbol_hash = { :key => "value" }

# 2. 繰り返す回数を決める（差を明確にするため100万回）
iterations = 1_000_000

puts "計測を開始します（#{iterations}回ループ）..."

# 3. Benchmarkを使って測定する
# bm(10)は、結果表示のラベル幅を10文字分確保するという意味
Benchmark.bm(10) do |x|
  # 数値キーの場合
  x.report("Integer:") { iterations.times { number_hash[1] } }

  # 文字列キーの場合
  x.report("String:")  { iterations.times { string_hash["key"] } }

  # シンボルキーの場合
  x.report("Symbol:")  { iterations.times { symbol_hash[:key] } }
end