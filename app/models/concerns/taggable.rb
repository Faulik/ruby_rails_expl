module Taggable
  extend ActiveSupport::Concern

  included do
    scope :any_tags, -> (tags){ where('tag_slugs && ARRAY[?]', Array.wrap(tags)) }
    scope :all_tags, -> (tags){ where('tag_slugs @> ARRAY[?]', Array.wrap(tags)) }    
  end

  def tag_slugs=(value)
    value.reject!(&:blank?)

    _exist = Tag.where(slug: value).map(&:slug)
    _non_exist = value - _exist

    append _non_exist

    self[:tag_slugs] = (_exist + _non_exist).uniq
  end

  private

  def append(arr)
    arr.each do |element|
      Tag.create(slug: element) unless element.blank?
    end
  end
end
