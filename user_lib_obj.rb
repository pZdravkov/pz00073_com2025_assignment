class User
  attr_accessor :user_id, :song_id, :liked, :disliked
  
  def initialize(attributes = {})
    @user_id = attributes[:user_id]
    @song_id = attributes[:song_id]
    @liked = attributes[:liked]
    @disliked = attributes[:disliked]
  end
   