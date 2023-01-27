class ContentsController < ApplicationController
  before_action :set_content, only: %i[ show update destroy ]

  # GET /contents/education
  def education
    @contents = Content.where(content_type: 'education')
    render json: @contents
  end

  # GET /contents/resource
  def education
    @contents = Content.where(content_type: 'resource')
    render json: @contents
  end

  # GET /contents/1
  def show
    render json: { content: @content, pages: Page.where(content_id: @content.id) }
  end

  # POST /contents
  def create
    @content = Content.new(content_params)
    @content.user = current_user
    if @content.save
      render json: @content, status: :created, location: @content
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contents/1
  def update
    @content.pages.destroy_all
    if @content.update(content_params)
      render json: @content
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contents/1
  def destroy
    @content.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:title, :thumbnail, :content_type, 
      pages_attributes: [:title, :body]
      )
    end
end
