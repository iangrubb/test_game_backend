class UserChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"

    user = User.find_by(name: params["user"])
    user.update(logged: true)

    logged_users.each do |auser|
      UserChannel.broadcast_to(auser, user)
    end

    stream_for user

  end

  def unsubscribed

    user = User.find_by(name: params["user"])
    user.update(logged: false)

    logged_users.each do |auser|
      UserChannel.broadcast_to(auser, user)
    end

    # Any cleanup needed when channel is unsubscribed
  end

  private 

  def logged_users
    User.where(logged: true)
  end
end
