require_relative '../lib/todo_item'

class TodoList

  attr_reader :name, :todo_items

  def initialize
    @name = name
    @todo_items = []
  end

  def add_item(name)
    @todo_items.push(TodoItem.new(name))
  end

  def remove_item(index)
    @todo_items.delete_at(index.to_i - 1)
  end

  def mark_complete(name)
    if name.to_i > 0
      todo_items[name.to_i - 1].mark_complete!
    else
      index = find_index(name)
      if index
        todo_items[index].mark_complete!
      end
    end
  end

  def find_index(name)
    found_index = nil
    found = false
    @todo_items.each.with_index do |todo_item, index|
      if todo_item.name == name
        found = true
        found_index = index
      end
      if found
        break
      end
    end
    return found_index
  end

  def print_list(kind='all')
    puts "#{name} list - #{kind} items"
    puts "-" * 30
    todo_items.each.with_index do |todo_item, index|
      case kind
      when 'all'
        puts "#{index + 1} #{todo_item}"
      when 'complete'
        puts "#{index + 1} #{todo_item}" if todo_item.complete?
      when 'incomplete'
        puts "#{index + 1} #{todo_item}"  unless todo_item.complete?
      end
    end
  puts "\n"
  end
end

class Welcome
  def start
    puts "-" * 30
    puts " ---------Todo List----------"
    puts "\n"
    puts " Enter you items: "
    puts "\n"

    todo_list = TodoList.new

    loop do
      todo_list.print_list

      print "Do you want to (a)dd, (c)omplete, or (d)elete >"
      response = gets.chomp.downcase

      case response
      when "a"
       name = gets.chomp
       todo_list.add_item(name)
      when "d"
        name = gets.chomp

        if name.to_i > 0 #never be true for now
          todo_list.remove_item(name)
          puts "#{name} was removed from the list."
        end
      when "c"
        name = gets.chomp
        todo_list.mark_complete(name)
        puts "#{name} was marked as complete"
        puts "\n"
      end
    end
  end
end

Welcome.new.start
