class UsersController < ApplicationController

    def show

        user = User.find_or_create_by(name: params[:id])

        users = User.all

        target = User.first

        render json: {user: user, users: users}

    end

end
