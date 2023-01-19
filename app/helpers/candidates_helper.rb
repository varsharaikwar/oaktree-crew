module CandidatesHelper
    def error_helper(name)
        if @candidate.errors[name]
            return @candidate.errors[name]
        end
    end
end
