class PropertyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def user_owns_record?
    record.user == user
  end

  def index?
    true
  end

  def show?
  	true
  end

  def create?
    true
  end

  def destroy?
  	user_owns_record?
  end

  def edit?
    user_owns_record?
  end

  def update?
    user_owns_record?
  end
end
