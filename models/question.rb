class Question
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  embeds_many :answers, cascade_callbacks: true

  accepts_nested_attributes_for :answers, :allow_destroy => true, :reject_if => ->(attrs) { attrs[:label].blank? }

  field :label, :type => String
  field :enabled, :type => Boolean, default: true

  validates_presence_of :label
  validate :validate_correct_answers

  scope :enabled, where(enabled: true)
  scope :with_answers, any_of(:answers.exists => true)

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>

  def self.correct_answers_for_question_id question_id
    enabled.with_answers.find(question_id).answers.correct
  end

  private

  def validate_correct_answers
    if answers.select { |x| x.correct == true }.count == 0
      # errors.add(:answers, 'At least one answer must be marked as correct')
    end
  end
end
