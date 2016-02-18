# dropping the prc prefix from model
class DrEnvController < ApplicationController

  def index
    @DrEnv = PrcbuildDrEnv.all
  end
end
