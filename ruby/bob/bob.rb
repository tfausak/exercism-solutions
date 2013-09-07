class Bob
  def hey(message)
    return 'Fine. Be that way!' if is_silence(message)
    return 'Woah, chill out!'   if is_yelling(message)
    return 'Sure.'              if is_question(message)
    'Whatever.'
  end

  private

  def is_silence(message)
    message =~ /\A\s*\z/
  end

  def is_yelling(message)
    message !~ /[a-z]/
  end

  def is_question(message)
    message =~ /\?\z/
  end
end
