module Thetoolbox
  module SlugFinders
    def find_by_slug(*args)
      record = find(*args)
      if record and record.respond_to? :slug
        return nil unless record.slug == args.first
      end
      record
    end

    def find_by_slug!(*args)
      find_by_slug(*args) or raise ActiveRecord::RecordNotFound
    end
  end
end

class ActiveRecord::Base
  extend Thetoolbox::SlugFinders
end