class PapersController < ApplicationController
  def index
    @papers = Paper.all
  end

  def new
    @paper = Paper.new
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  def show
    @paper = Paper.find(params[:id])
  end

  def create
    @paper = Paper.new(paper_params)

    if @paper.save
      redirect_to @paper
    else
      render 'new'
    end
  end

  def update
    @paper = Paper.find(params[:id])
    @paper.authors = []
    for i in 1..5
      id = params.require(:paper)[('author_' + i.to_s).to_sym]
      @paper.authors << Author.find(id) if id && !id.to_s.empty?
    end

    if @paper.update(paper_params)
      redirect_to @paper
    else
      render 'edit'
    end
  end

  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy

    redirect_to papers_path
  end
end

private
def paper_params
  params.require(:paper).permit(:title, :venue, :year)
end
