# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class

class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def photos
    Photo.all.select do |photo|
      photo.user == self
    end
  end
end

class Photo

  attr_accessor :user

   ALL = []

  def initialize
   ALL << self
  end

  def self.all
    ALL
  end

  def make_comment(comment)
    Comment.new(self, comment)
  end

  def comments
    Comment.all.select do |comment|
      comment.photo == self
    end
  end

end

class Comment

  attr_accessor :photo, :comment

  ALL = []

  def initialize(photo, comment)
    @photo = photo
    @comment = comment
    ALL << self
  end

  def self.all
    ALL
  end
end

photo = Photo.new
user = User.new("Sophie")
photo.user = user
photo.user.name
# => "Sophie"
user.photos
# => [<photo 1>]


photo.comments
# => []

photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
photo.comments
# => [<comment1>]

Comment.all
#=> [<comment1>]
