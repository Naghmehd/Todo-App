class List
  attr_accessor :tasks, :done

  def initialize
    @tasks = []
    @done = []
  end

  def post(item)
    @tasks.push(item)
  end

  def print
    @tasks.each do |item|
      puts item
    end
  end



  def incomplete

  end

  def done
    @remove =[]
    @tasks = %w{#{item}}
    removed_item = gets.chomp.downcase
    list_check = @tasks.any? {|word| word == removed_item}
    if list_check == true
      @done.push(removed_item)
      @taks.delete_if {|word| word == removed_item}
    else
      puts "can't find it"
    end
      done
  end

end


class Todo

  def start
    puts "-" * 30
    puts " ---------Todo List----------"
    puts "\n"

    @list = List.new

    loop do
      print " <> "
      item = gets.chomp

      @list.post(item)

      @list.print
    end

    done

  end


end

Todo.new.start
