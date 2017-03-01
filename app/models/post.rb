class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true

  belongs_to :user

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :comments, dependent: :destroy

  before_save :normalize_blank_values

  def normalize_blank_values
    attributes.each do |column, value|
      self[column].present? || self[column] = nil
    end
  end

end
