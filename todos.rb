class Todo
  def initialize(title)
    @title = title
    @completed = false
  end

  def title
    @title
  end

  def completed?
    @completed
  end

  def complete
    @completed = true
  end
end

class TodoList
  def initialize
    @tasks = []
  end

  def add(title)
    task = Todo.new(title)
    @tasks << task
  end

  def complete(index)
    task = @tasks[index]
    task.complete
  end

  def to_s
    @tasks.each_with_index do |task, i|
      puts "#{i}: #{task.title}"
    end
  end
end



list = TodoList.new
list.add("dry cleaning")
list.to_s
