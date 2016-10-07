require "redis_code_cov/version"
require "active_support/concern"
require "redis"
require "redis-namespace"
require "readthis"
#require "after_do"

module RedisCodeCov

  # common code for various classes (controller, models, etc)
  module Base
    def redis_code_cov key
      # => increment the counter unless ClassName.method_name is specifically excluded in initializer
      REDIS_CODE_COV.incr key unless EXCLUDE_REDIS_CODE_COV.include? key
    rescue Exception => e
      # => TODO - for now just doing nothing
    end
  end

  # controller specific code
  module Controller
    include Base
    extend ActiveSupport::Concern
    included do
      before_action do
        key = [self.class.name, params[:action]].join('.')
        redis_code_cov key
      end
    end
  end

  # active job code
  module Job
    include Base
    extend ActiveSupport::Concern
    included do
      before_perform do |job|
        # => TODO - figure out how to call it before other methods in the job class
        key = [self.class.name, 'perform'].join('.')
        redis_code_cov key
      end
    end
  end

  # # TODO
  # module View
  # end
  # module Model
  # end
  # module Helper
  # end
  # module Mailer
  # end

end
