@user ||= locals[:object]
object @user
node :signed_in do
  !@user.new_record?
end