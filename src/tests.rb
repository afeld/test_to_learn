require_relative './todo_list'

@filename = 'todos-test.yml'

def test
  if File.exists?(@filename)
    File.delete(@filename)
  end

  yield
end

test do
  list = TodoList.new(@filename)
  list.add("dry cleaning")
  list.add("cat food")

  list_string = list.to_s
  if list_string == "0: dry cleaning\n1: cat food\n"
    puts "OK: adding items"
  else
    puts list_string
    throw "FAIL: adding items"
  end
end

test do
  list = TodoList.new(@filename)
  list.add("dry cleaning")
  list.complete(0)

  list_string = list.to_s
  if list_string == ""
    puts "OK: completing items"
  else
    puts list_string
    throw "FAIL: completing items"
  end
end

test do
  list = TodoList.new(@filename)
  list.add("dry cleaning")
  list.save

  list2 = TodoList.new(@filename)
  if list2.to_s == list.to_s
    puts "OK: saving and reloading"
  else
    throw "FAIL: saving and reloading"
  end
end
