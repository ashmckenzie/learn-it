class Answer
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  embedded_in :question

  field :label, :type => String
  field :correct, :type => Boolean, default: false

  validates_presence_of :label
  validates_length_of :label, :minimum => 1

  scope :correct, where(correct: true)

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>
end
