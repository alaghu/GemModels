# dropping the prc prefix from model
class DrEnvController < ApplicationController

  def index
    #        This is the model class
    @DrEnv = PrcbuildDrEnv.all
  end
end
