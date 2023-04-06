module LeadsHelper
    def lead_error_helper(name)
        if @lead.errors[name]
            return @lead.errors[name]
        end
    end
end
