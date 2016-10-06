require "redis_code_cov/version"
require "active_support/concern"
require "redis"
require "redis-namespace"
require "readthis"

module RedisCodeCov

  module Controller
    extend ActiveSupport::Concern
    included do
      before_action :redis_code_cov
    end
    def redis_code_cov
      key = [self.class.name, params[:action]].join('.')
      REDIS_CODE_COV.incr key
    end
  end

end
