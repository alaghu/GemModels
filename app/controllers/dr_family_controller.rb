# dropping the prc prefix from model
class DrFamilyController < ApplicationController

  def index
    @DrFamily = PrcbuildDrFamily.all
  end
end
