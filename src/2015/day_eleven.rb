# frozen_string_literal: true

class DayEleven2015
  def self.part_one(password)
    next_password(password)
  end

  def self.part_two(password)
    new_password = next_password(password).next
    next_password(new_password)
  end

  class << self
    def next_password(password)
      regex = Regexp.union [*"a".."z"].each_cons(3).map(&:join)
      password.next! until password[regex] && iol?(password) && two_pairs?(password)
      password
    end

    def iol?(password)
      password !~ /[iol]/
    end

    def two_pairs?(password)
      password.scan(/(.)\1/).size > 1
    end
  end
end
