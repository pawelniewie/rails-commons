module RailsCommons

  class CrashinJob
    def perform(*args)
      raise "Crashing at #{Time.now.to_s} with #{args.to_s}"
    end
  end

end
