class Admin::BrandPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    new?
  end

  def show?
    true
  end

  def edit?
    true
  end

  def update?
    edit?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
