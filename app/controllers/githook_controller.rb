# frozen_string_literal: true

class GithookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def hook
    head :ok
  end
end
