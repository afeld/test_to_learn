require 'yaml'

class Todo
  def initialize(title)
    @title = title
  end

  def title
    @title
  end
end

class TodoList
  def initialize(filename)
    @filename = filename
    if File.exists?(filename)
      serialized = File.read(filename)
      @tasks = YAML.load(serialized)
    else
      @tasks = []
    end
  end

  def add(title)
    task = Todo.new(title)
    @tasks << task
    task
  end

  def complete(index)
    @tasks.delete_at(index)
  end

  def to_s
    output = ''
    @tasks.each_with_index do |task, i|
      output << "#{i}: #{task.title}\n"
    end
    output
  end

  def save
    serialized = YAML.dump(@tasks)
    File.open(@filename, 'w') {|f| f.write(serialized) }
  end
end


if __FILE__ == $0
  puts "COMMANDS:\na: add\nc: complete\nq: quit\n"
  list = TodoList.new('todos.yml')
  while true
    puts "\nTODOS:\n#{list}\n"

    print "> "
    input = gets.strip
    case input
    when 'a', 'add'
      print "title > "
      title = gets.strip
      task = list.add(title)
      puts "\"#{title}\" added!"
    when 'c', 'complete'
      print "index > "
      index = gets.to_i
      task = list.complete(index)
      puts "\"#{task.title}\" complete!\n"
    when 'q', 'quit'
      break
    else
      puts "WARNING: unknown command"
    end
  end

  list.save
end
