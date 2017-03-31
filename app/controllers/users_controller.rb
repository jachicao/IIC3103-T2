class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotUnique, with: :render_not_unique_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /users
  def index
    @users = User.all
    render :json => { usuarios: @users, total: @users.size }
  end

  # GET /users/1
  def show
    render json: @user, :except => [:created_at, :updated_at]
  end

  # POST /users
  def create
    if params[:id]
      render :json => { :error => "No se puede crear usuario con id" }, status: :bad_request
    else
      @user = User.new(user_params)
      if @user.save
        render json: @user, :except => [:created_at, :updated_at], status: :created, location: @user
      else
        render :json => { :error => "La creación ha fallado" }, status: :internal_server_error
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    if user_params.count > 1
      render :json => { :error => "La modificación ha fallado" }, status: :internal_server_error
    else
      if params[:id]
        render :json => { :error => "id no es modificable" }, status: :bad_request
      else
        if @user.update(user_params)
          render json: @user, :except => [:created_at, :updated_at]
        else
          render :json => { :error => "La actualización ha fallado" }, status: :internal_server_error
        end
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.fetch(:user, {}).permit(:id, :usuario, :nombre, :apellido, :twitter)
    end

    def render_unprocessable_entity_response(exception)
      render :json => { :error => "No se puede crear usuario con id" }, status: :unprocessable_entity
    end

    def render_not_found_response(exception)
      render :json => { :error => "Usuario no encontrado" }, status: :not_found
    end

    def render_not_unique_response(exception)
      render :json => { :error => "No se puede crear usuario con id" }, status: :bad_request
    end

end
