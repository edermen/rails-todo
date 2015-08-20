class List < ActiveRecord::Base

  validates(
    :name,
    presence: true,
    length: { in: 2..60 },
    format: { with: /[AZaz - _ $&\d]{2,}\z/,
    message: "forbidden symbols" }
  )

end
