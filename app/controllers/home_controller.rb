
class HomeController < ApplicationController
  def index
  end

  def show
  end

  def create
    @message = params[:message]
    @fullname = params[:fullname]
    @email = params[:email]
    @phonenumber = params[:phonenumber]
    puts @message, @fullname, @email, @phonenumber

    c = TestEmailForm.new(fullname: @fullname, email: @email, message: @message, phonenumber: @phonenumber)
    c.deliver

    redirect_to root_path
  end
end
