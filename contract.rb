require 'securerandom'

require_relative './product'

class Contract
  attr_reader   :id # unique id
  attr_reader   :purchase_price
  attr_reader   :covered_product

  attr_accessor :status
  attr_accessor :terms_and_conditions
  attr_accessor :purchase_date
  attr_accessor :in_store_guarantee_days

  attr_accessor :claims

  def initialize(purchase_price, covered_product, terms)
    @id                 = SecureRandom.uuid
    @purchase_price     = purchase_price
    @status             = "PENDING"
    @covered_product    = covered_product
    @claims             = Array.new
    @terms_and_conditions = terms
  end

  # Equality for entities is based on unique id
  def ==(other)
    self.id == other.id
  end
end
