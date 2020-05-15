require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
    @todo1.done!
    @todo2.done!
    @todo3.done!
    assert_equal(true, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi') }
    assert_raises(TypeError) { @list.add(nil) }
    assert_raises(TypeError) { @list.add([1, 2, true]) }
  end

  def test_shovel
    todo = Todo.new("Test")
    @list << todo
    @todos << todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    todo = Todo.new("Test")
    @list.add(todo)
    @todos << todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(3) }
    assert_equal(@todo3, @list.item_at(-1))
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(78) }
    assert_raises(ArgumentError) { @list.mark_undone_at }
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done_bang
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(2)

    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    @todo1.done!

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    results = []
    @list.each do |todo|
      results << todo
    end

    assert_equal(@todos, results)
  end

  def test_each2
    assert_equal(@list, @list.each { |todo| nil })
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    result = @list.select { |todo| todo.done? }

    assert_equal(list.title, result.title)
    assert_equal(list.to_s, result.to_s)
  end

  def test_find_by_title
    result = @list.find_by_title("Buy milk")
    assert_equal(@todo1, result)
  end

  def test_all_done
    list = TodoList.new(@list.title)
    list.add(@todo2)
    list.add(@todo3)

    @todo2.done!
    @todo3.done!
    result = @list.all_done

    assert_equal(list.to_s, result.to_s)
  end

  def test_all_not_done
    list = TodoList.new(@list.title)
    list.add(@todo2)
    list.add(@todo3)

    @todo1.done!
    result = @list.all_not_done

    assert_equal(list.to_s, result.to_s)
  end

  def test_mark_done
    @list.mark_done("Buy milk")
    @list.mark_done("Nothing")
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_all_undone
    @list.mark_all_undone
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)

    @list.mark_all_done
    @list.mark_all_undone
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

end