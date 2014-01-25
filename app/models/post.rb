class Post < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :title, :body

  has_attached_file :image, 
                    styles: { large: "800X800>", medium: "300x300>", thumb: "100x100>" }, 
                    default_url: ActionController::Base.helpers.asset_path('post_missing.png')

  validates_attachment_size :image, less_than: 10.megabytes


end