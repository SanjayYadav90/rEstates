class SideProjectsController < ApplicationController
  before_action :set_side_project, only: [:show, :update, :destroy]

  # GET /side_projects
  def index
    # @side_projects = SideProject.all
    @side_projects = SideProject.paginate(:page => params[:page], per_page: 10)

    render json: @side_projects
    # paginate json: @side_projects
  end

  # GET /side_projects/1
  def show
    render json: @side_project
  end

  # POST /side_projects
  def create
    @side_project = SideProject.new(side_project_params)

    if @side_project.save
      render json: @side_project, status: :created, location: @side_project
    else
      render json: @side_project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /side_projects/1
  def update
    if @side_project.update(side_project_params)
      render json: @side_project
    else
      render json: @side_project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /side_projects/1
  def destroy
    @side_project.destroy
  end

  def search
    @results = SideProject.where("roomtype, side ILIKE ?", params[:query])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_side_project
      @side_project = SideProject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def side_project_params
      params.require(:side_project).permit(:street, :city, :zip, :state, :beds, :baths, :sq__ft, :type, :sale_date, :price, :latitude, :longitude)
    end
end
