class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = user.employees.paginate(page: params[:page],per_page:4)
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    user = User.find(session[:user_id])
    @employee.user = user
      if @employee.save
        flash[:success] = 'Employee was successfully created.'
        redirect_to user_path(user)
      else
        render 'new'
      end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    if @employee.update(employee_params)
      flash[:success] = 'Employee was successfully updated.'
      user = User.find(session[:user_id])
      redirect_to user_path(user)
    else
      render 'edit'
    end

  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    flash[:danger] = 'Employee was successfully destroyed.'
    user = User.find(session[:user_id])
    redirect_to user_path(user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:usname, :password)
    end
end
