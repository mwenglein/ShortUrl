class ShortUrl < ActiveRecord::Base
  before_create :shorten  
  
  def visited
    self.visits = self.visits.to_i + 1
    self.lastvisit = Time.now
    save!
  end
  
  private
  
  def shorten
    self.short = bijective_encode(ShortUrl.count() + 1000)
    self.short_full = 'http://localhost:3001/' + self.short
  end

  ALPHABET =
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
    # make your own alphabet using:
    # (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).shuffle.join

  def bijective_encode(i)
    # from http://refactormycode.com/codes/125-base-62-encoding
    # with only minor modification
    return ALPHABET[0] if i == 0
    s = ''
    base = ALPHABET.length
    while i > 0
      s << ALPHABET[i.modulo(base)]
      i /= base
    end
    s.reverse
  end
    
end
