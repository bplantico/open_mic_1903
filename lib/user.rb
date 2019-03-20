class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(audience, joke)
    audience.learn(joke)
  end

  def joke_by_id(joke_id)
    @jokes[joke_id - 1]
  end

end
