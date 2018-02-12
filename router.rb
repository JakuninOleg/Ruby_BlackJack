class Router
  def initialize
    @running = true
  end

  def game(action)
    while @running
    end
  end

  def stop!
    @running = false
  end
end
