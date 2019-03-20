require 'minitest/autorun'
require 'minitest/emoji'
require './lib/joke'
require './lib/user'
require './lib/open_mic'

class Openmictest < Minitest::Test

  def test_OpenMic_class_exists
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
# require "pry"; binding.pry
    assert_instance_of OpenMic, open_mic
  end

  def test_location_method
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal "Comedy Works", open_mic.location
  end

  def test_date_method
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal "11-20-18", open_mic.date
  end

  def test_performers_initializes_as_blank_array
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal [], open_mic.performers
  end

  def test_
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")

    open_mic.welcome(sal)
    open_mic.welcome(ali)

    assert_equal [sal, ali], open_mic.performers
  end

  def test_repeated_jokes_is_false_by_default
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")

    open_mic.welcome(sal)
    open_mic.welcome(ali)

    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep an elephant from charging?", "Take away its credit cards.")

    ali.learn(joke_1)
    ali.learn(joke_2)

    refute open_mic.repeated_jokes?
  end

  def test_repeated_jokes_true_when_same_joke_told
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")

    open_mic.welcome(sal)
    open_mic.welcome(ali)

    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep an elephant from charging?", "Take away its credit cards.")

    ali.learn(joke_1)
    ali.learn(joke_2)

    refute open_mic.repeated_jokes?
    ali.tell(sal, joke_1)
    assert open_mic.repeated_jokes?
  end

end
# pry(main)> open_mic.repeated_jokes?
# # => true
