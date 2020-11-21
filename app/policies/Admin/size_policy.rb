class Admin::SizePolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    new?
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
