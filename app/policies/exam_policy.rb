# frozen_string_literal: true

class ExamPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    true
  end
end
