class PagesController < ApplicationController
  def dashboard
    @raws = Raw.all
    @recipes = Recipe.all
    @products = Product.as(:p).where("p.expired_at > #{Date.today}")
  end

  def not_found
  end
end
