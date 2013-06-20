require './todo_list'

HELP_TEXT = "COMMANDS:\na: add\nc: complete\nh: help\nq: quit\n"

puts HELP_TEXT
list = TodoList.new('todos.yml')

while true
  puts "\nTODOS:\n#{list}\n"

  print "> "
  input = gets.strip
  case input
  when 'a', 'add'
    print "title? > "
    title = gets.strip
    task = list.add(title)
    puts "\"#{title}\" added!"
  when 'c', 'complete'
    print "index? > "
    index = gets.to_i
    task = list.complete(index)
    puts "\"#{task.title}\" complete!\n"
  when 'h', 'help'
    puts HELP_TEXT
  when 'q', 'quit'
    break
  else
    puts "WARNING: unknown command"
    puts HELP_TEXT
  end
end

list.save
