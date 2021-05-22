class Event < ApplicationRecord

  validates :start_date,
    presence: true,
    numericality: { greater_than_or_equal_to: Time.now.to_i } 
    # Impossible de créer ou modifier un évènement dans le passé.

  validates :duration,
     presence: true, if: :mult_5_and_positive?
    # Le nombre de minutes doit être un multiple de 5, et strictement positif

  validates :title,
    presence: true,
    length: { minimum: 5, maximum: 140 }
    # Doit faire au moins 5 caracteres et maxi 140 caracteres

  validates :description,
    presence: true,
    length: { minimum: 5, maximum: 1000 }
    # Doit faire entre 20 et 1000 caracteres 

  validates :price,
    presence: true,
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
    # Doit être compris entre 1 et 1000

  validates :location,
    presence: true

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :creator, class_name: "User"

  private
 
  def mult_5_and_positive? # A revoir cette partie je comprends pas trop encore !!!!
    return true if self.duration % 5 == 0 && self.duration > 0
 
    false
  end

end
