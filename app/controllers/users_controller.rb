class UsersController < ApplicationController
    before_action :authorized, only: [:persist]

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            info = {user_id: @user.id}
            token = encode_token(info)
            render json: {user: UserSerializer.new(@user), token: token}
        else
            render json: {error: @user.errors.full_messages}
        end
    end

    def persist
        info = {user_id: @user.id}
        token = encode_token(info)
        render json: {user: UserSerializer.new(@user), token: token}
    end

    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            info = {user_id: @user.id}
            token = encode_token(info)
            render json: {user: UserSerializer.new(@user), token: token}
        else
            render json: {error: "Incorrect Username or Password"}
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
    end

    private

    def user_params
        params.permit(:username, :password, :first_name, :last_name, :cash)
    end

end
