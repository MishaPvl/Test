# frozen_string_literal: true

class ExamPolicy < ApplicationPolicy

  def index?
    user.viewer_role?
  end

  def create?
    user.admin_role?
  end

  def destroy?
    user.admin_role?
  end

  def update?
    user.admin_role?
  end
end
