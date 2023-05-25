require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

hoi_loop = 0
case_pattern = 0

module Initialize
  def initialize(opposition,pattern)
    @opposition = opposition
    @pattern = pattern
  end
end

module CallOpposition
  def call_opposition
    if @opposition == 0
      puts "相手：グーを出しました"
    elsif @opposition == 1
      puts "相手：チョキを出しました"
    elsif @opposition == 2
      puts "相手：パーを出しました"
    end
  end
end

 class Hoi
  def initialize(opposition,hoi_loop,hoi_type,case_pattern)
    @opposition = opposition
    @loop = hoi_loop
    @type = hoi_type
    @case = case_pattern
  end
  
  def hoi_opposition
    if @opposition == 0
      puts "相手：上"
    elsif @opposition == 1
      puts "相手：下"
    elsif @opposition == 2
      puts "相手：左"
    elsif @opposition == 3
      puts "相手：右"
    end
  end
        
  def call_result
    if @opposition == @type && @case == 2
      puts "あなたの勝ちです"
      @loop = 1
    elsif @opposition == @type && @case == 3
      puts "あなたの負けです"
      @loop = 1
    end
    return @loop
  end
 end

while hoi_loop == 0 do

  if case_pattern != 1
    puts "じゃんけん ..."
  end
  case_pattern = 0

  puts "0（グー）1（チョキ）2（パー）3（戦わない）"
  janken_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
  opposition = Random.rand(3)
  puts "ホイ！"
  puts "-----------------"
  
  if janken_type == 0
    class Janken
      include CallOpposition
      include Initialize
      
      def call_result
        if @opposition == 0
          @pattern = 1
        elsif @opposition == 1
          @pattern = 2
        elsif @opposition == 2
          @pattern = 3
        end
        return @pattern
      end
    end
    
    type1 = Janken.new(opposition,case_pattern)
    puts "あなた：グーを出しました"
    type1.call_opposition()
    puts "-----------------"
    case_pattern = type1.call_result()
    
  elsif janken_type == 1
    class Janken
      include CallOpposition
      include Initialize
      
      def call_result
        if @opposition == 0
          @pattern = 3
        elsif @opposition == 1
          @pattern = 1
        elsif @opposition == 2
          @pattern = 2
        end
        return @pattern
      end
    end
    
    type2 = Janken.new(opposition,case_pattern)
    puts "あなた：チョキを出しました"
    type2.call_opposition()
    puts "-----------------"
    case_pattern = type2.call_result()
    
  elsif janken_type == 2
    class Janken
      include CallOpposition
      include Initialize
      
      def call_result
        if @opposition == 0
          @pattern = 2
        elsif @opposition == 1
          @pattern = 3
        elsif @opposition == 2
          @pattern = 1
        end
        return @pattern
      end
    end
    
    type3 = Janken.new(opposition,case_pattern)
    puts "あなた：パーを出しました"
    type3.call_opposition()
    puts "-----------------"
    case_pattern = type3.call_result()
    
  else
    puts "じゃんけんをしませんでした"
    break
  end

  case case_pattern
  when 2..3
    puts "-----------------"
    puts "あっち向いて〜"
    puts "0（上）1（下）2（左）3（右）"
    hoi_type = gets.to_i
    puts "ホイ！"
    puts "-----------------"
    hoi_opposition = Random.rand(4)
    
    if hoi_type == 0
      hoi_ver0 = Hoi.new(hoi_opposition,hoi_loop,hoi_type,case_pattern)
      puts "あなた：上"
      hoi_ver0.hoi_opposition()
      hoi_loop = hoi_ver0.call_result()
      
    elsif hoi_type == 1
      hoi_ver1 = Hoi.new(hoi_opposition,hoi_loop,hoi_type,case_pattern)
      puts "あなた：下"
      hoi_ver1.hoi_opposition()
      hoi_loop = hoi_ver1.call_result()
      
    elsif hoi_type == 2
      hoi_ver2 = Hoi.new(hoi_opposition,hoi_loop,hoi_type,case_pattern)
      puts "あなた：左"
      hoi_ver2.hoi_opposition()
      hoi_loop = hoi_ver2.call_result()
      
    elsif hoi_type == 3
      hoi_ver3 = Hoi.new(hoi_opposition,hoi_loop,hoi_type,case_pattern)
      puts "あなた：右"
      hoi_ver3.hoi_opposition()
      hoi_loop = hoi_ver3.call_result()
      
    else
      puts "あっち向いてホイをやめました"
      break
    end
    
  when 1
    puts "あいこで ..."
  end
end