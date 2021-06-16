require_relative './contract'
require_relative './claim'
require 'date'

# Adjudicate/adjudication - a judgment made on a claim to determine whether
# we are legally obligated to process the claim against the warranty. From
# Wikipedia (https://en.wikipedia.org/wiki/Adjudication):
#
#  "Claims adjudication" is a phrase used in the insurance industry to refer to
#  the process of paying claims submitted or denying them after comparing claims
#  to the benefit or coverage requirements.

class ClaimsAdjudication
  def adjudicate(contract, new_claim)
    # contract logic change
    # contract.purchase_price * 0.8 > claim_total(contract)
    if (contract.purchase_price - claim_total(contract)) * 0.8 > new_claim.amount &&
      claim_within_contract_dates(contract, new_claim) &&
      contract.status == "ACTIVE"
      contract.claims << new_claim
    end
  end

   
  def claim_total(contract)
    contract.claims.sum(0.0) { |claim| claim.amount }
  end

  def claim_within_contract_dates(contract, new_claim)
    new_claim.date  >= contract.effective_date && new_claim.date <= contract.expiration_date
  end
end
