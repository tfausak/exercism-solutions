class Bob
  def hey(message)
    return 'Fine. Be that way!' if silence?(message)
    return 'Woah, chill out!'   if yelling?(message)
    return 'Sure.'              if question?(message)
    'Whatever.'
  end

  private

  def silence?(message)
    message =~ /\A\s*\z/
  end

  def yelling?(message)
    message !~ /[a-z]/
  end

  def question?(message)
    message =~ /\?\z/
  end
end
