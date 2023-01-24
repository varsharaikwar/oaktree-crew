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
end
