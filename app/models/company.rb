class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

#takes an instance of Dev, and item_name, and a value as arguments, and creates a new Freebie instance with this compnay and the given dev
    def give_freebie(dev, item_name, value)
        self.freebies.create(dev: dev, item_name: item_name, value: value)
    end

#returns the company instance with the earliest founding year
    def self.oldest_company
        # self.minimum(:founding_year) #gives the year founded of the company with the earliest founding year
        # self.order(founding_year: :ASC).first
        self.order(founding_year: :DESC).last
    end
end
