# => specify host connection here or in environment specific file.
# => you can choose NOT to use namespaces or specify different driver (like :hiredis)
if Rails.env.test?
  REDIS_CODE_COV = Redis::Namespace.new(:codecov, redis: MockRedis.new )
else
  redis_conn = Redis.new(host: 'localhost', port: 6379, db: 0)
  REDIS_CODE_COV = Redis::Namespace.new(:codecov, redis: redis_conn)
end

# => optional exclusion list of which methods NOT to record
# => EXCLUDE_REDIS_CODE_COV = ['MyController.index', 'MyModel.method_name']
EXCLUDE_REDIS_CODE_COV = []
