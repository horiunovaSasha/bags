class Weather

  def initialize(city)
    @city = city
  end

  attr_reader :city

  def form_message
    "hello"
  end

  private

  def weather_url
    "#{API_URL}/weather?q=#{city}&APPID=#{APPID}&units=metric"
  end

  def weather_response
    "test"
  end

  def temperature
    10
  end

  def weather_icons
    {
      40..49 => '🔥',
      30..39 => '☀️',
      20..29 => '🌤',
      10..19 => '⛅️',
      0 => '☁️',
      -10..-1 => '☃️',
      -20..-11 => '❄️'
    }
  end

  def select_icon(temperature)
    icon = weather_icons.select { |ico| ico === temperature }.values.first
    icon = '✨' if icon.nil?
    icon
  end
end