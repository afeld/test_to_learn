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
  list = TodoList.new('todos.yml')
  case ARGV[0]
  when 'add'
    title = ARGV[1]
    task = list.add(title)
    puts "\"#{task.title}\" added!\n"
  when 'complete'
    index = ARGV[1].to_i
    puts index
    task = list.complete(index)
    puts "\"#{task.title}\" complete!\n"
  end

  puts "Remaining:"
  puts list.to_s
  list.save
end
