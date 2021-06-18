class TermsAndConditions
  RETURN_WINDOW_DAYS = 90

  attr_reader :effective_date
  attr_reader :expiration_date

  def initialize(effective_date:, expiration_date:)
    @effective_date = effective_date
    @expiration_date = expiration_date
    freeze
  end

  def ==(other)
    self.class == other.class &&
      effective_date == other.effective_date &&
      expiration_date == other.expiration_date
  end
  alias :eql? :==

  def active?(date = Date.now)
    date >= effective_date && date <= expiration_date
  end
end
