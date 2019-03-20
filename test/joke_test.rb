require 'minitest/autorun'
require 'minitest/emoji'
require './lib/joke'
require 'pry'

class JokeTest < Minitest::Test

  def test_Joke_class_exists
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    assert_instance_of Joke, joke
  end

  def test_Joke_class_attributes
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    assert_equal 1, joke.id
    assert_equal "Why did the strawberry cross the road?", joke.setup
    assert_equal "Because his mother was in a jam.", joke.punchline
  end

  def test_Joke_class_attributes_again
    joke = Joke.new(2, "What did the fish say when they swam into a wall?", "Dam.")

    assert_equal 2, joke.id
    assert_equal "What did the fish say when they swam into a wall?", joke.setup
    assert_equal "Dam.", joke.punchline
  end

end
