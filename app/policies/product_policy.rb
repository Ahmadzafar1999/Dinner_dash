# frozen_string_literal: true

# product policy
class ProductPolicy < ApplicationPolicy
  def index?
    user.admin? || user.customer?
  end

  def show?
    user.admin?
  end

  def new?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy
    user.admin?
  end
end
