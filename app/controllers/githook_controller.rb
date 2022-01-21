# frozen_string_literal: true

class GithookController < ApplicationController
  def hook
    head :ok
  end
end
