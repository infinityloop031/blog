class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.admin?
        scope.where(user_id:user.id)
        
      else
        scope.all
      end
    end
  end
  def index?
    if user.present?
      if user.admin? || user.customer?
        true
      end
    end
  end

  def create?
    if user.admin?
      true
    end
  end

  def new?
    if user.admin?
      true
    end
  end

  def edit?
    if user.admin?
      true
    end
  end

  def update?
    if user.admin?
      true
    end
  end

  def destroy?
    if user.admin?
      true
    end
  end
    

end
