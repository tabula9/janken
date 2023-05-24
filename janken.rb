require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

case_pattern = ""
janken_loop = 0
hoi_pattern = ""
hoi_loop = 0

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
  
module StopLoop
  def stop_loop
    if @pattern == "あなたの勝ち" || @pattern == "あなたの負け"
      @loop = 1
    end
    return @loop
  end
end
  
module HoiOpposition
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
end

module LastResult
  def last_result
    if @pattern == "あなたの勝ち"
      puts "あなたの勝ちです！！"
    elsif @pattern == "あなたの負け"
      puts "あなたの負けです ..."
    end
  end
end

while hoi_loop == 0 do

  if case_pattern != "引き分け"
    puts "じゃんけん ..."
  end

  case_pattern = ""
  
  puts "0（グー）1（チョキ）2（パー）3（戦わない）"
  
  janken_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
  
  # if文を使用して続きを作成していきましょう。
  # 「janken_type」の値によって処理を分岐させていきましょう。
  
  opposition = Random.rand(3)
  
  puts "ホイ！"
  puts "-----------------"
  
  
  if janken_type == 0
    class Janken
      include CallOpposition
      include StopLoop
      
      def initialize(opposition,pattern,janken_loop)
        @opposition = opposition
        @pattern = pattern
        @loop = janken_loop
      end
      
      def call_result
        if @opposition == 0
          @pattern = "引き分け"
          puts @pattern
        elsif @opposition == 1
          @pattern = "あなたの勝ち"
          puts @pattern
        elsif @opposition == 2
          @pattern = "あなたの負け"
          puts @pattern
        end
        return @pattern
      end
      
    end
    
    type1 = Janken.new(opposition,case_pattern,janken_loop)
    puts "あなた：グーを出しました"
    type1.call_opposition()
    puts "-----------------"
    case_pattern = type1.call_result()
    janken_loop = type1.stop_loop()
    
    
  elsif janken_type == 1
    class Janken
      include CallOpposition
      include StopLoop
      
      def initialize(opposition,pattern,janken_loop)
        @opposition = opposition
        @pattern = pattern
        @loop = janken_loop
      end
      
      def call_result
        if @opposition == 0
          @pattern = "あなたの負け"
          puts @pattern
        elsif @opposition == 1
          @pattern = "引き分け"
          puts @pattern
        elsif @opposition == 2
          @pattern = "あなたの勝ち"
          puts @pattern
        end
        return @pattern
      end
      
    end
    
    type2 = Janken.new(opposition,case_pattern,janken_loop)
    puts "あなた：チョキを出しました"
    type2.call_opposition()
    puts "-----------------"
    case_pattern = type2.call_result()
    janken_loop = type2.stop_loop()
    
  
  elsif janken_type == 2
    class Janken
      include CallOpposition
      include StopLoop
      
      def initialize(opposition,pattern,janken_loop)
        @opposition = opposition
        @pattern = pattern
        @loop = janken_loop
      end
      
      def call_result
        if @opposition == 0
          @pattern = "あなたの勝ち"
          puts @pattern
        elsif @opposition == 1
          @pattern = "あなたの負け"
          puts @pattern
        elsif @opposition == 2
          @pattern = "引き分け"
          puts @pattern
        end
        return @pattern
      end
      
    end
    
    type3 = Janken.new(opposition,case_pattern,janken_loop)
    puts "あなた：パーを出しました"
    type3.call_opposition()
    puts "-----------------"
    case_pattern = type3.call_result()
    janken_loop = type3.stop_loop()
    
  end



  case case_pattern
  when "あなたの勝ち"
    puts "-----------------"
    puts "あっち向いて〜"
    puts "0（上）1（下）2（左）3（右）"
    
    hoi_type = gets.to_i
    
    puts "ホイ！"
    puts "-----------------"
    
    hoi_opposition = Random.rand(4)
    
  
    if hoi_type == 0
      class Hoi
        def initialize(opposition,pattern,hoi_loop)
          @opposition = opposition
          @pattern = pattern
          @loop = hoi_loop
        end
        
        include HoiOpposition
        include StopLoop
        include LastResult
        
        def hoi_result
          if @opposition == 0
            @pattern = "あなたの勝ち"
          end
        end
        
      end
      
    
      hoi_ver0 = Hoi.new(hoi_opposition,hoi_pattern,hoi_loop)
      puts "あなた：上"
      hoi_ver0.hoi_opposition()
      hoi_ver0.hoi_result()
      hoi_ver0.last_result()
      hoi_loop = hoi_ver0.stop_loop()
      
      
    elsif hoi_type == 1
      class Hoi
        def initialize(opposition,pattern,hoi_loop)
          @opposition = opposition
          @pattern = pattern
          @loop = hoi_loop
        end
        
        include HoiOpposition
        include StopLoop
        include LastResult
        
        def hoi_result
          if @opposition == 1
            @pattern = "あなたの勝ち"
          end
        end
        
      end
      
    
      hoi_ver1 = Hoi.new(hoi_opposition,hoi_pattern,hoi_loop)
      puts "あなた：下"
      hoi_ver1.hoi_opposition()
      hoi_ver1.hoi_result()
      hoi_ver1.last_result()
      hoi_loop = hoi_ver1.stop_loop()
      
      
    elsif hoi_type == 2
      class Hoi
        def initialize(opposition,pattern,hoi_loop)
          @opposition = opposition
          @pattern = pattern
          @loop = hoi_loop
        end
        
        include HoiOpposition
        include StopLoop
        include LastResult
        
        def hoi_result
          if @opposition == 2
            @pattern = "あなたの勝ち"
          end
        end
        
      end
      
    
      hoi_ver2 = Hoi.new(hoi_opposition,hoi_pattern,hoi_loop)
      puts "あなた：左"
      hoi_ver2.hoi_opposition()
      hoi_ver2.hoi_result()
      hoi_ver2.last_result()
      hoi_loop = hoi_ver2.stop_loop()
      
      
    elsif hoi_type == 3
      class Hoi
        def initialize(opposition,pattern,hoi_loop)
          @opposition = opposition
          @pattern = pattern
          @loop = hoi_loop
        end
        
        include HoiOpposition
        include StopLoop
        include LastResult
        
        def hoi_result
          if @opposition == 3
            @pattern = "あなたの勝ち"
          end
        end
        
      end
      
    
      hoi_ver3 = Hoi.new(hoi_opposition,hoi_pattern,hoi_loop)
      puts "あなた：右"
      hoi_ver3.hoi_opposition()
      hoi_ver3.hoi_result()
      hoi_ver3.last_result()
      hoi_loop = hoi_ver3.stop_loop()
      
    end
    
    
  
  when "あなたの負け"
    puts "-----------------"
    puts "あっち向いて〜"
    puts "0（上）1（下）2（左）3（右）"
    
    hoi_type = gets.to_i
    
    puts "ホイ！"
    puts "-----------------"
    
    hoi_opposition = Random.rand(4)
  
  
    if hoi_type == 0
      class Hoi
        def initialize(opposition,pattern,hoi_loop)
          @opposition = opposition
          @pattern = pattern
          @loop = hoi_loop
        end
        
        include HoiOpposition
        include StopLoop
        include LastResult
        
        def hoi_result
          if @opposition == 0
            @pattern = "あなたの負け"
          end
        end
        
      end
      
    
      hoi_ver0 = Hoi.new(hoi_opposition,hoi_pattern,hoi_loop)
      puts "あなた：上"
      hoi_ver0.hoi_opposition()
      hoi_ver0.hoi_result()
      hoi_ver0.last_result()
      hoi_loop = hoi_ver0.stop_loop()
      
      
    elsif hoi_type == 1
      class Hoi
        def initialize(opposition,pattern,hoi_loop)
          @opposition = opposition
          @pattern = pattern
          @loop = hoi_loop
        end
        
        include HoiOpposition
        include StopLoop
        include LastResult
        
        def hoi_result
          if @opposition == 1
            @pattern = "あなたの負け"
          end
        end
        
      end
      
    
      hoi_ver1 = Hoi.new(hoi_opposition,hoi_pattern,hoi_loop)
      puts "あなた：下"
      hoi_ver1.hoi_opposition()
      hoi_ver1.hoi_result()
      hoi_ver1.last_result()
      hoi_loop = hoi_ver1.stop_loop()
      
      
    elsif hoi_type == 2
      class Hoi
        def initialize(opposition,pattern,hoi_loop)
          @opposition = opposition
          @pattern = pattern
          @loop = hoi_loop
        end
        
        include HoiOpposition
        include StopLoop
        include LastResult
        
        def hoi_result
          if @opposition == 2
            @pattern = "あなたの負け"
          end
        end
        
      end
      
    
      hoi_ver2 = Hoi.new(hoi_opposition,hoi_pattern,hoi_loop)
      puts "あなた：左"
      hoi_ver2.hoi_opposition()
      hoi_ver2.hoi_result()
      hoi_ver2.last_result()
      hoi_loop = hoi_ver2.stop_loop()
      
      
    elsif hoi_type == 3
      class Hoi
        def initialize(opposition,pattern,hoi_loop)
          @opposition = opposition
          @pattern = pattern
          @loop = hoi_loop
        end
        
        include HoiOpposition
        include StopLoop
        include LastResult
        
        def hoi_result
          if @opposition == 3
            @pattern = "あなたの負け"
          end
        end
        
      end
      
    
      hoi_ver3 = Hoi.new(hoi_opposition,hoi_pattern,hoi_loop)
      puts "あなた：右"
      hoi_ver3.hoi_opposition()
      hoi_ver3.hoi_result()
      hoi_ver3.last_result()
      hoi_loop = hoi_ver3.stop_loop()
      
    end
  
    
    
  when "引き分け"
    puts "あいこで ..."
    
  when ""
    puts "じゃんけんをしませんでした"
    break
  end
  
end