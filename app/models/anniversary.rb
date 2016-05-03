class Anniversary
  def name
    name= 'Michael Lauer'
  end
  def birthdate
    birthdate = Date.new(1994, 5, 6)
  end
  def launchdate
    launchdate = Date.new(2016, 4, 26) #needs to be changed to final launch day, start of development
  end
  def countdown
    today = Date.today
    birthday= Date.new(today.year, birthdate.month, birthdate.day)
    if birthday > today
      countdown = (birthday-today).to_i
    else
      countdown = (birthday.next_year - today).to_i
    end
  end
  def countup
    today = Date.today
    lauchday = Date.new(today.year, launchdate.month, launchdate.day)
    countup = (today-lauchday).to_i
  end
end