# frozen_string_literal: true

module TodosHelper
  def completed_at(params)
    params[:completed_at].to_i > 0 ? DateTime.current : nil
  end
end
