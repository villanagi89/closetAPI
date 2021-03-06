class Article < ActiveRecord::Base
  belongs_to :closet
  enum category: [:everyday, :work, :evening, :event, :active, :vacation]
  enum article_type: [:shoes, :shirts, :skirts, :dresses, :pants, :outerwear, :accessories, :jewelry, :undergarments]
end
