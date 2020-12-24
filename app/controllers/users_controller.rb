class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

    # GET /users
    def index
        @users = User.all
    
        render json: @users
      end

    # GET /profiles/1
    def show
        @users = User.all
    
        render json: @users
    end

    # REGISTER
    def create
        @user = User.create(user_params)
        if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
        else
        render json: {error: "Invalid username or password"}
        end
    end

    # PATCH/PUT /users/1
    def update
        @user = User.find params[:id]
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

    # LOGGING IN
    def login
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
        else
        render json: {error: "Invalid username or password"}
        end
    end


    def auto_login
        render json: @user
    end

    private

    def user_params
        params.permit(:username, :password, :highScore, :user, :id)
    end
end
