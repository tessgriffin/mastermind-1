class GameTime

  attr_accessor :start_time, :end_time

  attr_reader :game_seconds, :game_minutes

  def initialize
    @start_time = nil
    @end_time = nil
  end

  def start_time
    @start_time = Time.now
  end

  def end_time
    @end_time = Time.now
  end

  def game_duration
    @game_duration = @end_time - @start_time
    @game_seconds = (@game_duration % 60).to_i
    @game_minutes = (@game_duration / 60).to_i

  end

end