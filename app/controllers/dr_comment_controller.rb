# dropping the prc prefix from model
class DrCommentController < ApplicationController

  def index
    @DrComment = PrcbuildDrComment.all
  end
end
