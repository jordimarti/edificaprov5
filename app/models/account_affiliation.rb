class AccountAffiliation < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :user
  belongs_to :account

  after_create_commit do
    broadcast_append_to :account_affiliations, target: "account_affiliations", partial: "account_affiliations/account_affiliation", locals: { account_affiliation: self }
  end

  after_destroy_commit do
    broadcast_remove_to :account_affiliations, target: dom_id(self)
  end
end
