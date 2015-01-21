class Redirection < ActiveRecord::Base
    before_create :default_values

    def default_values
        self.active ||= true
    end
    
    def self.update_attr(active)
        all = Redirection.all.pluck(:id)
        inactive = all - active
        update_states(inactive,false)
        update_states(active,true)
    end

    private

        def self.update_hyperlinks()
        
        end

        def self.update_states(array,state)
            Redirection.where(:id => array).update_all(:active => state)
        end
end
