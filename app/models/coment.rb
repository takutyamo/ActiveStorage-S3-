class Coment < ApplicationRecord
  belongs_to :article
  #commentはarticleによって所有されている
end
