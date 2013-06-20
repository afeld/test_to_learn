require './todos'

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
  if list_string == "1: dry cleaning\n2: cat food\n"
    puts "OK: adding items"
  else
    puts list_string
    throw "FAIL: adding items"
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
    throw "FAIL: didn't save properly"
  end
end
