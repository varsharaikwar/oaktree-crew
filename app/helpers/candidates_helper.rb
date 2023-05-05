module CandidatesHelper
    def error_helper(name)
        if @candidate.errors[name]
            return @candidate.errors[name]
        end
    end
    
    def check(id)
        candidate = Candidate.find(id)
        if candidate.status == "Active"
            return true 
        elsif candidate.status == "Draft"
            return false
        end
    end

    def check_premium(id)
        candidate = Candidate.find(id)
        if candidate.premium_status == "Premium"
            return true 
        elsif candidate.premium_status == "Mark as Premium"
            return false
        end
    end
end