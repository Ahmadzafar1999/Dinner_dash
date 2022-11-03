# frozen_string_literal: true

# cart policy
class CartPolicy < ApplicationPolicy::Scope
  def show?
    user.customer?
  end
end
