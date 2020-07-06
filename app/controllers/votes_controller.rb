class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(vote_params)

    if @vote.save
      redirect_to articles_path, notice: 'You voted a article.'
    else
      redirect_to articles_path, alert: 'You cannot vote this article.'
    end
  end

  def destroy
    vote = Vote.find_by(downvote_params, user: current_user)
    if vote
      vote.destroy
      redirect_to articles_path, notice: 'You downvoted a article.'
    else
      redirect_to articles_path, alert: 'You cannot disvote article that you did not vote before.'
    end
  end

  private

  def vote_params
    params.permit(:article_id)
  end

  def downvote_params
    params.permit(:id, :article_id)
  end
end
