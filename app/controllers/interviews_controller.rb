class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :create]
  skip_before_action :authenticate_user!

  def index
  end

  def show
    @answer = Answer.new
    @questions = Question.all.sample(10)
    
  end

  def new
    @interview = Interview.new

  end

  def create

  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
  end
end
