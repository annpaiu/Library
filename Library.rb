require 'active_record'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class Library < ApplicationRecord
  has_many :books
  has_many :cards
end

class Book < ApplicationRecord
  belongs_to :library
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :authors
  has_many :cards
end

class Genre < ApplicationRecord
  has_and_belongs_to_many :books
end

class Author < ApplicationRecord
  has_and_belongs_to_many :books
end

class Card < ApplicationRecord
  belongs_to :book
  belongs_to :user
end

class User < ApplicationRecord
  has_many :cards
end