module KeyAndDateGenerator
  def generate_key
    possible_keys = [*(0..99999)]
    possible_keys.sample.to_s.rjust(5, '0')
  end
  
  def date_getter
    DateTime.now.strftime("%d%m%y")
  end
end
