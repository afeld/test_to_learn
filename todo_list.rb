require 'yaml'
require './todo'

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
