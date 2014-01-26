class Post < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :title, :body

  has_attached_file :image, 
                    styles: { large: "800X800>", medium: "300x300>", thumb: "100x100>" }, 
                    default_url: ActionController::Base.helpers.asset_path('post_missing.png')

  validates_attachment_size :image, less_than: 10.megabytes

  before_save :make_url_proper

  geocoded_by :address  
  after_validation :geocode  

  def has_address?
    longitude.present? && latitude.present?
  end

  private

  def make_url_proper
    if link.present? && !link.include?("http")
      self.link = "http://" + link
    end
  end

end