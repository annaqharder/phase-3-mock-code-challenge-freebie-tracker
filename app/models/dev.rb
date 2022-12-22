class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

#accepts an item_name and returns TRUE if any of the freebies associated with the dev has that item_name, otherwise returns FALSE
    def received_one?(item_name)
        self.freebies.find_by(item_name: item_name) ? true : false
    end

#accepts a dev instance and a freebie instance, changes the freebie's dev to be the given dev
    # your code should only make the change if the freebie belongs to the dev who's giving it away
    def give_away(dev, freebie)
        if self.received_one?(freebie: item_name)
            freebie.update(dev: dev)
        end
    end
    # freebie.update(dev: dev) unless freebie.dev != self
end
